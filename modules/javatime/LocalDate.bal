import ballerina/jballerina.java;

# Represents a date without a time-zone in the ISO-8601 calendar system, 
# such as 2026-07-15.
@java:Binding {'class: "java.time.LocalDate"}
public distinct class LocalDate {

    *java:JObject;
    *Object;

    # The handle to the underlying Java object.
    public handle jObj;

    # Initializes the LocalDate wrapper.
    # + obj - The handle value containing the Java reference.
    public function init(handle obj) {
        self.jObj = obj;
    }

    # Returns the string representation of this date in ISO-8601 format.
    # + return - The string form (e.g., "2026-07-15").
    public function toString() returns string {
        return java:toString(self.jObj) ?: "";
    }

    # Adjusts the specified temporal object to have this date.
    # + temporal - The temporal object to adjust.
    # + return - The adjusted temporal object.
    function adjustInto(Temporal temporal) returns Temporal {
        handle externalObj = java_time_LocalDate_adjustInto(self.jObj, temporal.jObj);
        Temporal newObj = new (externalObj);
        return newObj;
    }

    # Returns a LocalDateTime formed from this date at the start of the day (00:00).
    # + return - The resulting LocalDateTime.
    public function atStartOfDay() returns LocalDateTime {
        handle externalObj = java_time_LocalDate_atStartOfDay(self.jObj);
        LocalDateTime newObj = new (externalObj);
        return newObj;
    }

    # Returns a ZonedDateTime formed from this date at the start of the day in the specified time-zone.
    # + zone - The time-zone to use.
    # + return - The resulting ZonedDateTime.
    function atStartOfDayWithZone(ZoneId zone) returns ZonedDateTime {
        handle externalObj = java_time_LocalDate_atStartOfDay2(self.jObj, zone.jObj);
        ZonedDateTime newObj = new (externalObj);
        return newObj;
    }

    # Combines this date with the specified time to create a LocalDateTime.
    # + hour - The hour (0-23).
    # + minute - The minute (0-59).
    # + return - The resulting LocalDateTime.
    public function atTime(int hour, int minute) returns LocalDateTime {
        handle externalObj = java_time_LocalDate_atTime(self.jObj, hour, minute);
        LocalDateTime newObj = new (externalObj);
        return newObj;
    }

    # Combines this date with the specified time (hours, minutes, seconds) to create a LocalDateTime.
    # + hour - The hour (0-23).
    # + minute - The minute (0-59).
    # + second - The second (0-59).
    # + return - The resulting LocalDateTime.
    public function atTimeDetailed(int hour, int minute, int second) returns LocalDateTime {
        handle externalObj = java_time_LocalDate_atTime2(self.jObj, hour, minute, second);
        LocalDateTime newObj = new (externalObj);
        return newObj;
    }

    # Combines this date with the specified time (hours, minutes, seconds, nanos) to create a LocalDateTime.
    # + hour - The hour.
    # + minute - The minute.
    # + second - The second.
    # + nano - The nanosecond.
    # + return - The resulting LocalDateTime.
    public function atTimeFull(int hour, int minute, int second, int nano) returns LocalDateTime {
        handle externalObj = java_time_LocalDate_atTime3(self.jObj, hour, minute, second, nano);
        LocalDateTime newObj = new (externalObj);
        return newObj;
    }

    # Combines this date with the specified LocalTime to create a LocalDateTime.
    # + time - The LocalTime to combine with this date.
    # + return - The resulting LocalDateTime.
    public function atLocalTime(LocalTime time) returns LocalDateTime {
        handle externalObj = java_time_LocalDate_atTime4(self.jObj, time.jObj);
        LocalDateTime newObj = new (externalObj);
        return newObj;
    }

    # Combines this date with the specified OffsetTime to create an OffsetDateTime.
    # + time - The OffsetTime to combine with this date.
    # + return - The resulting OffsetDateTime.
    function atOffsetTime(OffsetTime time) returns OffsetDateTime {
        handle externalObj = java_time_LocalDate_atTime5(self.jObj, time.jObj);
        OffsetDateTime newObj = new (externalObj);
        return newObj;
    }

    # Compares this date to another date.
    # + other - The date to compare to.
    # + return - The comparator value (less than 0 if before, 0 if equal, greater than 0 if after).
    function compareTo(ChronoLocalDate other) returns int {
        return java_time_LocalDate_compareTo(self.jObj, other.jObj);
    }

    # Returns a stream of dates from this date until the specified end date.
    # + endExclusive - The end date, exclusive.
    # + return - A stream of dates.
    public function datesUntil(LocalDate endExclusive) returns Stream {
        handle externalObj = java_time_LocalDate_datesUntil(self.jObj, endExclusive.jObj);
        return new (externalObj);
    }

    # Returns a stream of dates from this date until the specified end date, by the specified step.
    # + endExclusive - The end date, exclusive.
    # + step - The period of the step.
    # + return - A stream of dates.
    function datesUntilWithStep(LocalDate endExclusive, Period step) returns Stream {
        handle externalObj = java_time_LocalDate_datesUntil2(self.jObj, endExclusive.jObj, step.jObj);
        return new (externalObj);
    }

    # Checks if this date is equal to another object.
    # + other - The object to check equality with.
    # + return - True if equal, false otherwise.
    public function isEquals(Object other) returns boolean {
        return java_time_LocalDate_equals(self.jObj, other.jObj);
    }

    # Formats this date using the specified formatter.
    # + formatter - The date-time formatter to use.
    # + return - The formatted date string.
    function format(DateTimeFormatter formatter) returns string {
        return java:toString(java_time_LocalDate_format(self.jObj, formatter.jObj)) ?: "";
    }

    # Queries this date for the specified field.
    # + temporalField - The field to query.
    # + return - The value for the field.
    function get(TemporalField temporalField) returns int {
        return java_time_LocalDate_get(self.jObj, temporalField.jObj);
    }

    # Returns the chronology of this date.
    # + return - The ISO chronology.
    public function getChronology() returns IsoChronology {
        handle externalObj = java_time_LocalDate_getChronology(self.jObj);
        return new (externalObj);
    }

    # Returns the class of this object.
    # + return - The Java class instance.
    public function getClass() returns Class {
        handle externalObj = java_time_LocalDate_getClass(self.jObj);
        return new (externalObj);
    }

    # Returns the day-of-month.
    # + return - The day-of-month, from 1 to 31.
    public function getDayOfMonth() returns int {
        return java_time_LocalDate_getDayOfMonth(self.jObj);
    }

    # Returns the day-of-week.
    # + return - The day-of-week enum.
    public function getDayOfWeek() returns DayOfWeek {
        handle externalObj = java_time_LocalDate_getDayOfWeek(self.jObj);
        return new (externalObj);
    }

    # Returns the day-of-year.
    # + return - The day-of-year, from 1 to 365 or 366.
    public function getDayOfYear() returns int {
        return java_time_LocalDate_getDayOfYear(self.jObj);
    }

    # Returns the era.
    # + return - The era constant.
    public function getEra() returns IsoEra {
        handle externalObj = java_time_LocalDate_getEra(self.jObj);
        return new (externalObj);
    }

    # Returns the value of the specified field as a long.
    # + temporalField - The field to query.
    # + return - The value for the field.
    function getLong(TemporalField temporalField) returns int {
        return java_time_LocalDate_getLong(self.jObj, temporalField.jObj);
    }

    # Returns the month-of-year.
    # + return - The month enum.
    public function getMonth() returns Month {
        handle externalObj = java_time_LocalDate_getMonth(self.jObj);
        return new (externalObj);
    }

    # Returns the month-of-year value (1-12).
    # + return - The month-of-year.
    public function getMonthValue() returns int {
        return java_time_LocalDate_getMonthValue(self.jObj);
    }

    # Returns the year.
    # + return - The year.
    public function getYear() returns int {
        return java_time_LocalDate_getYear(self.jObj);
    }

    # Returns the hash code for this date.
    # + return - The hash code.
    public function hashCode() returns int {
        return java_time_LocalDate_hashCode(self.jObj);
    }

    # Checks if this date is after the specified date.
    # + other - The other date to compare to.
    # + return - True if this date is after the specified date.
    function isAfter(ChronoLocalDate other) returns boolean {
        return java_time_LocalDate_isAfter(self.jObj, other.jObj);
    }

    # Checks if this date is before the specified date.
    # + other - The other date to compare to.
    # + return - True if this date is before the specified date.
    function isBefore(ChronoLocalDate other) returns boolean {
        return java_time_LocalDate_isBefore(self.jObj, other.jObj);
    }

    # Checks if this date is equal to the specified date.
    # + other - The other date to compare to.
    # + return - True if this date is equal to the specified date.
    function isEqual(ChronoLocalDate other) returns boolean {
        return java_time_LocalDate_isEqual(self.jObj, other.jObj);
    }

    # Checks if the year is a leap year.
    # + return - True if the year is a leap year.
    public function isLeapYear() returns boolean {
        return java_time_LocalDate_isLeapYear(self.jObj);
    }

    # Checks if the specified field is supported.
    # + temporalField - The field to check.
    # + return - True if supported.
    function isSupported(TemporalField temporalField) returns boolean {
        return java_time_LocalDate_isSupported(self.jObj, temporalField.jObj);
    }

    # Checks if the specified unit is supported.
    # + unit - The unit to check.
    # + return - True if supported.
    function isSupportedUnit(TemporalUnit unit) returns boolean {
        return java_time_LocalDate_isSupported2(self.jObj, unit.jObj);
    }

    # Returns the length of the month represented by this date.
    # + return - The length of the month.
    public function lengthOfMonth() returns int {
        return java_time_LocalDate_lengthOfMonth(self.jObj);
    }

    # Returns the length of the year represented by this date.
    # + return - The length of the year.
    public function lengthOfYear() returns int {
        return java_time_LocalDate_lengthOfYear(self.jObj);
    }

    # Returns a copy of this date with the specified amount subtracted.
    # + amount - The amount to subtract.
    # + unit - The unit of the amount.
    # + return - A date with the amount subtracted.
    function minus(int amount, TemporalUnit unit) returns LocalDate {
        handle externalObj = java_time_LocalDate_minus(self.jObj, amount, unit.jObj);
        return new (externalObj);
    }

    # Returns a copy of this date with the specified period subtracted.
    # + period - The amount to subtract.
    # + return - A date with the period subtracted.
    function minusPeriod(TemporalAmount period) returns LocalDate {
        handle externalObj = java_time_LocalDate_minus2(self.jObj, period.jObj);
        return new (externalObj);
    }

    # Returns a copy of this date with the specified number of days subtracted.
    # + days - The days to subtract.
    # + return - A date with the days subtracted.
    public function minusDays(int days) returns LocalDate {
        handle externalObj = java_time_LocalDate_minusDays(self.jObj, days);
        return new (externalObj);
    }

    # Returns a copy of this date with the specified number of months subtracted.
    # + months - The months to subtract.
    # + return - A date with the months subtracted.
    public function minusMonths(int months) returns LocalDate {
        handle externalObj = java_time_LocalDate_minusMonths(self.jObj, months);
        return new (externalObj);
    }

    # Returns a copy of this date with the specified number of weeks subtracted.
    #
    # + weeks - The number of weeks to subtract.
    # + return - A new LocalDate with the weeks subtracted.
    public function minusWeeks(int weeks) returns LocalDate {
        handle externalObj = java_time_LocalDate_minusWeeks(self.jObj, weeks);
        return new (externalObj);
    }

    # Returns a copy of this date with the specified number of years subtracted.
    #
    # + years - The number of years to subtract.
    # + return - A new LocalDate with the years subtracted.
    public function minusYears(int years) returns LocalDate {
        handle externalObj = java_time_LocalDate_minusYears(self.jObj, years);
        return new (externalObj);
    }

    # Wakes up a single thread that is waiting on this object's monitor.
    # WARNING: This is a low-level Java synchronization method. Avoid using it in business logic.
    public function notify() {
        java_time_LocalDate_notify(self.jObj);
    }

    # Wakes up all threads that are waiting on this object's monitor.
    # WARNING: This is a low-level Java synchronization method. Avoid using it in business logic.
    public function notifyAll() {
        java_time_LocalDate_notifyAll(self.jObj);
    }

    # Returns a copy of this date with the specified amount added.
    #
    # + amount - The amount to add.
    # + unit - The unit of the amount to add.
    # + return - A new LocalDate with the specified amount added.
    function plus(int amount, TemporalUnit unit) returns LocalDate {
        handle externalObj = java_time_LocalDate_plus(self.jObj, amount, unit.jObj);
        return new (externalObj);
    }

    # Returns a copy of this date with the specified period added.
    #
    # + amount - The amount to add.
    # + return - A new LocalDate with the specified period added.
    function plusPeriod(TemporalAmount amount) returns LocalDate {
        handle externalObj = java_time_LocalDate_plus2(self.jObj, amount.jObj);
        return new (externalObj);
    }

    # Returns a copy of this date with the specified number of days added.
    #
    # + days - The number of days to add, may be negative.
    # + return - A new LocalDate with the days added.
    public function plusDays(int days) returns LocalDate {
        handle externalObj = java_time_LocalDate_plusDays(self.jObj, days);
        return new (externalObj);
    }

    # Returns a copy of this date with the specified number of months added.
    #
    # + months - The number of months to add, may be negative.
    # + return - A new LocalDate with the months added.
    public function plusMonths(int months) returns LocalDate {
        handle externalObj = java_time_LocalDate_plusMonths(self.jObj, months);
        return new (externalObj);
    }

    # Returns a copy of this date with the specified number of weeks added.
    #
    # + weeks - The number of weeks to add, may be negative.
    # + return - A new LocalDate with the weeks added.
    public function plusWeeks(int weeks) returns LocalDate {
        handle externalObj = java_time_LocalDate_plusWeeks(self.jObj, weeks);
        return new (externalObj);
    }

    # Returns a copy of this date with the specified number of years added.
    #
    # + years - The number of years to add, may be negative.
    # + return - A new LocalDate with the years added.
    public function plusYears(int years) returns LocalDate {
        handle externalObj = java_time_LocalDate_plusYears(self.jObj, years);
        return new (externalObj);
    }

    # Queries this date using the specified query.
    #
    # + query - The query to use.
    # + return - The query result.
    function query(TemporalQuery query) returns Object {
        handle externalObj = java_time_LocalDate_query(self.jObj, query.jObj);
        return new (externalObj);
    }

    # Returns the range of valid values for the specified field.
    #
    # + temporalField - The field to query.
    # + return - The range of valid values.
    function range(TemporalField temporalField) returns ValueRange {
        handle externalObj = java_time_LocalDate_range(self.jObj, temporalField.jObj);
        ValueRange newObj = new (externalObj);
        return newObj;
    }

    # Returns the epoch day count.
    #
    # + return - The epoch day count.
    public function toEpochDay() returns int {
        return java_time_LocalDate_toEpochDay(self.jObj);
    }

    # Returns the epoch second for this date at the specified time and offset.
    #
    # + time - The local time.
    # + offset - The zone offset.
    # + return - The epoch second.
    function toEpochSecond(LocalTime time, ZoneOffset offset) returns int {
        return java_time_LocalDate_toEpochSecond(self.jObj, time.jObj, offset.jObj);
    }

    # Returns the period between this date and another date.
    #
    # + endDate - The end date, exclusive.
    # + return - The period between the dates.
    function until(ChronoLocalDate endDate) returns Period {
        handle externalObj = java_time_LocalDate_until(self.jObj, endDate.jObj);
        Period newObj = new (externalObj);
        return newObj;
    }

    # Returns the amount of time between this date and another date in the specified unit.
    #
    # + endExclusive - The end date, exclusive.
    # + unit - The unit of time.
    # + return - The amount of time.
    function until2(Temporal endExclusive, TemporalUnit unit) returns int {
        return java_time_LocalDate_until2(self.jObj, endExclusive.jObj, unit.jObj);
    }

    # Causes the current thread to wait until notified.
    # WARNING: Low-level Java synchronization method. Use with caution.
    #
    # + return - An InterruptedException if the thread is interrupted while waiting.
    public function doWait() returns InterruptedException? {
        error|() externalObj = java_time_LocalDate_wait(self.jObj);
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
        error|() externalObj = java_time_LocalDate_wait2(self.jObj, timeoutMillis);
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
        error|() externalObj = java_time_LocalDate_wait3(self.jObj, timeoutMillis, nanos);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # Returns a copy of this date with the specified adjuster applied.
    #
    # + adjuster - The adjuster to use.
    # + return - A new LocalDate with the adjustment applied.
    function 'with(TemporalAdjuster adjuster) returns LocalDate {
        handle externalObj = java_time_LocalDate_with(self.jObj, adjuster.jObj);
        LocalDate newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this date with the specified field set to a new value.
    #
    # + temporalField - The field to set.
    # + newValue - The new value for the field.
    # + return - A new LocalDate with the field set.
    function with2(TemporalField temporalField, int newValue) returns LocalDate {
        handle externalObj = java_time_LocalDate_with2(self.jObj, temporalField.jObj, newValue);
        LocalDate newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this date with the day-of-month altered.
    #
    # + dayOfMonth - The day-of-month to set (1-31).
    # + return - A new LocalDate with the day-of-month set.
    public function withDayOfMonth(int dayOfMonth) returns LocalDate {
        handle externalObj = java_time_LocalDate_withDayOfMonth(self.jObj, dayOfMonth);
        LocalDate newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this date with the day-of-year altered.
    #
    # + dayOfYear - The day-of-year to set (1-365/366).
    # + return - A new LocalDate with the day-of-year set.
    public function withDayOfYear(int dayOfYear) returns LocalDate {
        handle externalObj = java_time_LocalDate_withDayOfYear(self.jObj, dayOfYear);
        LocalDate newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this date with the month-of-year altered.
    #
    # + month - The month-of-year to set (1-12).
    # + return - A new LocalDate with the month set.
    public function withMonth(int month) returns LocalDate {
        handle externalObj = java_time_LocalDate_withMonth(self.jObj, month);
        LocalDate newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this date with the year altered.
    #
    # + year - The year to set.
    # + return - A new LocalDate with the year set.
    public function withYear(int year) returns LocalDate {
        handle externalObj = java_time_LocalDate_withYear(self.jObj, year);
        LocalDate newObj = new (externalObj);
        return newObj;
    }

}

# Obtains a LocalDate from a temporal object.
#
# + temporalAccessor - The temporal object to convert.
# + return - The LocalDate.
function fromTemporal(TemporalAccessor temporalAccessor) returns LocalDate {
    handle externalObj = java_time_LocalDate_from(temporalAccessor.jObj);
    LocalDate newObj = new (externalObj);
    return newObj;
}

# Obtains the current date from the system clock in the default time-zone.
#
# + return - The current LocalDate.
public function getCurrentDate() returns LocalDate {
    handle externalObj = java_time_LocalDate_now();
    LocalDate newObj = new (externalObj);
    return newObj;
}

# Obtains the current date from the specified clock.
#
# + clock - The clock to use.
# + return - The current LocalDate.
function nowWithClock(Clock clock) returns LocalDate {
    handle externalObj = java_time_LocalDate_now2(clock.jObj);
    LocalDate newObj = new (externalObj);
    return newObj;
}

# Obtains the current date in the specified time-zone.
#
# + zone - The time-zone to use.
# + return - The current LocalDate.
function WithZone(ZoneId zone) returns LocalDate {
    handle externalObj = java_time_LocalDate_now3(zone.jObj);
    LocalDate newObj = new (externalObj);
    return newObj;
}

# Obtains a LocalDate from a year, month, and day.
#
# + year - The year.
# + month - The month-of-year (1-12).
# + day - The day-of-month (1-31).
# + return - The LocalDate.
public function ofDate(int year, int month, int day) returns LocalDate {
    handle externalObj = java_time_LocalDate_of(year, month, day);
    LocalDate newObj = new (externalObj);
    return newObj;
}

# Obtains a LocalDate from a year, month, and day.
#
# + year - The year.
# + month - The month enum.
# + day - The day-of-month (1-31).
# + return - The LocalDate.
function ofMonth(int year, Month month, int day) returns LocalDate {
    handle externalObj = java_time_LocalDate_of2(year, month.jObj, day);
    LocalDate newObj = new (externalObj);
    return newObj;
}

# Obtains a LocalDate from the epoch day count.
#
# + epochDay - The number of days from the epoch of 1970-01-01.
# + return - The LocalDate.
public function ofEpochDay(int epochDay) returns LocalDate {
    handle externalObj = java_time_LocalDate_ofEpochDay(epochDay);
    LocalDate newObj = new (externalObj);
    return newObj;
}

# Obtains a LocalDate from an Instant and a time-zone.
#
# + instant - The instant to use.
# + zone - The time-zone to use.
# + return - The LocalDate.
function ofInstant(Instant instant, ZoneId zone) returns LocalDate {
    handle externalObj = java_time_LocalDate_ofInstant(instant.jObj, zone.jObj);
    LocalDate newObj = new (externalObj);
    return newObj;
}

# Obtains a LocalDate from a year and day-of-year.
#
# + year - The year to represent.
# + dayOfYear - The day-of-year to represent (1-366).
# + return - The LocalDate.
public function ofYearDay(int year, int dayOfYear) returns LocalDate {
    handle externalObj = java_time_LocalDate_ofYearDay(year, dayOfYear);
    LocalDate newObj = new (externalObj);
    return newObj;
}

# Parses a string to a LocalDate using the ISO-8601 formatter.
#
# + text - The text to parse, such as "2026-07-15".
# + return - The LocalDate.
function parse(CharSequence text) returns LocalDate {
    handle externalObj = java_time_LocalDate_parse(text.jObj);
    LocalDate newObj = new (externalObj);
    return newObj;
}

# Parses a string to a LocalDate using a specific formatter.
#
# + text - The text to parse.
# + formatter - The formatter to use.
# + return - The LocalDate.
function parseWithFormatter(CharSequence text, DateTimeFormatter formatter) returns LocalDate {
    handle externalObj = java_time_LocalDate_parse2(text.jObj, formatter.jObj);
    LocalDate newObj = new (externalObj);
    return newObj;
}

# Returns the minimum supported LocalDate (year -999999999-01-01).
#
# + return - The MIN constant.
public function getMINDate() returns LocalDate {
    handle externalObj = java_time_LocalDate_getMIN();
    LocalDate newObj = new (externalObj);
    return newObj;
}

# Returns the maximum supported LocalDate (year 999999999-12-31).
#
# + return - The MAX constant.
public function getMAXDate() returns LocalDate {
    handle externalObj = java_time_LocalDate_getMAX();
    LocalDate newObj = new (externalObj);
    return newObj;
}

# Returns the epoch date (1970-01-01).
#
# + return - The EPOCH constant.
public function getEPOCHDate() returns LocalDate {
    handle externalObj = java_time_LocalDate_getEPOCH();
    LocalDate newObj = new (externalObj);
    return newObj;
}

function java_time_LocalDate_adjustInto(handle receiver, handle arg0) returns handle = @java:Method {
    name: "adjustInto",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.temporal.Temporal"]
} external;

function java_time_LocalDate_atStartOfDay(handle receiver) returns handle = @java:Method {
    name: "atStartOfDay",
    'class: "java.time.LocalDate",
    paramTypes: []
} external;

function java_time_LocalDate_atStartOfDay2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "atStartOfDay",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.ZoneId"]
} external;

function java_time_LocalDate_atTime(handle receiver, int arg0, int arg1) returns handle = @java:Method {
    name: "atTime",
    'class: "java.time.LocalDate",
    paramTypes: ["int", "int"]
} external;

function java_time_LocalDate_atTime2(handle receiver, int arg0, int arg1, int arg2) returns handle = @java:Method {
    name: "atTime",
    'class: "java.time.LocalDate",
    paramTypes: ["int", "int", "int"]
} external;

function java_time_LocalDate_atTime3(handle receiver, int arg0, int arg1, int arg2, int arg3) returns handle = @java:Method {
    name: "atTime",
    'class: "java.time.LocalDate",
    paramTypes: ["int", "int", "int", "int"]
} external;

function java_time_LocalDate_atTime4(handle receiver, handle arg0) returns handle = @java:Method {
    name: "atTime",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.LocalTime"]
} external;

function java_time_LocalDate_atTime5(handle receiver, handle arg0) returns handle = @java:Method {
    name: "atTime",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.OffsetTime"]
} external;

function java_time_LocalDate_compareTo(handle receiver, handle arg0) returns int = @java:Method {
    name: "compareTo",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.chrono.ChronoLocalDate"]
} external;

function java_time_LocalDate_datesUntil(handle receiver, handle arg0) returns handle = @java:Method {
    name: "datesUntil",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.LocalDate"]
} external;

function java_time_LocalDate_datesUntil2(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "datesUntil",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.LocalDate", "java.time.Period"]
} external;

function java_time_LocalDate_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "java.time.LocalDate",
    paramTypes: ["java.lang.Object"]
} external;

function java_time_LocalDate_format(handle receiver, handle arg0) returns handle = @java:Method {
    name: "format",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.format.DateTimeFormatter"]
} external;

function java_time_LocalDate_from(handle arg0) returns handle = @java:Method {
    name: "from",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.temporal.TemporalAccessor"]
} external;

function java_time_LocalDate_get(handle receiver, handle arg0) returns int = @java:Method {
    name: "get",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.temporal.TemporalField"]
} external;

function java_time_LocalDate_getChronology(handle receiver) returns handle = @java:Method {
    name: "getChronology",
    'class: "java.time.LocalDate",
    paramTypes: []
} external;

function java_time_LocalDate_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "java.time.LocalDate",
    paramTypes: []
} external;

function java_time_LocalDate_getDayOfMonth(handle receiver) returns int = @java:Method {
    name: "getDayOfMonth",
    'class: "java.time.LocalDate",
    paramTypes: []
} external;

function java_time_LocalDate_getDayOfWeek(handle receiver) returns handle = @java:Method {
    name: "getDayOfWeek",
    'class: "java.time.LocalDate",
    paramTypes: []
} external;

function java_time_LocalDate_getDayOfYear(handle receiver) returns int = @java:Method {
    name: "getDayOfYear",
    'class: "java.time.LocalDate",
    paramTypes: []
} external;

function java_time_LocalDate_getEra(handle receiver) returns handle = @java:Method {
    name: "getEra",
    'class: "java.time.LocalDate",
    paramTypes: []
} external;

function java_time_LocalDate_getLong(handle receiver, handle arg0) returns int = @java:Method {
    name: "getLong",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.temporal.TemporalField"]
} external;

function java_time_LocalDate_getMonth(handle receiver) returns handle = @java:Method {
    name: "getMonth",
    'class: "java.time.LocalDate",
    paramTypes: []
} external;

function java_time_LocalDate_getMonthValue(handle receiver) returns int = @java:Method {
    name: "getMonthValue",
    'class: "java.time.LocalDate",
    paramTypes: []
} external;

function java_time_LocalDate_getYear(handle receiver) returns int = @java:Method {
    name: "getYear",
    'class: "java.time.LocalDate",
    paramTypes: []
} external;

function java_time_LocalDate_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "java.time.LocalDate",
    paramTypes: []
} external;

function java_time_LocalDate_isAfter(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "isAfter",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.chrono.ChronoLocalDate"]
} external;

function java_time_LocalDate_isBefore(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "isBefore",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.chrono.ChronoLocalDate"]
} external;

function java_time_LocalDate_isEqual(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "isEqual",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.chrono.ChronoLocalDate"]
} external;

function java_time_LocalDate_isLeapYear(handle receiver) returns boolean = @java:Method {
    name: "isLeapYear",
    'class: "java.time.LocalDate",
    paramTypes: []
} external;

function java_time_LocalDate_isSupported(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "isSupported",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.temporal.TemporalField"]
} external;

function java_time_LocalDate_isSupported2(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "isSupported",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.temporal.TemporalUnit"]
} external;

function java_time_LocalDate_lengthOfMonth(handle receiver) returns int = @java:Method {
    name: "lengthOfMonth",
    'class: "java.time.LocalDate",
    paramTypes: []
} external;

function java_time_LocalDate_lengthOfYear(handle receiver) returns int = @java:Method {
    name: "lengthOfYear",
    'class: "java.time.LocalDate",
    paramTypes: []
} external;

function java_time_LocalDate_minus(handle receiver, int arg0, handle arg1) returns handle = @java:Method {
    name: "minus",
    'class: "java.time.LocalDate",
    paramTypes: ["long", "java.time.temporal.TemporalUnit"]
} external;

function java_time_LocalDate_minus2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "minus",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.temporal.TemporalAmount"]
} external;

function java_time_LocalDate_minusDays(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusDays",
    'class: "java.time.LocalDate",
    paramTypes: ["long"]
} external;

function java_time_LocalDate_minusMonths(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusMonths",
    'class: "java.time.LocalDate",
    paramTypes: ["long"]
} external;

function java_time_LocalDate_minusWeeks(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusWeeks",
    'class: "java.time.LocalDate",
    paramTypes: ["long"]
} external;

function java_time_LocalDate_minusYears(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusYears",
    'class: "java.time.LocalDate",
    paramTypes: ["long"]
} external;

function java_time_LocalDate_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "java.time.LocalDate",
    paramTypes: []
} external;

