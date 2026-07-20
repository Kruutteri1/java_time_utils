import ballerina/jballerina.java;

# Represents a date-time without a time-zone in the ISO-8601 calendar system,
# such as 2026-07-15T14:28:19.
@java:Binding {'class: "java.time.LocalDateTime"}
public distinct class LocalDateTime {

    *java:JObject;
    *Object;

    # The handle field that stores the reference to the Java object.
    public handle jObj;

    # Initializes the LocalDateTime wrapper.
    # + obj - The handle value containing the Java reference.
    public function init(handle obj) {
        self.jObj = obj;
    }

    # Returns the string representation of this date-time in ISO-8601 format.
    # + return - The string form (e.g., "2026-07-15T14:28:19").
    public function toString() returns string {
        return java:toString(self.jObj) ?: "";
    }

    # Adjusts the specified temporal object to have this date-time.
    # + temporal - The temporal object to adjust.
    # + return - The adjusted temporal object.
    function adjustInto(Temporal temporal) returns Temporal {
        handle externalObj = java_time_LocalDateTime_adjustInto(self.jObj, temporal.jObj);
        return new (externalObj);
    }

    # Combines this date-time with an offset to create an OffsetDateTime.
    # + offset - The offset to apply.
    # + return - The resulting OffsetDateTime.
    function atOffset(ZoneOffset offset) returns OffsetDateTime {
        handle externalObj = java_time_LocalDateTime_atOffset(self.jObj, offset.jObj);
        return new (externalObj);
    }

    # Combines this date-time with a time-zone to create a ZonedDateTime.
    # + zone - The time-zone to apply.
    # + return - The resulting ZonedDateTime.
    function atZone(ZoneId zone) returns ZonedDateTime {
        handle externalObj = java_time_LocalDateTime_atZone(self.jObj, zone.jObj);
        return new (externalObj);
    }

    # Compares this date-time to another date-time.
    # + other - The date-time to compare to.
    # + return - The comparator value (less than 0 if before, 0 if equal, greater than 0 if after).
    function compareTo(ChronoLocalDateTime other) returns int {
        return java_time_LocalDateTime_compareTo(self.jObj, other.jObj);
    }

    # Checks if this date-time is equal to another object.
    # + other - The object to check equality with.
    # + return - True if equal, false otherwise.
    public function isEquals(Object other) returns boolean {
        return java_time_LocalDateTime_equals(self.jObj, other.jObj);
    }

    # Formats this date-time using the specified formatter.
    # + formatter - The date-time formatter to use.
    # + return - The formatted date-time string.
    function format(DateTimeFormatter formatter) returns string {
        return java:toString(java_time_LocalDateTime_format(self.jObj, formatter.jObj)) ?: "";
    }

    # Queries this date-time for the specified field.
    # + temporalField - The field to query.
    # + return - The value for the field.
    function get(TemporalField temporalField) returns int {
        return java_time_LocalDateTime_get(self.jObj, temporalField.jObj);
    }

    # Returns the chronology of this date-time.
    # + return - The ISO chronology.
    public function getChronology() returns Chronology {
        handle externalObj = java_time_LocalDateTime_getChronology(self.jObj);
        Chronology newObj = new (externalObj);
        return newObj;
    }

    # Returns the class of this object.
    # + return - The Java class instance.
    public function getClass() returns Class {
        handle externalObj = java_time_LocalDateTime_getClass(self.jObj);
        Class newObj = new (externalObj);
        return newObj;
    }

    # Returns the day-of-month.
    # + return - The day-of-month, from 1 to 31.
    public function getDayOfMonth() returns int {
        return java_time_LocalDateTime_getDayOfMonth(self.jObj);
    }

    # Returns the day-of-week.
    # + return - The day-of-week enum.
    public function getDayOfWeek() returns DayOfWeek {
        handle externalObj = java_time_LocalDateTime_getDayOfWeek(self.jObj);
        DayOfWeek newObj = new (externalObj);
        return newObj;
    }

    # Returns the day-of-year.
    # + return - The day-of-year, from 1 to 365 or 366.
    public function getDayOfYear() returns int {
        return java_time_LocalDateTime_getDayOfYear(self.jObj);
    }

    # Returns the hour-of-day.
    # + return - The hour-of-day, from 0 to 23.
    public function getHour() returns int {
        return java_time_LocalDateTime_getHour(self.jObj);
    }

    # Returns the value of the specified field as a long.
    # + temporalField - The field to query.
    # + return - The value for the field.
    function getLong(TemporalField temporalField) returns int {
        return java_time_LocalDateTime_getLong(self.jObj, temporalField.jObj);
    }

    # Returns the minute-of-hour.
    # + return - The minute-of-hour, from 0 to 59.
    public function getMinute() returns int {
        return java_time_LocalDateTime_getMinute(self.jObj);
    }

    # Returns the month-of-year.
    # + return - The month enum.
    public function getMonth() returns Month {
        handle externalObj = java_time_LocalDateTime_getMonth(self.jObj);
        return new (externalObj);
    }

    # Returns the month-of-year value (1-12).
    # + return - The month-of-year.
    public function getMonthValue() returns int {
        return java_time_LocalDateTime_getMonthValue(self.jObj);
    }

    # Returns the nano-of-second.
    # + return - The nano-of-second, from 0 to 999,999,999.
    public function getNano() returns int {
        return java_time_LocalDateTime_getNano(self.jObj);
    }

    # Returns the second-of-minute.
    # + return - The second-of-minute, from 0 to 59.
    public function getSecond() returns int {
        return java_time_LocalDateTime_getSecond(self.jObj);
    }

    # Returns the year.
    # + return - The year.
    public function getYear() returns int {
        return java_time_LocalDateTime_getYear(self.jObj);
    }

    # Returns the hash code for this date-time.
    # + return - The hash code.
    public function hashCode() returns int {
        return java_time_LocalDateTime_hashCode(self.jObj);
    }

    # Checks if this date-time is after the specified date-time.
    # + other - The other date-time to compare to.
    # + return - True if this date-time is after the specified date-time.
    function isAfter(ChronoLocalDateTime other) returns boolean {
        return java_time_LocalDateTime_isAfter(self.jObj, other.jObj);
    }

    # Checks if this date-time is before the specified date-time.
    # + other - The other date-time to compare to.
    # + return - True if this date-time is before the specified date-time.
    function isBefore(ChronoLocalDateTime other) returns boolean {
        return java_time_LocalDateTime_isBefore(self.jObj, other.jObj);
    }

    # Checks if this date-time is equal to the specified date-time.
    # + other - The other date-time to compare to.
    # + return - True if this date-time is equal to the specified date-time.
    function isEqual(ChronoLocalDateTime other) returns boolean {
        return java_time_LocalDateTime_isEqual(self.jObj, other.jObj);
    }

    # Checks if the specified field is supported.
    # + temporalField - The field to check.
    # + return - True if the field is supported.
    function isSupported(TemporalField temporalField) returns boolean {
        return java_time_LocalDateTime_isSupported(self.jObj, temporalField.jObj);
    }

    # Checks if the specified unit is supported.
    # + unit - The unit to check.
    # + return - True if the unit is supported.
    function isSupportedUnit(TemporalUnit unit) returns boolean {
        return java_time_LocalDateTime_isSupported2(self.jObj, unit.jObj);
    }

    # Returns a copy of this date-time with the specified amount subtracted.
    # + amount - The amount to subtract.
    # + unit - The unit of the amount.
    # + return - A new LocalDateTime with the amount subtracted.
    function minus(int amount, TemporalUnit unit) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_minus(self.jObj, amount, unit.jObj);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the specified period subtracted.
    # + period - The amount to subtract.
    # + return - A new LocalDateTime with the period subtracted.
    function minusPeriod(TemporalAmount period) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_minus2(self.jObj, period.jObj);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the specified number of days subtracted.
    # + days - The days to subtract.
    # + return - A new LocalDateTime with the days subtracted.
    public function minusDays(int days) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_minusDays(self.jObj, days);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the specified number of hours subtracted.
    # + hours - The hours to subtract.
    # + return - A new LocalDateTime with the hours subtracted.
    public function minusHours(int hours) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_minusHours(self.jObj, hours);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the specified number of minutes subtracted.
    # + minutes - The minutes to subtract.
    # + return - A new LocalDateTime with the minutes subtracted.
    public function minusMinutes(int minutes) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_minusMinutes(self.jObj, minutes);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the specified number of months subtracted.
    # + months - The months to subtract.
    # + return - A new LocalDateTime with the months subtracted.
    public function minusMonths(int months) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_minusMonths(self.jObj, months);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the specified number of nanoseconds subtracted.
    # + nanos - The nanoseconds to subtract.
    # + return - A new LocalDateTime with the nanoseconds subtracted.
    public function minusNanos(int nanos) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_minusNanos(self.jObj, nanos);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the specified number of seconds subtracted.
    # + seconds - The seconds to subtract.
    # + return - A new LocalDateTime with the seconds subtracted.
    public function minusSeconds(int seconds) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_minusSeconds(self.jObj, seconds);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the specified number of weeks subtracted.
    # + weeks - The weeks to subtract.
    # + return - A new LocalDateTime with the weeks subtracted.
    public function minusWeeks(int weeks) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_minusWeeks(self.jObj, weeks);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the specified number of years subtracted.
    # + years - The years to subtract.
    # + return - A new LocalDateTime with the years subtracted.
    public function minusYears(int years) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_minusYears(self.jObj, years);
        return new (externalObj);
    }

    # Wakes up a single thread that is waiting on this object's monitor.
    # WARNING: Low-level Java synchronization method. Avoid using in business logic.
    public function notify() {
        java_time_LocalDateTime_notify(self.jObj);
    }

    # Wakes up all threads that are waiting on this object's monitor.
    # WARNING: Low-level Java synchronization method. Avoid using in business logic.
    public function notifyAll() {
        java_time_LocalDateTime_notifyAll(self.jObj);
    }

    # Returns a copy of this date-time with the specified amount added.
    # + amount - The amount to add.
    # + unit - The unit of the amount to add.
    # + return - A new LocalDateTime with the amount added.
    function plus(int amount, TemporalUnit unit) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_plus(self.jObj, amount, unit.jObj);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the specified period added.
    # + period - The amount to add.
    # + return - A new LocalDateTime with the period added.
    function plusPeriod(TemporalAmount period) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_plus2(self.jObj, period.jObj);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the specified number of days added.
    # + days - The number of days to add.
    # + return - A new LocalDateTime with the days added.
    public function plusDays(int days) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_plusDays(self.jObj, days);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the specified number of hours added.
    # + hours - The number of hours to add.
    # + return - A new LocalDateTime with the hours added.
    public function plusHours(int hours) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_plusHours(self.jObj, hours);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the specified number of minutes added.
    # + minutes - The number of minutes to add.
    # + return - A new LocalDateTime with the minutes added.
    public function plusMinutes(int minutes) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_plusMinutes(self.jObj, minutes);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the specified number of months added.
    # + months - The number of months to add.
    # + return - A new LocalDateTime with the months added.
    public function plusMonths(int months) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_plusMonths(self.jObj, months);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the specified number of nanoseconds added.
    # + nanos - The number of nanoseconds to add.
    # + return - A new LocalDateTime with the nanoseconds added.
    public function plusNanos(int nanos) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_plusNanos(self.jObj, nanos);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the specified number of seconds added.
    # + seconds - The number of seconds to add.
    # + return - A new LocalDateTime with the seconds added.
    public function plusSeconds(int seconds) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_plusSeconds(self.jObj, seconds);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the specified number of weeks added.
    # + weeks - The number of weeks to add.
    # + return - A new LocalDateTime with the weeks added.
    public function plusWeeks(int weeks) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_plusWeeks(self.jObj, weeks);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the specified number of years added.
    # + years - The number of years to add.
    # + return - A new LocalDateTime with the years added.
    public function plusYears(int years) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_plusYears(self.jObj, years);
        return new (externalObj);
    }

    # Queries this date-time using the specified query.
    # + query - The query to invoke.
    # + return - The query result.
    function query(TemporalQuery query) returns Object {
        handle externalObj = java_time_LocalDateTime_query(self.jObj, query.jObj);
        return new (externalObj);
    }

    # Returns the range of valid values for the specified field.
    # + temporalField - The field to query the range for.
    # + return - The range of valid values for the field.
    function range(TemporalField temporalField) returns ValueRange {
        handle externalObj = java_time_LocalDateTime_range(self.jObj, temporalField.jObj);
        return new (externalObj);
    }

    # Converts this date-time to the number of seconds from the epoch of 1970-01-01T00:00:00Z.
    # + offset - The zone offset to use.
    # + return - The number of seconds from the epoch.
    function toEpochSecond(ZoneOffset offset) returns int {
        return java_time_LocalDateTime_toEpochSecond(self.jObj, offset.jObj);
    }

    # Converts this date-time to an Instant.
    # + offset - The zone offset to use.
    # + return - An Instant representing the same point on the time-line.
    function toInstant(ZoneOffset offset) returns Instant {
        handle externalObj = java_time_LocalDateTime_toInstant(self.jObj, offset.jObj);
        return new (externalObj);
    }

    # Gets the LocalDate part of this date-time.
    # + return - The date part of this date-time.
    public function toLocalDate() returns LocalDate {
        handle externalObj = java_time_LocalDateTime_toLocalDate(self.jObj);
        return new (externalObj);
    }

    # Gets the LocalTime part of this date-time.
    # + return - The time part of this date-time.
    public function toLocalTime() returns LocalTime {
        handle externalObj = java_time_LocalDateTime_toLocalTime(self.jObj);
        return new (externalObj);
    }

    # Returns a copy of this date-time truncated to the specified unit.
    # + unit - The unit to truncate to.
    # + return - A new LocalDateTime truncated to the specified unit.
    function truncatedTo(TemporalUnit unit) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_truncatedTo(self.jObj, unit.jObj);
        return new (externalObj);
    }

    # Returns the amount of time between this date-time and another date-time in the specified unit.
    # + endExclusive - The end date-time, exclusive.
    # + unit - The unit to measure the time in.
    # + return - The amount of time between the two date-times.
    function until(Temporal endExclusive, TemporalUnit unit) returns int {
        return java_time_LocalDateTime_until(self.jObj, endExclusive.jObj, unit.jObj);
    }

    # Causes the current thread to wait until notified.
    # WARNING: Low-level Java synchronization method. Use with caution.
    #
    # + return - An InterruptedException if the thread is interrupted while waiting.
    public function doWait() returns InterruptedException? {
        error|() externalObj = java_time_LocalDateTime_wait(self.jObj);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # Causes the current thread to wait until notified or the specified time elapses.
    # WARNING: Low-level Java synchronization method. Use with caution.
    #
    # + timeoutMillis - The maximum time to wait in milliseconds.
    # + return - An InterruptedException if the thread is interrupted while waiting.
    public function waitWithTimeout(int timeoutMillis) returns InterruptedException? {
        error|() externalObj = java_time_LocalDateTime_wait2(self.jObj, timeoutMillis);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # Causes the current thread to wait until notified, with the specified timeout.
    # WARNING: Low-level Java synchronization method. Use with caution.
    #
    # + timeoutMillis - The maximum time to wait in milliseconds.
    # + nanos - Additional nanoseconds to wait.
    # + return - An InterruptedException if the thread is interrupted while waiting.
    public function waitWithTimeoutAndNanos(int timeoutMillis, int nanos) returns InterruptedException? {
        error|() externalObj = java_time_LocalDateTime_wait3(self.jObj, timeoutMillis, nanos);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # Returns a copy of this date-time with the specified adjuster applied.
    # + adjuster - The adjuster to use.
    # + return - A new LocalDateTime with the adjustment applied.
    function 'with(TemporalAdjuster adjuster) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_with(self.jObj, adjuster.jObj);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the specified field set to a new value.
    # + temporalField - The field to set.
    # + newValue - The new value for the field.
    # + return - A new LocalDateTime with the field set.
    function withField(TemporalField temporalField, int newValue) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_with2(self.jObj, temporalField.jObj, newValue);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the day-of-month altered.
    # + dayOfMonth - The day-of-month to set (1-31).
    # + return - A new LocalDateTime with the day-of-month set.
    public function withDayOfMonth(int dayOfMonth) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_withDayOfMonth(self.jObj, dayOfMonth);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the day-of-year altered.
    # + dayOfYear - The day-of-year to set (1-365/366).
    # + return - A new LocalDateTime with the day-of-year set.
    public function withDayOfYear(int dayOfYear) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_withDayOfYear(self.jObj, dayOfYear);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the hour-of-day altered.
    # + hour - The hour-of-day to set (0-23).
    # + return - A new LocalDateTime with the hour set.
    public function withHour(int hour) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_withHour(self.jObj, hour);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the minute-of-hour altered.
    # + minute - The minute-of-hour to set (0-59).
    # + return - A new LocalDateTime with the minute set.
    public function withMinute(int minute) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_withMinute(self.jObj, minute);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the month-of-year altered.
    # + month - The month-of-year to set (1-12).
    # + return - A new LocalDateTime with the month set.
    public function withMonth(int month) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_withMonth(self.jObj, month);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the nano-of-second altered.
    # + nano - The nano-of-second to set (0-999,999,999).
    # + return - A new LocalDateTime with the nano-of-second set.
    public function withNano(int nano) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_withNano(self.jObj, nano);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the second-of-minute altered.
    # + second - The second-of-minute to set (0-59).
    # + return - A new LocalDateTime with the second-of-minute set.
    public function withSecond(int second) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_withSecond(self.jObj, second);
        return new (externalObj);
    }

    # Returns a copy of this date-time with the year altered.
    # + year - The year to set.
    # + return - A new LocalDateTime with the year set.
    public function withYear(int year) returns LocalDateTime {
        handle externalObj = java_time_LocalDateTime_withYear(self.jObj, year);
        return new (externalObj);
    }

}

# Obtains an instance of LocalDateTime from a temporal object.
#
# + temporal - The temporal object to convert.
# + return - The LocalDateTime.
function LocalDateTime_from(TemporalAccessor temporal) returns LocalDateTime {
    handle externalObj = java_time_LocalDateTime_from(temporal.jObj);
    return new (externalObj);
}

# Obtains the current date-time from the system clock in the default time-zone.
#
# + return - The current LocalDateTime.
public function getCurrentDateTime() returns LocalDateTime { 
    handle externalObj = java_time_LocalDateTime_now();
    return new (externalObj);
}

# Obtains the current date-time from the specified clock.
#
# + clock - The clock to use.
# + return - The current LocalDateTime.
function LocalDateTime_nowWithClock(Clock clock) returns LocalDateTime {
    handle externalObj = java_time_LocalDateTime_now2(clock.jObj);
    return new (externalObj);
}

# Obtains the current date-time from the system clock in the specified time-zone.
#
# + zone - The time-zone to use.
# + return - The current LocalDateTime.
function LocalDateTime_nowWithZone(ZoneId zone) returns LocalDateTime {
    handle externalObj = java_time_LocalDateTime_now3(zone.jObj);
    return new (externalObj);
}

# Obtains an instance of LocalDateTime from year, month, day, hour, and minute.
#
# + year - The year to represent.
# + month - The month-of-year to represent (1-12).
# + dayOfMonth - The day-of-month to represent (1-31).
# + hour - The hour-of-day to represent (0-23).
# + minute - The minute-of-hour to represent (0-59).
# + return - The LocalDateTime.
public function ofDateTime(int year, int month, int dayOfMonth, int hour, int minute) returns LocalDateTime {
    handle externalObj = java_time_LocalDateTime_of(year, month, dayOfMonth, hour, minute);
    return new (externalObj);
}

# Obtains an instance of LocalDateTime from year, month, day, hour, minute, and second.
#
# + year - The year to represent.
# + month - The month-of-year to represent (1-12).
# + dayOfMonth - The day-of-month to represent (1-31).
# + hour - The hour-of-day to represent (0-23).
# + minute - The minute-of-hour to represent (0-59).
# + second - The second-of-minute to represent (0-59).
# + return - The LocalDateTime.
public function ofWithSeconds(int year, int month, int dayOfMonth, int hour, int minute, int second) returns LocalDateTime {
    handle externalObj = java_time_LocalDateTime_of2(year, month, dayOfMonth, hour, minute, second);
    return new (externalObj);
}

# Obtains an instance of LocalDateTime from year, month, day, hour, minute, second, and nanosecond.
#
# + year - The year to represent.
# + month - The month-of-year to represent (1-12).
# + dayOfMonth - The day-of-month to represent (1-31).
# + hour - The hour-of-day to represent (0-23).
# + minute - The minute-of-hour to represent (0-59).
# + second - The second-of-minute to represent (0-59).
# + nanoOfSecond - The nano-of-second to represent (0-999,999,999).
# + return - The LocalDateTime.
public function ofWithNanos(int year, int month, int dayOfMonth, int hour, int minute, int second, int nanoOfSecond) returns LocalDateTime {
    handle externalObj = java_time_LocalDateTime_of3(year, month, dayOfMonth, hour, minute, second, nanoOfSecond);
    return new (externalObj);
}

# Obtains an instance of LocalDateTime from year, Month enum, day, hour, and minute.
#
# + year - The year to represent.
# + month - The Month enum.
# + dayOfMonth - The day-of-month to represent (1-31).
# + hour - The hour-of-day to represent (0-23).
# + minute - The minute-of-hour to represent (0-59).
# + return - The LocalDateTime.
function ofMonthFull(int year, Month month, int dayOfMonth, int hour, int minute) returns LocalDateTime {
    handle externalObj = java_time_LocalDateTime_of4(year, month.jObj, dayOfMonth, hour, minute);
    return new (externalObj);
}

# Obtains an instance of LocalDateTime from year, Month enum, day, hour, minute, and second.
#
# + year - The year to represent.
# + month - The Month enum.
# + dayOfMonth - The day-of-month to represent (1-31).
# + hour - The hour-of-day to represent (0-23).
# + minute - The minute-of-hour to represent (0-59).
# + second - The second-of-minute to represent (0-59).
# + return - The LocalDateTime.
function ofMonthFullWithsecond(int year, Month month, int dayOfMonth, int hour, int minute, int second) returns LocalDateTime {
    handle externalObj = java_time_LocalDateTime_of5(year, month.jObj, dayOfMonth, hour, minute, second);
    return new (externalObj);
}

# Obtains an instance of LocalDateTime from year, Month enum, day, hour, minute, second, and nanosecond.
#
# + year - The year to represent.
# + month - The Month enum.
# + dayOfMonth - The day-of-month to represent (1-31).
# + hour - The hour-of-day to represent (0-23).
# + minute - The minute-of-hour to represent (0-59).
# + second - The second-of-minute to represent (0-59).
# + nanoOfSecond - The nano-of-second to represent (0-999,999,999).
# + return - The LocalDateTime.
function ofMonthFullWithNano(int year, Month month, int dayOfMonth, int hour, int minute, int second, int nanoOfSecond) returns LocalDateTime {
    handle externalObj = java_time_LocalDateTime_of6(year, month.jObj, dayOfMonth, hour, minute, second, nanoOfSecond);
    return new (externalObj);
}

# Obtains an instance of LocalDateTime from a LocalDate and LocalTime.
#
# + date - The date.
# + time - The time.
# + return - The LocalDateTime.
public function ofLocalDateWithLocalTime(LocalDate date, LocalTime time) returns LocalDateTime {
    handle externalObj = java_time_LocalDateTime_of7(date.jObj, time.jObj);
    LocalDateTime newObj = new (externalObj);
    return newObj;
}

# Obtains an instance of LocalDateTime using seconds from the epoch of 1970-01-01T00:00:00Z.
#
# + epochSecond - The number of seconds from the epoch.
# + nanoOfSecond - The nanosecond within the second.
# + offset - The zone offset.
# + return - The LocalDateTime.
function ofEpochSecond(int epochSecond, int nanoOfSecond, ZoneOffset offset) returns LocalDateTime {
    handle externalObj = java_time_LocalDateTime_ofEpochSecond(epochSecond, nanoOfSecond, offset.jObj);
    LocalDateTime newObj = new (externalObj);
    return newObj;
}

# Obtains an instance of LocalDateTime from an Instant and ZoneId.
#
# + instant - The instant to use.
# + zone - The time-zone.
# + return - The LocalDateTime.
function ofInstantWithZone(Instant instant, ZoneId zone) returns LocalDateTime {
    handle externalObj = java_time_LocalDateTime_ofInstant(instant.jObj, zone.jObj);
    LocalDateTime newObj = new (externalObj);
    return newObj;
}

# Parses a text string to a LocalDateTime using the default ISO_LOCAL_DATE_TIME formatter.
#
# + text - The text to parse.
# + return - The parsed LocalDateTime.
function parseWithText(CharSequence text) returns LocalDateTime {
    handle externalObj = java_time_LocalDateTime_parse(text.jObj);
    LocalDateTime newObj = new (externalObj);
    return newObj;
}

# Parses a text string to a LocalDateTime using a specific formatter.
#
# + text - The text to parse.
# + formatter - The formatter to use.
# + return - The parsed LocalDateTime.
function parseFormatter(CharSequence text, DateTimeFormatter formatter) returns LocalDateTime {
    handle externalObj = java_time_LocalDateTime_parse2(text.jObj, formatter.jObj);
    LocalDateTime newObj = new (externalObj);
    return newObj;
}

# Retrieves the minimum supported LocalDateTime (-999999999-01-01T00:00:00).
#
# + return - The minimum LocalDateTime.
public function getMINDateTime() returns LocalDateTime {
    handle externalObj = java_time_LocalDateTime_getMIN();
    LocalDateTime newObj = new (externalObj);
    return newObj;
}

# Retrieves the maximum supported LocalDateTime (+999999999-12-31T23:59:59.999999999).
#
# + return - The maximum LocalDateTime.
public function getMAXDateTime() returns LocalDateTime {
    handle externalObj = java_time_LocalDateTime_getMAX();
    LocalDateTime newObj = new (externalObj);
    return newObj;
}

function java_time_LocalDateTime_adjustInto(handle receiver, handle arg0) returns handle = @java:Method {
    name: "adjustInto",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.temporal.Temporal"]
} external;

function java_time_LocalDateTime_atOffset(handle receiver, handle arg0) returns handle = @java:Method {
    name: "atOffset",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.ZoneOffset"]
} external;

function java_time_LocalDateTime_atZone(handle receiver, handle arg0) returns handle = @java:Method {
    name: "atZone",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.ZoneId"]
} external;

function java_time_LocalDateTime_compareTo(handle receiver, handle arg0) returns int = @java:Method {
    name: "compareTo",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.chrono.ChronoLocalDateTime"]
} external;

function java_time_LocalDateTime_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.lang.Object"]
} external;

