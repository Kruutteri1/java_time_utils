import ballerina/test;

import kruutteri1/java_time_utils.javatime as jt;

// ===================================================================
// Creation — all factory functions
// ===================================================================

@test:Config {}
function testCreationWithNano() {
    jt:LocalTime t = jt:ofHourMinuteSecondNano(10, 15, 30, 500000000);
    test:assertEquals(t.getHour(), 10);
    test:assertEquals(t.getMinute(), 15);
    test:assertEquals(t.getSecond(), 30);
    test:assertEquals(t.getNano(), 500000000, "Nano-of-second should be 500000000");
}

@test:Config {}
function testOfNanoOfDayZero() {
    jt:LocalTime t = jt:ofNanoOfDay(0);
    test:assertEquals(t.toString(), "00:00", "0 nanos of day should be 00:00");
}

@test:Config {}
function testOfNanoOfDayNonZero() {
    // 1 hour = 3600 seconds = 3,600,000,000,000 nanoseconds
    jt:LocalTime t = jt:ofNanoOfDay(3600000000000);
    test:assertEquals(t.getHour(), 1);
    test:assertEquals(t.getMinute(), 0);
}

@test:Config {}
function testOfSecondOfDayZero() {
    jt:LocalTime t = jt:ofSecondOfDay(0);
    test:assertEquals(t.toString(), "00:00");
}

@test:Config {}
function testOfSecondOfDayOneHour() {
    jt:LocalTime t = jt:ofSecondOfDay(3600);
    test:assertEquals(t.getHour(), 1, "3600 seconds of day should be 01:00");
    test:assertEquals(t.getMinute(), 0);
}

@test:Config {}
function testOfSecondOfDayComplex() {
    // 10:15:30 = 10*3600 + 15*60 + 30 = 36930 seconds
    jt:LocalTime t = jt:ofSecondOfDay(36930);
    test:assertEquals(t.getHour(), 10);
    test:assertEquals(t.getMinute(), 15);
    test:assertEquals(t.getSecond(), 30);
}

@test:Config {}
function testConstantsMax_LocalTime() {
    jt:LocalTime max = jt:getMAX();
    test:assertEquals(max.getHour(), 23, "MAX should have hour 23");
    test:assertEquals(max.getMinute(), 59);
    test:assertEquals(max.getSecond(), 59);
    test:assertEquals(max.getNano(), 999999999);
}

@test:Config {}
function testConstantsNoon() {
    jt:LocalTime noon = jt:getNOON();
    test:assertEquals(noon.toString(), "12:00", "NOON should be 12:00");
}