function java_time_LocalDate_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "java.time.LocalDate",
    paramTypes: []
} external;

function java_time_LocalDate_now() returns handle = @java:Method {
    name: "now",
    'class: "java.time.LocalDate",
    paramTypes: []
} external;

function java_time_LocalDate_now2(handle arg0) returns handle = @java:Method {
    name: "now",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.Clock"]
} external;

function java_time_LocalDate_now3(handle arg0) returns handle = @java:Method {
    name: "now",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.ZoneId"]
} external;

function java_time_LocalDate_of(int arg0, int arg1, int arg2) returns handle = @java:Method {
    name: "of",
    'class: "java.time.LocalDate",
    paramTypes: ["int", "int", "int"]
} external;

function java_time_LocalDate_of2(int arg0, handle arg1, int arg2) returns handle = @java:Method {
    name: "of",
    'class: "java.time.LocalDate",
    paramTypes: ["int", "java.time.Month", "int"]
} external;

function java_time_LocalDate_ofEpochDay(int arg0) returns handle = @java:Method {
    name: "ofEpochDay",
    'class: "java.time.LocalDate",
    paramTypes: ["long"]
} external;

function java_time_LocalDate_ofInstant(handle arg0, handle arg1) returns handle = @java:Method {
    name: "ofInstant",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.Instant", "java.time.ZoneId"]
} external;

