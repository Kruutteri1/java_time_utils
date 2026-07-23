import ballerina/test;

// ===================================================================
// Creation — all factory functions
// ===================================================================

@test:Config {}
function testCreationWithNano() {
    LocalTime t = checkpanic ofTimeWithSecondNano(10, 15, 30, 500000000);
    test:assertEquals(t.getHour(), 10);
    test:assertEquals(t.getMinute(), 15);
    test:assertEquals(t.getSecond(), 30);
    test:assertEquals(t.getNano(), 500000000, "Nano-of-second should be 500000000");
}

@test:Config {}
function testOfNanoOfDayZero() {
    LocalTime t = checkpanic ofNanoOfDay(0);
    test:assertEquals(t.toString(), "00:00", "0 nanos of day should be 00:00");
}

@test:Config {}
function testOfNanoOfDayNonZero() {
    // 1 hour = 3600 seconds = 3,600,000,000,000 nanoseconds
    LocalTime t = checkpanic ofNanoOfDay(3600000000000);
    test:assertEquals(t.getHour(), 1);
    test:assertEquals(t.getMinute(), 0);
}

@test:Config {}
function testOfSecondOfDayZero() {
    LocalTime t = checkpanic ofSecondOfDay(0);
    test:assertEquals(t.toString(), "00:00");
}

@test:Config {}
function testOfSecondOfDayOneHour() {
    LocalTime t = checkpanic ofSecondOfDay(3600);
    test:assertEquals(t.getHour(), 1, "3600 seconds of day should be 01:00");
    test:assertEquals(t.getMinute(), 0);
}

@test:Config {}
function testOfSecondOfDayComplex() {
    // 10:15:30 = 10*3600 + 15*60 + 30 = 36930 seconds
    LocalTime t = checkpanic ofSecondOfDay(36930);
    test:assertEquals(t.getHour(), 10);
    test:assertEquals(t.getMinute(), 15);
    test:assertEquals(t.getSecond(), 30);
}

@test:Config {}
function testConstantsMax_LocalTime() {
    LocalTime max = getMaxTime();
    test:assertEquals(max.getHour(), 23, "MAX should have hour 23");
    test:assertEquals(max.getMinute(), 59);
    test:assertEquals(max.getSecond(), 59);
    test:assertEquals(max.getNano(), 999999999);
}

@test:Config {}
function testConstantsNoon() {
    LocalTime noon = getNoon();
    test:assertEquals(noon.toString(), "12:00", "NOON should be 12:00");
}

@test:Config {}
function testConstantsMidnightEqualsMin() {
    LocalTime min = getMinTime();
    LocalTime midnight = getMidnigth();
    test:assertTrue(min.isEquals(midnight), "MIN and MIDNIGHT should be equal");
    test:assertEquals(min.toString(), midnight.toString());
}

// ===================================================================
// toString and component getters
// ===================================================================

@test:Config {}
function testToStringFormat_LocalTime() {
    LocalTime t = checkpanic ofTimeWithSecond(9, 5, 3);
    test:assertEquals(t.toString(), "09:05:03", "String representation should be in ISO format");
}

@test:Config {}
function testGetNano_LocalTime() {
    LocalTime t = checkpanic ofTimeWithSecondNano(0, 0, 0, 123456789);
    test:assertEquals(t.getNano(), 123456789);
}

@test:Config {}
function testHashCodeConsistency_LocalTime() {
    LocalTime t1 = checkpanic ofTimeWithSecond(10, 15, 30);
    LocalTime t2 = checkpanic ofTimeWithSecond(10, 15, 30);
    test:assertEquals(t1.hashCode(), t2.hashCode(), "Hash codes of equal values should match");
}

@test:Config {}
function testGetClassNotNull() {
    LocalTime now = getCurrentTime();
    test:assertTrue(now.getHour() >= 0 && now.getHour() <= 23, "LocalTime_now() should return a valid time of day");
}

// ===================================================================
// Comparison — extended cases
// ===================================================================

@test:Config {}
function testEqualsFalseForDifferentTimes() {
    LocalTime t1 = checkpanic ofTime(10, 0);
    LocalTime t2 = checkpanic ofTime(11, 0);
    test:assertFalse(t1.isEquals(t2), "Different times should not be equal");
}

