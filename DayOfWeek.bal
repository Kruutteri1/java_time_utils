import ballerina/jballerina.java;
import ballerina/jballerina.java.arrays as jarrays;

# Ballerina class mapping for the Java `java.time.DayOfWeek` class.
#
# `DayOfWeek` is an enum representing the seven days of the week
# (MONDAY through SUNDAY). It is returned by `LocalDate.getDayOfWeek()`
# and `LocalDateTime.getDayOfWeek()`.
@java:Binding {'class: "java.time.DayOfWeek"}
public distinct class DayOfWeek {

    *java:JObject;
    *Enum;

    # The handle to the underlying Java object.
    public handle jObj;

    # Initializes the DayOfWeek wrapper.
    #
    # + obj - The handle value containing the Java reference.
    public function init(handle obj) {
        self.jObj = obj;
    }

    # Returns the string representation of this day-of-week (e.g. "MONDAY").
    #
    # + return - The string form of the day-of-week.
    public function toString() returns string {
        return java:toString(self.jObj) ?: "";
    }

    # Adjusts the specified temporal object to have this day-of-week.
    #
    # + temporal - The temporal object to adjust.
    # + return - The adjusted temporal object.
    function adjustInto(Temporal temporal) returns Temporal {
        handle externalObj = java_time_DayOfWeek_adjustInto(self.jObj, temporal.jObj);
        Temporal newObj = new (externalObj);
        return newObj;
    }

    # Compares this day-of-week to another enum constant by ordinal position.
    #
    # + other - The enum constant to compare against.
    # + return - Negative, zero, or positive if this constant is declared before, at the same position as, or after other.
    public function compareTo(Enum other) returns int {
        return java_time_DayOfWeek_compareTo(self.jObj, other.jObj);
    }

    # Returns an optional descriptor of this day-of-week for use with
    # nominal descriptors (Java's `Constable` mechanism).
    #
    # + return - The optional descriptor.
    function describeConstable() returns Optional {
        handle externalObj = java_time_DayOfWeek_describeConstable(self.jObj);
        Optional newObj = new (externalObj);
        return newObj;
    }

    # Checks whether this day-of-week is equal to another object. Returns
    # false rather than panicking if other is not a DayOfWeek.
    #
    # + other - The object to compare against.
    # + return - True if equal, false otherwise.
    public function isEquals(Object other) returns boolean {
        return java_time_DayOfWeek_equals(self.jObj, other.jObj);
    }

    # Gets the value of the specified field as an int.
    #
    # + temporal - The field to query.
    # + return - The value for the field.
    function get(TemporalField temporal) returns int {
        return java_time_DayOfWeek_get(self.jObj, temporal.jObj);
    }

    # Returns the runtime class of this object.
    #
    # + return - The Class object representing the runtime class.
    public function getClass() returns Class {
        handle externalObj = java_time_DayOfWeek_getClass(self.jObj);
        Class newObj = new (externalObj);
        return newObj;
    }

    # Returns the Class object corresponding to this enum constant's enum type.
    #
    # + return - The Class of the enum type.
    public function getDeclaringClass() returns Class {
        handle externalObj = java_time_DayOfWeek_getDeclaringClass(self.jObj);
        Class newObj = new (externalObj);
        return newObj;
    }

    # Returns the localized text representation of this day-of-week
    # (e.g. "Monday" or "Mon"), for the given style and locale.
    #
    # + style - The style of the text required (full name, short name, etc.).
    # + locale - The locale to use.
    # + return - The localized display name of this day-of-week.
    function getDisplayName(TextStyle style, Locale locale) returns string {
        return java:toString(java_time_DayOfWeek_getDisplayName(self.jObj, style.jObj, locale.jObj)) ?: "";
    }

    # Gets the value of the specified field as a long.
    #
    # + temporalField - The field to query.
    # + return - The value for the field.
    function getLong(TemporalField temporalField) returns int {
        return java_time_DayOfWeek_getLong(self.jObj, temporalField.jObj);
    }

    # Returns the ISO-8601 numeric value of this day-of-week.
    #
    # + return - The day-of-week value, from 1 (MONDAY) to 7 (SUNDAY).
    public function getValue() returns int {
        return java_time_DayOfWeek_getValue(self.jObj);
    }

    # Returns the hash code for this day-of-week.
    #
    # + return - The hash code.
    public function hashCode() returns int {
        return java_time_DayOfWeek_hashCode(self.jObj);
    }

    # Checks whether the specified field is supported by this day-of-week.
    #
    # + temporalField - The field to check.
    # + return - True if the field is supported.
    function isSupported(TemporalField temporalField) returns boolean {
        return java_time_DayOfWeek_isSupported(self.jObj, temporalField.jObj);
    }

    # Returns the day-of-week that results from subtracting the specified
    # number of days from this one, cycling through the week.
    #
    # + days - The number of days to subtract; may be negative.
    # + return - The resulting day-of-week.
    public function minusDays(int days) returns DayOfWeek {
        handle externalObj = java_time_DayOfWeek_minus(self.jObj, days);
        DayOfWeek newObj = new (externalObj);
        return newObj;
    }

    # Returns the name of this enum constant exactly as declared (e.g. "MONDAY").
    #
    # + return - The declared name of this constant.
    public function name() returns string {
        return java:toString(java_time_DayOfWeek_name(self.jObj)) ?: "";
    }

     # Wakes up a single thread that is waiting on this object's monitor.
    #
    # WARNING: This is a low-level Java synchronization method. Avoid using
    # it in business logic.
    public function notify() {
        java_time_DayOfWeek_notify(self.jObj);
    }

    # Wakes up all threads that are waiting on this object's monitor.
    #
    # WARNING: This is a low-level Java synchronization method. Avoid using
    # it in business logic.
    public function notifyAll() {
        java_time_DayOfWeek_notifyAll(self.jObj);
    }

    # Returns the position of this constant in its enum declaration, where
    # the first constant has an ordinal of zero (MONDAY = 0, ..., SUNDAY = 6).
    #
    # + return - The ordinal of this constant.
    public function ordinal() returns int {
        return java_time_DayOfWeek_ordinal(self.jObj);
    }

    # Returns the day-of-week that results from adding the specified
    # number of days to this one, cycling through the week.
    #
    # + days - The number of days to add; may be negative.
    # + return - The resulting day-of-week.
    public function plusDays(int days) returns DayOfWeek {
        handle externalObj = java_time_DayOfWeek_plus(self.jObj, days);
        DayOfWeek newObj = new (externalObj);
        return newObj;
    }

    # Queries this day-of-week using the specified query.
    #
    # + temporalQuery - The query to invoke.
    # + return - The query result.
    function query(TemporalQuery temporalQuery) returns Object {
        handle externalObj = java_time_DayOfWeek_query(self.jObj, temporalQuery.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # Returns the range of valid values for the specified field.
    #
    # + temporalField - The field to query the range for.
    # + return - The range of valid values for the field.
    function range(TemporalField temporalField) returns ValueRange {
        handle externalObj = java_time_DayOfWeek_range(self.jObj, temporalField.jObj);
        ValueRange newObj = new (externalObj);
        return newObj;
    }

    # Causes the current thread to wait until notified.
    #
    # WARNING: Low-level Java synchronization method. Use with caution.
    #
    # + return - An InterruptedException if the thread is interrupted while waiting.
    public function doWait() returns InterruptedException? {
        error|() externalObj = java_time_DayOfWeek_wait(self.jObj);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # Causes the current thread to wait until notified or the specified time elapses.
    #
    # WARNING: Low-level Java synchronization method. Use with caution.
    #
    # + timeoutMillis - The maximum time to wait, in milliseconds.
    # + return - An InterruptedException if the thread is interrupted while waiting.
    public function waitWithTimeout(int timeoutMillis) returns InterruptedException? {
        error|() externalObj = java_time_DayOfWeek_wait2(self.jObj, timeoutMillis);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

     # Causes the current thread to wait until notified, with the specified timeout.
    #
    # WARNING: Low-level Java synchronization method. Use with caution.
    #
    # + timeoutMillis - The maximum time to wait, in milliseconds.
    # + nanos - Additional nanoseconds to wait.
    # + return - An InterruptedException if the thread is interrupted while waiting.
    public function waitWithTimeoutAndNanos(int timeoutMillis, int nanos) returns InterruptedException? {
        error|() externalObj = java_time_DayOfWeek_wait3(self.jObj, timeoutMillis, nanos);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

}

# Obtains a DayOfWeek from a temporal object.
#
# + temporalAccessor - The temporal object to convert.
# + return - The corresponding DayOfWeek.
function DayOfWeek_from(TemporalAccessor temporalAccessor) returns DayOfWeek {
    handle externalObj = java_time_DayOfWeek_from(temporalAccessor.jObj);
    DayOfWeek newObj = new (externalObj);
    return newObj;
}

# Creates a DayOfWeek from an ISO-8601 numeric value.
#
# + dayOfWeek - The day-of-week value, from 1 (MONDAY) to 7 (SUNDAY).
# + return - The corresponding DayOfWeek. Panics if the value is out of range.
public function ofDay(int dayOfWeek) returns DayOfWeek {
    handle externalObj = java_time_DayOfWeek_of(dayOfWeek);
    DayOfWeek newObj = new (externalObj);
    return newObj;
}

# Returns the enum constant of the specified enum type with the specified name.
# This is the generic `Enum.valueOf(Class, String)` form.
#
# + enumClass - The Class object of the enum type.
# + name - The name of the constant to return.
# + return - The enum constant with the specified name.
public function valueOf(Class enumClass, string name) returns Enum {
    handle externalObj = java_time_DayOfWeek_valueOf(enumClass.jObj, java:fromString(name));
    Enum newObj = new (externalObj);
    return newObj;
}

# Returns the DayOfWeek constant with the specified name (e.g. "MONDAY").
# Panics if no constant with that name exists.
#
# + name - The name of the constant to return.
# + return - The corresponding DayOfWeek.
public function valueOfDayName(string name) returns DayOfWeek {
    handle externalObj = java_time_DayOfWeek_valueOf2(java:fromString(name));
    DayOfWeek newObj = new (externalObj);
    return newObj;
}

# Returns all seven DayOfWeek constants, in declaration order (MONDAY first).
#
# + return - An array of all DayOfWeek constants.
public function getWeekValues() returns DayOfWeek[]|error {
    handle externalObj = java_time_DayOfWeek_values();
    DayOfWeek[] newObj = [];
    handle[] anyObj = <handle[]>check jarrays:fromHandle(externalObj, "handle");
    int count = anyObj.length();
    foreach int i in 0 ... count - 1 {
        DayOfWeek element = new (anyObj[i]);
        newObj[i] = element;
    }
    return newObj;
}

# Returns the constant for Monday.
# + return - The MONDAY constant.
public function getMONDAY() returns DayOfWeek {
    handle externalObj = java_time_DayOfWeek_getMONDAY();
    DayOfWeek newObj = new (externalObj);
    return newObj;
}

# Returns the constant for Tuesday.
# + return - The TUESDAY constant.
public function getTUESDAY() returns DayOfWeek {
    handle externalObj = java_time_DayOfWeek_getTUESDAY();
    DayOfWeek newObj = new (externalObj);
    return newObj;
}

# Returns the constant for Wednesday.
# + return - The WEDNESDAY constant.
public function getWEDNESDAY() returns DayOfWeek {
    handle externalObj = java_time_DayOfWeek_getWEDNESDAY();
    DayOfWeek newObj = new (externalObj);
    return newObj;
}

# Returns the constant for Thursday.
# + return - The THURSDAY constant.
public function getTHURSDAY() returns DayOfWeek {
    handle externalObj = java_time_DayOfWeek_getTHURSDAY();
    DayOfWeek newObj = new (externalObj);
    return newObj;
}

# Returns the constant for Friday.
# + return - The FRIDAY constant.
public function getFRIDAY() returns DayOfWeek {
    handle externalObj = java_time_DayOfWeek_getFRIDAY();
    DayOfWeek newObj = new (externalObj);
    return newObj;
}

# Returns the constant for Saturday.
# + return - The SATURDAY constant.
public function getSATURDAY() returns DayOfWeek {
    handle externalObj = java_time_DayOfWeek_getSATURDAY();
    DayOfWeek newObj = new (externalObj);
    return newObj;
}

# Returns the constant for Sunday.
# + return - The SUNDAY constant.
public function getSUNDAY() returns DayOfWeek {
    handle externalObj = java_time_DayOfWeek_getSUNDAY();
    DayOfWeek newObj = new (externalObj);
    return newObj;
}

function java_time_DayOfWeek_adjustInto(handle receiver, handle arg0) returns handle = @java:Method {
    name: "adjustInto",
    'class: "java.time.DayOfWeek",
    paramTypes: ["java.time.temporal.Temporal"]
} external;

function java_time_DayOfWeek_compareTo(handle receiver, handle arg0) returns int = @java:Method {
    name: "compareTo",
    'class: "java.time.DayOfWeek",
    paramTypes: ["java.lang.Enum"]
} external;

function java_time_DayOfWeek_describeConstable(handle receiver) returns handle = @java:Method {
    name: "describeConstable",
    'class: "java.time.DayOfWeek",
    paramTypes: []
} external;

function java_time_DayOfWeek_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "java.time.DayOfWeek",
    paramTypes: ["java.lang.Object"]
} external;

function java_time_DayOfWeek_from(handle arg0) returns handle = @java:Method {
    name: "from",
    'class: "java.time.DayOfWeek",
    paramTypes: ["java.time.temporal.TemporalAccessor"]
} external;

function java_time_DayOfWeek_get(handle receiver, handle arg0) returns int = @java:Method {
    name: "get",
    'class: "java.time.DayOfWeek",
    paramTypes: ["java.time.temporal.TemporalField"]
} external;

function java_time_DayOfWeek_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "java.time.DayOfWeek",
    paramTypes: []
} external;

function java_time_DayOfWeek_getDeclaringClass(handle receiver) returns handle = @java:Method {
    name: "getDeclaringClass",
    'class: "java.time.DayOfWeek",
    paramTypes: []
} external;

function java_time_DayOfWeek_getDisplayName(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "getDisplayName",
    'class: "java.time.DayOfWeek",
    paramTypes: ["java.time.format.TextStyle", "java.util.Locale"]
} external;

function java_time_DayOfWeek_getLong(handle receiver, handle arg0) returns int = @java:Method {
    name: "getLong",
    'class: "java.time.DayOfWeek",
    paramTypes: ["java.time.temporal.TemporalField"]
} external;

function java_time_DayOfWeek_getValue(handle receiver) returns int = @java:Method {
    name: "getValue",
    'class: "java.time.DayOfWeek",
    paramTypes: []
} external;

function java_time_DayOfWeek_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "java.time.DayOfWeek",
    paramTypes: []
} external;

function java_time_DayOfWeek_isSupported(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "isSupported",
    'class: "java.time.DayOfWeek",
    paramTypes: ["java.time.temporal.TemporalField"]
} external;

function java_time_DayOfWeek_minus(handle receiver, int arg0) returns handle = @java:Method {
    name: "minus",
    'class: "java.time.DayOfWeek",
    paramTypes: ["long"]
} external;

function java_time_DayOfWeek_name(handle receiver) returns handle = @java:Method {
    name: "name",
    'class: "java.time.DayOfWeek",
    paramTypes: []
} external;

function java_time_DayOfWeek_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "java.time.DayOfWeek",
    paramTypes: []
} external;

function java_time_DayOfWeek_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "java.time.DayOfWeek",
    paramTypes: []
} external;

function java_time_DayOfWeek_of(int arg0) returns handle = @java:Method {
    name: "of",
    'class: "java.time.DayOfWeek",
    paramTypes: ["int"]
} external;

function java_time_DayOfWeek_ordinal(handle receiver) returns int = @java:Method {
    name: "ordinal",
    'class: "java.time.DayOfWeek",
    paramTypes: []
} external;

function java_time_DayOfWeek_plus(handle receiver, int arg0) returns handle = @java:Method {
    name: "plus",
    'class: "java.time.DayOfWeek",
    paramTypes: ["long"]
} external;

function java_time_DayOfWeek_query(handle receiver, handle arg0) returns handle = @java:Method {
    name: "query",
    'class: "java.time.DayOfWeek",
    paramTypes: ["java.time.temporal.TemporalQuery"]
} external;

function java_time_DayOfWeek_range(handle receiver, handle arg0) returns handle = @java:Method {
    name: "range",
    'class: "java.time.DayOfWeek",
    paramTypes: ["java.time.temporal.TemporalField"]
} external;

function java_time_DayOfWeek_valueOf(handle arg0, handle arg1) returns handle = @java:Method {
    name: "valueOf",
    'class: "java.time.DayOfWeek",
    paramTypes: ["java.lang.Class", "java.lang.String"]
} external;

function java_time_DayOfWeek_valueOf2(handle arg0) returns handle = @java:Method {
    name: "valueOf",
    'class: "java.time.DayOfWeek",
    paramTypes: ["java.lang.String"]
} external;

function java_time_DayOfWeek_values() returns handle = @java:Method {
    name: "values",
    'class: "java.time.DayOfWeek",
    paramTypes: []
} external;

function java_time_DayOfWeek_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "java.time.DayOfWeek",
    paramTypes: []
} external;

