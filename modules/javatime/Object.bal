import ballerina/jballerina.java;

# Ballerina wrapper for the Java `java.lang.Object` class.
#
# `Object` is the root type used across this library so that different
# time-related classes (`LocalDate`, `LocalDateTime`, `LocalTime`) can share
# a common contract for equality, hashing, and low-level Java thread
# synchronization.@java:Binding {'class: "java.lang.Object"}
public distinct class Object {

    *java:JObject;

    # The handle to the underlying Java object.
    public handle jObj;

    # Initializes the Object wrapper.
    #
    # + obj - The handle value containing the Java reference.
    public function init(handle obj) {
        self.jObj = obj;
    }

    # Returns the string representation of this object.
    #
    # + return - The string form of the Java object instance.
    public function toString() returns string {
        return java:toString(self.jObj) ?: "";
    }

    # Checks if this object is equal to another object.
    #
    # Note: this delegates directly to Java's `equals` method on `Object`, which
    # compares by reference identity unless the underlying Java class
    # overrides it. Subclasses in this library (e.g. `LocalDate`,
    # `LocalDateTime`, `LocalTime`) provide their own value-based equality
    # instead of relying on this default behavior.
    #
    # + other - The object to compare against.
    # + return - True if the two objects are equal, false otherwise.
    public function isEquals(Object other) returns boolean {
        return java_lang_Object_equals(self.jObj, other.jObj);
    }

    # Returns the runtime class of this object.
    #
    # + return - The Class instance representing this object's runtime type.
    public function getClass() returns Class {
        handle externalObj = java_lang_Object_getClass(self.jObj);
        Class newObj = new (externalObj);
        return newObj;
    }

    # Returns the hash code value for this object.
    #
    # + return - The hash code.
    public function hashCode() returns int {
        return java_lang_Object_hashCode(self.jObj);
    }

    # Wakes up a single thread that is waiting on this object's monitor.
    #
    # WARNING: This is a low-level Java synchronization method. Avoid using
    # it in business logic.
    public function notify() {
        java_lang_Object_notify(self.jObj);
    }

    # Wakes up all threads that are waiting on this object's monitor.
    #
    # WARNING: This is a low-level Java synchronization method. Avoid using
    # it in business logic.
    public function notifyAll() {
        java_lang_Object_notifyAll(self.jObj);
    }

    # Causes the current thread to wait until notified.
    #
    # WARNING: Low-level Java synchronization method. Use with caution.
    #
    # + return - An InterruptedException if the thread is interrupted while waiting.
    public function doWait() returns InterruptedException? {
        error|() externalObj = java_lang_Object_wait(self.jObj);
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
        error|() externalObj = java_lang_Object_wait2(self.jObj, timeoutMillis);
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
    # + nanos - Additional nanoseconds to wait (0–999,999).
    # + return - An InterruptedException if the thread is interrupted while waiting.
    public function waitWithTimeoutAndNanos(int timeoutMillis, int nanos) returns InterruptedException? {
        error|() externalObj = java_lang_Object_wait3(self.jObj, timeoutMillis, nanos);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

}

# Creates a new instance of `java.lang.Object`.
#
# + return - A new Object instance.
public function createObject() returns Object {
    handle externalObj = java_lang_Object_newObject1();
    Object newObj = new (externalObj);
    return newObj;
}

function java_lang_Object_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "java.lang.Object",
    paramTypes: ["java.lang.Object"]
} external;

function java_lang_Object_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "java.lang.Object",
    paramTypes: []
} external;

function java_lang_Object_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "java.lang.Object",
    paramTypes: []
} external;

function java_lang_Object_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "java.lang.Object",
    paramTypes: []
} external;

function java_lang_Object_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "java.lang.Object",
    paramTypes: []
} external;

function java_lang_Object_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "java.lang.Object",
    paramTypes: []
} external;

function java_lang_Object_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "java.lang.Object",
    paramTypes: ["long"]
} external;

function java_lang_Object_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "java.lang.Object",
    paramTypes: ["long", "int"]
} external;

function java_lang_Object_newObject1() returns handle = @java:Constructor {
    'class: "java.lang.Object",
    paramTypes: []
} external;