@test:Config {}
function testEqualsTrueForSameValues_LocalTime() {
    LocalTime t1 = checkpanic ofTimeWithSecond(10, 15, 30);
    LocalTime t2 = checkpanic ofTimeWithSecond(10, 15, 30);
    test:assertTrue(t1.isEquals(t2), "Identical time values should be equal");
}

@test:Config {}
function testCompareToEqual_() {
    LocalTime t1 = checkpanic ofTime(10, 0);
    LocalTime t2 = checkpanic ofTime(10, 0);
    test:assertEquals(t1.compareTo(t2), 0, "Equal times should compare as 0");
}

@test:Config {}
function testCompareToGreater() {
    LocalTime t1 = checkpanic ofTime(11, 0);
    LocalTime t2 = checkpanic ofTime(10, 0);
    test:assertEquals(t1.compareTo(t2), 1, "11:00 should be greater than 10:00");
}

@test:Config {}
function testIsAfterFalseWhenEqual() {
    LocalTime t1 = checkpanic ofTime(10, 0);
    LocalTime t2 = checkpanic ofTime(10, 0);
    test:assertFalse(t1.isAfter(t2), "A time cannot be 'after' itself");
}

@test:Config {}
function testIsBeforeFalseWhenEqual() {
    LocalTime t1 = checkpanic ofTime(10, 0);
    LocalTime t2 = checkpanic ofTime(10, 0);
    test:assertFalse(t1.isBefore(t2), "A time cannot be 'before' itself");
}

// ===================================================================
// Combining with a date (atDate)
// ===================================================================

@test:Config {}
function testAtDateProducesCorrectDateTime() {
    LocalTime t = checkpanic ofTimeWithSecond(14, 28, 19);
    LocalDate d = checkpanic ofDate(2026, 1, 1);
    LocalDateTime dt = t.atDate(d);

    test:assertEquals(dt.toString(), "2026-01-01T14:28:19");
}

// ===================================================================
// Representation as seconds / nanos of day
// ===================================================================

@test:Config {}
function testToSecondOfDayMidnight() {
    LocalTime t = getMidnigth();
    test:assertEquals(t.toSecondOfDay(), 0);
    test:assertEquals(t.toNanoOfDay(), 0);
}

@test:Config {}
function testToSecondOfDayValue() {
    // 01:00:00 = 3600 seconds of day
    LocalTime t = checkpanic ofTimeWithSecond(1, 0, 0);
    test:assertEquals(t.toSecondOfDay(), 3600);
    test:assertEquals(t.toNanoOfDay(), 3600000000000);

}

@test:Config {}
function testSecondOfDayRoundTrip() {
    // ofSecondOfDay and toSecondOfDay should be inverse operations
    int seconds = 45000;
    LocalTime t = checkpanic ofSecondOfDay(seconds);
    test:assertEquals(t.toSecondOfDay(), seconds, "Round-tripping seconds of day should yield the same value");
}

// ===================================================================
// Addition arithmetic — extended cases, incl. midnight rollover
// ===================================================================

@test:Config {}
function testPlusMinutesWraparound() {
    LocalTime t = checkpanic ofTime(23, 55);
    LocalTime next = t.plusMinutes(10);
    test:assertEquals(next.getHour(), 0, "23:55 + 10 minutes should roll over to the next day: 00:05");
    test:assertEquals(next.getMinute(), 5);
}

@test:Config {}
function testPlusSeconds_LocalTime() {
    LocalTime t = checkpanic ofTimeWithSecond(10, 0, 50);
    LocalTime next = t.plusSeconds(20);
    test:assertEquals(next.getMinute(), 1, "10:00:50 + 20 seconds = 10:01:10");
    test:assertEquals(next.getSecond(), 10);
}

@test:Config {}
function testPlusNanos_LocalTime() {
    LocalTime t = checkpanic ofTimeWithSecondNano(0, 0, 0, 900000000);
    LocalTime next = t.plusNanos(200000000);
    test:assertEquals(next.getSecond(), 1, "900ms + 200ms should roll over into the next second");
    test:assertEquals(next.getNano(), 100000000);
}

