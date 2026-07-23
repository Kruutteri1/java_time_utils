import ballerina/jballerina.java;

# Ballerina class mapping for the Java `java.time.Period` class, representing a date-based amount of time.
@java:Binding {'class: "java.time.Period"}
public distinct class Period {

    *java:JObject;
    *Object;

    # The underlying Java reference for the `java.time.Period` instance.
    public handle jObj;

    # Initializes a Ballerina `Period` wrapper around an existing Java `Period` handle.
    #
    # + obj - The `handle` value containing the Java reference of the object.
    public function init(handle obj) {
        self.jObj = obj;
    }

    # Returns the string representation of the Java `Period` instance.
    #
    # + return - The string form of the period (e.g., "P1Y2M3D").
    public function toString() returns string {
        return java:toString(self.jObj) ?: "";
    }

    # Adds this period to the specified temporal object.
    #
    # + temporal - The target temporal object to add the period to.
    # + return - The resulting temporal object with the period added.
    function addTo(Temporal temporal) returns Temporal {
        handle externalObj = java_time_Period_addTo(self.jObj, temporal.jObj);
        Temporal newObj = new (externalObj);
        return newObj;
    }

    # Checks whether this period is equal to another object.
    #
    # + other - The object to compare with this period.
    # + return - True if the objects are equal, false otherwise.
    public function isEquals(Object other) returns boolean {
        return java_time_Period_equals(self.jObj, other.jObj);
    }

    # Gets the value of the specified unit from this period.
    #
    # + unit - The `TemporalUnit` for which to return the value.
    # + return - The value of the unit.
    function get(TemporalUnit unit) returns int {
        return java_time_Period_get(self.jObj, unit.jObj);
    }

    # Gets the chronology of this period, which is the ISO calendar system.
    #
    # + return - The `IsoChronology` instance associated with this period.
    function getChronology() returns IsoChronology {
        handle externalObj = java_time_Period_getChronology(self.jObj);
        IsoChronology newObj = new (externalObj);
        return newObj;
    }

    # Returns the runtime class of this object.
    #
    # + return - The `Class` object representing the runtime class.
    public function getClass() returns Class {
        handle externalObj = java_time_Period_getClass(self.jObj);
        Class newObj = new (externalObj);
        return newObj;
    }

    # Gets the amount of days in this period.
    #
    # + return - The amount of days component.
    public function getDays() returns int {
        return java_time_Period_getDays(self.jObj);
    }

    # Gets the amount of months in this period.
    #
    # + return - The amount of months component.
    public function getMonths() returns int {
        return java_time_Period_getMonths(self.jObj);
    }

    # Gets the list of units supported by this period.
    #
    # + return - A `List` containing the supported temporal units.
    function getUnits() returns List {
        handle externalObj = java_time_Period_getUnits(self.jObj);
        List newObj = new (externalObj);
        return newObj;
    }

    # Gets the amount of years in this period.
    #
    # + return - The amount of years component.
    public function getYears() returns int {
        return java_time_Period_getYears(self.jObj);
    }

    # Returns a hash code for this period.
    #
    # + return - The hash code value.
    public function hashCode() returns int {
        return java_time_Period_hashCode(self.jObj);
    }

    # Checks if this period is negative.
    #
    # + return - True if any of the three amounts are less than zero.
    public function isNegative() returns boolean {
        return java_time_Period_isNegative(self.jObj);
    }

    # Checks if this period is zero-length.
    #
    # + return - True if all three amounts are zero.
    public function isZero() returns boolean {
        return java_time_Period_isZero(self.jObj);
    }

    # Returns a copy of this period with the specified amount subtracted.
    #
    # + amount - The temporal amount to subtract.
    # + return - A `Period` based on this period with the specified amount subtracted.
    function minus(TemporalAmount amount) returns Period {
        handle externalObj = java_time_Period_minus(self.jObj, amount.jObj);
        Period newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this period with the specified number of days subtracted.
    #
    # + days - The amount of days to subtract, may be negative.
    # + return - A `Period` based on this period with the specified days subtracted.
    public function minusDays(int days) returns Period {
        handle externalObj = java_time_Period_minusDays(self.jObj, days);
        Period newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this period with the specified number of months subtracted.
    #
    # + months - The amount of months to subtract, may be negative.
    # + return - A `Period` based on this period with the specified months subtracted.
    public function minusMonths(int months) returns Period {
        handle externalObj = java_time_Period_minusMonths(self.jObj, months);
        Period newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this period with the specified number of years subtracted.
    #
    # + years - The amount of years to subtract, may be negative.
    # + return - A `Period` based on this period with the specified years subtracted.
    public function minusYears(int years) returns Period {
        handle externalObj = java_time_Period_minusYears(self.jObj, years);
        Period newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this period multiplied by the specified scalar value.
    #
    # + scalar - The value to multiply by, may be negative.
    # + return - A `Period` based on this period multiplied by the scalar.
    public function multipliedBy(int scalar) returns Period {
        handle externalObj = java_time_Period_multipliedBy(self.jObj, scalar);
        Period newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this period with the length negated.
    #
    # + return - A `Period` based on this period with the amounts negated.
    public function negated() returns Period {
        handle externalObj = java_time_Period_negated(self.jObj);
        Period newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this period with the years and months normalized.
    #
    # + return - A `Period` based on this period with the amounts normalized.
    public function normalized() returns Period {
        handle externalObj = java_time_Period_normalized(self.jObj);
        Period newObj = new (externalObj);
        return newObj;
    }

    # Wakes up a single thread that is waiting on this object's monitor.
    public function notify() {
        java_time_Period_notify(self.jObj);
    }

    # Wakes up all threads that are waiting on this object's monitor.
    public function notifyAll() {
        java_time_Period_notifyAll(self.jObj);
    }

    # Returns a copy of this period with the specified amount added.
    #
    # + amount - The temporal amount to add.
    # + return - A `Period` based on this period with the specified amount added.
    function plus(TemporalAmount amount) returns Period {
        handle externalObj = java_time_Period_plus(self.jObj, amount.jObj);
        Period newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this period with the specified number of days added.
    #
    # + days - The amount of days to add, may be negative.
    # + return - A `Period` based on this period with the specified days added.
    public function plusDays(int days) returns Period {
        handle externalObj = java_time_Period_plusDays(self.jObj, days);
        Period newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this period with the specified number of months added.
    #
    # + months - The amount of months to add, may be negative.
    # + return - A `Period` based on this period with the specified months added.
    public function plusMonths(int months) returns Period {
        handle externalObj = java_time_Period_plusMonths(self.jObj, months);
        Period newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this period with the specified number of years added.
    #
    # + years - The amount of years to add, may be negative.
    # + return - A `Period` based on this period with the specified years added.
    public function plusYears(int years) returns Period {
        handle externalObj = java_time_Period_plusYears(self.jObj, years);
        Period newObj = new (externalObj);
        return newObj;
    }

    # Subtracts this period from the specified temporal object.
    #
    # + temporal - The target temporal object to subtract the period from.
    # + return - The resulting temporal object with the period subtracted.
    function subtractFrom(Temporal temporal) returns Temporal {
        handle externalObj = java_time_Period_subtractFrom(self.jObj, temporal.jObj);
        Temporal newObj = new (externalObj);
        return newObj;
    }

    # Gets the total number of months in this period.
    #
    # + return - The total number of months, calculated as years times 12 plus months.
    public function toTotalMonths() returns int {
        return java_time_Period_toTotalMonths(self.jObj);
    }

    # Causes the current thread to wait until another thread invokes the notify or notifyAll method.
    #
    # + return - An `InterruptedException` if the thread was interrupted while waiting, or nil otherwise.
    public function doWait() returns InterruptedException? {
        error|() externalObj = java_time_Period_wait(self.jObj);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # Causes the current thread to wait until another thread invokes notify or notifyAll, or a specified timeout expires.
    #
    # + timeoutMillis - The maximum time to wait in milliseconds.
    # + return - An `InterruptedException` if the thread was interrupted while waiting, or nil otherwise.
    public function waitWithTimeout(int timeoutMillis) returns InterruptedException? {
        error|() externalObj = java_time_Period_wait2(self.jObj, timeoutMillis);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # Causes the current thread to wait until another thread invokes notify or notifyAll, or a specified timeout expires with nanosecond precision.
    #
    # + timeoutMillis - The maximum time to wait in milliseconds.
    # + nanos - Additional nanoseconds to wait.
    # + return - An `InterruptedException` if the thread was interrupted while waiting, or nil otherwise.
    public function waitWithTimeoutAndNanos(int timeoutMillis, int nanos) returns InterruptedException? {
        error|() externalObj = java_time_Period_wait3(self.jObj, timeoutMillis, nanos);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # Returns a copy of this period with the specified amount of days.
    #
    # + days - The days to represent in the new period.
    # + return - A `Period` based on this period with the requested days.
    public function withDays(int days) returns Period {
        handle externalObj = java_time_Period_withDays(self.jObj, days);
        Period newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this period with the specified amount of months.
    #
    # + months - The months to represent in the new period.
    # + return - A `Period` based on this period with the requested months.
    public function withMonths(int months) returns Period {
        handle externalObj = java_time_Period_withMonths(self.jObj, months);
        Period newObj = new (externalObj);
        return newObj;
    }

    # Returns a copy of this period with the specified amount of years.
    #
    # + years - The years to represent in the new period.
    # + return - A `Period` based on this period with the requested years.
    public function withYears(int years) returns Period {
        handle externalObj = java_time_Period_withYears(self.jObj, years);
        Period newObj = new (externalObj);
        return newObj;
    }

}

# Obtains a `Period` consisting of the number of years, months, and days between two dates.
#
# + startDateInclusive - The start date, inclusive.
# + endDateExclusive - The end date, exclusive.
# + return - The period between the start and end dates.
public function between(LocalDate startDateInclusive, LocalDate endDateExclusive) returns Period {
    handle externalObj = java_time_Period_between(startDateInclusive.jObj, endDateExclusive.jObj);
    Period newObj = new (externalObj);
    return newObj;
}

# Obtains a `Period` from another temporal amount.
#
# + amount - The temporal amount to convert.
# + return - The equivalent period.
function Period_from(TemporalAmount amount) returns Period {
    handle externalObj = java_time_Period_from(amount.jObj);
    Period newObj = new (externalObj);
    return newObj;
}

# Obtains a `Period` representing a number of years, months, and days.
#
# + years - The amount of years, may be negative.
# + months - The amount of months, may be negative.
# + days - The amount of days, may be negative.
# + return - The period of years, months and days.
public function ofPeriod(int years, int months, int days) returns Period {
    handle externalObj = java_time_Period_of(years, months, days);
    Period newObj = new (externalObj);
    return newObj;
}

# Obtains a `Period` representing a number of days.
#
# + days - The number of days, may be negative.
# + return - A period with the specified number of days.
public function ofPeriodDays(int days) returns Period {
    handle externalObj = java_time_Period_ofDays(days);
    Period newObj = new (externalObj);
    return newObj;
}

# Obtains a `Period` representing a number of months.
#
# + months - The number of months, may be negative.
# + return - A period with the specified number of months.
public function ofPeriodMonths(int months) returns Period {
    handle externalObj = java_time_Period_ofMonths(months);
    Period newObj = new (externalObj);
    return newObj;
}

# Obtains a `Period` representing a number of weeks.
#
# + weeks - The number of weeks, may be negative.
# + return - A period with the specified number of weeks.
public function ofPeriodWeeks(int weeks) returns Period {
    handle externalObj = java_time_Period_ofWeeks(weeks);
    Period newObj = new (externalObj);
    return newObj;
}

# Obtains a `Period` representing a number of years.
#
# + years - The number of years, may be negative.
# + return - A period with the specified number of years.
public function ofPeriodYears(int years) returns Period {
    handle externalObj = java_time_Period_ofYears(years);
    Period newObj = new (externalObj);
    return newObj;
}

# Obtains a `Period` from a text string such as `PnYnMnD`.
#
# + text - The text to parse, not null.
# + return - Period|error — the parsed period, or an error if the text is invalid.
public function parsePeriod(string text) returns Period|error {
    handle externalObj = check trap java_time_Period_parse(java:fromString(text));
    Period newObj = new (externalObj);
    return newObj;
}

# Retrieves the constant for a period of zero.
#
# + return - A period of zero.
public function getZero() returns Period {
    handle externalObj = java_time_Period_getZERO();
    Period newObj = new (externalObj);
    return newObj;
}

function java_time_Period_addTo(handle receiver, handle arg0) returns handle = @java:Method {
    name: "addTo",
    'class: "java.time.Period",
    paramTypes: ["java.time.temporal.Temporal"]
} external;

function java_time_Period_between(handle arg0, handle arg1) returns handle = @java:Method {
    name: "between",
    'class: "java.time.Period",
    paramTypes: ["java.time.LocalDate", "java.time.LocalDate"]
} external;

function java_time_Period_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "java.time.Period",
    paramTypes: ["java.lang.Object"]
} external;

function java_time_Period_from(handle arg0) returns handle = @java:Method {
    name: "from",
    'class: "java.time.Period",
    paramTypes: ["java.time.temporal.TemporalAmount"]
} external;

function java_time_Period_get(handle receiver, handle arg0) returns int = @java:Method {
    name: "get",
    'class: "java.time.Period",
    paramTypes: ["java.time.temporal.TemporalUnit"]
} external;

function java_time_Period_getChronology(handle receiver) returns handle = @java:Method {
    name: "getChronology",
    'class: "java.time.Period",
    paramTypes: []
} external;

function java_time_Period_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "java.time.Period",
    paramTypes: []
} external;

function java_time_Period_getDays(handle receiver) returns int = @java:Method {
    name: "getDays",
    'class: "java.time.Period",
    paramTypes: []
} external;

function java_time_Period_getMonths(handle receiver) returns int = @java:Method {
    name: "getMonths",
    'class: "java.time.Period",
    paramTypes: []
} external;

function java_time_Period_getUnits(handle receiver) returns handle = @java:Method {
    name: "getUnits",
    'class: "java.time.Period",
    paramTypes: []
} external;

function java_time_Period_getYears(handle receiver) returns int = @java:Method {
    name: "getYears",
    'class: "java.time.Period",
    paramTypes: []
} external;

function java_time_Period_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "java.time.Period",
    paramTypes: []
} external;

function java_time_Period_isNegative(handle receiver) returns boolean = @java:Method {
    name: "isNegative",
    'class: "java.time.Period",
    paramTypes: []
} external;

function java_time_Period_isZero(handle receiver) returns boolean = @java:Method {
    name: "isZero",
    'class: "java.time.Period",
    paramTypes: []
} external;

function java_time_Period_minus(handle receiver, handle arg0) returns handle = @java:Method {
    name: "minus",
    'class: "java.time.Period",
    paramTypes: ["java.time.temporal.TemporalAmount"]
} external;

function java_time_Period_minusDays(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusDays",
    'class: "java.time.Period",
    paramTypes: ["long"]
} external;

function java_time_Period_minusMonths(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusMonths",
    'class: "java.time.Period",
    paramTypes: ["long"]
} external;

function java_time_Period_minusYears(handle receiver, int arg0) returns handle = @java:Method {
    name: "minusYears",
    'class: "java.time.Period",
    paramTypes: ["long"]
} external;

function java_time_Period_multipliedBy(handle receiver, int arg0) returns handle = @java:Method {
    name: "multipliedBy",
    'class: "java.time.Period",
    paramTypes: ["int"]
} external;

function java_time_Period_negated(handle receiver) returns handle = @java:Method {
    name: "negated",
    'class: "java.time.Period",
    paramTypes: []
} external;

function java_time_Period_normalized(handle receiver) returns handle = @java:Method {
    name: "normalized",
    'class: "java.time.Period",
    paramTypes: []
} external;

function java_time_Period_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "java.time.Period",
    paramTypes: []
} external;

function java_time_Period_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "java.time.Period",
    paramTypes: []
} external;

function java_time_Period_of(int arg0, int arg1, int arg2) returns handle = @java:Method {
    name: "of",
    'class: "java.time.Period",
    paramTypes: ["int", "int", "int"]
} external;

function java_time_Period_ofDays(int arg0) returns handle = @java:Method {
    name: "ofDays",
    'class: "java.time.Period",
    paramTypes: ["int"]
} external;

function java_time_Period_ofMonths(int arg0) returns handle = @java:Method {
    name: "ofMonths",
    'class: "java.time.Period",
    paramTypes: ["int"]
} external;

function java_time_Period_ofWeeks(int arg0) returns handle = @java:Method {
    name: "ofWeeks",
    'class: "java.time.Period",
    paramTypes: ["int"]
} external;

function java_time_Period_ofYears(int arg0) returns handle = @java:Method {
    name: "ofYears",
    'class: "java.time.Period",
    paramTypes: ["int"]
} external;

function java_time_Period_parse(handle arg0) returns handle|error = @java:Method {
    name: "parse",
    'class: "java.time.Period",
    paramTypes: ["java.lang.CharSequence"]
} external;

function java_time_Period_plus(handle receiver, handle arg0) returns handle = @java:Method {
    name: "plus",
    'class: "java.time.Period",
    paramTypes: ["java.time.temporal.TemporalAmount"]
} external;

function java_time_Period_plusDays(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusDays",
    'class: "java.time.Period",
    paramTypes: ["long"]
} external;

function java_time_Period_plusMonths(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusMonths",
    'class: "java.time.Period",
    paramTypes: ["long"]
} external;

function java_time_Period_plusYears(handle receiver, int arg0) returns handle = @java:Method {
    name: "plusYears",
    'class: "java.time.Period",
    paramTypes: ["long"]
} external;

function java_time_Period_subtractFrom(handle receiver, handle arg0) returns handle = @java:Method {
    name: "subtractFrom",
    'class: "java.time.Period",
    paramTypes: ["java.time.temporal.Temporal"]
} external;

function java_time_Period_toTotalMonths(handle receiver) returns int = @java:Method {
    name: "toTotalMonths",
    'class: "java.time.Period",
    paramTypes: []
} external;

function java_time_Period_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "java.time.Period",
    paramTypes: []
} external;

function java_time_Period_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "java.time.Period",
    paramTypes: ["long"]
} external;

function java_time_Period_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "java.time.Period",
    paramTypes: ["long", "int"]
} external;

function java_time_Period_withDays(handle receiver, int arg0) returns handle = @java:Method {
    name: "withDays",
    'class: "java.time.Period",
    paramTypes: ["int"]
} external;

function java_time_Period_withMonths(handle receiver, int arg0) returns handle = @java:Method {
    name: "withMonths",
    'class: "java.time.Period",
    paramTypes: ["int"]
} external;

function java_time_Period_withYears(handle receiver, int arg0) returns handle = @java:Method {
    name: "withYears",
    'class: "java.time.Period",
    paramTypes: ["int"]
} external;

function java_time_Period_getZERO() returns handle = @java:FieldGet {
    name: "ZERO",
    'class: "java.time.Period"
} external;

