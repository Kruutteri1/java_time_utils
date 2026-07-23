import ballerina/jballerina.java;

# Ballerina class mapping for the Java `java.time.Duration` class.
@java:Binding {'class: "java.time.Duration"}
public distinct class Duration {

    *java:JObject;
    *Object;

    # The underlying Java object reference.
    public handle jObj;

    # Initializes the Ballerina wrapper with a Java reference.
    #
    # + obj - The `handle` value containing the Java reference.
    public function init(handle obj) {
        self.jObj = obj;
    }

    # Returns the string representation of the duration.
    #
    # + return - The string form of the duration instance.
    public function toString() returns string {
        return java:toString(self.jObj) ?: "";
    }

    # Returns a copy of this duration with a positive length.
    #
    # + return - A duration with a positive length.
    public function abs() returns Duration {
        handle externalObj = java_time_Duration_abs(self.jObj);
        Duration newObj = new (externalObj);
        return newObj;
    }

    # Adds this duration to the specified temporal object.
    #
    # + temporal - The temporal object to add to.
    # + return - The resulting temporal object.
    function addTo(Temporal temporal) returns Temporal {
        handle externalObj = java_time_Duration_addTo(self.jObj, temporal.jObj);
        Temporal newObj = new (externalObj);
        return newObj;
    }

    # Compares this duration to another duration.
    #
    # + other - The other duration to compare with.
    # + return - Negative, zero, or positive as this duration is less than, equal to, or greater than the other.
    public function compareTo(Duration other) returns int {
        return java_time_Duration_compareTo(self.jObj, other.jObj);
    }

    # Divides this duration by another duration.
    #
    # + other - The other duration to divide by.
    # + return - The ratio of the durations as an integer.
    public function dividedByDuration(Duration other) returns int {
        return java_time_Duration_dividedBy(self.jObj, other.jObj);
    }

    # Divides this duration by the specified value.
    #
    # + divisor - The value to divide by.
    # + return - A duration-representing the result of the division.
    public function dividedBy(int divisor) returns Duration {
        handle externalObj = java_time_Duration_dividedBy2(self.jObj, divisor);
        Duration newObj = new (externalObj);
        return newObj;
    }

    # Checks if this duration is equal to another object.
    #
    # + other - The object to check equality with.
    # + return - True if this duration is equal to the other object, false otherwise.
    public function isEquals(Object other) returns boolean {
        return java_time_Duration_equals(self.jObj, other.jObj);
    }

    # Gets the value of the requested unit.
    #
    # + unit - The `TemporalUnit` for which to return the value.
    # + return - The long value for the unit.
    function get(TemporalUnit unit) returns int {
        return java_time_Duration_get(self.jObj, unit.jObj);
    }

    # Gets the runtime class of this duration.
    #
    # + return - The `Class` object representing the runtime class.
    public function getClass() returns Class {
        handle externalObj = java_time_Duration_getClass(self.jObj);
        Class newObj = new (externalObj);
        return newObj;
    }

    # Gets the number of nanoseconds in the second-based part of this duration.
    #
    # + return - The number of nanoseconds, from 0 to 999,999,999.
    public function getNano() returns int {
        return java_time_Duration_getNano(self.jObj);
    }

    # Gets the number of seconds in this duration.
    #
    # + return - The whole seconds part of the duration.
    public function getSeconds() returns int {
        return java_time_Duration_getSeconds(self.jObj);
    }

    # Gets the list of units supported by this duration.
    #
    # + return - A `List` containing the supported `TemporalUnit` instances.
    function getUnits() returns List {
        handle externalObj = java_time_Duration_getUnits(self.jObj);
        List newObj = new (externalObj);
        return newObj;
    }

    # Returns a hash code for this duration.
    #
    # + return - A suitable hash code value.
    public function hashCode() returns int {
        return java_time_Duration_hashCode(self.jObj);
    }

    # Checks if this duration is negative, excluding zero.
    #
    # + return - True if this duration has a total length less than zero, false otherwise.
    public function isNegative() returns boolean {
        return java_time_Duration_isNegative(self.jObj);
    }

    # Checks if this duration is positive, excluding zero.
    #
    # + return - True if this duration has a total length greater than zero, false otherwise.
    public function isPositive() returns boolean {
        return java_time_Duration_isPositive(self.jObj);
    }

    # Checks if this duration is zero length.
    #
    # + return - True if this duration has a total length of zero, false otherwise.
    public function isZero() returns boolean {
        return java_time_Duration_isZero(self.jObj);
    }

    # Returns a copy of this duration with the specified duration subtracted.
    #
    # + other - The duration to subtract, not null.
    # + return - A duration based on this duration with the specified duration subtracted.
    public function minus(Duration other) returns Duration {
        handle externalObj = java_time_Duration_minus(self.jObj, other.jObj);
        Duration newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this duration with the specified amount subtracted.
    #
    # + amount - The amount of the unit to subtract, measured in terms of the unit.
    # + unit - The unit that the amount is measured in, not null.
    # + return - A duration based on this duration with the specified amount subtracted.
    function minus2(int amount, TemporalUnit unit) returns Duration {
        handle externalObj = java_time_Duration_minus2(self.jObj, amount, unit.jObj);
        Duration newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this duration with the specified number of days subtracted.
    #
    # + days - The days to subtract, positive or negative.
    # + return - A duration based on this duration with the specified days subtracted.
    public function minusDays(int days) returns Duration {
        handle externalObj = java_time_Duration_minusDays(self.jObj, days);
        Duration newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this duration with the specified number of hours subtracted.
    #
    # + hours - The hours to subtract, positive or negative.
    # + return - A duration based on this duration with the specified hours subtracted.
    public function minusHours(int hours) returns Duration {
        handle externalObj = java_time_Duration_minusHours(self.jObj, hours);
        Duration newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this duration with the specified number of milliseconds subtracted.
    #
    # + millis - The milliseconds to subtract, positive or negative.
    # + return - A duration based on this duration with the specified milliseconds subtracted.
    public function minusMillis(int millis) returns Duration {
        handle externalObj = java_time_Duration_minusMillis(self.jObj, millis);
        Duration newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this duration with the specified number of minutes subtracted.
    #
    # + minutes - The minutes to subtract, positive or negative.
    # + return - A duration based on this duration with the specified minutes subtracted.
    public function minusMinutes(int minutes) returns Duration {
        handle externalObj = java_time_Duration_minusMinutes(self.jObj, minutes);
        Duration newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this duration with the specified number of nanoseconds subtracted.
    #
    # + nanos - The nanoseconds to subtract, positive or negative.
    # + return - A duration based on this duration with the specified nanoseconds subtracted.
    public function minusNanos(int nanos) returns Duration {
        handle externalObj = java_time_Duration_minusNanos(self.jObj, nanos);
        Duration newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this duration with the specified number of seconds subtracted.
    #
    # + seconds - The seconds to subtract, positive or negative.
    # + return - A duration based on this duration with the specified seconds subtracted.
    public function minusSeconds(int seconds) returns Duration {
        handle externalObj = java_time_Duration_minusSeconds(self.jObj, seconds);
        Duration newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this duration multiplied by the specified scalar.
    #
    # + multiplier - The value to multiply by, positive or negative.
    # + return - A duration based on this duration multiplied by the scalar.
    public function multipliedBy(int multiplier) returns Duration {
        handle externalObj = java_time_Duration_multipliedBy(self.jObj, multiplier);
        Duration newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this duration with the length negated.
    #
    # + return - A duration based on this duration with the amount negated.
    public function negated() returns Duration {
        handle externalObj = java_time_Duration_negated(self.jObj);
        Duration newObj = new (externalObj);
        return newObj;
    }

    # Wakes up a single thread that is waiting on this object's monitor.
    public function notify() {
        java_time_Duration_notify(self.jObj);
    }

    # Wakes up all threads that are waiting on this object's monitor.
    public function notifyAll() {
        java_time_Duration_notifyAll(self.jObj);
    }

    # Returns a copy of this duration with the specified duration added.
    #
    # + other - The duration to add, not null.
    # + return - A duration based on this duration with the specified duration added.
    public function plus(Duration other) returns Duration {
        handle externalObj = java_time_Duration_plus(self.jObj, other.jObj);
        Duration newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this duration with the specified amount added.
    #
    # + amount - The amount of the unit to add, measured in terms of the unit.
    # + unit - The unit that the amount is measured in, not null.
    # + return - A duration based on this duration with the specified amount added.
    function plus2(int amount, TemporalUnit unit) returns Duration {
        handle externalObj = java_time_Duration_plus2(self.jObj, amount, unit.jObj);
        Duration newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this duration with the specified number of days added.
    #
    # + days - The days to add, positive or negative.
    # + return - A duration based on this duration with the specified days added.
    public function plusDays(int days) returns Duration {
        handle externalObj = java_time_Duration_plusDays(self.jObj, days);
        Duration newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this duration with the specified number of hours added.
    #
    # + hours - The hours to add, positive or negative.
    # + return - A duration based on this duration with the specified hours added.
    public function plusHours(int hours) returns Duration {
        handle externalObj = java_time_Duration_plusHours(self.jObj, hours);
        Duration newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this duration with the specified number of milliseconds added.
    #
    # + millis - The milliseconds to add, positive or negative.
    # + return - A duration based on this duration with the specified milliseconds added.
    public function plusMillis(int millis) returns Duration {
        handle externalObj = java_time_Duration_plusMillis(self.jObj, millis);
        Duration newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this duration with the specified number of minutes added.
    #
    # + minutes - The minutes to add, positive or negative.
    # + return - A duration based on this duration with the specified minutes added.
    public function plusMinutes(int minutes) returns Duration {
        handle externalObj = java_time_Duration_plusMinutes(self.jObj, minutes);
        Duration newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this duration with the specified number of nanoseconds added.
    #
    # + nanos - The nanoseconds to add, positive or negative.
    # + return - A duration based on this duration with the specified nanoseconds added.
    public function plusNanos(int nanos) returns Duration {
        handle externalObj = java_time_Duration_plusNanos(self.jObj, nanos);
        Duration newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this duration with the specified number of seconds added.
    #
    # + seconds - The seconds to add, positive or negative.
    # + return - A duration based on this duration with the specified seconds added.
    public function plusSeconds(int seconds) returns Duration {
        handle externalObj = java_time_Duration_plusSeconds(self.jObj, seconds);
        Duration newObj = new (externalObj);
        return newObj;
    }

    # Subtracts this duration from the specified temporal object.
    #
    # + temporal - The temporal object to subtract from.
    # + return - The resulting temporal object.
    function subtractFrom(Temporal temporal) returns Temporal {
        handle externalObj = java_time_Duration_subtractFrom(self.jObj, temporal.jObj);
        Temporal newObj = new (externalObj);
        return newObj;
    }

    # Gets the number of days in this duration.
    #
    # + return - The total number of days in the duration.
    public function toDays() returns int {
        return java_time_Duration_toDays(self.jObj);
    }

    # Extracts the number of days in this duration.
    #
    # + return - The number of days part, after dividing out the hours, minutes and seconds.
    public function toDaysPart() returns int {
        return java_time_Duration_toDaysPart(self.jObj);
    }

    # Gets the number of hours in this duration.
    #
    # + return - The total number of hours in the duration.
    public function toHours() returns int {
        return java_time_Duration_toHours(self.jObj);
    }

    # Extracts the number of hours part in this duration.
    #
    # + return - The number of hours part, in the range 0 to 23.
    public function toHoursPart() returns int {
        return java_time_Duration_toHoursPart(self.jObj);
    }

    # Gets the number of milliseconds in this duration.
    #
    # + return - The total number of milliseconds in the duration.
    public function toMillis() returns int {
        return java_time_Duration_toMillis(self.jObj);
    }

    # Extracts the number of milliseconds part in this duration.
    #
    # + return - The number of milliseconds part, in the range 0 to 999.
    public function toMillisPart() returns int {
        return java_time_Duration_toMillisPart(self.jObj);
    }

    # Gets the number of minutes in this duration.
    #
    # + return - The total number of minutes in the duration.
    public function toMinutes() returns int {
        return java_time_Duration_toMinutes(self.jObj);
    }

    # Extracts the number of minutes part in this duration.
    #
    # + return - The number of minutes part, in the range 0 to 59.
    public function toMinutesPart() returns int {
        return java_time_Duration_toMinutesPart(self.jObj);
    }

    # Gets the total number of nanoseconds in this duration.
    #
    # + return - The total number of nanoseconds in the duration.
    public function toNanos() returns int {
        return java_time_Duration_toNanos(self.jObj);
    }

    # Extracts the number of nanoseconds part in this duration.
    #
    # + return - The number of nanoseconds part, in the range 0 to 999,999,999.
    public function toNanosPart() returns int {
        return java_time_Duration_toNanosPart(self.jObj);
    }

    # Gets the number of seconds in this duration.
    #
    # + return - The total number of seconds in the duration.
    public function toSeconds() returns int {
        return java_time_Duration_toSeconds(self.jObj);
    }

    # Extracts the number of seconds part in this duration.
    #
    # + return - The number of seconds part, in the range 0 to 59.
    public function toSecondsPart() returns int {
        return java_time_Duration_toSecondsPart(self.jObj);
    }

    # Returns a copy of this duration truncated to the specified unit.
    #
    # + unit - The unit to truncate to, not null.
    # + return - A duration based on this duration with the specified unit truncated.
    function truncatedTo(TemporalUnit unit) returns Duration {
        handle externalObj = java_time_Duration_truncatedTo(self.jObj, unit.jObj);
        Duration newObj = new (externalObj);
        return newObj;
    }

    # Causes the current thread to wait until another thread invokes the notify() or notifyAll() methods for this object.
    #
    # + return - An `InterruptedException` if the thread was interrupted while waiting, or nil otherwise.
    public function doWait() returns InterruptedException? {
        error|() externalObj = java_time_Duration_wait(self.jObj);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # Causes the current thread to wait until another thread invokes notify() or notifyAll() for this object, or a certain amount of real time has elapsed.
    #
    # + millis - The maximum time to wait in milliseconds.
    # + return - An `InterruptedException` if the thread was interrupted while waiting, or nil otherwise.
    public function waitWithTimeout(int millis) returns InterruptedException? {
        error|() externalObj = java_time_Duration_wait2(self.jObj, millis);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # Causes the current thread to wait until another thread invokes notify() or notifyAll() for this object, or some other thread interrupts the current thread, or a certain amount of real time has elapsed.
    #
    # + millis - The maximum time to wait in milliseconds.
    # + nanos - Additional nanoseconds, in the range 0-999,999.
    # + return - An `InterruptedException` if the thread was interrupted while waiting, or nil otherwise.
    public function waitWithTimeoutAndNanos(int millis, int nanos) returns InterruptedException? {
        error|() externalObj = java_time_Duration_wait3(self.jObj, millis, nanos);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # Returns a copy of this duration with the specified number of nanoseconds.
    #
    # + nanos - The number of nanoseconds to represent, from 0 to 999,999,999.
    # + return - A duration based on this duration with the requested nanoseconds.
    public function withNanos(int nanos) returns Duration {
        handle externalObj = java_time_Duration_withNanos(self.jObj, nanos);
        Duration newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this duration with the specified number of seconds.
    #
    # + seconds - The number of seconds, positive or negative.
    # + return - A duration based on this duration with the requested seconds.
    public function withSeconds(int seconds) returns Duration {
        handle externalObj = java_time_Duration_withSeconds(self.jObj, seconds);
        Duration newObj = new (externalObj);
        return newObj;
    }

}

# Obtains a `Duration` representing the duration between two temporal objects.
#
# + startInclusive - The start time object (inclusive), not null.
# + endExclusive - The end time object (exclusive), not null.
# + return - The duration between the start and end time objects.
public function between(LocalDateTime|LocalTime|LocalDate startInclusive, LocalDateTime|LocalTime|LocalDate endExclusive) returns Duration {
    handle externalObj = java_time_Duration_between(startInclusive.jObj, endExclusive.jObj);
    Duration newObj = new (externalObj);
    return newObj;
}

# Obtains an instance of `Duration` from a temporal amount.
#
# + interval - The temporal amount to convert (`Duration` or `Period`), not null.
# + return - The equivalent `Duration` instance.
public function fromInterval(Duration|Period interval) returns Duration {
    handle externalObj = java_time_Duration_from(interval.jObj);
    Duration newObj = new (externalObj);
    return newObj;
}

# Obtains a `Duration` representing an amount in the specified unit.
#
# + amount - The quantity of the temporal unit.
# + unit - The `TemporalUnit` to measure the duration in.
# + return - The created `Duration` instance.
function Duration_of(int amount, TemporalUnit unit) returns Duration {
    handle externalObj = java_time_Duration_of(amount, unit.jObj);
    Duration newObj = new (externalObj);
    return newObj;
}

# Obtains a `Duration` representing a number of standard 24-hour days.
#
# + days - The number of days, positive or negative.
# + return - The created `Duration` instance.
public function ofDays(int days) returns Duration {
    handle externalObj = java_time_Duration_ofDays(days);
    Duration newObj = new (externalObj);
    return newObj;
}

# Obtains a `Duration` representing a number of hours.
#
# + hours - The number of hours, positive or negative.
# + return - The created `Duration` instance.
public function ofHours(int hours) returns Duration {
    handle externalObj = java_time_Duration_ofHours(hours);
    Duration newObj = new (externalObj);
    return newObj;
}

# Obtains a `Duration` representing a number of milliseconds.
#
# + millis - The number of milliseconds, positive or negative.
# + return - The created `Duration` instance.
public function ofMillis(int millis) returns Duration {
    handle externalObj = java_time_Duration_ofMillis(millis);
    Duration newObj = new (externalObj);
    return newObj;
}

# Obtains a `Duration` representing a number of minutes.
#
# + minutes - The number of minutes, positive or negative.
# + return - The created `Duration` instance.
public function ofMinutes(int minutes) returns Duration {
    handle externalObj = java_time_Duration_ofMinutes(minutes);
    Duration newObj = new (externalObj);
    return newObj;
}

# Obtains a `Duration` representing a number of nanoseconds.
#
# + nanos - The number of nanoseconds, positive or negative.
# + return - The created `Duration` instance.
public function ofNanos(int nanos) returns Duration {
    handle externalObj = java_time_Duration_ofNanos(nanos);
    Duration newObj = new (externalObj);
    return newObj;
}

# Obtains a `Duration` representing a number of seconds.
#
# + seconds - The number of seconds, positive or negative.
# + return - The created `Duration` instance.
public function ofSeconds(int seconds) returns Duration {
    handle externalObj = java_time_Duration_ofSeconds(seconds);
    Duration newObj = new (externalObj);
    return newObj;
}

# Obtains a `Duration` representing a number of seconds and an adjustment in nanoseconds.
#
# + seconds - The number of seconds, positive or negative.
# + nanoAdjustment - The nanosecond adjustment, from -999,999,999 to +999,999,999.
# + return - The created `Duration` instance.
public function ofSecondsWithNanos(int seconds, int nanoAdjustment) returns Duration {
    handle externalObj = java_time_Duration_ofSeconds2(seconds, nanoAdjustment);
    Duration newObj = new (externalObj);
    return newObj;
}

# Obtains a `Duration` from a text string such as `PT20.345S` (ISO-8601 format).
#
# + text - The text string to parse, not null.
# + return - The parsed `Duration` instance.
public function parseDuration(string text) returns Duration {
    handle externalObj = java_time_Duration_parse(java:fromString(text));
    Duration newObj = new (externalObj);
    return newObj;
}

# Obtains a constant `Duration` instance representing a zero length.
#
# + return - The `ZERO` duration instance.
public function Duration_getZERO() returns Duration {
    handle externalObj = java_time_Duration_getZERO();
    Duration newObj = new (externalObj);
    return newObj;
}

function java_time_Duration_abs(handle receiver) returns handle = @java:Method {
    name: "abs",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_addTo(handle receiver, handle arg0) returns handle = @java:Method {
    name: "addTo",
    'class: "java.time.Duration",
    paramTypes: ["java.time.temporal.Temporal"]
} external;

function java_time_Duration_between(handle arg0, handle arg1) returns handle = @java:Method {
    name: "between",
    'class: "java.time.Duration",
    paramTypes: ["java.time.temporal.Temporal", "java.time.temporal.Temporal"]
} external;

function java_time_Duration_compareTo(handle receiver, handle arg0) returns int = @java:Method {
    name: "compareTo",
    'class: "java.time.Duration",
    paramTypes: ["java.time.Duration"]
} external;

function java_time_Duration_dividedBy(handle receiver, handle arg0) returns int = @java:Method {
    name: "dividedBy",
    'class: "java.time.Duration",
    paramTypes: ["java.time.Duration"]
} external;

function java_time_Duration_dividedBy2(handle receiver, int arg0) returns handle = @java:Method {
    name: "dividedBy",
    'class: "java.time.Duration",
    paramTypes: ["long"]
} external;

function java_time_Duration_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "java.time.Duration",
    paramTypes: ["java.lang.Object"]
} external;

function java_time_Duration_from(handle arg0) returns handle = @java:Method {
    name: "from",
    'class: "java.time.Duration",
    paramTypes: ["java.time.temporal.TemporalAmount"]
} external;

function java_time_Duration_get(handle receiver, handle arg0) returns int = @java:Method {
    name: "get",
    'class: "java.time.Duration",
    paramTypes: ["java.time.temporal.TemporalUnit"]
} external;

function java_time_Duration_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_getNano(handle receiver) returns int = @java:Method {
    name: "getNano",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_getSeconds(handle receiver) returns int = @java:Method {
    name: "getSeconds",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_getUnits(handle receiver) returns handle = @java:Method {
    name: "getUnits",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_isNegative(handle receiver) returns boolean = @java:Method {
    name: "isNegative",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_isPositive(handle receiver) returns boolean = @java:Method {
    name: "isPositive",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_isZero(handle receiver) returns boolean = @java:Method {
    name: "isZero",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_minus(handle receiver, handle arg0) returns handle = @java:Method {
    name: "minus",
    'class: "java.time.Duration",
    paramTypes: ["java.time.Duration"]
} external;

function java_time_Duration_minus2(handle receiver, int arg0, handle arg1) returns handle = @java:Method {
    name: "minus",
    'class: "java.time.Duration",
    paramTypes: ["long", "java.time.temporal.TemporalUnit"]
} external;

function java_time_Duration_minusDays(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusDays",
    'class: "java.time.Duration",
    paramTypes: ["long"]
} external;

function java_time_Duration_minusHours(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusHours",
    'class: "java.time.Duration",
    paramTypes: ["long"]
} external;

function java_time_Duration_minusMillis(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusMillis",
    'class: "java.time.Duration",
    paramTypes: ["long"]
} external;

function java_time_Duration_minusMinutes(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusMinutes",
    'class: "java.time.Duration",
    paramTypes: ["long"]
} external;

function java_time_Duration_minusNanos(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusNanos",
    'class: "java.time.Duration",
    paramTypes: ["long"]
} external;

function java_time_Duration_minusSeconds(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusSeconds",
    'class: "java.time.Duration",
    paramTypes: ["long"]
} external;

function java_time_Duration_multipliedBy(handle receiver, int arg0) returns handle = @java:Method {
    name: "multipliedBy",
    'class: "java.time.Duration",
    paramTypes: ["long"]
} external;

function java_time_Duration_negated(handle receiver) returns handle = @java:Method {
    name: "negated",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_of(int arg0, handle arg1) returns handle = @java:Method {
    name: "of",
    'class: "java.time.Duration",
    paramTypes: ["long", "java.time.temporal.TemporalUnit"]
} external;

function java_time_Duration_ofDays(int arg0) returns handle = @java:Method {
    name: "ofDays",
    'class: "java.time.Duration",
    paramTypes: ["long"]
} external;

function java_time_Duration_ofHours(int arg0) returns handle = @java:Method {
    name: "ofHours",
    'class: "java.time.Duration",
    paramTypes: ["long"]
} external;

function java_time_Duration_ofMillis(int arg0) returns handle = @java:Method {
    name: "ofMillis",
    'class: "java.time.Duration",
    paramTypes: ["long"]
} external;

function java_time_Duration_ofMinutes(int arg0) returns handle = @java:Method {
    name: "ofMinutes",
    'class: "java.time.Duration",
    paramTypes: ["long"]
} external;

function java_time_Duration_ofNanos(int arg0) returns handle = @java:Method {
    name: "ofNanos",
    'class: "java.time.Duration",
    paramTypes: ["long"]
} external;

function java_time_Duration_ofSeconds(int arg0) returns handle = @java:Method {
    name: "ofSeconds",
    'class: "java.time.Duration",
    paramTypes: ["long"]
} external;

function java_time_Duration_ofSeconds2(int arg0, int arg1) returns handle = @java:Method {
    name: "ofSeconds",
    'class: "java.time.Duration",
    paramTypes: ["long", "long"]
} external;

function java_time_Duration_parse(handle arg0) returns handle = @java:Method {
    name: "parse",
    'class: "java.time.Duration",
    paramTypes: ["java.lang.CharSequence"]
} external;

function java_time_Duration_plus(handle receiver, handle arg0) returns handle = @java:Method {
    name: "plus",
    'class: "java.time.Duration",
    paramTypes: ["java.time.Duration"]
} external;

function java_time_Duration_plus2(handle receiver, int arg0, handle arg1) returns handle = @java:Method {
    name: "plus",
    'class: "java.time.Duration",
    paramTypes: ["long", "java.time.temporal.TemporalUnit"]
} external;

function java_time_Duration_plusDays(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusDays",
    'class: "java.time.Duration",
    paramTypes: ["long"]
} external;

function java_time_Duration_plusHours(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusHours",
    'class: "java.time.Duration",
    paramTypes: ["long"]
} external;

function java_time_Duration_plusMillis(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusMillis",
    'class: "java.time.Duration",
    paramTypes: ["long"]
} external;

function java_time_Duration_plusMinutes(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusMinutes",
    'class: "java.time.Duration",
    paramTypes: ["long"]
} external;

function java_time_Duration_plusNanos(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusNanos",
    'class: "java.time.Duration",
    paramTypes: ["long"]
} external;

function java_time_Duration_plusSeconds(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusSeconds",
    'class: "java.time.Duration",
    paramTypes: ["long"]
} external;

function java_time_Duration_subtractFrom(handle receiver, handle arg0) returns handle = @java:Method {
    name: "subtractFrom",
    'class: "java.time.Duration",
    paramTypes: ["java.time.temporal.Temporal"]
} external;

function java_time_Duration_toDays(handle receiver) returns int = @java:Method {
    name: "toDays",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_toDaysPart(handle receiver) returns int = @java:Method {
    name: "toDaysPart",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_toHours(handle receiver) returns int = @java:Method {
    name: "toHours",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_toHoursPart(handle receiver) returns int = @java:Method {
    name: "toHoursPart",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_toMillis(handle receiver) returns int = @java:Method {
    name: "toMillis",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_toMillisPart(handle receiver) returns int = @java:Method {
    name: "toMillisPart",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_toMinutes(handle receiver) returns int = @java:Method {
    name: "toMinutes",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_toMinutesPart(handle receiver) returns int = @java:Method {
    name: "toMinutesPart",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_toNanos(handle receiver) returns int = @java:Method {
    name: "toNanos",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_toNanosPart(handle receiver) returns int = @java:Method {
    name: "toNanosPart",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_toSeconds(handle receiver) returns int = @java:Method {
    name: "toSeconds",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_toSecondsPart(handle receiver) returns int = @java:Method {
    name: "toSecondsPart",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_truncatedTo(handle receiver, handle arg0) returns handle = @java:Method {
    name: "truncatedTo",
    'class: "java.time.Duration",
    paramTypes: ["java.time.temporal.TemporalUnit"]
} external;

function java_time_Duration_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "java.time.Duration",
    paramTypes: []
} external;

function java_time_Duration_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "java.time.Duration",
    paramTypes: ["long"]
} external;

function java_time_Duration_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "java.time.Duration",
    paramTypes: ["long", "int"]
} external;

function java_time_Duration_withNanos(handle receiver, int arg0) returns handle = @java:Method {
    name: "withNanos",
    'class: "java.time.Duration",
    paramTypes: ["int"]
} external;

function java_time_Duration_withSeconds(handle receiver, int arg0) returns handle = @java:Method {
    name: "withSeconds",
    'class: "java.time.Duration",
    paramTypes: ["long"]
} external;

function java_time_Duration_getZERO() returns handle = @java:FieldGet {
    name: "ZERO",
    'class: "java.time.Duration"
} external;