// ===================================================================
// Subtraction arithmetic — extended cases, incl. midnight rollover
// ===================================================================

@test:Config {}
function testMinusHoursWraparound() {
    LocalTime t = checkpanic ofTime(1, 0);
    LocalTime prev = t.minusHours(2);
    test:assertEquals(prev.getHour(), 23, "01:00 - 2 hours should roll back to the previous day: 23:00");
}

@test:Config {}
function testMinusSeconds_LocalTime() {
    LocalTime t = checkpanic ofTimeWithSecond(10, 1, 10);
    LocalTime prev = t.minusSeconds(20);
    test:assertEquals(prev.getMinute(), 0, "10:01:10 - 20 seconds = 10:00:50");
    test:assertEquals(prev.getSecond(), 50);
}

@test:Config {}
function testMinusNanos_LocalTime() {
    LocalTime t = checkpanic ofTimeWithSecondNano(0, 0, 1, 100000000);
    LocalTime prev = t.minusNanos(200000000);
    test:assertEquals(prev.getSecond(), 0, "1s 100ms - 200ms should roll back into the previous second");
    test:assertEquals(prev.getNano(), 900000000);
}

// ===================================================================
// Altering individual fields (with*)
// ===================================================================

@test:Config {}
function testWithSecond_LocalTime() {
    LocalTime t = checkpanic ofTimeWithSecond(10, 15, 30);
    LocalTime changed = t.withSecond(0);
    test:assertEquals(changed.getSecond(), 0);
    // Other fields should remain unchanged
    test:assertEquals(changed.getHour(), 10);
    test:assertEquals(changed.getMinute(), 15);
}

@test:Config {}
function testWithNano_LocalTime() {
    LocalTime t = checkpanic ofTimeWithSecond(10, 15, 30);
    LocalTime changed = t.withNano(500000000);
    test:assertEquals(changed.getNano(), 500000000);
}

@test:Config {}
function testWithMethodsChainImmutability_LocalTime() {
    LocalTime original = checkpanic ofTimeWithSecond(10, 15, 30);
    LocalTime _ = original.withHour(0).withMinute(0).withSecond(0).withNano(0);

    // The original object should remain unchanged
    test:assertEquals(original.getHour(), 10);
    test:assertEquals(original.getMinute(), 15);
    test:assertEquals(original.getSecond(), 30);
}

// ===================================================================
// Complex scenario: chaining multiple operations
// ===================================================================

@test:Config {}
function testComplexScenario_LocalTime() {
    LocalTime t = checkpanic ofTimeWithSecond(22, 30, 0);
    LocalTime result = t.plusHours(3).minusMinutes(15);

    // 22:30 + 3h = 01:30 (next day) - 15 minutes = 01:15
    test:assertEquals(result.getHour(), 1);
    test:assertEquals(result.getMinute(), 15);
}

// ===================================================================
// Negative cases
// ===================================================================

@test:Config {}
function testInvalidHourThrows_() {
    LocalTime|error t = trap ofTime(24, 0);
    test:assertTrue(t is error);
}

@test:Config {}
function testNegativeHourThrows() {
    LocalTime|error t = trap ofTime(-1, 0);
    test:assertTrue(t is error);
}

@test:Config {}
function testInvalidMinuteThrows_() {
    LocalTime|error t = trap ofTime(10, 60);
    test:assertTrue(t is error);
}

@test:Config {}
function testInvalidSecondThrows_() {
    LocalTime|error t = trap ofTimeWithSecond(10, 0, 60);
    test:assertTrue(t is error);
}

@test:Config {}
function testInvalidNanoOfDayThrows() {
    // max 86_399_999_999_999
    LocalTime|error t = trap ofNanoOfDay(86400000000000);
    test:assertTrue(t is error);
}

@test:Config {}
function testInvalidSecondOfDayThrows() {
    // max 86399
    LocalTime|error t = trap ofSecondOfDay(86400);
    test:assertTrue(t is error);
}