function java_time_LocalDateTime_format(handle receiver, handle arg0) returns handle = @java:Method {
    name: "format",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.format.DateTimeFormatter"]
} external;

function java_time_LocalDateTime_from(handle arg0) returns handle = @java:Method {
    name: "from",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.temporal.TemporalAccessor"]
} external;

function java_time_LocalDateTime_get(handle receiver, handle arg0) returns int = @java:Method {
    name: "get",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.temporal.TemporalField"]
} external;

function java_time_LocalDateTime_getChronology(handle receiver) returns handle = @java:Method {
    name: "getChronology",
    'class: "java.time.LocalDateTime",
    paramTypes: []
} external;

function java_time_LocalDateTime_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "java.time.LocalDateTime",
    paramTypes: []
} external;

function java_time_LocalDateTime_getDayOfMonth(handle receiver) returns int = @java:Method {
    name: "getDayOfMonth",
    'class: "java.time.LocalDateTime",
    paramTypes: []
} external;

function java_time_LocalDateTime_getDayOfWeek(handle receiver) returns handle = @java:Method {
    name: "getDayOfWeek",
    'class: "java.time.LocalDateTime",
    paramTypes: []
} external;

function java_time_LocalDateTime_getDayOfYear(handle receiver) returns int = @java:Method {
    name: "getDayOfYear",
    'class: "java.time.LocalDateTime",
    paramTypes: []
} external;

