import ballerina/test;

@test:Config
function testOfPattern() returns error? {
    DateTimeFormatter formatter = check ofPattern("yyyy-MM-dd HH:mm:ss");
    test:assertNotEquals(formatter, (), "Pattern formatter should not be null");
}

@test:Config
function testOfPatternVariants() returns error? {
    DateTimeFormatter d1 = check ofPattern("dd.MM.yyyy");
    DateTimeFormatter d2 = check ofPattern("EEE, dd MMM yyyy HH:mm:ss Z");
    DateTimeFormatter d3 = check ofPattern("HH:mm:ss.SSS");
    test:assertNotEquals(d1, (), "dd.MM.yyyy formatter should not be null");
    test:assertNotEquals(d2, (), "RFC-like pattern formatter should not be null");
    test:assertNotEquals(d3, (), "Time with millis formatter should not be null");
}

@test:Config
function testOfLocalizedPattern() returns error? {
    DateTimeFormatter formatter = check ofLocalizedPattern("yyyyMMdd");
    test:assertNotEquals(formatter, (), "Localized pattern formatter should not be null");
}

@test:Config
function testIsoStandardFormatters() {
    test:assertNotEquals(getIsoLocalDateFormatter(), (), "ISO_LOCAL_DATE should be initialized");
    test:assertNotEquals(getIsoOffsetDateFormatter(), (), "ISO_OFFSET_DATE should be initialized");
    test:assertNotEquals(getIsoDateFormatter(), (), "ISO_DATE should be initialized");
    test:assertNotEquals(getIsoLocalTimeFormatter(), (), "ISO_LOCAL_TIME should be initialized");
    test:assertNotEquals(getIsoOffsetTimeFormatter(), (), "ISO_OFFSET_TIME should be initialized");
    test:assertNotEquals(getIsoTimeFormatter(), (), "ISO_TIME should be initialized");
    test:assertNotEquals(getIsoLocalDateTimeFormatter(), (), "ISO_LOCAL_DATE_TIME should be initialized");
    test:assertNotEquals(getIsoOffsetDateTimeFormatter(), (), "ISO_OFFSET_DATE_TIME should be initialized");
    test:assertNotEquals(getIsoZonedDateTimeFormatter(), (), "ISO_ZONED_DATE_TIME should be initialized");
    test:assertNotEquals(getIsoDateTimeFormatter(), (), "ISO_DATE_TIME should be initialized");
    test:assertNotEquals(getIsoOrdinalDateFormatter(), (), "ISO_ORDINAL_DATE should be initialized");
    test:assertNotEquals(getIsoWeekDateFormatter(), (), "ISO_WEEK_DATE should be initialized");
    test:assertNotEquals(getIsoInstantFormatter(), (), "ISO_INSTANT should be initialized");
    test:assertNotEquals(getBasicIsoDateFormatter(), (), "BASIC_ISO_DATE should be initialized");
    test:assertNotEquals(getRfc1123DateTimeFormatter(), (), "RFC_1123_DATE_TIME should be initialized");
}

@test:Config
function testInvalidPatternHandling() {
    DateTimeFormatter|error result = ofPattern("Invalid-Pattern-@@@");
    test:assertTrue(result is error, "Invalid pattern should result in an error");
}

@test:Config
function testInvalidPatternError() {
    DateTimeFormatter|error result = ofPattern("p");
    test:assertTrue(result is error, "Empty pattern should result in an error");
}

@test:Config
function testUnclosedQuotePatternError() {
    DateTimeFormatter|error result = ofPattern("yyyy-MM-dd 'at HH:mm:ss");
    test:assertTrue(result is error, "Unclosed quote pattern should result in an error");
}

// ---------- Тесты публичных методов инстанса DateTimeFormatter ----------

@test:Config
function testToStringMethod() returns error? {
    DateTimeFormatter formatter = check ofPattern("yyyy-MM-dd");
    string str = formatter.toString();
    test:assertTrue(str.length() > 0, "toString should return a non-empty string representation");
}

@test:Config
function testToStringForDifferentPatterns() returns error? {
    DateTimeFormatter d1 = check ofPattern("yyyy-MM-dd");
    DateTimeFormatter d2 = check ofPattern("HH:mm:ss");
    test:assertNotEquals(d1.toString(), d2.toString(),
            "toString output should differ for formatters built from different patterns");
}

@test:Config
function testIsEqualsSameInstance() returns error? {
    DateTimeFormatter formatter = check ofPattern("yyyy-MM-dd");
    boolean result = formatter.isEquals(formatter);
    test:assertTrue(result, "A formatter should be equal to itself");
}

@test:Config
function testIsEqualsDifferentInstances() returns error? {
    DateTimeFormatter formatter1 = check ofPattern("yyyy-MM-dd");
    DateTimeFormatter formatter2 = check ofPattern("HH:mm:ss");
    boolean result = formatter1.isEquals(formatter2);
    test:assertFalse(result, "Formatters built from different patterns should not be equal");
}

@test:Config
function testIsEqualsWithPredefinedFormatters() {
    DateTimeFormatter iso1 = getIsoLocalDateFormatter();
    DateTimeFormatter iso2 = getIsoLocalDateFormatter();
    // ISO_LOCAL_DATE is a shared static constant on the Java side, so both handles
    // should reference an equal underlying formatter.
    test:assertTrue(iso1.isEquals(iso2), "Two references to ISO_LOCAL_DATE should be equal");
}

@test:Config
function testGetClass() returns error? {
    DateTimeFormatter formatter = check ofPattern("yyyy-MM-dd");
    Class clazz = formatter.getClass();
    test:assertNotEquals(clazz, (), "getClass should return a non-null Class instance");
}

@test:Config
function testGetClassNameContainsDateTimeFormatter() returns error? {
    DateTimeFormatter formatter = check ofPattern("yyyy-MM-dd");
    Class clazz = formatter.getClass();
    string className = clazz.toString();
    test:assertTrue(className.length() > 0, "Class toString should not be empty");
}

@test:Config
function testHashCode() returns error? {
    DateTimeFormatter formatter = check ofPattern("yyyy-MM-dd");
    int hash = formatter.hashCode();
    test:assertTrue(hash is int, "hashCode should return an int value");
}

@test:Config
function testHashCodeConsistency() returns error? {
    DateTimeFormatter formatter = check ofPattern("yyyy-MM-dd");
    int hash1 = formatter.hashCode();
    int hash2 = formatter.hashCode();
    test:assertEquals(hash1, hash2, "hashCode should be consistent across repeated calls on the same instance");
}
