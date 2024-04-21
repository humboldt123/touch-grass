import { LocalDateTime, ChronoUnit, convert } from 'npm:@js-joda/core'

function getEventTime() {
    const x = LocalDateTime.now();
    return convert(x.plusDays(1).withHour(20).truncatedTo(ChronoUnit.HOURS)).toDate();
}

getEventTime();