function java_time_LocalDateTime_getHour(handle receiver) returns int = @java:Method {
    name: "getHour",
    'class: "java.time.LocalDateTime",
    paramTypes: []
} external;

function java_time_LocalDateTime_getLong(handle receiver, handle arg0) returns int = @java:Method {
    name: "getLong",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.temporal.TemporalField"]
} external;

function java_time_LocalDateTime_getMinute(handle receiver) returns int = @java:Method {
    name: "getMinute",
    'class: "java.time.LocalDateTime",
    paramTypes: []
} external;

function java_time_LocalDateTime_getMonth(handle receiver) returns handle = @java:Method {
    name: "getMonth",
    'class: "java.time.LocalDateTime",
    paramTypes: []
} external;

function java_time_LocalDateTime_getMonthValue(handle receiver) returns int = @java:Method {
    name: "getMonthValue",
    'class: "java.time.LocalDateTime",
    paramTypes: []
} external;

function java_time_LocalDateTime_getNano(handle receiver) returns int = @java:Method {
    name: "getNano",
    'class: "java.time.LocalDateTime",
    paramTypes: []
} external;

function java_time_LocalDateTime_getSecond(handle receiver) returns int = @java:Method {
    name: "getSecond",
    'class: "java.time.LocalDateTime",
    paramTypes: []
} external;

