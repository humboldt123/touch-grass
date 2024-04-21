// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import {serve} from "https://deno.land/std@0.131.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2"

import * as postgres from 'https://deno.land/x/postgres@v0.17.0/mod.ts'

// Get the connection string from the environment variable "SUPABASE_DB_URL"
const databaseUrl = Deno.env.get('SUPABASE_DB_URL')!

// Create a database pool with three connections that are lazily established
const pool = new postgres.Pool(databaseUrl, 3, true)

/**
 * Makes events given a group of people
 * Runs as a daily batch job.
 */
serve(async (req) => {

    const groups: Group[] = await getGroups()

    let events = [];
    for (const group of groups) {
        events.push(makeEvent(group));
    }
    insertEvents(req, events);

    return new Response(
        JSON.stringify(`${events.length} events made`),
        {headers: {"Content-Type": "application/json"}},
    )
});

type User = {
    lat: number;
    lng: number;
}

type Group = {
    groupId: number;
    users: User[];
}

type Location = {
    lng: number;
    lat: number;
}

function average(nums: number[]): number {
    const count = nums.length;
    const sum = nums.reduce((a, b) => a + b, 0);
    return sum / count;
}

function averageLoc(users: User[]): Location {
    const averageLongitude = average(users.map((u) => u.lng));
    const averageLatitude = average(users.map((u) => u.lat));
    return {
        lat: averageLatitude,
        lng: averageLongitude
    };
}

type Event = {
    group: Group,
    location: Location
}

function makeEvent(group: Group): Event {
    const averageLocation = averageLoc(group.users);
    const event: Event = {
        group,
        location: averageLocation
    }
    return event;
}

async function insertEvents(req: Request, events: Event[]) {
    const authHeader = req.headers.get('Authorization')!
    const supabaseClient = createClient(
        Deno.env.get('SUPABASE_URL') ?? '',
        Deno.env.get('SUPABASE_ANON_KEY') ?? '',
        { global: { headers: { Authorization: authHeader } } }
    );

    supabaseClient.from('affair').insert(events);
}

async function getGroups(): Promise<Group[]> {
    try {
        const connection = await pool.connect()

        try {
            // Run a query
            const result = await connection.queryObject`select gm.group, json_agg(row_to_json(person.*))
                                                        from group_membership gm
                                                                 join person on person.id = gm.user
                                                        group by gm.group;`;
            console.log(result);
            const groups = result.rows as Group[];
            // Return the response with the correct content type header
            return Promise.resolve(groups);
        } finally {
            // Release the connection back into the pool
            connection.release()
        }
    } catch (e) {
        console.error(e);
    }
    return Promise.resolve([]);
}