import ballerina/jballerina.java;
import ballerina/jballerina.java.arrays as jarrays;

# Ballerina class mapping for the Java `java.time.format.DateTimeFormatter` class.
@java:Binding {'class: "java.time.format.DateTimeFormatter"}
public distinct class DateTimeFormatter {

    *java:JObject;
    *Object;

    # The `handle` field that stores the reference to the `java.time.format.DateTimeFormatter` object.
    public handle jObj;

    # The init function of the Ballerina class mapping the `java.time.format.DateTimeFormatter` Java class.
    #
    # + obj - The `handle` value containing the Java reference of the object.
    public function init(handle obj) {
        self.jObj = obj;
    }

    # The function to retrieve the string representation of the Ballerina class mapping the `java.time.format.DateTimeFormatter` Java class.
    #
    # + return - The `string` form of the Java object instance.
    public function toString() returns string {
        return java:toString(self.jObj) ?: "";
    }

    # The function that maps to the `equals` method of `java.time.format.DateTimeFormatter`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function isEquals(Object arg0) returns boolean {
        return java_time_format_DateTimeFormatter_equals(self.jObj, arg0.jObj);
    }

    # The function that maps to the `format` method of `java.time.format.DateTimeFormatter`.
    #
    # + arg0 - The `TemporalAccessor` value required to map with the Java method parameter.
    # + return - The `string` value returning from the Java mapping.
    function format(TemporalAccessor arg0) returns string {
        return java:toString(java_time_format_DateTimeFormatter_format(self.jObj, arg0.jObj)) ?: "";
    }

    # The function that maps to the `formatTo` method of `java.time.format.DateTimeFormatter`.
    #
    # + arg0 - The `TemporalAccessor` value required to map with the Java method parameter.
    # + arg1 - The `Appendable` value required to map with the Java method parameter.
    function formatTo(TemporalAccessor arg0, Appendable arg1) {
        java_time_format_DateTimeFormatter_formatTo(self.jObj, arg0.jObj, arg1.jObj);
    }

    # The function that maps to the `getChronology` method of `java.time.format.DateTimeFormatter`.
    #
    # + return - The `Chronology` value returning from the Java mapping.
    function getChronology() returns Chronology {
        handle externalObj = java_time_format_DateTimeFormatter_getChronology(self.jObj);
        Chronology newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getClass` method of `java.time.format.DateTimeFormatter`.
    #
    # + return - The `Class` value returning from the Java mapping.
    public function getClass() returns Class {
        handle externalObj = java_time_format_DateTimeFormatter_getClass(self.jObj);
        Class newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getDecimalStyle` method of `java.time.format.DateTimeFormatter`.
    #
    # + return - The `DecimalStyle` value returning from the Java mapping.
    function getDecimalStyle() returns DecimalStyle {
        handle externalObj = java_time_format_DateTimeFormatter_getDecimalStyle(self.jObj);
        DecimalStyle newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getLocale` method of `java.time.format.DateTimeFormatter`.
    #
    # + return - The `Locale` value returning from the Java mapping.
    function getLocale() returns Locale {
        handle externalObj = java_time_format_DateTimeFormatter_getLocale(self.jObj);
        Locale newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getResolverFields` method of `java.time.format.DateTimeFormatter`.
    #
    # + return - The `Set` value returning from the Java mapping.
    function getResolverFields() returns Set {
        handle externalObj = java_time_format_DateTimeFormatter_getResolverFields(self.jObj);
        Set newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getResolverStyle` method of `java.time.format.DateTimeFormatter`.
    #
    # + return - The `ResolverStyle` value returning from the Java mapping.
    function getResolverStyle() returns ResolverStyle {
        handle externalObj = java_time_format_DateTimeFormatter_getResolverStyle(self.jObj);
        ResolverStyle newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getZone` method of `java.time.format.DateTimeFormatter`.
    #
    # + return - The `ZoneId` value returning from the Java mapping.
    function getZone() returns ZoneId {
        handle externalObj = java_time_format_DateTimeFormatter_getZone(self.jObj);
        ZoneId newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `hashCode` method of `java.time.format.DateTimeFormatter`.
    #
    # + return - The `int` value returning from the Java mapping.
    public function hashCode() returns int {
        return java_time_format_DateTimeFormatter_hashCode(self.jObj);
    }

    # The function that maps to the `localizedBy` method of `java.time.format.DateTimeFormatter`.
    #
    # + arg0 - The `Locale` value required to map with the Java method parameter.
    # + return - The `DateTimeFormatter` value returning from the Java mapping.
    function localizedBy(Locale arg0) returns DateTimeFormatter {
        handle externalObj = java_time_format_DateTimeFormatter_localizedBy(self.jObj, arg0.jObj);
        DateTimeFormatter newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `notify` method of `java.time.format.DateTimeFormatter`.
    public function notify() {
        java_time_format_DateTimeFormatter_notify(self.jObj);
    }

    # The function that maps to the `notifyAll` method of `java.time.format.DateTimeFormatter`.
    public function notifyAll() {
        java_time_format_DateTimeFormatter_notifyAll(self.jObj);
    }

    # The function that maps to the `parse` method of `java.time.format.DateTimeFormatter`.
    #
    # + arg0 - The `CharSequence` value required to map with the Java method parameter.
    # + return - The `TemporalAccessor` value returning from the Java mapping.
    function parse(CharSequence arg0) returns TemporalAccessor {
        handle externalObj = java_time_format_DateTimeFormatter_parse(self.jObj, arg0.jObj);
        TemporalAccessor newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `parse` method of `java.time.format.DateTimeFormatter`.
    #
    # + arg0 - The `CharSequence` value required to map with the Java method parameter.
    # + arg1 - The `ParsePosition` value required to map with the Java method parameter.
    # + return - The `TemporalAccessor` value returning from the Java mapping.
    function parse2(CharSequence arg0, ParsePosition arg1) returns TemporalAccessor {
        handle externalObj = java_time_format_DateTimeFormatter_parse2(self.jObj, arg0.jObj, arg1.jObj);
        TemporalAccessor newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `parse` method of `java.time.format.DateTimeFormatter`.
    #
    # + arg0 - The `CharSequence` value required to map with the Java method parameter.
    # + arg1 - The `TemporalQuery` value required to map with the Java method parameter.
    # + return - The `Object` value returning from the Java mapping.
    function parse3(CharSequence arg0, TemporalQuery arg1) returns Object {
        handle externalObj = java_time_format_DateTimeFormatter_parse3(self.jObj, arg0.jObj, arg1.jObj);
        Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `parseBest` method of `java.time.format.DateTimeFormatter`.
    #
    # + arg0 - The `CharSequence` value required to map with the Java method parameter.
    # + arg1 - The `TemporalQuery[]` value required to map with the Java method parameter.
    # + return - The `TemporalAccessor` value returning from the Java mapping.
    function parseBest(CharSequence arg0, TemporalQuery[] arg1) returns TemporalAccessor|error {
        handle externalObj = java_time_format_DateTimeFormatter_parseBest(self.jObj, arg0.jObj, check jarrays:toHandle(arg1, "java.time.temporal.TemporalQuery"));
        TemporalAccessor newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `parseUnresolved` method of `java.time.format.DateTimeFormatter`.
    #
    # + arg0 - The `CharSequence` value required to map with the Java method parameter.
    # + arg1 - The `ParsePosition` value required to map with the Java method parameter.
    # + return - The `TemporalAccessor` value returning from the Java mapping.
    function parseUnresolved(CharSequence arg0, ParsePosition arg1) returns TemporalAccessor {
        handle externalObj = java_time_format_DateTimeFormatter_parseUnresolved(self.jObj, arg0.jObj, arg1.jObj);
        TemporalAccessor newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `toFormat` method of `java.time.format.DateTimeFormatter`.
    #
    # + return - The `Format` value returning from the Java mapping.
    function toFormat() returns Format {
        handle externalObj = java_time_format_DateTimeFormatter_toFormat(self.jObj);
        Format newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `toFormat` method of `java.time.format.DateTimeFormatter`.
    #
    # + arg0 - The `TemporalQuery` value required to map with the Java method parameter.
    # + return - The `Format` value returning from the Java mapping.
    function toFormat2(TemporalQuery arg0) returns Format {
        handle externalObj = java_time_format_DateTimeFormatter_toFormat2(self.jObj, arg0.jObj);
        Format newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `wait` method of `java.time.format.DateTimeFormatter`.
    #
    # + return - The `InterruptedException` value returning from the Java mapping.
    public function doWait() returns InterruptedException? {
        error|() externalObj = java_time_format_DateTimeFormatter_wait(self.jObj);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # The function that maps to the `wait` method of `java.time.format.DateTimeFormatter`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `InterruptedException` value returning from the Java mapping.
    public function waitWithTimeout(int arg0) returns InterruptedException? {
        error|() externalObj = java_time_format_DateTimeFormatter_wait2(self.jObj, arg0);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # The function that maps to the `wait` method of `java.time.format.DateTimeFormatter`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + return - The `InterruptedException` value returning from the Java mapping.
    public function waitWithTimeoutAndNanos(int arg0, int arg1) returns InterruptedException? {
        error|() externalObj = java_time_format_DateTimeFormatter_wait3(self.jObj, arg0, arg1);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # The function that maps to the `withChronology` method of `java.time.format.DateTimeFormatter`.
    #
    # + arg0 - The `Chronology` value required to map with the Java method parameter.
    # + return - The `DateTimeFormatter` value returning from the Java mapping.
    function withChronology(Chronology arg0) returns DateTimeFormatter {
        handle externalObj = java_time_format_DateTimeFormatter_withChronology(self.jObj, arg0.jObj);
        DateTimeFormatter newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `withDecimalStyle` method of `java.time.format.DateTimeFormatter`.
    #
    # + arg0 - The `DecimalStyle` value required to map with the Java method parameter.
    # + return - The `DateTimeFormatter` value returning from the Java mapping.
    public function withDecimalStyle(DecimalStyle arg0) returns DateTimeFormatter {
        handle externalObj = java_time_format_DateTimeFormatter_withDecimalStyle(self.jObj, arg0.jObj);
        DateTimeFormatter newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `withLocale` method of `java.time.format.DateTimeFormatter`.
    #
    # + arg0 - The `Locale` value required to map with the Java method parameter.
    # + return - The `DateTimeFormatter` value returning from the Java mapping.
    function withLocale(Locale arg0) returns DateTimeFormatter {
        handle externalObj = java_time_format_DateTimeFormatter_withLocale(self.jObj, arg0.jObj);
        DateTimeFormatter newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `withResolverFields` method of `java.time.format.DateTimeFormatter`.
    #
    # + arg0 - The `Set` value required to map with the Java method parameter.
    # + return - The `DateTimeFormatter` value returning from the Java mapping.
    function withResolverFields(Set arg0) returns DateTimeFormatter {
        handle externalObj = java_time_format_DateTimeFormatter_withResolverFields(self.jObj, arg0.jObj);
        DateTimeFormatter newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `withResolverFields` method of `java.time.format.DateTimeFormatter`.
    #
    # + arg0 - The `TemporalField[]` value required to map with the Java method parameter.
    # + return - The `DateTimeFormatter` value returning from the Java mapping.
    function withResolverFields2(TemporalField[] arg0) returns DateTimeFormatter|error {
        handle externalObj = java_time_format_DateTimeFormatter_withResolverFields2(self.jObj, check jarrays:toHandle(arg0, "java.time.temporal.TemporalField"));
        DateTimeFormatter newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `withResolverStyle` method of `java.time.format.DateTimeFormatter`.
    #
    # + arg0 - The `ResolverStyle` value required to map with the Java method parameter.
    # + return - The `DateTimeFormatter` value returning from the Java mapping.
    function withResolverStyle(ResolverStyle arg0) returns DateTimeFormatter {
        handle externalObj = java_time_format_DateTimeFormatter_withResolverStyle(self.jObj, arg0.jObj);
        DateTimeFormatter newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `withZone` method of `java.time.format.DateTimeFormatter`.
    #
    # + arg0 - The `ZoneId` value required to map with the Java method parameter.
    # + return - The `DateTimeFormatter` value returning from the Java mapping.
    function withZone(ZoneId arg0) returns DateTimeFormatter {
        handle externalObj = java_time_format_DateTimeFormatter_withZone(self.jObj, arg0.jObj);
        DateTimeFormatter newObj = new (externalObj);
        return newObj;
    }

}

# The function that maps to the `ofLocalizedDate` method of `java.time.format.DateTimeFormatter`.
#
# + arg0 - The `FormatStyle` value required to map with the Java method parameter.
# + return - The `DateTimeFormatter` value returning from the Java mapping.
function DateTimeFormatter_ofLocalizedDate(FormatStyle arg0) returns DateTimeFormatter {
    handle externalObj = java_time_format_DateTimeFormatter_ofLocalizedDate(arg0.jObj);
    DateTimeFormatter newObj = new (externalObj);
    return newObj;
}

# The function that maps to the `ofLocalizedDateTime` method of `java.time.format.DateTimeFormatter`.
#
# + arg0 - The `FormatStyle` value required to map with the Java method parameter.
# + return - The `DateTimeFormatter` value returning from the Java mapping.
function DateTimeFormatter_ofLocalizedDateTime(FormatStyle arg0) returns DateTimeFormatter {
    handle externalObj = java_time_format_DateTimeFormatter_ofLocalizedDateTime(arg0.jObj);
    DateTimeFormatter newObj = new (externalObj);
    return newObj;
}

# The function that maps to the `ofLocalizedDateTime` method of `java.time.format.DateTimeFormatter`.
#
# + arg0 - The `FormatStyle` value required to map with the Java method parameter.
# + arg1 - The `FormatStyle` value required to map with the Java method parameter.
# + return - The `DateTimeFormatter` value returning from the Java mapping.
function DateTimeFormatter_ofLocalizedDateTime2(FormatStyle arg0, FormatStyle arg1) returns DateTimeFormatter {
    handle externalObj = java_time_format_DateTimeFormatter_ofLocalizedDateTime2(arg0.jObj, arg1.jObj);
    DateTimeFormatter newObj = new (externalObj);
    return newObj;
}

# Creates a formatter using the specified pattern template, such as "dd.MM.yyyy".
#
# + text - The pattern template to use, such as "dd.MM.yyyy".
# + return - The constructed DateTimeFormatter instance.
public function ofLocalizedPattern(string text) returns DateTimeFormatter|error {
    handle externalObj = check trap java_time_format_DateTimeFormatter_ofLocalizedPattern(java:fromString(text));
    DateTimeFormatter newObj = new (externalObj);
    return newObj;
}

# The function that maps to the `ofLocalizedTime` method of `java.time.format.DateTimeFormatter`.
#
# + arg0 - The `FormatStyle` value required to map with the Java method parameter.
# + return - The `DateTimeFormatter` value returning from the Java mapping.
function DateTimeFormatter_ofLocalizedTime(FormatStyle arg0) returns DateTimeFormatter {
    handle externalObj = java_time_format_DateTimeFormatter_ofLocalizedTime(arg0.jObj);
    DateTimeFormatter newObj = new (externalObj);
    return newObj;
}

# Creates a formatter using the specified pattern, such as "yyyy-MM-dd HH:mm:ss", "yyyy.MM.dd 'at' HH:mm:ss".
#
# + pattern - The pattern to use, such as "yyyy-MM-dd HH:mm:ss".
# + return - The constructed DateTimeFormatter instance, or an error if the pattern is invalid.
public function ofPattern(string pattern) returns DateTimeFormatter|error {
    handle externalObj = check trap java_time_format_DateTimeFormatter_ofPattern(java:fromString(pattern));
    DateTimeFormatter newObj = new (externalObj);
    return newObj;
}

# The function that maps to the `ofPattern` method of `java.time.format.DateTimeFormatter`.
#
# + arg0 - The `string` value required to map with the Java method parameter.
# + arg1 - The `Locale` value required to map with the Java method parameter.
# + return - The `DateTimeFormatter` value returning from the Java mapping.
function DateTimeFormatter_ofPattern2(string arg0, Locale arg1) returns DateTimeFormatter {
    handle externalObj = java_time_format_DateTimeFormatter_ofPattern2(java:fromString(arg0), arg1.jObj);
    DateTimeFormatter newObj = new (externalObj);
    return newObj;
}

# The function that maps to the `parsedExcessDays` method of `java.time.format.DateTimeFormatter`.
#
# + return - The `TemporalQuery` value returning from the Java mapping.
function DateTimeFormatter_parsedExcessDays() returns TemporalQuery {
    handle externalObj = java_time_format_DateTimeFormatter_parsedExcessDays();
    TemporalQuery newObj = new (externalObj);
    return newObj;
}

# The function that maps to the `parsedLeapSecond` method of `java.time.format.DateTimeFormatter`.
#
# + return - The `TemporalQuery` value returning from the Java mapping.
function DateTimeFormatter_parsedLeapSecond() returns TemporalQuery {
    handle externalObj = java_time_format_DateTimeFormatter_parsedLeapSecond();
    TemporalQuery newObj = new (externalObj);
    return newObj;
}

#Obtains the ISO_LOCAL_DATE formatter that formats or parses a date without an offset, such as "2026-07-22".
#
# + return - The constructed DateTimeFormatter instance.
public function getIsoLocalDateFormatter() returns DateTimeFormatter {
    handle externalObj = java_time_format_DateTimeFormatter_getISO_LOCAL_DATE();
    DateTimeFormatter newObj = new (externalObj);
    return newObj;
}

# Obtains the ISO_OFFSET_DATE formatter that formats or parses a date with an offset, such as "2026-07-22+03:00".
#
# + return - The constructed DateTimeFormatter instance.
public function getIsoOffsetDateFormatter() returns DateTimeFormatter {
    handle externalObj = java_time_format_DateTimeFormatter_getISO_OFFSET_DATE();
    DateTimeFormatter newObj = new (externalObj);
    return newObj;
}

# Obtains the ISO_DATE formatter that formats or parses a date with or without an offset, such as "2026-07-22" or "2026-07-22+03:00".
#
# + return - The constructed DateTimeFormatter instance.
public function getIsoDateFormatter() returns DateTimeFormatter {
    handle externalObj = java_time_format_DateTimeFormatter_getISO_DATE();
    DateTimeFormatter newObj = new (externalObj);
    return newObj;
}

# Obtains the ISO_LOCAL_TIME formatter that formats or parses a time without an offset, such as "14:28:19".
#
# + return - The constructed DateTimeFormatter instance.
public function getIsoLocalTimeFormatter() returns DateTimeFormatter {
    handle externalObj = java_time_format_DateTimeFormatter_getISO_LOCAL_TIME();
    DateTimeFormatter newObj = new (externalObj);
    return newObj;
}

# Obtains the ISO_OFFSET_TIME formatter that formats or parses a time with an offset, such as "14:28:19+03:00".
#
# + return - The constructed DateTimeFormatter instance.
public function getIsoOffsetTimeFormatter() returns DateTimeFormatter {
    handle externalObj = java_time_format_DateTimeFormatter_getISO_OFFSET_TIME();
    DateTimeFormatter newObj = new (externalObj);
    return newObj;
}

# Obtains the ISO_TIME formatter that formats or parses a time with or without an offset, such as "14:28:19" or "14:28:19+03:00".
#
# + return - The constructed DateTimeFormatter instance.
public function getIsoTimeFormatter() returns DateTimeFormatter {
    handle externalObj = java_time_format_DateTimeFormatter_getISO_TIME();
    DateTimeFormatter newObj = new (externalObj);
    return newObj;
}

# Obtains the ISO_LOCAL_DATE_TIME formatter that formats or parses a date-time without an offset, such as "2026-07-22T14:28:19".
#
# + return - The constructed DateTimeFormatter instance.
public function getIsoLocalDateTimeFormatter() returns DateTimeFormatter {
    handle externalObj = java_time_format_DateTimeFormatter_getISO_LOCAL_DATE_TIME();
    DateTimeFormatter newObj = new (externalObj);
    return newObj;
}

# Obtains the ISO_OFFSET_DATE_TIME formatter that formats or parses a date-time with an offset, such as "2026-07-22T14:28:19+03:00".
#
# + return - The constructed DateTimeFormatter instance.
public function getIsoOffsetDateTimeFormatter() returns DateTimeFormatter {
    handle externalObj = java_time_format_DateTimeFormatter_getISO_OFFSET_DATE_TIME();
    DateTimeFormatter newObj = new (externalObj);
    return newObj;
}

# Obtains the ISO_ZONED_DATE_TIME formatter that formats or parses a date-time with a zone ID, such as "2026-07-22T14:28:19+03:00[Europe/Kyiv]".
#
# + return - The constructed DateTimeFormatter instance.
public function getIsoZonedDateTimeFormatter() returns DateTimeFormatter {
    handle externalObj = java_time_format_DateTimeFormatter_getISO_ZONED_DATE_TIME();
    DateTimeFormatter newObj = new (externalObj);
    return newObj;
}

# Obtains the ISO_DATE_TIME formatter that formats or parses a date-time with a zone, such as "2026-07-22T14:28:19+03:00[Europe/Kyiv]".
#
# + return - The constructed DateTimeFormatter instance.
public function getIsoDateTimeFormatter() returns DateTimeFormatter {
    handle externalObj = java_time_format_DateTimeFormatter_getISO_DATE_TIME();
    DateTimeFormatter newObj = new (externalObj);
    return newObj;
}

# Obtains the ISO_ORDINAL_DATE formatter that formats or parses the ordinal date, such as "2026-203".
#
# + return - The constructed DateTimeFormatter instance.
public function getIsoOrdinalDateFormatter() returns DateTimeFormatter {
    handle externalObj = java_time_format_DateTimeFormatter_getISO_ORDINAL_DATE();
    DateTimeFormatter newObj = new (externalObj);
    return newObj;
}

# Obtains the ISO_WEEK_DATE formatter that formats or parses the week-based date, such as "2026-W30-3".
#
# + return - The constructed DateTimeFormatter instance.
public function getIsoWeekDateFormatter() returns DateTimeFormatter {
    handle externalObj = java_time_format_DateTimeFormatter_getISO_WEEK_DATE();
    DateTimeFormatter newObj = new (externalObj);
    return newObj;
}

# Obtains the ISO_INSTANT formatter that formats or parses an instant in UTC, such as "2026-07-22T11:28:19Z".
#
# + return - The constructed DateTimeFormatter instance.
public function getIsoInstantFormatter() returns DateTimeFormatter {
    handle externalObj = java_time_format_DateTimeFormatter_getISO_INSTANT();
    DateTimeFormatter newObj = new (externalObj);
    return newObj;
}

# Obtains the BASIC_ISO_DATE formatter that formats or parses a basic date without separators, such as "20260722".
#
# + return - The constructed DateTimeFormatter instance.
public function getBasicIsoDateFormatter() returns DateTimeFormatter {
    handle externalObj = java_time_format_DateTimeFormatter_getBASIC_ISO_DATE();
    DateTimeFormatter newObj = new (externalObj);
    return newObj;
}

# Obtains the RFC_1123_DATE_TIME formatter that formats or parses a date-time according to RFC 1123, such as "Wed, 22 Jul 2026 14:28:19 +0300".
#
# + return - The constructed DateTimeFormatter instance.
public function getRfc1123DateTimeFormatter() returns DateTimeFormatter {
    handle externalObj = java_time_format_DateTimeFormatter_getRFC_1123_DATE_TIME();
    DateTimeFormatter newObj = new (externalObj);
    return newObj;
}

function java_time_format_DateTimeFormatter_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.lang.Object"]
} external;

function java_time_format_DateTimeFormatter_format(handle receiver, handle arg0) returns handle = @java:Method {
    name: "format",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.time.temporal.TemporalAccessor"]
} external;

function java_time_format_DateTimeFormatter_formatTo(handle receiver, handle arg0, handle arg1) = @java:Method {
    name: "formatTo",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.time.temporal.TemporalAccessor", "java.lang.Appendable"]
} external;

function java_time_format_DateTimeFormatter_getChronology(handle receiver) returns handle = @java:Method {
    name: "getChronology",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: []
} external;

function java_time_format_DateTimeFormatter_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: []
} external;

function java_time_format_DateTimeFormatter_getDecimalStyle(handle receiver) returns handle = @java:Method {
    name: "getDecimalStyle",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: []
} external;

function java_time_format_DateTimeFormatter_getLocale(handle receiver) returns handle = @java:Method {
    name: "getLocale",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: []
} external;

function java_time_format_DateTimeFormatter_getResolverFields(handle receiver) returns handle = @java:Method {
    name: "getResolverFields",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: []
} external;

function java_time_format_DateTimeFormatter_getResolverStyle(handle receiver) returns handle = @java:Method {
    name: "getResolverStyle",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: []
} external;

function java_time_format_DateTimeFormatter_getZone(handle receiver) returns handle = @java:Method {
    name: "getZone",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: []
} external;

function java_time_format_DateTimeFormatter_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: []
} external;

function java_time_format_DateTimeFormatter_localizedBy(handle receiver, handle arg0) returns handle = @java:Method {
    name: "localizedBy",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.util.Locale"]
} external;

function java_time_format_DateTimeFormatter_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: []
} external;

function java_time_format_DateTimeFormatter_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: []
} external;

function java_time_format_DateTimeFormatter_ofLocalizedDate(handle arg0) returns handle = @java:Method {
    name: "ofLocalizedDate",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.time.format.FormatStyle"]
} external;

function java_time_format_DateTimeFormatter_ofLocalizedDateTime(handle arg0) returns handle = @java:Method {
    name: "ofLocalizedDateTime",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.time.format.FormatStyle"]
} external;

function java_time_format_DateTimeFormatter_ofLocalizedDateTime2(handle arg0, handle arg1) returns handle = @java:Method {
    name: "ofLocalizedDateTime",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.time.format.FormatStyle", "java.time.format.FormatStyle"]
} external;

function java_time_format_DateTimeFormatter_ofLocalizedPattern(handle arg0) returns handle|error = @java:Method {
    name: "ofLocalizedPattern",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.lang.String"]
} external;

function java_time_format_DateTimeFormatter_ofLocalizedTime(handle arg0) returns handle = @java:Method {
    name: "ofLocalizedTime",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.time.format.FormatStyle"]
} external;

function java_time_format_DateTimeFormatter_ofPattern(handle arg0) returns handle|error = @java:Method {
    name: "ofPattern",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.lang.String"]
} external;

function java_time_format_DateTimeFormatter_ofPattern2(handle arg0, handle arg1) returns handle = @java:Method {
    name: "ofPattern",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.lang.String", "java.util.Locale"]
} external;

function java_time_format_DateTimeFormatter_parse(handle receiver, handle arg0) returns handle = @java:Method {
    name: "parse",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.lang.CharSequence"]
} external;

function java_time_format_DateTimeFormatter_parse2(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "parse",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.lang.CharSequence", "java.text.ParsePosition"]
} external;

function java_time_format_DateTimeFormatter_parse3(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "parse",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.lang.CharSequence", "java.time.temporal.TemporalQuery"]
} external;

function java_time_format_DateTimeFormatter_parseBest(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "parseBest",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.lang.CharSequence", "[Ljava.time.temporal.TemporalQuery;"]
} external;

function java_time_format_DateTimeFormatter_parseUnresolved(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "parseUnresolved",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.lang.CharSequence", "java.text.ParsePosition"]
} external;

function java_time_format_DateTimeFormatter_parsedExcessDays() returns handle = @java:Method {
    name: "parsedExcessDays",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: []
} external;

function java_time_format_DateTimeFormatter_parsedLeapSecond() returns handle = @java:Method {
    name: "parsedLeapSecond",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: []
} external;

function java_time_format_DateTimeFormatter_toFormat(handle receiver) returns handle = @java:Method {
    name: "toFormat",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: []
} external;

function java_time_format_DateTimeFormatter_toFormat2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "toFormat",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.time.temporal.TemporalQuery"]
} external;

function java_time_format_DateTimeFormatter_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: []
} external;

function java_time_format_DateTimeFormatter_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["long"]
} external;

function java_time_format_DateTimeFormatter_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["long", "int"]
} external;

function java_time_format_DateTimeFormatter_withChronology(handle receiver, handle arg0) returns handle = @java:Method {
    name: "withChronology",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.time.chrono.Chronology"]
} external;

function java_time_format_DateTimeFormatter_withDecimalStyle(handle receiver, handle arg0) returns handle = @java:Method {
    name: "withDecimalStyle",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.time.format.DecimalStyle"]
} external;

function java_time_format_DateTimeFormatter_withLocale(handle receiver, handle arg0) returns handle = @java:Method {
    name: "withLocale",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.util.Locale"]
} external;

function java_time_format_DateTimeFormatter_withResolverFields(handle receiver, handle arg0) returns handle = @java:Method {
    name: "withResolverFields",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.util.Set"]
} external;

function java_time_format_DateTimeFormatter_withResolverFields2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "withResolverFields",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["[Ljava.time.temporal.TemporalField;"]
} external;

function java_time_format_DateTimeFormatter_withResolverStyle(handle receiver, handle arg0) returns handle = @java:Method {
    name: "withResolverStyle",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.time.format.ResolverStyle"]
} external;

function java_time_format_DateTimeFormatter_withZone(handle receiver, handle arg0) returns handle = @java:Method {
    name: "withZone",
    'class: "java.time.format.DateTimeFormatter",
    paramTypes: ["java.time.ZoneId"]
} external;

function java_time_format_DateTimeFormatter_getISO_LOCAL_DATE() returns handle = @java:FieldGet {
    name: "ISO_LOCAL_DATE",
    'class: "java.time.format.DateTimeFormatter"
} external;

function java_time_format_DateTimeFormatter_getISO_OFFSET_DATE() returns handle = @java:FieldGet {
    name: "ISO_OFFSET_DATE",
    'class: "java.time.format.DateTimeFormatter"
} external;

function java_time_format_DateTimeFormatter_getISO_DATE() returns handle = @java:FieldGet {
    name: "ISO_DATE",
    'class: "java.time.format.DateTimeFormatter"
} external;

function java_time_format_DateTimeFormatter_getISO_LOCAL_TIME() returns handle = @java:FieldGet {
    name: "ISO_LOCAL_TIME",
    'class: "java.time.format.DateTimeFormatter"
} external;

function java_time_format_DateTimeFormatter_getISO_OFFSET_TIME() returns handle = @java:FieldGet {
    name: "ISO_OFFSET_TIME",
    'class: "java.time.format.DateTimeFormatter"
} external;

function java_time_format_DateTimeFormatter_getISO_TIME() returns handle = @java:FieldGet {
    name: "ISO_TIME",
    'class: "java.time.format.DateTimeFormatter"
} external;

function java_time_format_DateTimeFormatter_getISO_LOCAL_DATE_TIME() returns handle = @java:FieldGet {
    name: "ISO_LOCAL_DATE_TIME",
    'class: "java.time.format.DateTimeFormatter"
} external;

function java_time_format_DateTimeFormatter_getISO_OFFSET_DATE_TIME() returns handle = @java:FieldGet {
    name: "ISO_OFFSET_DATE_TIME",
    'class: "java.time.format.DateTimeFormatter"
} external;

function java_time_format_DateTimeFormatter_getISO_ZONED_DATE_TIME() returns handle = @java:FieldGet {
    name: "ISO_ZONED_DATE_TIME",
    'class: "java.time.format.DateTimeFormatter"
} external;

function java_time_format_DateTimeFormatter_getISO_DATE_TIME() returns handle = @java:FieldGet {
    name: "ISO_DATE_TIME",
    'class: "java.time.format.DateTimeFormatter"
} external;

function java_time_format_DateTimeFormatter_getISO_ORDINAL_DATE() returns handle = @java:FieldGet {
    name: "ISO_ORDINAL_DATE",
    'class: "java.time.format.DateTimeFormatter"
} external;

function java_time_format_DateTimeFormatter_getISO_WEEK_DATE() returns handle = @java:FieldGet {
    name: "ISO_WEEK_DATE",
    'class: "java.time.format.DateTimeFormatter"
} external;

function java_time_format_DateTimeFormatter_getISO_INSTANT() returns handle = @java:FieldGet {
    name: "ISO_INSTANT",
    'class: "java.time.format.DateTimeFormatter"
} external;

function java_time_format_DateTimeFormatter_getBASIC_ISO_DATE() returns handle = @java:FieldGet {
    name: "BASIC_ISO_DATE",
    'class: "java.time.format.DateTimeFormatter"
} external;

function java_time_format_DateTimeFormatter_getRFC_1123_DATE_TIME() returns handle = @java:FieldGet {
    name: "RFC_1123_DATE_TIME",
    'class: "java.time.format.DateTimeFormatter"
} external;