function java_time_LocalDateTime_getYear(handle receiver) returns int = @java:Method {
    name: "getYear",
    'class: "java.time.LocalDateTime",
    paramTypes: []
} external;

function java_time_LocalDateTime_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "java.time.LocalDateTime",
    paramTypes: []
} external;

function java_time_LocalDateTime_isAfter(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "isAfter",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.chrono.ChronoLocalDateTime"]
} external;

function java_time_LocalDateTime_isBefore(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "isBefore",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.chrono.ChronoLocalDateTime"]
} external;

function java_time_LocalDateTime_isEqual(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "isEqual",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.chrono.ChronoLocalDateTime"]
} external;

function java_time_LocalDateTime_isSupported(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "isSupported",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.temporal.TemporalField"]
} external;

function java_time_LocalDateTime_isSupported2(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "isSupported",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.temporal.TemporalUnit"]
} external;

function java_time_LocalDateTime_minus(handle receiver, int arg0, handle arg1) returns handle = @java:Method {
    name: "minus",
    'class: "java.time.LocalDateTime",
    paramTypes: ["long", "java.time.temporal.TemporalUnit"]
} external;

function java_time_LocalDateTime_minus2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "minus",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.temporal.TemporalAmount"]
} external;

function java_time_LocalDateTime_minusDays(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusDays",
    'class: "java.time.LocalDateTime",
    paramTypes: ["long"]
} external;

