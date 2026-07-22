import ballerina/test;

// ===================================================================
// Creation — all factory functions
// ===================================================================

@test:Config {}
function testOfBasic_LocalDateTime() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    test:assertEquals(dt.getYear(), 2026);
    test:assertEquals(dt.getMonthValue(), 7);
    test:assertEquals(dt.getDayOfMonth(), 15);
    test:assertEquals(dt.getHour(), 14);
    test:assertEquals(dt.getMinute(), 28);
    test:assertEquals(dt.getSecond(), 0, "Second should default to 0 when not specified");
}

@test:Config {}
function testLocalDateTimeOfMonthFullWithSecond() {
    Month jan = getJanuary();
    LocalDateTime ldt = checkpanic ofMonthFullWithsecond(2026, jan, 15, 14, 30, 45);

    test:assertEquals(ldt.getYear(), 2026);
    test:assertEquals(ldt.getMonthValue(), 1);
    test:assertEquals(ldt.getDayOfMonth(), 15);
    test:assertEquals(ldt.getHour(), 14);
    test:assertEquals(ldt.getMinute(), 30);
    test:assertEquals(ldt.getSecond(), 45);
}

@test:Config {}
function testLocalDateTimeOfMonthFullWithNano() {
    Month july = getJuly();
    LocalDateTime ldt = checkpanic ofMonthFullWithNano(2026, july, 21, 16, 17, 38, 123456789);

    test:assertEquals(ldt.getYear(), 2026);
    test:assertEquals(ldt.getMonthValue(), 7);
    test:assertEquals(ldt.getDayOfMonth(), 21);
    test:assertEquals(ldt.getHour(), 16);
    test:assertEquals(ldt.getMinute(), 17);
    test:assertEquals(ldt.getSecond(), 38);
    test:assertEquals(ldt.getNano(), 123456789);
}

@test:Config {}
function testLocalDateTimeOfMonthFullWithSecondInvalidDay() {
    // Attempting to create a LocalDateTime with an invalid day for February (e.g., February 30)
    Month feb = getFebruary();
    // This should panic or return an error depending on the underlying Java/Ballerina mapping behavior
    LocalDateTime|error? result = trap ofMonthFullWithsecond(2026, feb, 30, 12, 0, 0);
    test:assertTrue(result is error, "Expected an error for invalid day-of-month (February 30)");
}

@test:Config {}
function testLocalDateTimeOfMonthFullWithNanoInvalidHour() {
    // Attempting to create a LocalDateTime with an out-of-range hour (24)
    Month mar = getMarch();
    LocalDateTime|error? result = trap ofMonthFullWithNano(2026, mar, 15, 24, 0, 0, 0);
    test:assertTrue(result is error, "Expected an error for invalid hour (24)");
}

@test:Config {}
function testLocalDateTimeOfMonthFullWithSecondInvalidMonthDay() {
    // Attempting to create a LocalDateTime with April 31 (April only has 30 days)
    Month apr = getApril();
    LocalDateTime|error? result = trap ofMonthFullWithsecond(2026, apr, 31, 10, 15, 30);
    test:assertTrue(result is error, "Expected an error for invalid day-of-month for April (31)");
}

@test:Config {}
function testOfFull() {
    LocalDateTime dt = checkpanic ofWithSeconds(2026, 7, 15, 14, 28, 19);
    test:assertEquals(dt.toString(), "2026-07-15T14:28:19");
}

@test:Config {}
function testOfFullWithNano() {
    LocalDateTime dt = checkpanic ofWithNanos(2026, 7, 15, 14, 28, 19, 500000000);
    test:assertEquals(dt.getSecond(), 19);
    test:assertEquals(dt.getNano(), 500000000, "Nano-of-second should be 500000000");
}

@test:Config {}
function testOfLocalDateWithLocalTime() {
    LocalDate d = checkpanic ofDate(2026, 7, 15);
    LocalTime t = checkpanic ofTime(14, 28);
    LocalDateTime dt = ofLocalDateWithLocalTime(d, t);
    test:assertEquals(dt.toString(), "2026-07-15T14:28", "Combining a LocalDate and a LocalTime should produce the matching LocalDateTime");
}

