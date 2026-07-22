import ballerina/jballerina.java;
import ballerina/jballerina.java.arrays as jarrays;

# Ballerina class mapping for the Java `java.time.Month` class.
#
# Represents a month in the year, such as 'July'.
@java:Binding {'class: "java.time.Month"}
public distinct class Month {

    *java:JObject;
    *Enum;

    # The `handle` field that stores the reference to the `java.time.Month` object.
    public handle jObj;

    # The init function of the Ballerina class mapping the `java.time.Month` Java class.
    #
    # + obj - The `handle` value containing the Java reference of the object.
    public function init(handle obj) {
        self.jObj = obj;
    }

    # Returns the string representation of the Java `Month` object instance.
    #
    # + return - The string form of the Java object instance.
    public function toString() returns string {
        return java:toString(self.jObj) ?: "";
    }

    # Adjusts the specified temporal object to have the same month as this object.
    #
    # + temporal - The target temporal object to be adjusted.
    # + return - The adjusted temporal object.
    function adjustInto(Temporal temporal) returns Temporal {
        handle externalObj = java_time_Month_adjustInto(self.jObj, temporal.jObj);
        Temporal newObj = new (externalObj);
        return newObj;
    }

    # Compares this month to another enum value.
    #
    # + other - The other enum value to compare against.
    # + return - The negative integer, zero, or positive integer as this object is less than, equal to, or greater than the specified object.
    public function compareTo(Enum other) returns int {
        return java_time_Month_compareTo(self.jObj, other.jObj);
    }

    # Returns a lazy description of this month-of-year.
    #
    # + return - The optional string descriptor.
    function describeConstable() returns Optional {
        handle externalObj = java_time_Month_describeConstable(self.jObj);
        Optional newObj = new (externalObj);
        return newObj;
    }

    # Checks if this month is equal to another object.
    #
    # + other - The object to check equality with.
    # + return - True if the objects are equal, false otherwise.
    public function isEquals(Object other) returns boolean {
        return java_time_Month_equals(self.jObj, other.jObj);
    }

    # Gets the day-of-year corresponding to the first day of this month.
    #
    # + leapYear - True if the year is a leap year, false otherwise.
    # + return - The day-of-year for the first day of this month (1 to 335).
    public function firstDayOfYear(boolean leapYear) returns int {
        return java_time_Month_firstDayOfYear(self.jObj, leapYear);
    }

    # Gets the first month of the quarter.
    #
    # + return - The first month of the corresponding quarter.
    public function firstMonthOfQuarter() returns Month {
        handle externalObj = java_time_Month_firstMonthOfQuarter(self.jObj);
        Month newObj = new (externalObj);
        return newObj;
    }

    # Gets the value of the specified field from this month as an int.
    #
    # + temporalField - The field to get.
    # + return - The value for the field.
    function get(TemporalField temporalField) returns int {
        return java_time_Month_get(self.jObj, temporalField.jObj);
    }

    # Returns the Class object that represents this month's runtime class.
    #
    # + return - The Class object.
    public function getClass() returns Class {
        handle externalObj = java_time_Month_getClass(self.jObj);
        Class newObj = new (externalObj);
        return newObj;
    }

    # Returns the declaring class of this enum's type.
    #
    # + return - The Class object representing the enum type.
    public function getDeclaringClass() returns Class {
        handle externalObj = java_time_Month_getDeclaringClass(self.jObj);
        Class newObj = new (externalObj);
        return newObj;
    }

   # Gets the textual representation of the month, such as 'Jan' or 'December'.
    #
    # + style - The length of the text required (e.g., FULL or SHORT).
    # + locale - The locale to use.
    # + return - The display name of the month.
    function getDisplayName(TextStyle style, Locale locale) returns string {
        return java:toString(java_time_Month_getDisplayName(self.jObj, style.jObj, locale.jObj)) ?: "";
    }

    # Gets the value of the specified field from this month as a long.
    #
    # + temporalField - The field to get.
    # + return - The value for the field.
    function getLong(TemporalField temporalField) returns int {
        return java_time_Month_getLong(self.jObj, temporalField.jObj);
    }

    # Returns the numeric value of the month.
    #
    # + return - The integer value representing the month (1 for January, 12 for December).
    public function getValue() returns int {
        return java_time_Month_getValue(self.jObj);
    }

    # Returns a hash code for this month.
    #
    # + return - A suitable hash code.
    public function hashCode() returns int {
        return java_time_Month_hashCode(self.jObj);
    }

    # Checks if the specified field is supported.
    #
    # + temporalField - The field to check, null returns false.
    # + return - True if the field is supported on this month, false if not.
    function isSupported(TemporalField temporalField) returns boolean {
        return java_time_Month_isSupported(self.jObj, temporalField.jObj);
    }

    # Gets the length of the month in days, taking leap years into account.
    #
    # + leapYear - True if the year is a leap year, false otherwise.
    # + return - The length of this month in days.
    public function length(boolean leapYear) returns int {
        return java_time_Month_length(self.jObj, leapYear);
    }

    # Gets the maximum length of this month in days.
    #
    # + return - The maximum length of this month in days (29 to 31).
    public function maxLength() returns int {
        return java_time_Month_maxLength(self.jObj);
    }

    # Gets the minimum length of this month in days.
    #
    # + return - The minimum length of this month in days (28 to 31).
    public function minLength() returns int {
        return java_time_Month_minLength(self.jObj);
    }

    # Returns the month-of-year that is the specified number of months before this one.
    #
    # + months - The months to subtract, positive or negative.
    # + return - The resulting month.
    public function minus(int months) returns Month {
        handle externalObj = java_time_Month_minus(self.jObj, months);
        Month newObj = new (externalObj);
        return newObj;
    }

    # Returns the name of this enum constant, exactly as declared in its enum declaration.
    #
    # + return - The name of this month.
    public function name() returns string {
        return java:toString(java_time_Month_name(self.jObj)) ?: "";
    }

    # Wakes up a single thread that is waiting on this object's monitor.
    public function notify() {
        java_time_Month_notify(self.jObj);
    }

    # Wakes up all threads that are waiting on this object's monitor.
    public function notifyAll() {
        java_time_Month_notifyAll(self.jObj);
    }

    # Returns the ordinal of this enumeration constant (its position in its enum declaration, where the initial constant is assigned an ordinal of zero).
    #
    # + return - The ordinal of this month.
    public function ordinal() returns int {
        return java_time_Month_ordinal(self.jObj);
    }

    # Returns the month-of-year that is the specified number of months after this one.
    #
    # + months - The months to add, positive or negative.
    # + return - The resulting month.
    public function plus(int months) returns Month {
        handle externalObj = java_time_Month_plus(self.jObj, months);
        Month newObj = new (externalObj);
        return newObj;
    }

    # Queries this month using the specified query.
    #
    # + query - The query to invoke, not null.
    # + return - The query result, null may be returned (mapped to Object).
    function query(TemporalQuery query) returns Object {
        handle externalObj = java_time_Month_query(self.jObj, query.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # Gets the range of valid values for the specified field.
    #
    # + temporalField - The field to query the range for.
    # + return - The range of valid values for the field.
    function range(TemporalField temporalField) returns ValueRange {
        handle externalObj = java_time_Month_range(self.jObj, temporalField.jObj);
        ValueRange newObj = new (externalObj);
        return newObj;
    }

    # Causes the current thread to wait until another thread wakes it up.
    #
    # + return - An InterruptedException if the current thread was interrupted while waiting, or nil otherwise.
    public function doWait() returns InterruptedException? {
        error|() externalObj = java_time_Month_wait(self.jObj);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # Causes the current thread to wait until another thread wakes it up, or until a specified timeout elapses.
    #
    # + timeoutMillis - The maximum time to wait in milliseconds.
    # + return - An InterruptedException if the current thread was interrupted while waiting, or nil otherwise.
    public function waitWithTimeout(int timeoutMillis) returns InterruptedException? {
        error|() externalObj = java_time_Month_wait2(self.jObj, timeoutMillis);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # Causes the current thread to wait until another thread wakes it up, or until a specified timeout and nanoseconds elapse.
    #
    # + timeoutMillis - The maximum time to wait in milliseconds.
    # + nanos - Additional nanoseconds to wait.
    # + return - An InterruptedException if the current thread was interrupted while waiting, or nil otherwise.
    public function waitWithTimeoutAndNanos(int timeoutMillis, int nanos) returns InterruptedException? {
        error|() externalObj = java_time_Month_wait3(self.jObj, timeoutMillis, nanos);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

}

# Obtains an instance of `Month` from a temporal object.
#
# + temporal - The temporal object to convert, not null.
# + return - The month-of-year.
function Month_from(TemporalAccessor temporal) returns Month {
    handle externalObj = java_time_Month_from(temporal.jObj);
    Month newObj = new (externalObj);
    return newObj;
}

# Obtains an instance of `Month` from an int value.
#
# + month - The month-of-year to represent, from 1 (January) to 12 (December).
# + return - Month|error — the month constant, or an error if month is outside the range 1-12.
public function getMonthOf(int month) returns Month|error {
    handle externalObj = check java_time_Month_of(month);
    Month newObj = new (externalObj);
    return newObj;
}

# Returns the enum constant of the specified enum type with the specified name.
#
# + enumClass - The Class object of the enum type.
# + name - The name of the constant to return.
# + return - Enum|error — the enum constant, or an error if no constant with the given name exists.
public function getMonthValueOfEnum(Class enumClass, string name) returns Enum|error {
    handle externalObj = check java_time_Month_valueOf(enumClass.jObj, java:fromString(name));
    Enum newObj = new (externalObj);
    return newObj;
}

# Returns the enum constant of this type with the specified name.
#
# + name - The name of the constant to return.
# + return - Month|error — the month constant, or an error if no month with the given name exists (e.g. misspelled).
public function getMonthValueOf(string name) returns Month|error {
    handle externalObj = check java_time_Month_valueOf2(java:fromString(name));
    Month newObj = new (externalObj);
    return newObj;
}

# Returns an array containing the constants of this enum class, in the order they're declared.
#
# + return - Month[]|error — an array of all twelve Month constants, or an error if conversion fails.
public function getMonthValues() returns Month[]|error {
    handle externalObj = java_time_Month_values();
    Month[] newObj = [];
    handle[] anyObj = <handle[]>check jarrays:fromHandle(externalObj, "handle");
    int count = anyObj.length();
    foreach int i in 0 ... count - 1 {
        Month element = new (anyObj[i]);
        newObj[i] = element;
    }
    return newObj;
}

# Retrieves the constant representing the month of January.
#
# + return - The January month constant.
public function getJanuary() returns Month {
    handle externalObj = java_time_Month_getJANUARY();
    Month newObj = new (externalObj);
    return newObj;
}

# Retrieves the constant representing the month of February.
#
# + return - The February month constant.
public function getFebruary() returns Month {
    handle externalObj = java_time_Month_getFEBRUARY();
    Month newObj = new (externalObj);
    return newObj;
}

# Retrieves the constant representing the month of March.
#
# + return - The March month constant.
public function getMarch() returns Month {
    handle externalObj = java_time_Month_getMARCH();
    Month newObj = new (externalObj);
    return newObj;
}

# Retrieves the constant representing the month of April.
#
# + return - The April month constant.
public function getApril() returns Month {
    handle externalObj = java_time_Month_getAPRIL();
    Month newObj = new (externalObj);
    return newObj;
}

# Retrieves the constant representing the month of May.
#
# + return - The May month constant.
public function getMay() returns Month {
    handle externalObj = java_time_Month_getMAY();
    Month newObj = new (externalObj);
    return newObj;
}

# Retrieves the constant representing the month of June.
#
# + return - The June month constant.
public function getJune() returns Month {
    handle externalObj = java_time_Month_getJUNE();
    Month newObj = new (externalObj);
    return newObj;
}

# Retrieves the constant representing the month of July.
#
# + return - The July month constant.
public function getJuly() returns Month {
    handle externalObj = java_time_Month_getJULY();
    Month newObj = new (externalObj);
    return newObj;
}

# Retrieves the constant representing the month of August.
#
# + return - The August month constant.
public function getAugust() returns Month {
    handle externalObj = java_time_Month_getAUGUST();
    Month newObj = new (externalObj);
    return newObj;
}

# Retrieves the constant representing the month of September.
#
# + return - The September month constant.
public function getSeptember() returns Month {
    handle externalObj = java_time_Month_getSEPTEMBER();
    Month newObj = new (externalObj);
    return newObj;
}

# Retrieves the constant representing the month of October.
#
# + return - The October month constant.
public function getOctober() returns Month {
    handle externalObj = java_time_Month_getOCTOBER();
    Month newObj = new (externalObj);
    return newObj;
}

# Retrieves the constant representing the month of November.
#
# + return - The November month constant.
public function getNovember() returns Month {
    handle externalObj = java_time_Month_getNOVEMBER();
    Month newObj = new (externalObj);
    return newObj;
}

# Retrieves the constant representing the month of December.
#
# + return - The December month constant.
public function getDecember() returns Month {
    handle externalObj = java_time_Month_getDECEMBER();
    Month newObj = new (externalObj);
    return newObj;
}

function java_time_Month_adjustInto(handle receiver, handle arg0) returns handle = @java:Method {
    name: "adjustInto",
    'class: "java.time.Month",
    paramTypes: ["java.time.temporal.Temporal"]
} external;

function java_time_Month_compareTo(handle receiver, handle arg0) returns int = @java:Method {
    name: "compareTo",
    'class: "java.time.Month",
    paramTypes: ["java.lang.Enum"]
} external;

function java_time_Month_describeConstable(handle receiver) returns handle = @java:Method {
    name: "describeConstable",
    'class: "java.time.Month",
    paramTypes: []
} external;

function java_time_Month_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "java.time.Month",
    paramTypes: ["java.lang.Object"]
} external;

function java_time_Month_firstDayOfYear(handle receiver, boolean arg0) returns int = @java:Method {
    name: "firstDayOfYear",
    'class: "java.time.Month",
    paramTypes: ["boolean"]
} external;

function java_time_Month_firstMonthOfQuarter(handle receiver) returns handle = @java:Method {
    name: "firstMonthOfQuarter",
    'class: "java.time.Month",
    paramTypes: []
} external;

function java_time_Month_from(handle arg0) returns handle = @java:Method {
    name: "from",
    'class: "java.time.Month",
    paramTypes: ["java.time.temporal.TemporalAccessor"]
} external;

function java_time_Month_get(handle receiver, handle arg0) returns int = @java:Method {
    name: "get",
    'class: "java.time.Month",
    paramTypes: ["java.time.temporal.TemporalField"]
} external;

function java_time_Month_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "java.time.Month",
    paramTypes: []
} external;

function java_time_Month_getDeclaringClass(handle receiver) returns handle = @java:Method {
    name: "getDeclaringClass",
    'class: "java.time.Month",
    paramTypes: []
} external;

function java_time_Month_getDisplayName(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "getDisplayName",
    'class: "java.time.Month",
    paramTypes: ["java.time.format.TextStyle", "java.util.Locale"]
} external;

function java_time_Month_getLong(handle receiver, handle arg0) returns int = @java:Method {
    name: "getLong",
    'class: "java.time.Month",
    paramTypes: ["java.time.temporal.TemporalField"]
} external;

function java_time_Month_getValue(handle receiver) returns int = @java:Method {
    name: "getValue",
    'class: "java.time.Month",
    paramTypes: []
} external;

function java_time_Month_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "java.time.Month",
    paramTypes: []
} external;

function java_time_Month_isSupported(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "isSupported",
    'class: "java.time.Month",
    paramTypes: ["java.time.temporal.TemporalField"]
} external;

function java_time_Month_length(handle receiver, boolean arg0) returns int = @java:Method {
    name: "length",
    'class: "java.time.Month",
    paramTypes: ["boolean"]
} external;

function java_time_Month_maxLength(handle receiver) returns int = @java:Method {
    name: "maxLength",
    'class: "java.time.Month",
    paramTypes: []
} external;

function java_time_Month_minLength(handle receiver) returns int = @java:Method {
    name: "minLength",
    'class: "java.time.Month",
    paramTypes: []
} external;

function java_time_Month_minus(handle receiver, int arg0) returns handle = @java:Method {
    name: "minus",
    'class: "java.time.Month",
    paramTypes: ["long"]
} external;

function java_time_Month_name(handle receiver) returns handle = @java:Method {
    name: "name",
    'class: "java.time.Month",
    paramTypes: []
} external;

function java_time_Month_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "java.time.Month",
    paramTypes: []
} external;

function java_time_Month_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "java.time.Month",
    paramTypes: []
} external;

function java_time_Month_of(int arg0) returns handle|error = @java:Method {
    name: "of",
    'class: "java.time.Month",
    paramTypes: ["int"]
} external;

function java_time_Month_ordinal(handle receiver) returns int = @java:Method {
    name: "ordinal",
    'class: "java.time.Month",
    paramTypes: []
} external;

function java_time_Month_plus(handle receiver, int arg0) returns handle = @java:Method {
    name: "plus",
    'class: "java.time.Month",
    paramTypes: ["long"]
} external;

function java_time_Month_query(handle receiver, handle arg0) returns handle = @java:Method {
    name: "query",
    'class: "java.time.Month",
    paramTypes: ["java.time.temporal.TemporalQuery"]
} external;

function java_time_Month_range(handle receiver, handle arg0) returns handle = @java:Method {
    name: "range",
    'class: "java.time.Month",
    paramTypes: ["java.time.temporal.TemporalField"]
} external;

function java_time_Month_valueOf(handle arg0, handle arg1) returns handle|error = @java:Method {
    name: "valueOf",
    'class: "java.time.Month",
    paramTypes: ["java.lang.Class", "java.lang.String"]
} external;

function java_time_Month_valueOf2(handle arg0) returns handle|error = @java:Method {
    name: "valueOf",
    'class: "java.time.Month",
    paramTypes: ["java.lang.String"]
} external;

function java_time_Month_values() returns handle = @java:Method {
    name: "values",
    'class: "java.time.Month",
    paramTypes: []
} external;

function java_time_Month_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "java.time.Month",
    paramTypes: []
} external;