function java_time_LocalDateTime_minusHours(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusHours",
    'class: "java.time.LocalDateTime",
    paramTypes: ["long"]
} external;

function java_time_LocalDateTime_minusMinutes(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusMinutes",
    'class: "java.time.LocalDateTime",
    paramTypes: ["long"]
} external;

function java_time_LocalDateTime_minusMonths(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusMonths",
    'class: "java.time.LocalDateTime",
    paramTypes: ["long"]
} external;

function java_time_LocalDateTime_minusNanos(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusNanos",
    'class: "java.time.LocalDateTime",
    paramTypes: ["long"]
} external;

function java_time_LocalDateTime_minusSeconds(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusSeconds",
    'class: "java.time.LocalDateTime",
    paramTypes: ["long"]
} external;

function java_time_LocalDateTime_minusWeeks(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusWeeks",
    'class: "java.time.LocalDateTime",
    paramTypes: ["long"]
} external;

function java_time_LocalDateTime_minusYears(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusYears",
    'class: "java.time.LocalDateTime",
    paramTypes: ["long"]
} external;

function java_time_LocalDateTime_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "java.time.LocalDateTime",
    paramTypes: []
} external;

function java_time_LocalDateTime_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "java.time.LocalDateTime",
    paramTypes: []
} external;

function java_time_LocalDateTime_now() returns handle = @java:Method {
    name: "now",
    'class: "java.time.LocalDateTime",
    paramTypes: []
} external;

