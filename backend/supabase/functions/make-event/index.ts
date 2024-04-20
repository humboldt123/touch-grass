// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import {serve} from "https://deno.land/std@0.131.0/http/server.ts"

console.log("Hello from Functions!")

/**
 * Makes events given a group of people
 * Runs as a daily batch job.
 */
serve(async (req) => {
    // const {name} = await req.json()
    // const data = {
    //     message: `Hello ${name}!`,
    // }

    const groups: Group[] = [{
        groupId: 1,
        users: [
            {
                lat: 39.95,
                lng: -75.2
            }
        ]
    }];

    let eventsMade = 0;
    for (const group of groups) {
        makeEvent(group);
        eventsMade++;
    }

    return new Response(
        JSON.stringify(`${eventsMade} events made`),
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

function makeEvent(group: Group) {
    const averageLocation = averageLoc(group.users);
    const event = {
        group,
        location: averageLocation
    }
    console.log(event);
}

// To invoke:
// curl -i --location --request POST 'http://localhost:54321/functions/v1/' \
//   --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24ifQ.625_WdcF3KHqz5amU0x2X5WWHP-OEs_4qj0ssLNHzTs' \
//   --header 'Content-Type: application/json' \
//   --data '{"name":"Functions"}'
