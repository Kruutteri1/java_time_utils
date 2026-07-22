import ballerina/jballerina.java;

# A time without a time-zone in the ISO-8601 calendar system, such as 10:15:30.
# This is a value-based class; use of identity-sensitive operations on instances
# of LocalTime may have unpredictable results and should be avoided.
@java:Binding {'class: "java.time.LocalTime"}
public distinct class LocalTime {

    *java:JObject;
    *Object;

    # The handle to the underlying Java object.
    public handle jObj;

    # Initializes the class with a handle to a Java object.
    #
    # + obj - The handle reference to the Java object.
    public function init(handle obj) {
        self.jObj = obj;
    }

    # Returns the ISO-8601 string representation of this time.
    #
    # + return - The time as a string, e.g., 10:15:30.
    public function toString() returns string {
        return java:toString(self.jObj) ?: "";
    }

    # Adjusts the specified temporal object to have the same time as this object.
    #
    # + temporal - The target object to be adjusted.
    # + return - The adjusted object.ш
    function adjustInto(Temporal temporal) returns Temporal {
        handle externalObj = java_time_LocalTime_adjustInto(self.jObj, temporal.jObj);
        Temporal newObj = new (externalObj);
        return newObj;
    }

    # Combines this time with a date to create a LocalDateTime.
    #
    # + date - The date to combine with.
    # + return - The local date-time formed from this time and the specified date.
    public function atDate(LocalDate date) returns LocalDateTime {
        handle externalObj = java_time_LocalTime_atDate(self.jObj, date.jObj);
        LocalDateTime newObj = new (externalObj);
        return newObj;
    }

    # Combines this time with an offset to create an OffsetTime.
    #
    # + offset - The offset to combine with.
    # + return - The offset time formed from this time and the specified offset.
    function atOffset(ZoneOffset offset) returns OffsetTime {
        handle externalObj = java_time_LocalTime_atOffset(self.jObj, offset.jObj);
        OffsetTime newObj = new (externalObj);
        return newObj;
    }

    # Compares this time to another time.
    #
    # + other - The other time to compare to.
    # + return - A negative integer, zero, or a positive integer as this time is less than, equal to, or greater than the specified time.
    public function compareTo(LocalTime other) returns int {
        return java_time_LocalTime_compareTo(self.jObj, other.jObj);
    }

    # Checks if this time is equal to another object.
    #
    # + other - The object to check for equality.
    # + return - True if this time is equal to the specified object.
    public function isEquals(Object other) returns boolean {
        return java_time_LocalTime_equals(self.jObj, other.jObj);
    }

    # Formats this time using the specified formatter.
    #
    # + formatter - The formatter to use.
    # + return - The formatted time string.
    function format(DateTimeFormatter formatter) returns string {
        return java:toString(java_time_LocalTime_format(self.jObj, formatter.jObj)) ?: "";
    }

    # Gets the value of the specified field.
    #
    # + temporalField - The field to query.
    # + return - The value for the field.
    function get(TemporalField temporalField) returns int {
        return java_time_LocalTime_get(self.jObj, temporalField.jObj);
    }

    # Returns the runtime class of this object.
    #
    # + return - The Class object representing the runtime class.
    public function getClass() returns Class {
        handle externalObj = java_time_LocalTime_getClass(self.jObj);
        Class newObj = new (externalObj);
        return newObj;
    }

    # Gets the hour-of-day field.
    #
    # + return - The hour-of-day, from 0 to 23.
    public function getHour() returns int {
        return java_time_LocalTime_getHour(self.jObj);
    }

    # Gets the value of the specified field as a long.
    #
    # + temporalField - The field to get.
    # + return - The value for the field.
    function getLong(TemporalField temporalField) returns int {
        return java_time_LocalTime_getLong(self.jObj, temporalField.jObj);
    }

    # Gets the minute-of-hour field.
    #
    # + return - The minute-of-hour, from 0 to 59.
    public function getMinute() returns int {
        return java_time_LocalTime_getMinute(self.jObj);
    }

    # Gets the nano-of-second field.
    #
    # + return - The nano-of-second, from 0 to 999,999,999.
    public function getNano() returns int {
        return java_time_LocalTime_getNano(self.jObj);
    }

    # Gets the second-of-minute field.
    #
    # + return - The second-of-minute, from 0 to 59.
    public function getSecond() returns int {
        return java_time_LocalTime_getSecond(self.jObj);
    }

    # Returns the hash code for this time.
    #
    # + return - A suitable hash code.
    public function hashCode() returns int {
        return java_time_LocalTime_hashCode(self.jObj);
    }

    # Checks if this time is after the specified time.
    #
    # + other - The other time to compare to.
    # + return - True if this time is after the specified time.
    public function isAfter(LocalTime other) returns boolean {
        return java_time_LocalTime_isAfter(self.jObj, other.jObj);
    }

    # Checks if this time is before the specified time.
    #
    # + other - The other time to compare to.
    # + return - True if this time is before the specified time.
    public function isBefore(LocalTime other) returns boolean {
        return java_time_LocalTime_isBefore(self.jObj, other.jObj);
    }

    # Checks if the specified field is supported.
    #
    # + temporalField - The field to check.
    # + return - True if the field is supported.
    function isSupported(TemporalField temporalField) returns boolean {
        return java_time_LocalTime_isSupported(self.jObj, temporalField.jObj);
    }

    # Checks if the specified unit is supported.
    #
    # + unit - The unit to check.
    # + return - True if the unit is supported.
    function isSupportedByUnit(TemporalUnit unit) returns boolean {
        return java_time_LocalTime_isSupported2(self.jObj, unit.jObj);
    }

    # Returns a copy of this time with the specified amount subtracted.
    #
    # + amount - The amount to subtract.
    # + unit - The unit for the amount to subtract.
    # + return - A LocalTime based on this one with the specified amount subtracted.
    function minus(int amount, TemporalUnit unit) returns LocalTime {
        handle externalObj = java_time_LocalTime_minus(self.jObj, amount, unit.jObj);
        LocalTime newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this time with the specified period subtracted.
    #
    # + amount - The amount to subtract.
    # + return - A LocalTime based on this one with the specified amount subtracted.
    function minus2(TemporalAmount amount) returns LocalTime {
        handle externalObj = java_time_LocalTime_minus2(self.jObj, amount.jObj);
        LocalTime newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this time with the specified number of hours subtracted.
    #
    # + hours - The hours to subtract.
    # + return - A LocalTime based on this one with the hours subtracted.
    public function minusHours(int hours) returns LocalTime {
        handle externalObj = java_time_LocalTime_minusHours(self.jObj, hours);
        LocalTime newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this time with the specified number of minutes subtracted.
    #
    # + minutes - The minutes to subtract.
    # + return - A LocalTime based on this one with the minutes subtracted.
    public function minusMinutes(int minutes) returns LocalTime {
        handle externalObj = java_time_LocalTime_minusMinutes(self.jObj, minutes);
        LocalTime newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this time with the specified number of nanoseconds subtracted.
    #
    # + nanos - The nanoseconds to subtract.
    # + return - A LocalTime based on this one with the nanoseconds subtracted.
    public function minusNanos(int nanos) returns LocalTime {
        handle externalObj = java_time_LocalTime_minusNanos(self.jObj, nanos);
        LocalTime newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this time with the specified number of seconds subtracted.
    #
    # + seconds - The seconds to subtract.
    # + return - A LocalTime based on this one with the seconds subtracted.
    public function minusSeconds(int seconds) returns LocalTime {
        handle externalObj = java_time_LocalTime_minusSeconds(self.jObj, seconds);
        LocalTime newObj = new (externalObj);
        return newObj;
    }

    # Wakes up a single thread that is waiting on this object's monitor.
    public function notify() {
        java_time_LocalTime_notify(self.jObj);
    }

    # Wakes up all threads that are waiting on this object's monitor.
    public function notifyAll() {
        java_time_LocalTime_notifyAll(self.jObj);
    }

    # Returns a copy of this time with the specified amount added.
    #
    # + amount - The amount to add.
    # + unit - The unit for the amount to add.
    # + return - A LocalTime based on this one with the specified amount added.
    function plus(int amount, TemporalUnit unit) returns LocalTime {
        handle externalObj = java_time_LocalTime_plus(self.jObj, amount, unit.jObj);
        LocalTime newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this time with the specified period added.
    #
    # + amount - The amount to add.
    # + return - A LocalTime based on this one with the specified period added.
    function plusAmount(TemporalAmount amount) returns LocalTime {
        handle externalObj = java_time_LocalTime_plus2(self.jObj, amount.jObj);
        LocalTime newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this time with the specified number of hours added.
    #
    # + hours - The hours to add.
    # + return - A LocalTime based on this one with the hours added.
    public function plusHours(int hours) returns LocalTime {
        handle externalObj = java_time_LocalTime_plusHours(self.jObj, hours);
        LocalTime newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this time with the specified number of minutes added.
    #
    # + minutes - The minutes to add.
    # + return - A LocalTime based on this one with the minutes added.
    public function plusMinutes(int minutes) returns LocalTime {
        handle externalObj = java_time_LocalTime_plusMinutes(self.jObj, minutes);
        LocalTime newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this time with the specified number of nanoseconds added.
    #
    # + nanos - The nanoseconds to add.
    # + return - A LocalTime based on this one with the nanoseconds added.
    public function plusNanos(int nanos) returns LocalTime {
        handle externalObj = java_time_LocalTime_plusNanos(self.jObj, nanos);
        LocalTime newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this time with the specified number of seconds added.
    #
    # + seconds - The seconds to add.
    # + return - A LocalTime based on this one with the seconds added.
    public function plusSeconds(int seconds) returns LocalTime {
        handle externalObj = java_time_LocalTime_plusSeconds(self.jObj, seconds);
        LocalTime newObj = new (externalObj);
        return newObj;
    }

    # Queries this time using the specified query.
    #
    # + query - The query to invoke.
    # + return - The query result.
    function query(TemporalQuery query) returns Object {
        handle externalObj = java_time_LocalTime_query(self.jObj, query.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # Gets the range of valid values for the specified field.
    #
    # + temporalField - The field to query.
    # + return - The range of valid values for the field.
    function range(TemporalField temporalField) returns ValueRange {
        handle externalObj = java_time_LocalTime_range(self.jObj, temporalField.jObj);
        ValueRange newObj = new (externalObj);
        return newObj;
    }

    # Converts this time to a total number of seconds since the epoch of 1970-01-01T00:00:00Z.
    #
    # + date - The date to combine with this time.
    # + offset - The zone offset.
    # + return - The number of seconds since the epoch.
    function toEpochSecond(LocalDate date, ZoneOffset offset) returns int {
        return java_time_LocalTime_toEpochSecond(self.jObj, date.jObj, offset.jObj);
    }

    # Extracts the time as nanoseconds of day.
    #
    # + return - The nanoseconds of day.
    public function toNanoOfDay() returns int {
        return java_time_LocalTime_toNanoOfDay(self.jObj);
    }

    # Extracts the time as seconds of day.
    #
    # + return - The seconds of day.
    public function toSecondOfDay() returns int {
        return java_time_LocalTime_toSecondOfDay(self.jObj);
    }

    # Returns a copy of this time truncated to the specified unit.
    #
    # + unit - The unit to truncate to.
    # + return - A LocalTime based on this time with the time truncated.
    function truncatedTo(TemporalUnit unit) returns LocalTime {
        handle externalObj = java_time_LocalTime_truncatedTo(self.jObj, unit.jObj);
        LocalTime newObj = new (externalObj);
        return newObj;
    }

    # Calculates the amount of time until another time in terms of the specified unit.
    #
    # + endExclusive - The end time, exclusive.
    # + unit - The unit to measure the time in.
    # + return - The amount of time until the specified time.
    function until(Temporal endExclusive, TemporalUnit unit) returns int {
        return java_time_LocalTime_until(self.jObj, endExclusive.jObj, unit.jObj);
    }

    # Waits to be notified by another thread.
    #
    # + return - An error if the wait is interrupted, or () if successful.
    public function doWait() returns InterruptedException? {
        error|() externalObj = java_time_LocalTime_wait(self.jObj);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # Waits to be notified by another thread for a specified amount of time.
    #
    # + timeoutMillis - The maximum time to wait in milliseconds.
    # + return - An error if the wait is interrupted, or () if successful.
    public function waitWithTimeout(int timeoutMillis) returns InterruptedException? {
        error|() externalObj = java_time_LocalTime_wait2(self.jObj, timeoutMillis);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # Waits to be notified by another thread for a specified amount of time.
    #
    # + timeoutMillis - The maximum time to wait in milliseconds.
    # + nanos - The additional nanoseconds to wait.
    # + return - An error if the wait is interrupted, or () if successful.
    public function waitWithTimeoutAndNanos(int timeoutMillis, int nanos) returns InterruptedException? {
        error|() externalObj = java_time_LocalTime_wait3(self.jObj, timeoutMillis, nanos);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # Returns a copy of this time with the specified adjuster applied.
    #
    # + adjuster - The adjuster to apply.
    # + return - A LocalTime based on this one with the adjustment made.
    function 'with(TemporalAdjuster adjuster) returns LocalTime {
        handle externalObj = java_time_LocalTime_with(self.jObj, adjuster.jObj);
        LocalTime newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this time with the specified field altered.
    #
    # + temporalField - The field to set in the result.
    # + newValue - The new value of the field in the result.
    # + return - A LocalTime based on this one with the specified field set.
    function withField(TemporalField temporalField, int newValue) returns LocalTime {
        handle externalObj = java_time_LocalTime_with2(self.jObj, temporalField.jObj, newValue);
        LocalTime newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this time with the hour-of-day altered.
    #
    # + hour - The hour-of-day to set in the result.
    # + return - A LocalTime based on this one with the requested hour.
    public function withHour(int hour) returns LocalTime {
        handle externalObj = java_time_LocalTime_withHour(self.jObj, hour);
        LocalTime newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this time with the minute-of-hour altered.
    #
    # + minute - The minute-of-hour to set in the result.
    # + return - A LocalTime based on this one with the requested minute.
    public function withMinute(int minute) returns LocalTime {
        handle externalObj = java_time_LocalTime_withMinute(self.jObj, minute);
        LocalTime newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this time with the nano-of-second altered.
    #
    # + nano - The nano-of-second to set in the result.
    # + return - A LocalTime based on this one with the requested nano-of-second.
    public function withNano(int nano) returns LocalTime {
        handle externalObj = java_time_LocalTime_withNano(self.jObj, nano);
        LocalTime newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this time with the second-of-minute altered.
    #
    # + second - The second-of-minute to set in the result.
    # + return - A LocalTime based on this one with the requested second.
    public function withSecond(int second) returns LocalTime {
        handle externalObj = java_time_LocalTime_withSecond(self.jObj, second);
        LocalTime newObj = new (externalObj);
        return newObj;
    }

}

# Obtains an instance of LocalTime from a temporal object.
#
# + temporal - The temporal object to convert.
# + return - The LocalTime.
function LocalTime_from(TemporalAccessor temporal) returns LocalTime {
    handle externalObj = java_time_LocalTime_from(temporal.jObj);
    LocalTime newObj = new (externalObj);
    return newObj;
}

# Obtains the current time from the system clock in the default time-zone.
#
# + return - The current time.
public function getCurrentTime() returns LocalTime {
    handle externalObj = java_time_LocalTime_now();
    LocalTime newObj = new (externalObj);
    return newObj;
}

# Obtains the current time from the specified clock.
#
# + clock - The clock to use.
# + return - The current time.
function nowFromClock(Clock clock) returns LocalTime {
    handle externalObj = java_time_LocalTime_now2(clock.jObj);
    LocalTime newObj = new (externalObj);
    return newObj;
}

# Obtains the current time from the system clock in the specified time-zone.
#
# + zone - The time-zone to use.
# + return - The current time.
function nowFromZone(ZoneId zone) returns LocalTime {
    handle externalObj = java_time_LocalTime_now3(zone.jObj);
    LocalTime newObj = new (externalObj);
    return newObj;
}

# Obtains an instance of LocalTime from an hour and minute.
#
# + hour - The hour-of-day to represent.
# + minute - The minute-of-hour to represent.
# + return - LocalTime|error — the constructed time, or an error if hour or minute is out of range.
public function ofTime(int hour, int minute) returns LocalTime|error {
    handle externalObj = check java_time_LocalTime_of(hour, minute);
    LocalTime newObj = new (externalObj);
    return newObj;
}

# Obtains an instance of LocalTime from an hour, minute and second.
#
# + hour - The hour-of-day to represent.
# + minute - The minute-of-hour to represent.
# + second - The second-of-minute to represent.
# + return - LocalTime|error — the constructed time, or an error if any parameter is out of range.
public function ofTimeWithSecond(int hour, int minute, int second) returns LocalTime|error {
    handle externalObj = check java_time_LocalTime_of2(hour, minute, second);
    LocalTime newObj = new (externalObj);
    return newObj;
}

# Obtains an instance of LocalTime from an hour, minute, second and nanosecond.
#
# + hour - The hour-of-day.
# + minute - The minute-of-hour.
# + second - The second-of-minute.
# + nanoOfSecond - The nano-of-second.
# + return - LocalTime|error — the constructed time, or an error if any parameter is out of range.
public function ofTimeWithSecondNano(int hour, int minute, int second, int nanoOfSecond) returns LocalTime|error {
    handle externalObj = check java_time_LocalTime_of3(hour, minute, second, nanoOfSecond);
    LocalTime newObj = new (externalObj);
    return newObj;
}

# Obtains an instance of LocalTime from an Instant and ZoneId.
#
# + instant - The instant to create the time from.
# + zone - The time-zone to use.
# + return - The LocalTime.
function ofInstantWithZones(Instant instant, ZoneId zone) returns LocalTime {
    handle externalObj = java_time_LocalTime_ofInstant(instant.jObj, zone.jObj);
    LocalTime newObj = new (externalObj);
    return newObj;
}

# Obtains an instance of LocalTime from a nanos-of-day value.
#
# + nanoOfDay - The nanos of day.
# + return - LocalTime|error — the constructed time, or an error if nanoOfDay is negative or exceeds 86,399,999,999,999.
public function ofNanoOfDay(int nanoOfDay) returns LocalTime|error {
    handle externalObj = check java_time_LocalTime_ofNanoOfDay(nanoOfDay);
    LocalTime newObj = new (externalObj);
    return newObj;
}

# Obtains an instance of LocalTime from a second-of-day value.
#
# + secondOfDay - The second of day.
# + return - LocalTime|error — the constructed time, or an error if secondOfDay is negative or exceeds 86,399.
public function ofSecondOfDay(int secondOfDay) returns LocalTime|error {
    handle externalObj = check java_time_LocalTime_ofSecondOfDay(secondOfDay);
    LocalTime newObj = new (externalObj);
    return newObj;
}

# Obtains an instance of LocalTime from a text string.
#
# + text - The text to parse.
# + return - The LocalTime.
function parseText(CharSequence text) returns LocalTime {
    handle externalObj = java_time_LocalTime_parse(text.jObj);
    LocalTime newObj = new (externalObj);
    return newObj;
}

# Obtains an instance of LocalTime from a text string using a specific formatter.
#
# + text - The text to parse.
# + formatter - The formatter to use.
# + return - The LocalTime.
function parseTextWithFormatter(CharSequence text, DateTimeFormatter formatter) returns LocalTime {
    handle externalObj = java_time_LocalTime_parse2(text.jObj, formatter.jObj);
    LocalTime newObj = new (externalObj);
    return newObj;
}

# Retrieves the value of the public field `MIN`.
#
# + return - The `LocalTime` value of the field.
public function getMinTime() returns LocalTime {
    handle externalObj = java_time_LocalTime_getMIN();
    LocalTime newObj = new (externalObj);
    return newObj;
}

# Retrieves the value of the public field `MAX`.
#
# + return - The `LocalTime` value of the field.
public function getMaxTime() returns LocalTime {
    handle externalObj = java_time_LocalTime_getMAX();
    LocalTime newObj = new (externalObj);
    return newObj;
}

# Retrieves the value of the public field `MIDNIGHT`.
#
# + return - The `LocalTime` value of the field.
public function getMidnigth() returns LocalTime {
    handle externalObj = java_time_LocalTime_getMIDNIGHT();
    LocalTime newObj = new (externalObj);
    return newObj;
}

# Retrieves the value of the public field `NOON`.
#
# + return - The `LocalTime` value của the field.
public function getNoon() returns LocalTime {
    handle externalObj = java_time_LocalTime_getNOON();
    LocalTime newObj = new (externalObj);
    return newObj;
}

function java_time_LocalTime_adjustInto(handle receiver, handle arg0) returns handle = @java:Method {
    name: "adjustInto",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.temporal.Temporal"]
} external;

function java_time_LocalTime_atDate(handle receiver, handle arg0) returns handle = @java:Method {
    name: "atDate",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.LocalDate"]
} external;

function java_time_LocalTime_atOffset(handle receiver, handle arg0) returns handle = @java:Method {
    name: "atOffset",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.ZoneOffset"]
} external;

function java_time_LocalTime_compareTo(handle receiver, handle arg0) returns int = @java:Method {
    name: "compareTo",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.LocalTime"]
} external;

function java_time_LocalTime_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "java.time.LocalTime",
    paramTypes: ["java.lang.Object"]
} external;

function java_time_LocalTime_format(handle receiver, handle arg0) returns handle = @java:Method {
    name: "format",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.format.DateTimeFormatter"]
} external;

function java_time_LocalTime_from(handle arg0) returns handle = @java:Method {
    name: "from",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.temporal.TemporalAccessor"]
} external;

function java_time_LocalTime_get(handle receiver, handle arg0) returns int = @java:Method {
    name: "get",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.temporal.TemporalField"]
} external;

function java_time_LocalTime_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "java.time.LocalTime",
    paramTypes: []
} external;

function java_time_LocalTime_getHour(handle receiver) returns int = @java:Method {
    name: "getHour",
    'class: "java.time.LocalTime",
    paramTypes: []
} external;

function java_time_LocalTime_getLong(handle receiver, handle arg0) returns int = @java:Method {
    name: "getLong",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.temporal.TemporalField"]
} external;

function java_time_LocalTime_getMinute(handle receiver) returns int = @java:Method {
    name: "getMinute",
    'class: "java.time.LocalTime",
    paramTypes: []
} external;

function java_time_LocalTime_getNano(handle receiver) returns int = @java:Method {
    name: "getNano",
    'class: "java.time.LocalTime",
    paramTypes: []
} external;

function java_time_LocalTime_getSecond(handle receiver) returns int = @java:Method {
    name: "getSecond",
    'class: "java.time.LocalTime",
    paramTypes: []
} external;

function java_time_LocalTime_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "java.time.LocalTime",
    paramTypes: []
} external;

function java_time_LocalTime_isAfter(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "isAfter",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.LocalTime"]
} external;

function java_time_LocalTime_isBefore(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "isBefore",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.LocalTime"]
} external;

function java_time_LocalTime_isSupported(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "isSupported",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.temporal.TemporalField"]
} external;

function java_time_LocalTime_isSupported2(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "isSupported",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.temporal.TemporalUnit"]
} external;

function java_time_LocalTime_minus(handle receiver, int arg0, handle arg1) returns handle = @java:Method {
    name: "minus",
    'class: "java.time.LocalTime",
    paramTypes: ["long", "java.time.temporal.TemporalUnit"]
} external;

function java_time_LocalTime_minus2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "minus",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.temporal.TemporalAmount"]
} external;

function java_time_LocalTime_minusHours(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusHours",
    'class: "java.time.LocalTime",
    paramTypes: ["long"]
} external;

function java_time_LocalTime_minusMinutes(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusMinutes",
    'class: "java.time.LocalTime",
    paramTypes: ["long"]
} external;

function java_time_LocalTime_minusNanos(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusNanos",
    'class: "java.time.LocalTime",
    paramTypes: ["long"]
} external;

function java_time_LocalTime_minusSeconds(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusSeconds",
    'class: "java.time.LocalTime",
    paramTypes: ["long"]
} external;

function java_time_LocalTime_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "java.time.LocalTime",
    paramTypes: []
} external;

function java_time_LocalTime_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "java.time.LocalTime",
    paramTypes: []
} external;

function java_time_LocalTime_now() returns handle = @java:Method {
    name: "now",
    'class: "java.time.LocalTime",
    paramTypes: []
} external;

function java_time_LocalTime_now2(handle arg0) returns handle = @java:Method {
    name: "now",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.Clock"]
} external;

function java_time_LocalTime_now3(handle arg0) returns handle = @java:Method {
    name: "now",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.ZoneId"]
} external;

function java_time_LocalTime_of(int arg0, int arg1) returns handle|error = @java:Method {
    name: "of",
    'class: "java.time.LocalTime",
    paramTypes: ["int", "int"]
} external;

function java_time_LocalTime_of2(int arg0, int arg1, int arg2) returns handle|error = @java:Method {
    name: "of",
    'class: "java.time.LocalTime",
    paramTypes: ["int", "int", "int"]
} external;

function java_time_LocalTime_of3(int arg0, int arg1, int arg2, int arg3) returns handle|error = @java:Method {
    name: "of",
    'class: "java.time.LocalTime",
    paramTypes: ["int", "int", "int", "int"]
} external;

function java_time_LocalTime_ofInstant(handle arg0, handle arg1) returns handle = @java:Method {
    name: "ofInstant",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.Instant", "java.time.ZoneId"]
} external;

function java_time_LocalTime_ofNanoOfDay(int arg0) returns handle|error = @java:Method {
    name: "ofNanoOfDay",
    'class: "java.time.LocalTime",
    paramTypes: ["long"]
} external;

function java_time_LocalTime_ofSecondOfDay(int arg0) returns handle|error = @java:Method {
    name: "ofSecondOfDay",
    'class: "java.time.LocalTime",
    paramTypes: ["long"]
} external;

function java_time_LocalTime_parse(handle arg0) returns handle = @java:Method {
    name: "parse",
    'class: "java.time.LocalTime",
    paramTypes: ["java.lang.CharSequence"]
} external;

function java_time_LocalTime_parse2(handle arg0, handle arg1) returns handle = @java:Method {
    name: "parse",
    'class: "java.time.LocalTime",
    paramTypes: ["java.lang.CharSequence", "java.time.format.DateTimeFormatter"]
} external;

function java_time_LocalTime_plus(handle receiver, int arg0, handle arg1) returns handle = @java:Method {
    name: "plus",
    'class: "java.time.LocalTime",
    paramTypes: ["long", "java.time.temporal.TemporalUnit"]
} external;

function java_time_LocalTime_plus2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "plus",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.temporal.TemporalAmount"]
} external;

function java_time_LocalTime_plusHours(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusHours",
    'class: "java.time.LocalTime",
    paramTypes: ["long"]
} external;

function java_time_LocalTime_plusMinutes(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusMinutes",
    'class: "java.time.LocalTime",
    paramTypes: ["long"]
} external;

function java_time_LocalTime_plusNanos(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusNanos",
    'class: "java.time.LocalTime",
    paramTypes: ["long"]
} external;

function java_time_LocalTime_plusSeconds(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusSeconds",
    'class: "java.time.LocalTime",
    paramTypes: ["long"]
} external;

function java_time_LocalTime_query(handle receiver, handle arg0) returns handle = @java:Method {
    name: "query",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.temporal.TemporalQuery"]
} external;

function java_time_LocalTime_range(handle receiver, handle arg0) returns handle = @java:Method {
    name: "range",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.temporal.TemporalField"]
} external;

function java_time_LocalTime_toEpochSecond(handle receiver, handle arg0, handle arg1) returns int = @java:Method {
    name: "toEpochSecond",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.LocalDate", "java.time.ZoneOffset"]
} external;

function java_time_LocalTime_toNanoOfDay(handle receiver) returns int = @java:Method {
    name: "toNanoOfDay",
    'class: "java.time.LocalTime",
    paramTypes: []
} external;

function java_time_LocalTime_toSecondOfDay(handle receiver) returns int = @java:Method {
    name: "toSecondOfDay",
    'class: "java.time.LocalTime",
    paramTypes: []
} external;

function java_time_LocalTime_truncatedTo(handle receiver, handle arg0) returns handle = @java:Method {
    name: "truncatedTo",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.temporal.TemporalUnit"]
} external;

function java_time_LocalTime_until(handle receiver, handle arg0, handle arg1) returns int = @java:Method {
    name: "until",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.temporal.Temporal", "java.time.temporal.TemporalUnit"]
} external;

function java_time_LocalTime_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "java.lang.Object",
    paramTypes: []
} external;

function java_time_LocalTime_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "java.lang.Object",
    paramTypes: ["long"]
} external;

function java_time_LocalTime_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "java.lang.Object",
    paramTypes: ["long", "int"]
} external;

function java_time_LocalTime_with(handle receiver, handle arg0) returns handle = @java:Method {
    name: "with",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.temporal.TemporalAdjuster"]
} external;

function java_time_LocalTime_with2(handle receiver, handle arg0, int arg1) returns handle = @java:Method {
    name: "with",
    'class: "java.time.LocalTime",
    paramTypes: ["java.time.temporal.TemporalField", "long"]
} external;

function java_time_LocalTime_withHour(handle receiver, int arg0) returns handle = @java:Method {
    name: "withHour",
    'class: "java.time.LocalTime",
    paramTypes: ["int"]
} external;

function java_time_LocalTime_withMinute(handle receiver, int arg0) returns handle = @java:Method {
    name: "withMinute",
    'class: "java.time.LocalTime",
    paramTypes: ["int"]
} external;

function java_time_LocalTime_withNano(handle receiver, int arg0) returns handle = @java:Method {
    name: "withNano",
    'class: "java.time.LocalTime",
    paramTypes: ["int"]
} external;

function java_time_LocalTime_withSecond(handle receiver, int arg0) returns handle = @java:Method {
    name: "withSecond",
    'class: "java.time.LocalTime",
    paramTypes: ["int"]
} external;

function java_time_LocalTime_getMIN() returns handle = @java:FieldGet {
    name: "MIN",
    'class: "java.time.LocalTime"
} external;

function java_time_LocalTime_getMAX() returns handle = @java:FieldGet {
    name: "MAX",
    'class: "java.time.LocalTime"
} external;

function java_time_LocalTime_getMIDNIGHT() returns handle = @java:FieldGet {
    name: "MIDNIGHT",
    'class: "java.time.LocalTime"
} external;

function java_time_LocalTime_getNOON() returns handle = @java:FieldGet {
    name: "NOON",
    'class: "java.time.LocalTime"
} external;