function java_time_LocalDate_ofYearDay(int arg0, int arg1) returns handle = @java:Method {
    name: "ofYearDay",
    'class: "java.time.LocalDate",
    paramTypes: ["int", "int"]
} external;

function java_time_LocalDate_parse(handle arg0) returns handle = @java:Method {
    name: "parse",
    'class: "java.time.LocalDate",
    paramTypes: ["java.lang.CharSequence"]
} external;

function java_time_LocalDate_parse2(handle arg0, handle arg1) returns handle = @java:Method {
    name: "parse",
    'class: "java.time.LocalDate",
    paramTypes: ["java.lang.CharSequence", "java.time.format.DateTimeFormatter"]
} external;

function java_time_LocalDate_plus(handle receiver, int arg0, handle arg1) returns handle = @java:Method {
    name: "plus",
    'class: "java.time.LocalDate",
    paramTypes: ["long", "java.time.temporal.TemporalUnit"]
} external;

function java_time_LocalDate_plus2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "plus",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.temporal.TemporalAmount"]
} external;

function java_time_LocalDate_plusDays(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusDays",
    'class: "java.time.LocalDate",
    paramTypes: ["long"]
} external;

function java_time_LocalDate_plusMonths(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusMonths",
    'class: "java.time.LocalDate",
    paramTypes: ["long"]
} external;

