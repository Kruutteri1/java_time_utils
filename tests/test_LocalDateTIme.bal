import ballerina/test;

import kruutteri1/java_time_utils.javatime as jt;

// ===================================================================
// Creation — all factory functions
// ===================================================================

@test:Config {}
function testOfBasic_LocalDateTime() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 28);
    test:assertEquals(dt.getYear(), 2026);
    test:assertEquals(dt.getMonthValue(), 7);
    test:assertEquals(dt.getDayOfMonth(), 15);
    test:assertEquals(dt.getHour(), 14);
    test:assertEquals(dt.getMinute(), 28);
    test:assertEquals(dt.getSecond(), 0, "Second should default to 0 when not specified");
}

@test:Config {}
function testOfFull() {
    jt:LocalDateTime dt = jt:ofWithSeconds(2026, 7, 15, 14, 28, 19);
    test:assertEquals(dt.toString(), "2026-07-15T14:28:19");
}

@test:Config {}
function testOfFullWithNano() {
    jt:LocalDateTime dt = jt:ofWithNanos(2026, 7, 15, 14, 28, 19, 500000000);
    test:assertEquals(dt.getSecond(), 19);
    test:assertEquals(dt.getNano(), 500000000, "Nano-of-second should be 500000000");
}

@test:Config {}
function testOfLocalDateWithLocalTime() {
    jt:LocalDate d = jt:ofDate(2026, 7, 15);
    jt:LocalTime t = jt:ofTime(14, 28);
    jt:LocalDateTime dt = jt:ofLocalDateWithLocalTime(d, t);
    test:assertEquals(dt.toString(), "2026-07-15T14:28", "Combining a LocalDate and a LocalTime should produce the matching LocalDateTime");
}

@test:Config {}
function testConstantsMin_LocalDateTime() {
    jt:LocalDateTime min = jt:getMINDateTime();
    test:assertEquals(min.getYear(), -999999999, "MIN should have year -999999999");
    test:assertEquals(min.getHour(), 0);
    test:assertEquals(min.getMinute(), 0);
    test:assertEquals(min.getSecond(), 0);
}

@test:Config {}
function testConstantsMax() {
    jt:LocalDateTime max = jt:getMAXDateTime();
    test:assertEquals(max.getYear(), 999999999, "MAX should have year 999999999");
    test:assertEquals(max.getHour(), 23);
    test:assertEquals(max.getMinute(), 59);
    test:assertEquals(max.getSecond(), 59);
    test:assertEquals(max.getNano(), 999999999);
}

@test:Config {}
function testNowIsNotNull_LocalDateTime() {
    jt:LocalDateTime now = jt:getCurrentDateTime();
    test:assertTrue(now.getYear() > 2000, "LocalDateTime_now() should return a valid current-era date-time");
}

// ===================================================================
// toString and component getters
// ===================================================================

@test:Config {}
function testToStringFormat() {
    jt:LocalDateTime dt = jt:ofWithSeconds(2026, 1, 5, 9, 3, 7);
    test:assertEquals(dt.toString(), "2026-01-05T09:03:07", "String representation should be zero-padded ISO format");
}

@test:Config {}
function testGetYear_LocalDateTime() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 28);
    test:assertEquals(dt.getYear(), 2026);
}

@test:Config {}
function testGetMonthValue_LocalDateTime() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 28);
    test:assertEquals(dt.getMonthValue(), 7);
}

@test:Config {}
function testGetDayOfMonth_LocalDateTime() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 28);
    test:assertEquals(dt.getDayOfMonth(), 15);
}

@test:Config {}
function testGetDayOfYear_LocalDateTime() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 2, 1, 0, 0);
    test:assertEquals(dt.getDayOfYear(), 32, "February 1st should be day 32 of the year");
}

@test:Config {}
function testGetHour() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 28);
    test:assertEquals(dt.getHour(), 14);
}

@test:Config {}
function testGetMinute() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 28);
    test:assertEquals(dt.getMinute(), 28);
}

@test:Config {}
function testGetSecond() {
    jt:LocalDateTime dt = jt:ofWithSeconds(2026, 7, 15, 14, 28, 19);
    test:assertEquals(dt.getSecond(), 19);
}

@test:Config {}
function testGetNano() {
    jt:LocalDateTime dt = jt:ofWithNanos(2026, 7, 15, 14, 28, 19, 123456789);
    test:assertEquals(dt.getNano(), 123456789);
}

@test:Config {}
function testHashCodeConsistency() {
    jt:LocalDateTime dt1 = jt:ofDateTime(2026, 7, 15, 14, 28);
    jt:LocalDateTime dt2 = jt:ofDateTime(2026, 7, 15, 14, 28);
    test:assertEquals(dt1.hashCode(), dt2.hashCode(), "Hash codes of equal date-times should match");
}