@test:Config {}
function testWithInvalidHourThrows_() {
    LocalTime t = checkpanic ofTime(10, 0);
    LocalTime|error result = trap t.withHour(25);
    test:assertTrue(result is error);
}

@test:Config {}
function testWithInvalidMinuteThrows() {
    LocalTime t = checkpanic ofTime(10, 0);
    LocalTime|error result = trap t.withMinute(60);
    test:assertTrue(result is error);
}

// ===== Hour =====
@test:Config {}
function testHourNegativeThrows_() {
    LocalTime|error t = trap ofTime(-1, 0);
    test:assertTrue(t is error);
}

@test:Config {}
function testHour24Throws_() {
    LocalTime|error t = trap ofTime(24, 0);
    test:assertTrue(t is error);
}

@test:Config {}
function testHour23IsValid_() {
    LocalTime|error t = trap ofTime(23, 0);
    test:assertTrue(t is LocalTime);
}

@test:Config {}
function testHour0IsValid_() {
    LocalTime|error t = trap ofTime(0, 0);
    test:assertTrue(t is LocalTime);
}

// ===== Minute =====
@test:Config {}
function testMinuteNegativeThrows_() {
    LocalTime|error t = trap ofTime(10, -1);
    test:assertTrue(t is error);
}

@test:Config {}
function testMinute60Throws_() {
    LocalTime|error t = trap ofTime(10, 60);
    test:assertTrue(t is error);
}

@test:Config {}
function testMinute59IsValid_() {
    LocalTime|error t = trap ofTime(10, 59);
    test:assertTrue(t is LocalTime);
}

// ===== Second =====
@test:Config {}
function testSecondNegativeThrows_() {
    LocalTime|error t = trap ofTimeWithSecond(10, 0, -1);
    test:assertTrue(t is error);
}

@test:Config {}
function testSecond60Throws_() {
    LocalTime|error t = trap ofTimeWithSecond(10, 0, 60);
    test:assertTrue(t is error);
}

@test:Config {}
function testSecond59IsValid_() {
    LocalTime|error t = trap ofTimeWithSecond(10, 0, 59);
    test:assertTrue(t is LocalTime);
}

// ===== Наносекунда =====
@test:Config {}
function testNanoNegativeThrows_() {
    LocalTime|error t = trap ofTimeWithSecondNano(10, 0, 0, -1);
    test:assertTrue(t is error);
}

@test:Config {}
function testNano1000000000Throws_() {
    LocalTime|error t = trap ofTimeWithSecondNano(10, 0, 0, 1000000000);
    test:assertTrue(t is error);
}

@test:Config {}
function testNano999999999IsValid_() {
    LocalTime|error t = trap ofTimeWithSecondNano(10, 0, 0, 999999999);
    test:assertTrue(t is LocalTime);
}

// ===== Секунда суток =====
@test:Config {}
function testSecondOfDayNegativeThrows() {
    LocalTime|error t = trap ofSecondOfDay(-1);
    test:assertTrue(t is error);
}

@test:Config {}
function testSecondOfDay86400Throws() {
    LocalTime|error t = trap ofSecondOfDay(86400);
    test:assertTrue(t is error);
}

@test:Config {}
function testSecondOfDay86399IsValid() {
    LocalTime|error t = trap ofSecondOfDay(86399);
    test:assertTrue(t is LocalTime);
}

// ===== Наносекунда суток =====
@test:Config {}
function testNanoOfDayNegativeThrows() {
    LocalTime|error t = trap ofNanoOfDay(-1);
    test:assertTrue(t is error);
}

@test:Config {}
function testNanoOfDay86400000000000Throws() {
    LocalTime|error t = trap ofNanoOfDay(86400000000000);
    test:assertTrue(t is error);
}

@test:Config {}
function testNanoOfDay86399999999999IsValid() {
    LocalTime|error t = trap ofNanoOfDay(86399999999999);
    test:assertTrue(t is LocalTime);
}

@test:Config
function testParseLocalTimeDefaultIso() returns error? {
    LocalTime time = check parseText("14:28:19");
    test:assertNotEquals(time, (), "Parsed LocalTime should not be null");
}