function java_time_Month_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "java.time.Month",
    paramTypes: ["long"]
} external;

function java_time_Month_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "java.time.Month",
    paramTypes: ["long", "int"]
} external;

function java_time_Month_getJANUARY() returns handle = @java:FieldGet {
    name: "JANUARY",
    'class: "java.time.Month"
} external;

function java_time_Month_getFEBRUARY() returns handle = @java:FieldGet {
    name: "FEBRUARY",
    'class: "java.time.Month"
} external;

function java_time_Month_getMARCH() returns handle = @java:FieldGet {
    name: "MARCH",
    'class: "java.time.Month"
} external;

function java_time_Month_getAPRIL() returns handle = @java:FieldGet {
    name: "APRIL",
    'class: "java.time.Month"
} external;

function java_time_Month_getMAY() returns handle = @java:FieldGet {
    name: "MAY",
    'class: "java.time.Month"
} external;

function java_time_Month_getJUNE() returns handle = @java:FieldGet {
    name: "JUNE",
    'class: "java.time.Month"
} external;

function java_time_Month_getJULY() returns handle = @java:FieldGet {
    name: "JULY",
    'class: "java.time.Month"
} external;

function java_time_Month_getAUGUST() returns handle = @java:FieldGet {
    name: "AUGUST",
    'class: "java.time.Month"
} external;

function java_time_Month_getSEPTEMBER() returns handle = @java:FieldGet {
    name: "SEPTEMBER",
    'class: "java.time.Month"
} external;

function java_time_Month_getOCTOBER() returns handle = @java:FieldGet {
    name: "OCTOBER",
    'class: "java.time.Month"
} external;

function java_time_Month_getNOVEMBER() returns handle = @java:FieldGet {
    name: "NOVEMBER",
    'class: "java.time.Month"
} external;

function java_time_Month_getDECEMBER() returns handle = @java:FieldGet {
    name: "DECEMBER",
    'class: "java.time.Month"
} external;

