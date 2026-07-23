import ballerina/jballerina.java;

# Ballerina class mapping for the Java `java.lang.CharSequence` interface.
@java:Binding {'class: "java.lang.CharSequence"}
public distinct class CharSequence {

    *java:JObject;

    # The `handle` field that stores the reference to the `java.lang.CharSequence` object.
    public handle jObj;

    # The init function of the Ballerina class mapping the `java.lang.CharSequence` Java interface.
    #
    # + obj - The `handle` value containing the Java reference of the object.
    function init(handle obj) {
        self.jObj = obj;
    }

    # The function to retrieve the string representation of the Ballerina class mapping the `java.lang.CharSequence` Java interface.
    #
    # + return - The `string` form of the Java object instance.
    function toString() returns string {
        return java:toString(self.jObj) ?: "";
    }

    # The function that maps to the `charAt` method of `java.lang.CharSequence`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `int` value returning from the Java mapping.
    function charAt(int arg0) returns int {
        return java_lang_CharSequence_charAt(self.jObj, arg0);
    }

    # The function that maps to the `chars` method of `java.lang.CharSequence`.
    #
    # + return - The `IntStream` value returning from the Java mapping.
    function chars() returns IntStream {
        handle externalObj = java_lang_CharSequence_chars(self.jObj);
        IntStream newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `codePoints` method of `java.lang.CharSequence`.
    #
    # + return - The `IntStream` value returning from the Java mapping.
    function codePoints() returns IntStream {
        handle externalObj = java_lang_CharSequence_codePoints(self.jObj);
        IntStream newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `isEmpty` method of `java.lang.CharSequence`.
    #
    # + return - The `boolean` value returning from the Java mapping.
    function isEmpty() returns boolean {
        return java_lang_CharSequence_isEmpty(self.jObj);
    }

    # The function that maps to the `length` method of `java.lang.CharSequence`.
    #
    # + return - The `int` value returning from the Java mapping.
    function length() returns int {
        return java_lang_CharSequence_length(self.jObj);
    }

    # The function that maps to the `subSequence` method of `java.lang.CharSequence`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + return - The `CharSequence` value returning from the Java mapping.
    function subSequence(int arg0, int arg1) returns CharSequence {
        handle externalObj = java_lang_CharSequence_subSequence(self.jObj, arg0, arg1);
        CharSequence newObj = new (externalObj);
        return newObj;
    }

}

# The function that maps to the `compare` method of `java.lang.CharSequence`.
#
# + arg0 - The `CharSequence` value required to map with the Java method parameter.
# + arg1 - The `CharSequence` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
function CharSequence_compare(CharSequence arg0, CharSequence arg1) returns int {
    return java_lang_CharSequence_compare(arg0.jObj, arg1.jObj);
}

function java_lang_CharSequence_charAt(handle receiver, int arg0) returns int = @java:Method {
    name: "charAt",
    'class: "java.lang.CharSequence",
    paramTypes: ["int"]
} external;

function java_lang_CharSequence_chars(handle receiver) returns handle = @java:Method {
    name: "chars",
    'class: "java.lang.CharSequence",
    paramTypes: []
} external;

function java_lang_CharSequence_codePoints(handle receiver) returns handle = @java:Method {
    name: "codePoints",
    'class: "java.lang.CharSequence",
    paramTypes: []
} external;

function java_lang_CharSequence_compare(handle arg0, handle arg1) returns int = @java:Method {
    name: "compare",
    'class: "java.lang.CharSequence",
    paramTypes: ["java.lang.CharSequence", "java.lang.CharSequence"]
} external;

function java_lang_CharSequence_isEmpty(handle receiver) returns boolean = @java:Method {
    name: "isEmpty",
    'class: "java.lang.CharSequence",
    paramTypes: []
} external;

function java_lang_CharSequence_length(handle receiver) returns int = @java:Method {
    name: "length",
    'class: "java.lang.CharSequence",
    paramTypes: []
} external;

function java_lang_CharSequence_subSequence(handle receiver, int arg0, int arg1) returns handle = @java:Method {
    name: "subSequence",
    'class: "java.lang.CharSequence",
    paramTypes: ["int", "int"]
} external;

