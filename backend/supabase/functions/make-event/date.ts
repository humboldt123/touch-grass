import { LocalDateTime, ChronoUnit, convert } from 'npm:@js-joda/core'

function getEventTime() {
    const x = LocalDateTime.now();
    return convert(x.plusDays(1).withHour(20).truncatedTo(ChronoUnit.HOURS)).toDate();
}

getEventTime();

// const tomorrow = new Date(new Date().to + (24 * 60 * 60));
// tomorrow.setTime((12 + 8) * 60 * 60)
// console.log(tomorrow);
const oneDayInMillis = 24 * 60 * 60 * 1000;
let tomorrow = new Date(new Date().getTime() + oneDayInMillis);
tomorrow.setHours(20, 0, 0, 0);
console.log(tomorrow);