// ===================================================================
// Comparison
// ===================================================================

@test:Config {}
function testEqualsTrueForSameValues() {
    jt:LocalDateTime dt1 = jt:ofDateTime(2026, 7, 15, 14, 28);
    jt:LocalDateTime dt2 = jt:ofDateTime(2026, 7, 15, 14, 28);
    test:assertTrue(dt1.isEquals(dt2), "Identical date-times should be equal");
}



@test:Config {}
function testEqualsFalseForDifferentValues() {
    jt:LocalDate dt1 = jt:ofDate(2026, 7, 15);
    jt:LocalDateTime dt2 = jt:ofDateTime(2026, 7, 15, 14, 29);
    test:assertFalse(dt1.isEquals(dt2), "Different date-times should not be equal");
}

// ===================================================================
// Extracting date and time
// ===================================================================

@test:Config {}
function testToLocalDate() {
    jt:LocalDateTime dt = jt:ofWithSeconds(2026, 7, 15, 14, 28, 19);
    jt:LocalDate d = dt.toLocalDate();
    test:assertEquals(d.toString(), "2026-07-15");
}

@test:Config {}
function testToLocalTime() {
    jt:LocalDateTime dt = jt:ofWithSeconds(2026, 7, 15, 14, 28, 19);
    jt:LocalTime t = dt.toLocalTime();
    test:assertEquals(t.toString(), "14:28:19");
}

@test:Config {}
function testToLocalDateAndTimeRoundTrip() {
    jt:LocalDateTime original = jt:ofWithSeconds(2026, 7, 15, 14, 28, 19);
    jt:LocalDate d = original.toLocalDate();
    jt:LocalTime t = original.toLocalTime();
    jt:LocalDateTime rebuilt = jt:ofLocalDateWithLocalTime(d, t);
    test:assertEquals(rebuilt.toString(), original.toString(), "Splitting into date/time and recombining should round-trip");
}

// ===================================================================
// Addition arithmetic
// ===================================================================

@test:Config {}
function testPlusDays_LocalDateTime() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 28);
    jt:LocalDateTime next = dt.plusDays(1);
    test:assertEquals(next.toString(), "2026-07-16T14:28");
}

@test:Config {}
function testPlusWeeks_LocalDateTime() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 28);
    jt:LocalDateTime next = dt.plusWeeks(1);
    test:assertEquals(next.toString(), "2026-07-22T14:28");
}

@test:Config {}
function testPlusMonths_LocalDateTime() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 28);
    jt:LocalDateTime next = dt.plusMonths(1);
    test:assertEquals(next.toString(), "2026-08-15T14:28");
}

@test:Config {}
function testPlusMonthsClampsShorterMonth_LocalDateTime() {
    // Jan 31 + 1 month should clamp to Feb 28 (non-leap year), time unaffected
    jt:LocalDateTime dt = jt:ofDateTime(2026, 1, 31, 10, 0);
    jt:LocalDateTime next = dt.plusMonths(1);
    test:assertEquals(next.toString(), "2026-02-28T10:00", "Day should be clamped when the target month is shorter");
}

@test:Config {}
function testPlusYears_LocalDateTime() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 28);
    jt:LocalDateTime next = dt.plusYears(1);
    test:assertEquals(next.toString(), "2027-07-15T14:28");
}

@test:Config {}
function testPlusHours() {
    jt:LocalDateTime dt = jt:ofWithSeconds(2026, 7, 15, 10, 0, 0);
    jt:LocalDateTime next = dt.plusHours(2);
    test:assertEquals(next.toString(), "2026-07-15T12:00");
}

@test:Config {}
function testPlusHoursCrossesMidnightIntoNextDay() {
    // Unlike a standalone LocalTime, LocalDateTime carries the date, so an
    // hour rollover past midnight increments the day instead of wrapping.
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 23, 0);
    jt:LocalDateTime next = dt.plusHours(2);
    test:assertEquals(next.toString(), "2026-07-16T01:00", "Crossing midnight should roll over to the next calendar day");
}

@test:Config {}
function testPlusMinutes() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 50);
    jt:LocalDateTime next = dt.plusMinutes(20);
    test:assertEquals(next.getHour(), 15);
    test:assertEquals(next.getMinute(), 10);
}

@test:Config {}
function testPlusSeconds() {
    jt:LocalDateTime dt = jt:ofWithSeconds(2026, 7, 15, 14, 28, 50);
    jt:LocalDateTime next = dt.plusSeconds(20);
    test:assertEquals(next.getMinute(), 29);
    test:assertEquals(next.getSecond(), 10);
}