function java_time_DayOfWeek_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "java.time.DayOfWeek",
    paramTypes: ["long"]
} external;

function java_time_DayOfWeek_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "java.time.DayOfWeek",
    paramTypes: ["long", "int"]
} external;

function java_time_DayOfWeek_getMONDAY() returns handle = @java:FieldGet {
    name: "MONDAY",
    'class: "java.time.DayOfWeek"
} external;

function java_time_DayOfWeek_getTUESDAY() returns handle = @java:FieldGet {
    name: "TUESDAY",
    'class: "java.time.DayOfWeek"
} external;

function java_time_DayOfWeek_getWEDNESDAY() returns handle = @java:FieldGet {
    name: "WEDNESDAY",
    'class: "java.time.DayOfWeek"
} external;

function java_time_DayOfWeek_getTHURSDAY() returns handle = @java:FieldGet {
    name: "THURSDAY",
    'class: "java.time.DayOfWeek"
} external;

function java_time_DayOfWeek_getFRIDAY() returns handle = @java:FieldGet {
    name: "FRIDAY",
    'class: "java.time.DayOfWeek"
} external;

function java_time_DayOfWeek_getSATURDAY() returns handle = @java:FieldGet {
    name: "SATURDAY",
    'class: "java.time.DayOfWeek"
} external;

function java_time_DayOfWeek_getSUNDAY() returns handle = @java:FieldGet {
    name: "SUNDAY",
    'class: "java.time.DayOfWeek"
} external;