@test:Config {}
function testConstantsMidnightEqualsMin() {
    jt:LocalTime min = jt:getMin();
    jt:LocalTime midnight = jt:getMIDNIGHT();
    test:assertTrue(min.'equals(midnight), "MIN and MIDNIGHT should be equal");
    test:assertEquals(min.toString(), midnight.toString());
}

// ===================================================================
// toString and component getters
// ===================================================================

@test:Config {}
function testToStringFormat_LocalTime() {
    jt:LocalTime t = jt:ofHourMinuteSecond(9, 5, 3);
    test:assertEquals(t.toString(), "09:05:03", "String representation should be in ISO format");
}

@test:Config {}
function testGetNano_LocalTime() {
    jt:LocalTime t = jt:ofHourMinuteSecondNano(0, 0, 0, 123456789);
    test:assertEquals(t.getNano(), 123456789);
}

@test:Config {}
function testHashCodeConsistency_LocalTime() {
    jt:LocalTime t1 = jt:ofHourMinuteSecond(10, 15, 30);
    jt:LocalTime t2 = jt:ofHourMinuteSecond(10, 15, 30);
    test:assertEquals(t1.hashCode(), t2.hashCode(), "Hash codes of equal values should match");
}

@test:Config {}
function testGetClassNotNull() {
    jt:LocalTime now = jt:LocalTime_now();
    test:assertTrue(now.getHour() >= 0 && now.getHour() <= 23, "LocalTime_now() should return a valid time of day");
}

// ===================================================================
// Comparison — extended cases
// ===================================================================

@test:Config {}
function testEqualsFalseForDifferentTimes() {
    jt:LocalTime t1 = jt:ofHourMinute(10, 0);
    jt:LocalTime t2 = jt:ofHourMinute(11, 0);
    test:assertFalse(t1.'equals(t2), "Different times should not be equal");
}

@test:Config {}
function testEqualsTrueForSameValues_LocalTime() {
    jt:LocalTime t1 = jt:ofHourMinuteSecond(10, 15, 30);
    jt:LocalTime t2 = jt:ofHourMinuteSecond(10, 15, 30);
    test:assertTrue(t1.'equals(t2), "Identical time values should be equal");
}

@test:Config {}
function testCompareToEqual() {
    jt:LocalTime t1 = jt:ofHourMinute(10, 0);
    jt:LocalTime t2 = jt:ofHourMinute(10, 0);
    test:assertEquals(t1.compareTo(t2), 0, "Equal times should compare as 0");
}

@test:Config {}
function testCompareToGreater() {
    jt:LocalTime t1 = jt:ofHourMinute(11, 0);
    jt:LocalTime t2 = jt:ofHourMinute(10, 0);
    test:assertEquals(t1.compareTo(t2), 1, "11:00 should be greater than 10:00");
}

@test:Config {}
function testIsAfterFalseWhenEqual() {
    jt:LocalTime t1 = jt:ofHourMinute(10, 0);
    jt:LocalTime t2 = jt:ofHourMinute(10, 0);
    test:assertFalse(t1.isAfter(t2), "A time cannot be 'after' itself");
}

@test:Config {}
function testIsBeforeFalseWhenEqual() {
    jt:LocalTime t1 = jt:ofHourMinute(10, 0);
    jt:LocalTime t2 = jt:ofHourMinute(10, 0);
    test:assertFalse(t1.isBefore(t2), "A time cannot be 'before' itself");
}

// ===================================================================
// Combining with a date (atDate)
// ===================================================================

@test:Config {}
function testAtDateProducesCorrectDateTime() {
    jt:LocalTime t = jt:ofHourMinuteSecond(14, 28, 19);
    jt:LocalDate d = jt:LocalDate_of(2026, 1, 1);
    jt:LocalDateTime dt = t.atDate(d);

    test:assertEquals(dt.toString(), "2026-01-01T14:28:19");
}

// ===================================================================
// Representation as seconds / nanos of day
// ===================================================================

@test:Config {}
function testToSecondOfDayMidnight() {
    jt:LocalTime t = jt:getMIDNIGHT();
    test:assertEquals(t.toSecondOfDay(), 0);
}

@test:Config {}
function testToSecondOfDayValue() {
    // 01:00:00 = 3600 seconds of day
    jt:LocalTime t = jt:ofHourMinuteSecond(1, 0, 0);
    test:assertEquals(t.toSecondOfDay(), 3600);
}

@test:Config {}
function testToNanoOfDayMidnight() {
    jt:LocalTime t = jt:getMIDNIGHT();
    test:assertEquals(t.toNanoOfDay(), 0);
}

@test:Config {}
function testToNanoOfDayValue() {
    jt:LocalTime t = jt:ofHourMinuteSecond(1, 0, 0);
    test:assertEquals(t.toNanoOfDay(), 3600000000000);
}

@test:Config {}
function testSecondOfDayRoundTrip() {
    // ofSecondOfDay and toSecondOfDay should be inverse operations
    int seconds = 45000;
    jt:LocalTime t = jt:ofSecondOfDay(seconds);
    test:assertEquals(t.toSecondOfDay(), seconds, "Round-tripping seconds of day should yield the same value");
}

// ===================================================================
// Addition arithmetic — extended cases, incl. midnight rollover
// ===================================================================

@test:Config {}
function testPlusMinutesWraparound() {
    jt:LocalTime t = jt:ofHourMinute(23, 55);
    jt:LocalTime next = t.plusMinutes(10);
    test:assertEquals(next.getHour(), 0, "23:55 + 10 minutes should roll over to the next day: 00:05");
    test:assertEquals(next.getMinute(), 5);
}

@test:Config {}
function testPlusSeconds_LocalTime() {
    jt:LocalTime t = jt:ofHourMinuteSecond(10, 0, 50);
    jt:LocalTime next = t.plusSeconds(20);
    test:assertEquals(next.getMinute(), 1, "10:00:50 + 20 seconds = 10:01:10");
    test:assertEquals(next.getSecond(), 10);
}

@test:Config {}
function testPlusNanos_LocalTime() {
    jt:LocalTime t = jt:ofHourMinuteSecondNano(0, 0, 0, 900000000);
    jt:LocalTime next = t.plusNanos(200000000);
    test:assertEquals(next.getSecond(), 1, "900ms + 200ms should roll over into the next second");
    test:assertEquals(next.getNano(), 100000000);
}

// ===================================================================
// Subtraction arithmetic — extended cases, incl. midnight rollover
// ===================================================================

@test:Config {}
function testMinusHoursWraparound() {
    jt:LocalTime t = jt:ofHourMinute(1, 0);
    jt:LocalTime prev = t.minusHours(2);
    test:assertEquals(prev.getHour(), 23, "01:00 - 2 hours should roll back to the previous day: 23:00");
}

@test:Config {}
function testMinusSeconds_LocalTime() {
    jt:LocalTime t = jt:ofHourMinuteSecond(10, 1, 10);
    jt:LocalTime prev = t.minusSeconds(20);
    test:assertEquals(prev.getMinute(), 0, "10:01:10 - 20 seconds = 10:00:50");
    test:assertEquals(prev.getSecond(), 50);
}

@test:Config {}
function testMinusNanos_LocalTime() {
    jt:LocalTime t = jt:ofHourMinuteSecondNano(0, 0, 1, 100000000);
    jt:LocalTime prev = t.minusNanos(200000000);
    test:assertEquals(prev.getSecond(), 0, "1s 100ms - 200ms should roll back into the previous second");
    test:assertEquals(prev.getNano(), 900000000);
}

// ===================================================================
// Altering individual fields (with*)
// ===================================================================

@test:Config {}
function testWithSecond_LocalTime() {
    jt:LocalTime t = jt:ofHourMinuteSecond(10, 15, 30);
    jt:LocalTime changed = t.withSecond(0);
    test:assertEquals(changed.getSecond(), 0);
    // Other fields should remain unchanged
    test:assertEquals(changed.getHour(), 10);
    test:assertEquals(changed.getMinute(), 15);
}

@test:Config {}
function testWithNano_LocalTime() {
    jt:LocalTime t = jt:ofHourMinuteSecond(10, 15, 30);
    jt:LocalTime changed = t.withNano(500000000);
    test:assertEquals(changed.getNano(), 500000000);
}

@test:Config {}
function testWithMethodsChainImmutability_LocalTime() {
    jt:LocalTime original = jt:ofHourMinuteSecond(10, 15, 30);
    jt:LocalTime _ = original.withHour(0).withMinute(0).withSecond(0).withNano(0);

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
    jt:LocalTime t = jt:ofHourMinuteSecond(22, 30, 0);
    jt:LocalTime result = t.plusHours(3).minusMinutes(15);

    // 22:30 + 3h = 01:30 (next day) - 15 minutes = 01:15
    test:assertEquals(result.getHour(), 1);
    test:assertEquals(result.getMinute(), 15);
}

// ===================================================================
// Negative cases
// ===================================================================

@test:Config {}
function testInvalidHourThrows_() {
    jt:LocalTime|error t = trap jt:ofHourMinute(24, 0);
    test:assertTrue(t is error);
}

@test:Config {}
function testNegativeHourThrows() {
    jt:LocalTime|error t = trap jt:ofHourMinute(-1, 0);
    test:assertTrue(t is error);
}

@test:Config {}
function testInvalidMinuteThrows_() {
    jt:LocalTime|error t = trap jt:ofHourMinute(10, 60);
    test:assertTrue(t is error);
}

@test:Config {}
function testInvalidSecondThrows_() {
    jt:LocalTime|error t = trap jt:ofHourMinuteSecond(10, 0, 60);
    test:assertTrue(t is error);
}

@test:Config {}
function testInvalidNanoOfDayThrows() {
    // max 86_399_999_999_999
    jt:LocalTime|error t = trap jt:ofNanoOfDay(86400000000000);
    test:assertTrue(t is error);
}

@test:Config {}
function testInvalidSecondOfDayThrows() {
    // max 86399
    jt:LocalTime|error t = trap jt:ofSecondOfDay(86400);
    test:assertTrue(t is error);
}

@test:Config {}
function testWithInvalidHourThrows_() {
    jt:LocalTime t = jt:ofHourMinute(10, 0);
    jt:LocalTime|error result = trap t.withHour(25);
    test:assertTrue(result is error);
}

@test:Config {}
function testWithInvalidMinuteThrows() {
    jt:LocalTime t = jt:ofHourMinute(10, 0);
    jt:LocalTime|error result = trap t.withMinute(60);
    test:assertTrue(result is error);
}

// ===== Hour =====
@test:Config {}
function testHourNegativeThrows_() {
    jt:LocalTime|error t = trap jt:ofHourMinute(-1, 0);
    test:assertTrue(t is error);
}

@test:Config {}
function testHour24Throws_() {
    jt:LocalTime|error t = trap jt:ofHourMinute(24, 0);
    test:assertTrue(t is error);
}

@test:Config {}
function testHour23IsValid_() {
    jt:LocalTime|error t = trap jt:ofHourMinute(23, 0);
    test:assertTrue(t is jt:LocalTime);
}

@test:Config {}
function testHour0IsValid_() {
    jt:LocalTime|error t = trap jt:ofHourMinute(0, 0);
    test:assertTrue(t is jt:LocalTime);
}

// ===== Minute =====
@test:Config {}
function testMinuteNegativeThrows_() {
    jt:LocalTime|error t = trap jt:ofHourMinute(10, -1);
    test:assertTrue(t is error);
}

@test:Config {}
function testMinute60Throws_() {
    jt:LocalTime|error t = trap jt:ofHourMinute(10, 60);
    test:assertTrue(t is error);
}

@test:Config {}
function testMinute59IsValid_() {
    jt:LocalTime|error t = trap jt:ofHourMinute(10, 59);
    test:assertTrue(t is jt:LocalTime);
}

// ===== Second =====
@test:Config {}
function testSecondNegativeThrows_() {
    jt:LocalTime|error t = trap jt:ofHourMinuteSecond(10, 0, -1);
    test:assertTrue(t is error);
}

@test:Config {}
function testSecond60Throws_() {
    jt:LocalTime|error t = trap jt:ofHourMinuteSecond(10, 0, 60);
    test:assertTrue(t is error);
}

@test:Config {}
function testSecond59IsValid_() {
    jt:LocalTime|error t = trap jt:ofHourMinuteSecond(10, 0, 59);
    test:assertTrue(t is jt:LocalTime);
}

// ===== Наносекунда =====
@test:Config {}
function testNanoNegativeThrows_() {
    jt:LocalTime|error t = trap jt:ofHourMinuteSecondNano(10, 0, 0, -1);
    test:assertTrue(t is error);
}

@test:Config {}
function testNano1000000000Throws_() {
    jt:LocalTime|error t = trap jt:ofHourMinuteSecondNano(10, 0, 0, 1000000000);
    test:assertTrue(t is error);
}

@test:Config {}
function testNano999999999IsValid_() {
    jt:LocalTime|error t = trap jt:ofHourMinuteSecondNano(10, 0, 0, 999999999);
    test:assertTrue(t is jt:LocalTime);
}

// ===== Секунда суток =====
@test:Config {}
function testSecondOfDayNegativeThrows() {
    jt:LocalTime|error t = trap jt:ofSecondOfDay(-1);
    test:assertTrue(t is error);
}

@test:Config {}
function testSecondOfDay86400Throws() {
    jt:LocalTime|error t = trap jt:ofSecondOfDay(86400);
    test:assertTrue(t is error);
}

@test:Config {}
function testSecondOfDay86399IsValid() {
    jt:LocalTime|error t = trap jt:ofSecondOfDay(86399);
    test:assertTrue(t is jt:LocalTime);
}

// ===== Наносекунда суток =====
@test:Config {}
function testNanoOfDayNegativeThrows() {
    jt:LocalTime|error t = trap jt:ofNanoOfDay(-1);
    test:assertTrue(t is error);
}

@test:Config {}
function testNanoOfDay86400000000000Throws() {
    jt:LocalTime|error t = trap jt:ofNanoOfDay(86400000000000);
    test:assertTrue(t is error);
}

@test:Config {}
function testNanoOfDay86399999999999IsValid() {
    jt:LocalTime|error t = trap jt:ofNanoOfDay(86399999999999);
    test:assertTrue(t is jt:LocalTime);
}