@test:Config {}
function testPlusNanos() {
    jt:LocalDateTime dt = jt:ofWithNanos(2026, 7, 15, 0, 0, 0, 900000000);
    jt:LocalDateTime next = dt.plusNanos(200000000);
    test:assertEquals(next.getSecond(), 1, "900ms + 200ms should roll over into the next second");
    test:assertEquals(next.getNano(), 100000000);
}

// ===================================================================
// Subtraction arithmetic
// ===================================================================

@test:Config {}
function testMinusDays_LocalDateTime() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 28);
    jt:LocalDateTime prev = dt.minusDays(1);
    test:assertEquals(prev.toString(), "2026-07-14T14:28");
}

@test:Config {}
function testMinusWeeks_LocalDateTime() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 28);
    jt:LocalDateTime prev = dt.minusWeeks(1);
    test:assertEquals(prev.toString(), "2026-07-08T14:28");
}

@test:Config {}
function testMinusMonths_LocalDateTime() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 28);
    jt:LocalDateTime prev = dt.minusMonths(1);
    test:assertEquals(prev.toString(), "2026-06-15T14:28");
}

@test:Config {}
function testMinusYears_LocalDateTime() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 28);
    jt:LocalDateTime prev = dt.minusYears(1);
    test:assertEquals(prev.toString(), "2025-07-15T14:28");
}

@test:Config {}
function testMinusHoursCrossesMidnightIntoPreviousDay() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 1, 0);
    jt:LocalDateTime prev = dt.minusHours(2);
    test:assertEquals(prev.toString(), "2026-07-14T23:00", "Crossing midnight backwards should roll back to the previous calendar day");
}

@test:Config {}
function testMinusMinutes() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 10, 5);
    jt:LocalDateTime prev = dt.minusMinutes(10);
    test:assertEquals(prev.getHour(), 9);
    test:assertEquals(prev.getMinute(), 55);
}

@test:Config {}
function testMinusSeconds() {
    jt:LocalDateTime dt = jt:ofWithSeconds(2026, 7, 15, 10, 1, 10);
    jt:LocalDateTime prev = dt.minusSeconds(20);
    test:assertEquals(prev.getMinute(), 0);
    test:assertEquals(prev.getSecond(), 50);
}

@test:Config {}
function testMinusNanos() {
    jt:LocalDateTime dt = jt:ofWithNanos(2026, 7, 15, 0, 0, 1, 100000000);
    jt:LocalDateTime prev = dt.minusNanos(200000000);
    test:assertEquals(prev.getSecond(), 0, "1s 100ms - 200ms should roll back into the previous second");
    test:assertEquals(prev.getNano(), 900000000);
}

// ===================================================================
// Altering individual fields (with*)
// ===================================================================

@test:Config {}
function testWithYear_LocalDateTime() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 28);
    jt:LocalDateTime changed = dt.withYear(2030);
    test:assertEquals(changed.toString(), "2030-07-15T14:28");
}

@test:Config {}
function testWithMonth_LocalDateTime() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 28);
    jt:LocalDateTime changed = dt.withMonth(1);
    test:assertEquals(changed.toString(), "2026-01-15T14:28");
}

@test:Config {}
function testWithDayOfMonth_LocalDateTime() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 28);
    jt:LocalDateTime changed = dt.withDayOfMonth(1);
    test:assertEquals(changed.toString(), "2026-07-01T14:28");
}

@test:Config {}
function testWithDayOfYear_LocalDateTime() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 1, 1, 0, 0);
    jt:LocalDateTime changed = dt.withDayOfYear(200);
    test:assertEquals(changed.getDayOfYear(), 200);
}

@test:Config {}
function testWithHour() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 28);
    jt:LocalDateTime changed = dt.withHour(0);
    test:assertEquals(changed.getHour(), 0);
}

@test:Config {}
function testWithMinute() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 28);
    jt:LocalDateTime changed = dt.withMinute(0);
    test:assertEquals(changed.getMinute(), 0);
}

@test:Config {}
function testWithSecond() {
    jt:LocalDateTime dt = jt:ofWithSeconds(2026, 7, 15, 14, 28, 19);
    jt:LocalDateTime changed = dt.withSecond(0);
    test:assertEquals(changed.getSecond(), 0);
}

@test:Config {}
function testWithNano() {
    jt:LocalDateTime dt = jt:ofWithSeconds(2026, 7, 15, 14, 28, 19);
    jt:LocalDateTime changed = dt.withNano(500000000);
    test:assertEquals(changed.getNano(), 500000000);
}

@test:Config {}
function testWithMethodsChainImmutability() {
    jt:LocalDateTime original = jt:ofDateTime(2026, 7, 15, 14, 28);
    jt:LocalDateTime _ = original.withHour(0).withMinute(0).withSecond(0);

    // The original object should remain unchanged
    test:assertEquals(original.toString(), "2026-07-15T14:28");
}

// ===================================================================
// Complex scenarios: chaining multiple operations
// ===================================================================

