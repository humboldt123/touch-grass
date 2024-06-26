// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import {serve} from "https://deno.land/std@0.131.0/http/server.ts"
import {SupabaseClient, createClient} from "https://esm.sh/@supabase/supabase-js@2"

import * as postgres from 'https://deno.land/x/postgres@v0.17.0/mod.ts'

// import * from 'npm:@js-joda/core@5.6.2'

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

    const events = [] as Event[];
    for (const group of groups) {
        events.push(makeEvent(group));
    }
    console.log(`Events`);
    console.dir(events);
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
    group: BigInt;
    users: User[];
}

type Loc = {
    lng: number;
    lat: number;
}

type Location = {
    id: number;
    name: string;
    type: string;
    lat: number;
    lng: number;
    loc: number; // db id
}

function average(nums: number[]): number {
    const count = nums.length;
    const sum = nums.reduce((a, b) => a + b, 0);
    return sum / count;
}

function averageLoc(users: User[]): Loc {
    console.log(users);
    const averageLongitude = average(users.map((u) => u.lng));
    const averageLatitude = average(users.map((u) => u.lat));
    return {
        lat: averageLatitude,
        lng: averageLongitude
    };
}

type Event = {
    group: number,
    lat: number,
    lng: number,
    start_time: string
}

function makeEvent(group: Group): Event {
    const averageLocation = averageLoc(group.users);
    console.log("group", group);
    const event: Event = {
        group: Number(group.group),
        ...averageLocation,
        start_time: getEventTime().toJSON()
    }
    console.log(event);
    return event;
}

function getEventTime() {
    const oneDayInMillis = 24 * 60 * 60 * 1000;
    let tomorrow = new Date(new Date().getTime() + oneDayInMillis);
    tomorrow.setHours(20, 0, 0, 0);
    return tomorrow;
}

async function insertEvents(req: Request, events: Event[]) {
    const authHeader = req.headers.get('Authorization')!
    const supabaseClient = createClient(
        Deno.env.get('SUPABASE_URL') ?? '',
        Deno.env.get('SUPABASE_ANON_KEY') ?? '',
        {global: {headers: {Authorization: authHeader}}}
    );

    for (const event of events) {
        const location = await findNearest(supabaseClient, event);
        console.log({location});
        console.log("insertion", await supabaseClient.from('affair').insert({...event, location_id: location.id}));
    }
}

async function getGroups(): Promise<Group[]> {
    try {
        const connection = await pool.connect();

        try {
            // Run a query
            const result = await connection.queryObject`select gm.group, json_agg(row_to_json(person.*)) users
                                                        from group_membership gm
                                                                 join person on person.id = gm.user
                                                        where not exists (select * from affair e where e.group = gm.group)
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

type SupaClient = SupabaseClient<any, "public", any>;

async function findNearest(supabase: SupabaseClient<any, "public", any>, averageLoc: Loc): Promise<Location> {
    let {data, error} = await supabase
        .rpc('nearby', {lat: averageLoc.lat, lng: averageLoc.lng})
    if (error) console.error(error)
    else console.log(data)
    return data;
}