function java_time_LocalDate_plusWeeks(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusWeeks",
    'class: "java.time.LocalDate",
    paramTypes: ["long"]
} external;

function java_time_LocalDate_plusYears(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusYears",
    'class: "java.time.LocalDate",
    paramTypes: ["long"]
} external;

function java_time_LocalDate_query(handle receiver, handle arg0) returns handle = @java:Method {
    name: "query",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.temporal.TemporalQuery"]
} external;

function java_time_LocalDate_range(handle receiver, handle arg0) returns handle = @java:Method {
    name: "range",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.temporal.TemporalField"]
} external;

function java_time_LocalDate_toEpochDay(handle receiver) returns int = @java:Method {
    name: "toEpochDay",
    'class: "java.time.LocalDate",
    paramTypes: []
} external;

function java_time_LocalDate_toEpochSecond(handle receiver, handle arg0, handle arg1) returns int = @java:Method {
    name: "toEpochSecond",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.LocalTime", "java.time.ZoneOffset"]
} external;

function java_time_LocalDate_until(handle receiver, handle arg0) returns handle = @java:Method {
    name: "until",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.chrono.ChronoLocalDate"]
} external;

function java_time_LocalDate_until2(handle receiver, handle arg0, handle arg1) returns int = @java:Method {
    name: "until",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.temporal.Temporal", "java.time.temporal.TemporalUnit"]
} external;

