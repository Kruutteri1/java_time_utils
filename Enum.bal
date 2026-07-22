import ballerina/jballerina.java;

# Ballerina class mapping for the Java `java.lang.Enum` class.
#
# `Enum` is the common base type for all Java enum classes. In this
# library, `DayOfWeek` and `Month` both extend it, giving access to
# shared enum behavior (`ordinal`, `name`, `compareTo`, etc.)
# without duplicating it in each concrete enum wrapper.
@java:Binding {'class: "java.lang.Enum"}
public distinct class Enum {

    *java:JObject;
    *Object;

    # The handle to the underlying Java object.
    public handle jObj;

    # Initializes the Enum wrapper.
    #
    # + obj - The handle value containing the Java reference.
    public function init(handle obj) {
        self.jObj = obj;
    }

    # Returns the string representation of this enum constant (its declared name).
    #
    # + return - The string form of the constant.
    public function toString() returns string {
        return java:toString(self.jObj) ?: "";
    }

    # Compares this enum constant to another by declaration (ordinal) order.
    # Only meaningful when both constants belong to the same enum type.
    #
    # + other - The enum constant to compare against.
    # + return - Negative, zero, or positive if this constant is declared before, at the same position as, or after other.
    public function compareTo(Enum other) returns int {
        return java_lang_Enum_compareTo(self.jObj, other.jObj);
    }

    # Returns an optional descriptor of this enum constant for use with
    # nominal descriptors (Java's `Constable` mechanism).
    #
    # + return - The optional descriptor.
    function describeConstable() returns Optional {
        handle externalObj = java_lang_Enum_describeConstable(self.jObj);
        Optional newObj = new (externalObj);
        return newObj;
    }

    # Checks whether this enum constant is equal to another object. Enum
    # constants are only ever equal to themselves (reference equality), so
    # this returns false for any object that isn't this exact constant.
    #
    # + other - The object to compare against.
    # + return - True if equal, false otherwise.
    public function isEquals(Object other) returns boolean {
        return java_lang_Enum_equals(self.jObj, other.jObj);
    }

    # Returns the runtime class of this object.
    #
    # + return - The Class object representing the runtime class.
    public function getClass() returns Class {
        handle externalObj = java_lang_Enum_getClass(self.jObj);
        Class newObj = new (externalObj);
        return newObj;
    }

    # Returns the Class object corresponding to this enum constant's
    # actual enum type (useful when the constant belongs to an enum with
    # constant-specific method bodies).
    #
    # + return - The Class of the enum type.
    public function getDeclaringClass() returns Class {
        handle externalObj = java_lang_Enum_getDeclaringClass(self.jObj);
        Class newObj = new (externalObj);
        return newObj;
    }

    # Returns the hash code for this enum constant.
    #
    # + return - The hash code.
    public function hashCode() returns int {
        return java_lang_Enum_hashCode(self.jObj);
    }

    # Returns the name of this enum constant exactly as declared in its
    # enum type (e.g. "MONDAY", "JANUARY").
    #
    # + return - The declared name of this constant.
    public function name() returns string {
        return java:toString(java_lang_Enum_name(self.jObj)) ?: "";
    }

    # Wakes up a single thread that is waiting on this object's monitor.
    #
    # WARNING: This is a low-level Java synchronization method. Avoid using
    # it in business logic.
    public function notify() {
        java_lang_Enum_notify(self.jObj);
    }

     # Wakes up all threads that are waiting on this object's monitor.
    #
    # WARNING: This is a low-level Java synchronization method. Avoid using
    # it in business logic.
    public function notifyAll() {
        java_lang_Enum_notifyAll(self.jObj);
    }

    # Returns the position of this constant in its enum declaration, where
    # the first constant has an ordinal of zero.
    #
    # + return - The ordinal of this constant.
    public function ordinal() returns int {
        return java_lang_Enum_ordinal(self.jObj);
    }

    # Causes the current thread to wait until notified.
    #
    # WARNING: Low-level Java synchronization method. Use with caution.
    #
    # + return - An InterruptedException if the thread is interrupted while waiting.
    public function doWait() returns InterruptedException? {
        error|() externalObj = java_lang_Enum_wait(self.jObj);
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
        error|() externalObj = java_lang_Enum_wait2(self.jObj, timeoutMillis);
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
        error|() externalObj = java_lang_Enum_wait3(self.jObj, timeoutMillis, nanos);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

}

# Returns the enum constant of the specified enum type with the specified name.
#
# + enumClass - The Class object of the enum type.
# + name - The name of the constant to return.
# + return - The enum constant with the specified name.
public function ofEnumValue(Class enumClass, string name) returns Enum {
    handle externalObj = java_lang_Enum_valueOf(enumClass.jObj, java:fromString(name));
    Enum newObj = new (externalObj);
    return newObj;
}

function java_lang_Enum_compareTo(handle receiver, handle arg0) returns int = @java:Method {
    name: "compareTo",
    'class: "java.lang.Enum",
    paramTypes: ["java.lang.Enum"]
} external;

function java_lang_Enum_describeConstable(handle receiver) returns handle = @java:Method {
    name: "describeConstable",
    'class: "java.lang.Enum",
    paramTypes: []
} external;

function java_lang_Enum_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "java.lang.Enum",
    paramTypes: ["java.lang.Object"]
} external;

function java_lang_Enum_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "java.lang.Enum",
    paramTypes: []
} external;

function java_lang_Enum_getDeclaringClass(handle receiver) returns handle = @java:Method {
    name: "getDeclaringClass",
    'class: "java.lang.Enum",
    paramTypes: []
} external;

function java_lang_Enum_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "java.lang.Enum",
    paramTypes: []
} external;

function java_lang_Enum_name(handle receiver) returns handle = @java:Method {
    name: "name",
    'class: "java.lang.Enum",
    paramTypes: []
} external;

function java_lang_Enum_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "java.lang.Enum",
    paramTypes: []
} external;

function java_lang_Enum_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "java.lang.Enum",
    paramTypes: []
} external;

function java_lang_Enum_ordinal(handle receiver) returns int = @java:Method {
    name: "ordinal",
    'class: "java.lang.Enum",
    paramTypes: []
} external;

function java_lang_Enum_valueOf(handle arg0, handle arg1) returns handle = @java:Method {
    name: "valueOf",
    'class: "java.lang.Enum",
    paramTypes: ["java.lang.Class", "java.lang.String"]
} external;

function java_lang_Enum_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "java.lang.Enum",
    paramTypes: []
} external;

function java_lang_Enum_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "java.lang.Enum",
    paramTypes: ["long"]
} external;

function java_lang_Enum_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "java.lang.Enum",
    paramTypes: ["long", "int"]
} external;