@test:Config {}
function testConstantsMin_LocalDateTime() {
    LocalDateTime min = getMinDateTime();
    test:assertEquals(min.getYear(), -999999999, "MIN should have year -999999999");
    test:assertEquals(min.getHour(), 0);
    test:assertEquals(min.getMinute(), 0);
    test:assertEquals(min.getSecond(), 0);
}

@test:Config {}
function testConstantsMax() {
    LocalDateTime max = getMaxDateTime();
    test:assertEquals(max.getYear(), 999999999, "MAX should have year 999999999");
    test:assertEquals(max.getHour(), 23);
    test:assertEquals(max.getMinute(), 59);
    test:assertEquals(max.getSecond(), 59);
    test:assertEquals(max.getNano(), 999999999);
}

@test:Config {}
function testNowIsNotNull_LocalDateTime() {
    LocalDateTime now = getCurrentDateTime();
    test:assertTrue(now.getYear() > 2000, "LocalDateTime_now() should return a valid current-era date-time");
}

// ===================================================================
// toString and component getters
// ===================================================================

@test:Config {}
function testToStringFormat() {
    LocalDateTime dt = checkpanic ofWithSeconds(2026, 1, 5, 9, 3, 7);
    test:assertEquals(dt.toString(), "2026-01-05T09:03:07", "String representation should be zero-padded ISO format");
}

@test:Config {}
function testGetYear_LocalDateTime() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    test:assertEquals(dt.getYear(), 2026);
}

@test:Config {}
function testGetMonthValue_LocalDateTime() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    test:assertEquals(dt.getMonthValue(), 7);
}

@test:Config {}
function testGetDayOfMonth_LocalDateTime() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    test:assertEquals(dt.getDayOfMonth(), 15);
}

@test:Config {}
function testGetDayOfYear_LocalDateTime() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 2, 1, 0, 0);
    test:assertEquals(dt.getDayOfYear(), 32, "February 1st should be day 32 of the year");
}

@test:Config {}
function testGetHour() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    test:assertEquals(dt.getHour(), 14);
}

@test:Config {}
function testGetMinute() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    test:assertEquals(dt.getMinute(), 28);
}

@test:Config {}
function testGetSecond() {
    LocalDateTime dt = checkpanic ofWithSeconds(2026, 7, 15, 14, 28, 19);
    test:assertEquals(dt.getSecond(), 19);
}

@test:Config {}
function testGetNano() {
    LocalDateTime dt = checkpanic ofWithNanos(2026, 7, 15, 14, 28, 19, 123456789);
    test:assertEquals(dt.getNano(), 123456789);
}

@test:Config {}
function testHashCodeConsistency() {
    LocalDateTime dt1 = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    LocalDateTime dt2 = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    test:assertEquals(dt1.hashCode(), dt2.hashCode(), "Hash codes of equal date-times should match");
}

// ===================================================================
// Comparison
// ===================================================================

@test:Config {}
function testEqualsTrueForSameValues() {
    LocalDateTime dt1 = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    LocalDateTime dt2 = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    test:assertTrue(dt1.isEquals(dt2), "Identical date-times should be equal");
}

@test:Config {}
function testEqualsFalseForDifferentValues() {
    LocalDate dt1 = checkpanic ofDate(2026, 7, 15);
    LocalDateTime dt2 = checkpanic ofDateTime(2026, 7, 15, 14, 29);
    test:assertFalse(dt1.isEquals(dt2), "Different date-times should not be equal");
}

// ===================================================================
// Extracting date and time
// ===================================================================

@test:Config {}
function testToLocalDate() {
    LocalDateTime dt = checkpanic ofWithSeconds(2026, 7, 15, 14, 28, 19);
    LocalDate d = dt.toLocalDate();
    test:assertEquals(d.toString(), "2026-07-15");
}

@test:Config {}
function testToLocalTime() {
    LocalDateTime dt = checkpanic ofWithSeconds(2026, 7, 15, 14, 28, 19);
    LocalTime t = dt.toLocalTime();
    test:assertEquals(t.toString(), "14:28:19");
}

