import { LocalDateTime, ChronoUnit, convert } from 'npm:@js-joda/core'

function getEventTime() {
    const x = LocalDateTime.now();
    return convert(x.plusDays(1).withHour(20).truncatedTo(ChronoUnit.HOURS)).toDate();
}

getEventTime();

const tomorrow = new Date(new Date().to + (24 * 60 * 60));
tomorrow.setTime((12 + 8) * 60 * 60)
console.log(tomorrow);
console.log(new Date(new Date() + 1));