@test:Config {}
function testMidnightScenarioFromDocs() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 28);
    jt:LocalDateTime midnight = dt.withHour(0).withMinute(0).withSecond(0);
    test:assertEquals(midnight.toString(), "2026-07-15T00:00");
}

@test:Config {}
function testComplexScenario() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 1, 31, 23, 30);
    jt:LocalDateTime result = dt.plusMonths(1).plusHours(1);

    // Jan 31 23:30 -> Feb 28 23:30 (clamped, non-leap year) -> + 1 hour -> Mar 1 00:30
    test:assertEquals(result.toString(), "2026-03-01T00:30");
}

// ===================================================================
// Negative cases
// ===================================================================

@test:Config {}
function testInvalidHourThrows() {
    jt:LocalDateTime|error dt = trap jt:ofDateTime(2026, 7, 15, 24, 0);
    test:assertTrue(dt is error);
}

@test:Config {}
function testInvalidMinuteThrows() {
    jt:LocalDateTime|error dt = trap jt:ofDateTime(2026, 7, 15, 10, 60);
    test:assertTrue(dt is error);
}

@test:Config {}
function testInvalidDayInDateTimeThrows() {
    jt:LocalDateTime|error dt = trap jt:ofDateTime(2026, 2, 30, 0, 0);
    test:assertTrue(dt is error);
}

@test:Config {}
function testInvalidSecondThrows() {
    jt:LocalDateTime|error dt = trap jt:ofWithSeconds(2026, 7, 15, 10, 0, 60);
    test:assertTrue(dt is error);
}

@test:Config {}
function testWithInvalidHourThrows() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 10, 0);
    jt:LocalDateTime|error result = trap dt.withHour(25);
    test:assertTrue(result is error);
}

// ===== Час =====
@test:Config {}
function testHourNegativeThrows() {
    jt:LocalDateTime|error dt = trap jt:ofDateTime(2026, 7, 15, -1, 0);
    test:assertTrue(dt is error);
}

@test:Config {}
function testHour24Throws() {
    jt:LocalDateTime|error dt = trap jt:ofDateTime(2026, 7, 15, 24, 0);
    test:assertTrue(dt is error);
}

@test:Config {}
function testHour23IsValid() {
    jt:LocalDateTime|error dt = trap jt:ofDateTime(2026, 7, 15, 23, 0);
    test:assertTrue(dt is jt:LocalDateTime);
}

@test:Config {}
function testHour0IsValid() {
    jt:LocalDateTime|error dt = trap jt:ofDateTime(2026, 7, 15, 0, 0);
    test:assertTrue(dt is jt:LocalDateTime);
}

// ===== Минута =====
@test:Config {}
function testMinuteNegativeThrows() {
    jt:LocalDateTime|error dt = trap jt:ofDateTime(2026, 7, 15, 10, -1);
    test:assertTrue(dt is error);
}

@test:Config {}
function testMinute60Throws() {
    jt:LocalDateTime|error dt = trap jt:ofDateTime(2026, 7, 15, 10, 60);
    test:assertTrue(dt is error);
}

@test:Config {}
function testMinute59IsValid() {
    jt:LocalDateTime|error dt = trap jt:ofDateTime(2026, 7, 15, 10, 59);
    test:assertTrue(dt is jt:LocalDateTime);
}

// ===== Секунда =====
@test:Config {}
function testSecondNegativeThrows() {
    jt:LocalDateTime|error dt = trap jt:ofWithSeconds(2026, 7, 15, 10, 0, -1);
    test:assertTrue(dt is error);
}

@test:Config {}
function testSecond60Throws() {
    jt:LocalDateTime|error dt = trap jt:ofWithSeconds(2026, 7, 15, 10, 0, 60);
    test:assertTrue(dt is error);
}

@test:Config {}
function testSecond59IsValid() {
    jt:LocalDateTime|error dt = trap jt:ofWithSeconds(2026, 7, 15, 10, 0, 59);
    test:assertTrue(dt is jt:LocalDateTime);
}

// ===== Наносекунда =====
@test:Config {}
function testNanoNegativeThrows() {
    jt:LocalDateTime|error dt = trap jt:ofWithNanos(2026, 7, 15, 10, 0, 0, -1);
    test:assertTrue(dt is error);
}

@test:Config {}
function testNano1000000000Throws() {
    // максимум 999999999
    jt:LocalDateTime|error dt = trap jt:ofWithNanos(2026, 7, 15, 10, 0, 0, 1000000000);
    test:assertTrue(dt is error);
}

@test:Config {}
function testNano999999999IsValid() {
    jt:LocalDateTime|error dt = trap jt:ofWithNanos(2026, 7, 15, 10, 0, 0, 999999999);
    test:assertTrue(dt is jt:LocalDateTime);
}