@test:Config {}
function testToLocalDateAndTimeRoundTrip() {
    LocalDateTime original = checkpanic ofWithSeconds(2026, 7, 15, 14, 28, 19);
    LocalDate d = original.toLocalDate();
    LocalTime t = original.toLocalTime();
    LocalDateTime rebuilt = ofLocalDateWithLocalTime(d, t);
    test:assertEquals(rebuilt.toString(), original.toString(), "Splitting into date/time and recombining should round-trip");
}

// ===================================================================
// Addition arithmetic
// ===================================================================

@test:Config {}
function testPlusDays_LocalDateTime() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    LocalDateTime next = dt.plusDays(1);
    test:assertEquals(next.toString(), "2026-07-16T14:28");
}

@test:Config {}
function testPlusWeeks_LocalDateTime() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    LocalDateTime next = dt.plusWeeks(1);
    test:assertEquals(next.toString(), "2026-07-22T14:28");
}

@test:Config {}
function testPlusMonths_LocalDateTime() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    LocalDateTime next = dt.plusMonths(1);
    test:assertEquals(next.toString(), "2026-08-15T14:28");
}

@test:Config {}
function testPlusMonthsClampsShorterMonth_LocalDateTime() {
    // Jan 31 + 1 month should clamp to Feb 28 (non-leap year), time unaffected
    LocalDateTime dt = checkpanic ofDateTime(2026, 1, 31, 10, 0);
    LocalDateTime next = dt.plusMonths(1);
    test:assertEquals(next.toString(), "2026-02-28T10:00", "Day should be clamped when the target month is shorter");
}

@test:Config {}
function testPlusYears_LocalDateTime() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    LocalDateTime next = dt.plusYears(1);
    test:assertEquals(next.toString(), "2027-07-15T14:28");
}

@test:Config {}
function testPlusHours() {
    LocalDateTime dt = checkpanic ofWithSeconds(2026, 7, 15, 10, 0, 0);
    LocalDateTime next = dt.plusHours(2);
    test:assertEquals(next.toString(), "2026-07-15T12:00");
}

@test:Config {}
function testPlusHoursCrossesMidnightIntoNextDay() {
    // Unlike a standalone LocalTime, LocalDateTime carries the date, so an
    // hour rollover past midnight increments the day instead of wrapping.
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 23, 0);
    LocalDateTime next = dt.plusHours(2);
    test:assertEquals(next.toString(), "2026-07-16T01:00", "Crossing midnight should roll over to the next calendar day");
}

@test:Config {}
function testPlusMinutes() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 14, 50);
    LocalDateTime next = dt.plusMinutes(20);
    test:assertEquals(next.getHour(), 15);
    test:assertEquals(next.getMinute(), 10);
}

@test:Config {}
function testPlusSeconds() {
    LocalDateTime dt = checkpanic ofWithSeconds(2026, 7, 15, 14, 28, 50);
    LocalDateTime next = dt.plusSeconds(20);
    test:assertEquals(next.getMinute(), 29);
    test:assertEquals(next.getSecond(), 10);
}

@test:Config {}
function testPlusNanos() {
    LocalDateTime dt = checkpanic ofWithNanos(2026, 7, 15, 0, 0, 0, 900000000);
    LocalDateTime next = dt.plusNanos(200000000);
    test:assertEquals(next.getSecond(), 1, "900ms + 200ms should roll over into the next second");
    test:assertEquals(next.getNano(), 100000000);
}

// ===================================================================
// Subtraction arithmetic
// ===================================================================

@test:Config {}
function testMinusDays_LocalDateTime() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    LocalDateTime prev = dt.minusDays(1);
    test:assertEquals(prev.toString(), "2026-07-14T14:28");
}

@test:Config {}
function testMinusWeeks_LocalDateTime() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    LocalDateTime prev = dt.minusWeeks(1);
    test:assertEquals(prev.toString(), "2026-07-08T14:28");
}

@test:Config {}
function testMinusMonths_LocalDateTime() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    LocalDateTime prev = dt.minusMonths(1);
    test:assertEquals(prev.toString(), "2026-06-15T14:28");
}