function java_time_LocalDateTime_now2(handle arg0) returns handle = @java:Method {
    name: "now",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.Clock"]
} external;

function java_time_LocalDateTime_now3(handle arg0) returns handle = @java:Method {
    name: "now",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.ZoneId"]
} external;

function java_time_LocalDateTime_of(int arg0, int arg1, int arg2, int arg3, int arg4) returns handle = @java:Method {
    name: "of",
    'class: "java.time.LocalDateTime",
    paramTypes: ["int", "int", "int", "int", "int"]
} external;

function java_time_LocalDateTime_of2(int arg0, int arg1, int arg2, int arg3, int arg4, int arg5) returns handle = @java:Method {
    name: "of",
    'class: "java.time.LocalDateTime",
    paramTypes: ["int", "int", "int", "int", "int", "int"]
} external;

function java_time_LocalDateTime_of3(int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6) returns handle = @java:Method {
    name: "of",
    'class: "java.time.LocalDateTime",
    paramTypes: ["int", "int", "int", "int", "int", "int", "int"]
} external;

function java_time_LocalDateTime_of4(int arg0, handle arg1, int arg2, int arg3, int arg4) returns handle = @java:Method {
    name: "of",
    'class: "java.time.LocalDateTime",
    paramTypes: ["int", "java.time.Month", "int", "int", "int"]
} external;