function java_time_LocalDate_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "java.time.LocalDate",
    paramTypes: []
} external;

function java_time_LocalDate_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "java.time.LocalDate",
    paramTypes: ["long"]
} external;

function java_time_LocalDate_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "java.time.LocalDate",
    paramTypes: ["long", "int"]
} external;

function java_time_LocalDate_with(handle receiver, handle arg0) returns handle = @java:Method {
    name: "with",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.temporal.TemporalAdjuster"]
} external;

function java_time_LocalDate_with2(handle receiver, handle arg0, int arg1) returns handle = @java:Method {
    name: "with",
    'class: "java.time.LocalDate",
    paramTypes: ["java.time.temporal.TemporalField", "long"]
} external;

function java_time_LocalDate_withDayOfMonth(handle receiver, int arg0) returns handle = @java:Method {
    name: "withDayOfMonth",
    'class: "java.time.LocalDate",
    paramTypes: ["int"]
} external;

function java_time_LocalDate_withDayOfYear(handle receiver, int arg0) returns handle = @java:Method {
    name: "withDayOfYear",
    'class: "java.time.LocalDate",
    paramTypes: ["int"]
} external;

function java_time_LocalDate_withMonth(handle receiver, int arg0) returns handle = @java:Method {
    name: "withMonth",
    'class: "java.time.LocalDate",
    paramTypes: ["int"]
} external;

function java_time_LocalDate_withYear(handle receiver, int arg0) returns handle = @java:Method {
    name: "withYear",
    'class: "java.time.LocalDate",
    paramTypes: ["int"]
} external;

function java_time_LocalDate_getMIN() returns handle = @java:FieldGet {
    name: "MIN",
    'class: "java.time.LocalDate"
} external;

function java_time_LocalDate_getMAX() returns handle = @java:FieldGet {
    name: "MAX",
    'class: "java.time.LocalDate"
} external;

function java_time_LocalDate_getEPOCH() returns handle = @java:FieldGet {
    name: "EPOCH",
    'class: "java.time.LocalDate"
} external;