@test:Config {}
function testMinusYears_LocalDateTime() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    LocalDateTime prev = dt.minusYears(1);
    test:assertEquals(prev.toString(), "2025-07-15T14:28");
}

@test:Config {}
function testMinusHoursCrossesMidnightIntoPreviousDay() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 1, 0);
    LocalDateTime prev = dt.minusHours(2);
    test:assertEquals(prev.toString(), "2026-07-14T23:00", "Crossing midnight backwards should roll back to the previous calendar day");
}

@test:Config {}
function testMinusMinutes() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 10, 5);
    LocalDateTime prev = dt.minusMinutes(10);
    test:assertEquals(prev.getHour(), 9);
    test:assertEquals(prev.getMinute(), 55);
}

@test:Config {}
function testMinusSeconds() {
    LocalDateTime dt = checkpanic ofWithSeconds(2026, 7, 15, 10, 1, 10);
    LocalDateTime prev = dt.minusSeconds(20);
    test:assertEquals(prev.getMinute(), 0);
    test:assertEquals(prev.getSecond(), 50);
}

@test:Config {}
function testMinusNanos() {
    LocalDateTime dt = checkpanic ofWithNanos(2026, 7, 15, 0, 0, 1, 100000000);
    LocalDateTime prev = dt.minusNanos(200000000);
    test:assertEquals(prev.getSecond(), 0, "1s 100ms - 200ms should roll back into the previous second");
    test:assertEquals(prev.getNano(), 900000000);
}

// ===================================================================
// Altering individual fields (with*)
// ===================================================================

@test:Config {}
function testWithYear_LocalDateTime() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    LocalDateTime changed = dt.withYear(2030);
    test:assertEquals(changed.toString(), "2030-07-15T14:28");
}

@test:Config {}
function testWithMonth_LocalDateTime() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    LocalDateTime changed = dt.withMonth(1);
    test:assertEquals(changed.toString(), "2026-01-15T14:28");
}

@test:Config {}
function testWithDayOfMonth_LocalDateTime() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    LocalDateTime changed = dt.withDayOfMonth(1);
    test:assertEquals(changed.toString(), "2026-07-01T14:28");
}

@test:Config {}
function testWithDayOfYear_LocalDateTime() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 1, 1, 0, 0);
    LocalDateTime changed = dt.withDayOfYear(200);
    test:assertEquals(changed.getDayOfYear(), 200);
}

@test:Config {}
function testWithHour() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    LocalDateTime changed = dt.withHour(0);
    test:assertEquals(changed.getHour(), 0);
}

@test:Config {}
function testWithMinute() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    LocalDateTime changed = dt.withMinute(0);
    test:assertEquals(changed.getMinute(), 0);
}

@test:Config {}
function testWithSecond() {
    LocalDateTime dt = checkpanic ofWithSeconds(2026, 7, 15, 14, 28, 19);
    LocalDateTime changed = dt.withSecond(0);
    test:assertEquals(changed.getSecond(), 0);
}

@test:Config {}
function testWithNano() {
    LocalDateTime dt = checkpanic ofWithSeconds(2026, 7, 15, 14, 28, 19);
    LocalDateTime changed = dt.withNano(500000000);
    test:assertEquals(changed.getNano(), 500000000);
}

@test:Config {}
function testWithMethodsChainImmutability() {
    LocalDateTime original = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    LocalDateTime _ = original.withHour(0).withMinute(0).withSecond(0);

    // The original object should remain unchanged
    test:assertEquals(original.toString(), "2026-07-15T14:28");
}

// ===================================================================
// Complex scenarios: chaining multiple operations
// ===================================================================

@test:Config {}
function testMidnightScenarioFromDocs() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 14, 28);
    LocalDateTime midnight = dt.withHour(0).withMinute(0).withSecond(0);
    test:assertEquals(midnight.toString(), "2026-07-15T00:00");
}

@test:Config {}
function testComplexScenario() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 1, 31, 23, 30);
    LocalDateTime result = dt.plusMonths(1).plusHours(1);

    // Jan 31 23:30 -> Feb 28 23:30 (clamped, non-leap year) -> + 1 hour -> Mar 1 00:30
    test:assertEquals(result.toString(), "2026-03-01T00:30");
}