function java_time_LocalDateTime_of5(int arg0, handle arg1, int arg2, int arg3, int arg4, int arg5) returns handle = @java:Method {
    name: "of",
    'class: "java.time.LocalDateTime",
    paramTypes: ["int", "java.time.Month", "int", "int", "int", "int"]
} external;

function java_time_LocalDateTime_of6(int arg0, handle arg1, int arg2, int arg3, int arg4, int arg5, int arg6) returns handle = @java:Method {
    name: "of",
    'class: "java.time.LocalDateTime",
    paramTypes: ["int", "java.time.Month", "int", "int", "int", "int", "int"]
} external;

function java_time_LocalDateTime_of7(handle arg0, handle arg1) returns handle = @java:Method {
    name: "of",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.LocalDate", "java.time.LocalTime"]
} external;

function java_time_LocalDateTime_ofEpochSecond(int arg0, int arg1, handle arg2) returns handle = @java:Method {
    name: "ofEpochSecond",
    'class: "java.time.LocalDateTime",
    paramTypes: ["long", "int", "java.time.ZoneOffset"]
} external;

function java_time_LocalDateTime_ofInstant(handle arg0, handle arg1) returns handle = @java:Method {
    name: "ofInstant",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.Instant", "java.time.ZoneId"]
} external;

function java_time_LocalDateTime_parse(handle arg0) returns handle = @java:Method {
    name: "parse",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.lang.CharSequence"]
} external;

function java_time_LocalDateTime_parse2(handle arg0, handle arg1) returns handle = @java:Method {
    name: "parse",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.lang.CharSequence", "java.time.format.DateTimeFormatter"]
} external;

function java_time_LocalDateTime_plus(handle receiver, int arg0, handle arg1) returns handle = @java:Method {
    name: "plus",
    'class: "java.time.LocalDateTime",
    paramTypes: ["long", "java.time.temporal.TemporalUnit"]
} external;

function java_time_LocalDateTime_plus2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "plus",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.temporal.TemporalAmount"]
} external;

function java_time_LocalDateTime_plusDays(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusDays",
    'class: "java.time.LocalDateTime",
    paramTypes: ["long"]
} external;

function java_time_LocalDateTime_plusHours(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusHours",
    'class: "java.time.LocalDateTime",
    paramTypes: ["long"]
} external;

