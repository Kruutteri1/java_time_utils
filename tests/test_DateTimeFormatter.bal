import ballerina/test;

@test:Config
function testOfPattern() returns error? {
    DateTimeFormatter formatter = check ofPattern("yyyy-MM-dd HH:mm:ss");
    test:assertNotEquals(formatter, (), "Pattern formatter should not be null");
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