// ===================================================================
// Negative cases
// ===================================================================

@test:Config {}
function testInvalidHourThrows() {
    LocalDateTime|error dt = trap ofDateTime(2026, 7, 15, 24, 0);
    test:assertTrue(dt is error);
}

@test:Config {}
function testInvalidMinuteThrows() {
    LocalDateTime|error dt = trap ofDateTime(2026, 7, 15, 10, 60);
    test:assertTrue(dt is error);
}

@test:Config {}
function testInvalidDayInDateTimeThrows() {
    LocalDateTime|error dt = trap ofDateTime(2026, 2, 30, 0, 0);
    test:assertTrue(dt is error);
}

@test:Config {}
function testInvalidSecondThrows() {
    LocalDateTime|error dt = trap ofWithSeconds(2026, 7, 15, 10, 0, 60);
    test:assertTrue(dt is error);
}

@test:Config {}
function testWithInvalidHourThrows() {
    LocalDateTime dt = checkpanic ofDateTime(2026, 7, 15, 10, 0);
    LocalDateTime|error result = trap dt.withHour(25);
    test:assertTrue(result is error);
}

// ===== Час =====
@test:Config {}
function testHourNegativeThrows() {
    LocalDateTime|error dt = trap ofDateTime(2026, 7, 15, -1, 0);
    test:assertTrue(dt is error);
}

@test:Config {}
function testHour24Throws() {
    LocalDateTime|error dt = trap ofDateTime(2026, 7, 15, 24, 0);
    test:assertTrue(dt is error);
}

@test:Config {}
function testHour23IsValid() {
    LocalDateTime|error dt = trap ofDateTime(2026, 7, 15, 23, 0);
    test:assertTrue(dt is LocalDateTime);
}

@test:Config {}
function testHour0IsValid() {
    LocalDateTime|error dt = trap ofDateTime(2026, 7, 15, 0, 0);
    test:assertTrue(dt is LocalDateTime);
}

// ===== Минута =====
@test:Config {}
function testMinuteNegativeThrows() {
    LocalDateTime|error dt = trap ofDateTime(2026, 7, 15, 10, -1);
    test:assertTrue(dt is error);
}

@test:Config {}
function testMinute60Throws() {
    LocalDateTime|error dt = trap ofDateTime(2026, 7, 15, 10, 60);
    test:assertTrue(dt is error);
}

@test:Config {}
function testMinute59IsValid() {
    LocalDateTime|error dt = trap ofDateTime(2026, 7, 15, 10, 59);
    test:assertTrue(dt is LocalDateTime);
}

// ===== Секунда =====
@test:Config {}
function testSecondNegativeThrows() {
    LocalDateTime|error dt = trap ofWithSeconds(2026, 7, 15, 10, 0, -1);
    test:assertTrue(dt is error);
}

@test:Config {}
function testSecond60Throws() {
    LocalDateTime|error dt = trap ofWithSeconds(2026, 7, 15, 10, 0, 60);
    test:assertTrue(dt is error);
}

@test:Config {}
function testSecond59IsValid() {
    LocalDateTime|error dt = trap ofWithSeconds(2026, 7, 15, 10, 0, 59);
    test:assertTrue(dt is LocalDateTime);
}

// ===== Наносекунда =====
@test:Config {}
function testNanoNegativeThrows() {
    LocalDateTime|error dt = trap ofWithNanos(2026, 7, 15, 10, 0, 0, -1);
    test:assertTrue(dt is error);
}

@test:Config {}
function testNano1000000000Throws() {
    // максимум 999999999
    LocalDateTime|error dt = trap ofWithNanos(2026, 7, 15, 10, 0, 0, 1000000000);
    test:assertTrue(dt is error);
}

@test:Config {}
function testNano999999999IsValid() {
    LocalDateTime|error dt = trap ofWithNanos(2026, 7, 15, 10, 0, 0, 999999999);
    test:assertTrue(dt is LocalDateTime);
}