function java_time_LocalDateTime_plusMinutes(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusMinutes",
    'class: "java.time.LocalDateTime",
    paramTypes: ["long"]
} external;

function java_time_LocalDateTime_plusMonths(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusMonths",
    'class: "java.time.LocalDateTime",
    paramTypes: ["long"]
} external;

function java_time_LocalDateTime_plusNanos(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusNanos",
    'class: "java.time.LocalDateTime",
    paramTypes: ["long"]
} external;

function java_time_LocalDateTime_plusSeconds(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusSeconds",
    'class: "java.time.LocalDateTime",
    paramTypes: ["long"]
} external;

function java_time_LocalDateTime_plusWeeks(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusWeeks",
    'class: "java.time.LocalDateTime",
    paramTypes: ["long"]
} external;

function java_time_LocalDateTime_plusYears(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusYears",
    'class: "java.time.LocalDateTime",
    paramTypes: ["long"]
} external;

function java_time_LocalDateTime_query(handle receiver, handle arg0) returns handle = @java:Method {
    name: "query",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.temporal.TemporalQuery"]
} external;

function java_time_LocalDateTime_range(handle receiver, handle arg0) returns handle = @java:Method {
    name: "range",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.temporal.TemporalField"]
} external;

function java_time_LocalDateTime_toEpochSecond(handle receiver, handle arg0) returns int = @java:Method {
    name: "toEpochSecond",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.ZoneOffset"]
} external;

function java_time_LocalDateTime_toInstant(handle receiver, handle arg0) returns handle = @java:Method {
    name: "toInstant",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.ZoneOffset"]
} external;

function java_time_LocalDateTime_toLocalDate(handle receiver) returns handle = @java:Method {
    name: "toLocalDate",
    'class: "java.time.LocalDateTime",
    paramTypes: []
} external;

function java_time_LocalDateTime_toLocalTime(handle receiver) returns handle = @java:Method {
    name: "toLocalTime",
    'class: "java.time.LocalDateTime",
    paramTypes: []
} external;

function java_time_LocalDateTime_truncatedTo(handle receiver, handle arg0) returns handle = @java:Method {
    name: "truncatedTo",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.temporal.TemporalUnit"]
} external;

function java_time_LocalDateTime_until(handle receiver, handle arg0, handle arg1) returns int = @java:Method {
    name: "until",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.temporal.Temporal", "java.time.temporal.TemporalUnit"]
} external;

function java_time_LocalDateTime_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "java.time.LocalDateTime",
    paramTypes: []
} external;

function java_time_LocalDateTime_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "java.time.LocalDateTime",
    paramTypes: ["long"]
} external;

function java_time_LocalDateTime_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "java.time.LocalDateTime",
    paramTypes: ["long", "int"]
} external;

function java_time_LocalDateTime_with(handle receiver, handle arg0) returns handle = @java:Method {
    name: "with",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.temporal.TemporalAdjuster"]
} external;

function java_time_LocalDateTime_with2(handle receiver, handle arg0, int arg1) returns handle = @java:Method {
    name: "with",
    'class: "java.time.LocalDateTime",
    paramTypes: ["java.time.temporal.TemporalField", "long"]
} external;

function java_time_LocalDateTime_withDayOfMonth(handle receiver, int arg0) returns handle = @java:Method {
    name: "withDayOfMonth",
    'class: "java.time.LocalDateTime",
    paramTypes: ["int"]
} external;

function java_time_LocalDateTime_withDayOfYear(handle receiver, int arg0) returns handle = @java:Method {
    name: "withDayOfYear",
    'class: "java.time.LocalDateTime",
    paramTypes: ["int"]
} external;

function java_time_LocalDateTime_withHour(handle receiver, int arg0) returns handle = @java:Method {
    name: "withHour",
    'class: "java.time.LocalDateTime",
    paramTypes: ["int"]
} external;

function java_time_LocalDateTime_withMinute(handle receiver, int arg0) returns handle = @java:Method {
    name: "withMinute",
    'class: "java.time.LocalDateTime",
    paramTypes: ["int"]
} external;

function java_time_LocalDateTime_withMonth(handle receiver, int arg0) returns handle = @java:Method {
    name: "withMonth",
    'class: "java.time.LocalDateTime",
    paramTypes: ["int"]
} external;

function java_time_LocalDateTime_withNano(handle receiver, int arg0) returns handle = @java:Method {
    name: "withNano",
    'class: "java.time.LocalDateTime",
    paramTypes: ["int"]
} external;

function java_time_LocalDateTime_withSecond(handle receiver, int arg0) returns handle = @java:Method {
    name: "withSecond",
    'class: "java.time.LocalDateTime",
    paramTypes: ["int"]
} external;

function java_time_LocalDateTime_withYear(handle receiver, int arg0) returns handle = @java:Method {
    name: "withYear",
    'class: "java.time.LocalDateTime",
    paramTypes: ["int"]
} external;

function java_time_LocalDateTime_getMIN() returns handle = @java:FieldGet {
    name: "MIN",
    'class: "java.time.LocalDateTime"
} external;

function java_time_LocalDateTime_getMAX() returns handle = @java:FieldGet {
    name: "MAX",
    'class: "java.time.LocalDateTime"
} external;