@test:Config
function testParseLocalTimeDefaultIsoInvalidFormat() {
    LocalTime|error result = parseText("14-28-19"); // Неверный разделитель для ISO формата
    test:assertTrue(result is error, "Parsing invalid ISO LocalTime format should result in an error");
}

@test:Config
function testParseLocalTimeWithFormatter() returns error? {
    DateTimeFormatter formatter = check ofPattern("HH.mm.ss");
    LocalTime time = check parseTextWithFormatter("14.28.19", formatter);
    test:assertNotEquals(time, (), "Parsed LocalTime with custom formatter should not be null");
}

@test:Config
function testParseLocalTimeWithFormatterMismatch() returns error? {
    DateTimeFormatter formatter = check ofPattern("HH:mm:ss");
    LocalTime|error result = parseTextWithFormatter("14-28-19", formatter);
    test:assertTrue(result is error, "Mismatched pattern and text for LocalTime should result in an error");
}

@test:Config {}
function testLocalTimePlusDurationHours() {
    LocalTime time = checkpanic ofTimeWithSecond(10, 15, 0);
    Duration duration = ofHours(3);
    
    LocalTime result = time.plusDuration(duration);
    
    test:assertEquals(result.getHour(), 13);
    test:assertEquals(result.getMinute(), 15);
    test:assertEquals(result.getSecond(), 0);
}

@test:Config {}
function testLocalTimePlusDurationMinutes() {
    LocalTime time = checkpanic ofTimeWithSecond(12, 30, 0);
    Duration duration = ofMinutes(45);
    
    LocalTime result = time.plusDuration(duration);
    
    test:assertEquals(result.getHour(), 13);
    test:assertEquals(result.getMinute(), 15);
    test:assertEquals(result.getSecond(), 0);
}

@test:Config {}
function testLocalTimePlusDurationSeconds() {
    LocalTime time = checkpanic ofTimeWithSecond(23, 59, 30);
    Duration duration = ofSeconds(45);
    
    LocalTime result = time.plusDuration(duration);
    
    test:assertEquals(result.getHour(), 0);
    test:assertEquals(result.getMinute(), 0);
    test:assertEquals(result.getSecond(), 15);
}

@test:Config {}
function testLocalTimePlusDurationImmutability() {
    LocalTime time = checkpanic ofTimeWithSecond(12, 0, 0);
    Duration duration = ofHours(2);
    
    _ = time.plusDuration(duration);
    
    test:assertEquals(time.getHour(), 12);
    test:assertEquals(time.getMinute(), 0);
}

@test:Config {}
function testLocalTimeMinusDurationHours() {
    LocalTime time = checkpanic ofTimeWithSecond(15, 30, 0);
    Duration duration = ofHours(2);
    
    LocalTime result = time.minusDuration(duration);
    
    test:assertEquals(result.getHour(), 13);
    test:assertEquals(result.getMinute(), 30);
    test:assertEquals(result.getSecond(), 0);
}

@test:Config {}
function testLocalTimeMinusDurationMinutes() {
    LocalTime time = checkpanic ofTimeWithSecond(12, 15, 0);
    Duration duration = ofMinutes(45);
    
    LocalTime result = time.minusDuration(duration);
    
    test:assertEquals(result.getHour(), 11);
    test:assertEquals(result.getMinute(), 30);
    test:assertEquals(result.getSecond(), 0);
}

@test:Config {}
function testLocalTimeMinusDurationSeconds() {
    LocalTime time = checkpanic ofTimeWithSecond(10, 0, 30);
    Duration duration = ofSeconds(45);
    
    LocalTime result = time.minusDuration(duration);
    
    test:assertEquals(result.getHour(), 9);
    test:assertEquals(result.getMinute(), 59);
    test:assertEquals(result.getSecond(), 45);
}

@test:Config {}
function testLocalTimeMinusDurationImmutability() {
    LocalTime time = checkpanic ofTimeWithSecond(12, 0, 0);
    Duration duration = ofHours(1);
    
    _ = time.minusDuration(duration);
    
    test:assertEquals(time.getHour(), 12);
    test:assertEquals(time.getMinute(), 0);
}