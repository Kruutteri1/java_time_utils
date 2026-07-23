import ballerina/test;

// ===================================================================
// Creation — all factory functions
// ===================================================================

@test:Config {}
function testOfBasic() {
    LocalDate d = checkpanic ofDate(2026, 7, 15);
    test:assertEquals(d.getYear(), 2026);
    test:assertEquals(d.getMonthValue(), 7);
    test:assertEquals(d.getDayOfMonth(), 15);
}

@test:Config {}
function testLocalDateOfMonthValid() {
    Month oct = getOctober();
    LocalDate ld = checkpanic ofMonth(2026, oct, 31);

    test:assertEquals(ld.getYear(), 2026);
    test:assertEquals(ld.getMonthValue(), 10);
    test:assertEquals(ld.getDayOfMonth(), 31);
}

@test:Config {}
function testLocalDateOfMonthLeapYear() {
    Month feb = getFebruary();
    LocalDate ld = checkpanic ofMonth(2024, feb, 29);

    test:assertEquals(ld.getYear(), 2024);
    test:assertEquals(ld.getMonthValue(), 2);
    test:assertEquals(ld.getDayOfMonth(), 29);
}

@test:Config {}
function testLocalDateOfMonthInvalidDayForMonth() {
    Month june = getJune();
    LocalDate|error? result = trap ofMonth(2026, june, 31);
    test:assertTrue(result is error, "Expected an error for invalid day-of-month for June (31)");
}

@test:Config {}
function testLocalDateOfMonthInvalidLeapYearDay() {
    Month feb = getFebruary();
    LocalDate|error? result = trap ofMonth(2026, feb, 29);
    test:assertTrue(result is error, "Expected an error for February 29 on a non-leap year");
}

@test:Config {}
function testOfEpochDayZero() {
    LocalDate d = checkpanic ofEpochDay(0);
    test:assertEquals(d.toString(), "1970-01-01", "Epoch day 0 should be 1970-01-01");
}

@test:Config {}
function testOfEpochDayNegative() {
    LocalDate d = checkpanic ofEpochDay(-1);
    test:assertEquals(d.toString(), "1969-12-31", "Epoch day -1 should be the day before the epoch");
}

@test:Config {}
function testOfEpochDayPositive() {
    LocalDate d = checkpanic ofEpochDay(1);
    test:assertEquals(d.toString(), "1970-01-02");
}

@test:Config {}
function testOfYearDay() {
    LocalDate d = checkpanic ofYearDay(2026, 1);
    test:assertEquals(d.toString(), "2026-01-01", "Day 1 of the year should be January 1st");
}

@test:Config {}
function testOfYearDayMidYear() {
    // 2026 is not a leap year; day 200 falls in July
    LocalDate d = checkpanic ofYearDay(2026, 200);
    test:assertEquals(d.getMonthValue(), 7);
    test:assertEquals(d.getDayOfYear(), 200);
}

@test:Config {}
function testConstantsMin() {
    LocalDate min = getMinDate();
    test:assertEquals(min.getYear(), -999999999, "MIN should have year -999999999");
    test:assertEquals(min.getMonthValue(), 1);
    test:assertEquals(min.getDayOfMonth(), 1);
}

@test:Config {}
function testConstantsMax_LocalDate() {
    LocalDate max = getMaxDate();
    test:assertEquals(max.getYear(), 999999999, "MAX should have year 999999999");
    test:assertEquals(max.getMonthValue(), 12);
    test:assertEquals(max.getDayOfMonth(), 31);
}

@test:Config {}
function testConstantsEpoch() {
    LocalDate epoch = getEpochDate();
    test:assertEquals(epoch.toString(), "1970-01-01", "EPOCH should be 1970-01-01");
}

@test:Config {}
function testNowIsNotNull() {
    LocalDate today = getCurrentDate();
    test:assertTrue(today.getYear() > 2000, "LocalDate_now() should return a valid current-era date");
}

// ===================================================================
// toString and component getters
// ===================================================================

@test:Config {}
function testToStringFormat_LocalDate() {
    LocalDate d = checkpanic ofDate(2026, 1, 5);
    test:assertEquals(d.toString(), "2026-01-05", "String representation should be zero-padded ISO format");
}

@test:Config {}
function testGetYear() {
    LocalDate d = checkpanic ofDate(2026, 7, 15);
    test:assertEquals(d.getYear(), 2026);
}

@test:Config {}
function testGetMonthValue() {
    LocalDate d = checkpanic ofDate(2026, 7, 15);
    test:assertEquals(d.getMonthValue(), 7);
}

@test:Config {}
function testGetDayOfMonth() {
    LocalDate d = checkpanic ofDate(2026, 7, 15);
    test:assertEquals(d.getDayOfMonth(), 15);
}

@test:Config {}
function testGetDayOfYear() {
    LocalDate d = checkpanic ofDate(2026, 2, 1);
    test:assertEquals(d.getDayOfYear(), 32, "February 1st should be day 32 of the year");
}

@test:Config {}
function testHashCodeConsistency_LocalDate() {
    LocalDate d1 = checkpanic ofDate(2026, 7, 15);
    LocalDate d2 = checkpanic ofDate(2026, 7, 15);
    test:assertEquals(d1.hashCode(), d2.hashCode(), "Hash codes of equal dates should match");
}

// ===================================================================
// Getters returning object types
// ===================================================================

// ===================================================================
// Comparison
// ===================================================================

@test:Config {}
function testEqualsTrueForSameValues_LocalDate() {
    LocalDate d1 = checkpanic ofDate(2026, 7, 15);
    LocalDate d2 = checkpanic ofDate(2026, 7, 15);
    test:assertTrue(d1.isEquals(d2), "Identical dates should be equal");
}

@test:Config {}
function testEqualsFalseForDifferentDates() {
    LocalDate d1 = checkpanic ofDate(2026, 7, 15);
    LocalDate d2 = checkpanic ofDate(2026, 7, 16);
    LocalDateTime d3 = getCurrentDateTime();

    test:assertFalse(d1.isEquals(d2), "Different dates should not be equal");
    test:assertFalse(d1.isEquals(d3), "Different dates should not be equal");

}

// ===================================================================
// Checks and metadata
// ===================================================================

@test:Config {}
function testIsLeapYearTrue() {
    LocalDate d = checkpanic ofDate(2024, 1, 1);
    test:assertTrue(d.isLeapYear(), "2024 should be a leap year");
}

@test:Config {}
function testIsLeapYearFalse() {
    LocalDate d = checkpanic ofDate(2026, 1, 1);
    test:assertFalse(d.isLeapYear(), "2026 should not be a leap year");
}

@test:Config {}
function testIsLeapYearCentury() {
    // 1900 is divisible by 4 and 100, but not by 400 — not a leap year
    LocalDate d = checkpanic ofDate(1900, 1, 1);
    test:assertFalse(d.isLeapYear(), "1900 should not be a leap year despite being divisible by 4");
}

@test:Config {}
function testLengthOfMonth31Days() {
    LocalDate d = checkpanic ofDate(2026, 1, 1);
    test:assertEquals(d.lengthOfMonth(), 31, "January should have 31 days");
}

@test:Config {}
function testLengthOfMonthFebruaryNonLeap() {
    LocalDate d = checkpanic ofDate(2026, 2, 1);
    test:assertEquals(d.lengthOfMonth(), 28, "February in a non-leap year should have 28 days");
}

@test:Config {}
function testLengthOfMonthFebruaryLeap() {
    LocalDate d = checkpanic ofDate(2024, 2, 1);
    test:assertEquals(d.lengthOfMonth(), 29, "February in a leap year should have 29 days");
}

@test:Config {}
function testLengthOfYearNonLeap() {
    LocalDate d = checkpanic ofDate(2026, 1, 1);
    test:assertEquals(d.lengthOfYear(), 365, "A non-leap year should have 365 days");
}

@test:Config {}
function testLengthOfYearLeap() {
    LocalDate d = checkpanic ofDate(2024, 1, 1);
    test:assertEquals(d.lengthOfYear(), 366, "A leap year should have 366 days");
}

@test:Config {}
function testToEpochDay() {
    LocalDate d = checkpanic ofDate(1970, 1, 1);
    test:assertEquals(d.toEpochDay(), 0, "1970-01-01 should be epoch day 0");
}

@test:Config {}
function testToEpochDayDifference() {
    LocalDate d1 = checkpanic ofDate(2026, 7, 20);
    LocalDate d2 = checkpanic ofDate(2026, 7, 15);
    test:assertEquals(d1.toEpochDay() - d2.toEpochDay(), 5, "Epoch day difference should give the number of days between two dates");
}

// ===================================================================
// Combining with time (producing LocalDateTime)
// ===================================================================

@test:Config {}
function testAtStartOfDay() {
    LocalDate d = checkpanic ofDate(2026, 7, 15);
    LocalDateTime dt = d.atStartOfDay();
    test:assertEquals(dt.toString(), "2026-07-15T00:00", "atStartOfDay() should combine the date with midnight");
}

@test:Config {}
function testAtTime() {
    LocalDate d = checkpanic ofDate(2026, 7, 15);
    LocalDateTime dt = d.atTime(14, 28);
    test:assertEquals(dt.toString(), "2026-07-15T14:28");
}

@test:Config {}
function testAtTimeDetailed() {
    LocalDate d = checkpanic ofDate(2026, 7, 15);
    LocalDateTime dt = d.atTimeDetailed(14, 28, 19);
    test:assertEquals(dt.toString(), "2026-07-15T14:28:19");
}

@test:Config {}
function testAtTimeFull() {
    LocalDate d = checkpanic ofDate(2026, 7, 15);
    LocalDateTime dt = d.atTimeFull(14, 28, 19, 500000000);
    test:assertEquals(dt.getHour(), 14);
    test:assertEquals(dt.getMinute(), 28);
    test:assertEquals(dt.getSecond(), 19);
    test:assertEquals(dt.getNano(), 500000000);
}

// ===================================================================
// Addition arithmetic
// ===================================================================

@test:Config {}
function testPlusDays() {
    LocalDate d = checkpanic ofDate(2026, 7, 15);
    LocalDate next = d.plusDays(1);
    test:assertEquals(next.toString(), "2026-07-16");
}

@test:Config {}
function testPlusDaysMonthRollover() {
    LocalDate d = checkpanic ofDate(2026, 1, 31);
    LocalDate next = d.plusDays(1);
    test:assertEquals(next.toString(), "2026-02-01", "Adding a day past month end should roll over to the next month");
}

@test:Config {}
function testPlusWeeks() {
    LocalDate d = checkpanic ofDate(2026, 7, 15);
    LocalDate next = d.plusWeeks(1);
    test:assertEquals(next.toString(), "2026-07-22");
}

@test:Config {}
function testPlusMonths() {
    LocalDate d = checkpanic ofDate(2026, 7, 15);
    LocalDate next = d.plusMonths(1);
    test:assertEquals(next.toString(), "2026-08-15");
}

@test:Config {}
function testPlusMonthsYearRollover() {
    LocalDate d = checkpanic ofDate(2026, 12, 15);
    LocalDate next = d.plusMonths(1);
    test:assertEquals(next.toString(), "2027-01-15", "Adding a month past December should roll over to the next year");
}

@test:Config {}
function testPlusMonthsClampsShorterMonth() {
    // Jan 31 + 1 month should clamp to Feb 28 (non-leap year)
    LocalDate d = checkpanic ofDate(2026, 1, 31);
    LocalDate next = d.plusMonths(1);
    test:assertEquals(next.toString(), "2026-02-28", "Day should be clamped when the target month is shorter");
}

@test:Config {}
function testPlusYears() {
    LocalDate d = checkpanic ofDate(2026, 7, 15);
    LocalDate next = d.plusYears(1);
    test:assertEquals(next.toString(), "2027-07-15");
}

@test:Config {}
function testPlusYearsLeapDayClamped() {
    // Feb 29, 2024 + 1 year should clamp to Feb 28, 2025 (non-leap year)
    LocalDate d = checkpanic ofDate(2024, 2, 29);
    LocalDate next = d.plusYears(1);
    test:assertEquals(next.toString(), "2025-02-28", "Feb 29 should be clamped to Feb 28 in a non-leap year");
}

// ===================================================================
// Subtraction arithmetic
// ===================================================================

@test:Config {}
function testMinusDays() {
    LocalDate d = checkpanic ofDate(2026, 7, 15);
    LocalDate prev = d.minusDays(1);
    test:assertEquals(prev.toString(), "2026-07-14");
}

@test:Config {}
function testMinusDaysMonthRollover() {
    LocalDate d = checkpanic ofDate(2026, 3, 1);
    LocalDate prev = d.minusDays(1);
    test:assertEquals(prev.toString(), "2026-02-28", "Subtracting a day from the 1st should roll back to the previous month");
}

@test:Config {}
function testMinusWeeks() {
    LocalDate d = checkpanic ofDate(2026, 7, 15);
    LocalDate prev = d.minusWeeks(1);
    test:assertEquals(prev.toString(), "2026-07-08");
}

@test:Config {}
function testMinusMonths() {
    LocalDate d = checkpanic ofDate(2026, 7, 15);
    LocalDate prev = d.minusMonths(1);
    test:assertEquals(prev.toString(), "2026-06-15");
}

@test:Config {}
function testMinusMonthsYearRollover() {
    LocalDate d = checkpanic ofDate(2026, 1, 15);
    LocalDate prev = d.minusMonths(1);
    test:assertEquals(prev.toString(), "2025-12-15", "Subtracting a month from January should roll back to the previous year");
}

@test:Config {}
function testMinusYears() {
    LocalDate d = checkpanic ofDate(2026, 7, 15);
    LocalDate prev = d.minusYears(1);
    test:assertEquals(prev.toString(), "2025-07-15");
}

// ===================================================================
// Altering individual fields (with*)
// ===================================================================

@test:Config {}
function testWithYear() {
    LocalDate d = checkpanic ofDate(2026, 7, 15);
    LocalDate changed = d.withYear(2030);
    test:assertEquals(changed.toString(), "2030-07-15");
}

@test:Config {}
function testWithMonth() {
    LocalDate d = checkpanic ofDate(2026, 7, 15);
    LocalDate changed = d.withMonth(1);
    test:assertEquals(changed.toString(), "2026-01-15");
}

@test:Config {}
function testWithDayOfMonth() {
    LocalDate d = checkpanic ofDate(2026, 7, 15);
    LocalDate changed = d.withDayOfMonth(1);
    test:assertEquals(changed.toString(), "2026-07-01");
}

@test:Config {}
function testWithDayOfYear() {
    LocalDate d = checkpanic ofDate(2026, 1, 1);
    LocalDate changed = d.withDayOfYear(200);
    test:assertEquals(changed.getDayOfYear(), 200);
}

@test:Config {}
function testWithMethodsChainImmutability_LocalDate() {
    LocalDate original = checkpanic ofDate(2026, 7, 15);
    LocalDate _ = original.withYear(2030).withMonth(1).withDayOfMonth(1);

    // The original object should remain unchanged
    test:assertEquals(original.toString(), "2026-07-15");
}

// ===================================================================
// Complex scenario: chaining multiple operations
// ===================================================================

@test:Config {}
function testComplexScenario_LocalDate() {
    LocalDate d = checkpanic ofDate(2026, 1, 31);
    LocalDate result = d.plusMonths(1).plusDays(10);

    // Jan 31 + 1 month -> Feb 28 (clamped, non-leap year) + 10 days -> Mar 10
    test:assertEquals(result.toString(), "2026-03-10");
}

@test:Config {}
function testNewYearsDayScenario() {
    LocalDate d = checkpanic ofDate(2026, 7, 15);
    LocalDate newYearDay = d.withMonth(1).withDayOfMonth(1);
    test:assertEquals(newYearDay.toString(), "2026-01-01");
}

// ===================================================================
// Negative cases
// ===================================================================

@test:Config {}
function testInvalidMonthThrows() {
    LocalDate|error d = trap ofDate(2026, 13, 1);
    test:assertTrue(d is error);
}

@test:Config {}
function testInvalidMonthZeroThrows() {
    LocalDate|error d = trap ofDate(2026, 0, 1);
    test:assertTrue(d is error);
}

@test:Config {}
function testInvalidDayThrows() {
    LocalDate|error d = trap ofDate(2026, 1, 32);
    test:assertTrue(d is error);
}

@test:Config {}
function testFeb30NeverValidThrows() {
    LocalDate|error d = trap ofDate(2026, 2, 30);
    test:assertTrue(d is error);
}

@test:Config {}
function testFeb29OnNonLeapYearThrows() {
    // 2026 is not a leap year
    LocalDate|error d = trap ofDate(2026, 2, 29);
    test:assertTrue(d is error);
}

@test:Config {}
function testWithInvalidDayOfMonthThrows() {
    LocalDate d = checkpanic ofDate(2026, 2, 1);
    LocalDate|error result = trap d.withDayOfMonth(30);
    test:assertTrue(result is error);
}

@test:Config {}
function testWithInvalidMonthThrows() {
    LocalDate d = checkpanic ofDate(2026, 1, 1);
    LocalDate|error result = trap d.withMonth(13);
    test:assertTrue(result is error);
}

@test:Config {}
function testInvalidDayOfYearThrows() {
    // 2026 is not a leap year → max 365
    LocalDate|error d = trap ofYearDay(2026, 366);
    test:assertTrue(d is error);
}

// ===== Месяц =====
@test:Config {}
function testMonthZeroThrows() {
    LocalDate|error d = trap ofDate(2026, 0, 1);
    test:assertTrue(d is error);
}

@test:Config {}
function testMonthNegativeThrows() {
    LocalDate|error d = trap ofDate(2026, -1, 1);
    test:assertTrue(d is error);
}

@test:Config {}
function testMonth13Throws() {
    LocalDate|error d = trap ofDate(2026, 13, 1);
    test:assertTrue(d is error);
}

@test:Config {}
function testMonth12IsValid() {
    LocalDate|error d = trap ofDate(2026, 12, 1);
    test:assertTrue(d is LocalDate);
}

@test:Config {}
function testMonth1IsValid() {
    LocalDate|error d = trap ofDate(2026, 1, 1);
    test:assertTrue(d is LocalDate);
}

// ===== День месяца =====
@test:Config {}
function testDayZeroThrows() {
    LocalDate|error d = trap ofDate(2026, 1, 0);
    test:assertTrue(d is error);
}

@test:Config {}
function testDayNegativeThrows() {
    LocalDate|error d = trap ofDate(2026, 1, -1);
    test:assertTrue(d is error);
}

@test:Config {}
function testDay32Throws() {
    LocalDate|error d = trap ofDate(2026, 1, 32);
    test:assertTrue(d is error);
}

@test:Config {}
function testDay31InJanuaryIsValid() {
    LocalDate|error d = trap ofDate(2026, 1, 31);
    test:assertTrue(d is LocalDate);
}

@test:Config {}
function testDay31InAprilThrows() {
    // в апреле только 30 дней
    LocalDate|error d = trap ofDate(2026, 4, 31);
    test:assertTrue(d is error);
}

@test:Config {}
function testDay30InAprilIsValid() {
    LocalDate|error d = trap ofDate(2026, 4, 30);
    test:assertTrue(d is LocalDate);
}

// ===== День года =====
@test:Config {}
function testDayOfYearZeroThrows() {
    LocalDate|error d = trap ofYearDay(2026, 0);
    test:assertTrue(d is error);
}

@test:Config {}
function testDayOfYear366OnNonLeapYearThrows() {
    LocalDate|error d = trap ofYearDay(2026, 366);
    test:assertTrue(d is error);
}

@test:Config {}
function testDayOfYear366OnLeapYearIsValid() {
    LocalDate|error d = trap ofYearDay(2024, 366);
    test:assertTrue(d is LocalDate);
}

@test:Config {}
function testDayOfYear367Throws() {
    LocalDate|error d = trap ofYearDay(2024, 367);
    test:assertTrue(d is error);
}

@test:Config {}
function testDayOfYear365IsValid() {
    LocalDate|error d = trap ofYearDay(2026, 365);
    test:assertTrue(d is LocalDate);
}


@test:Config
function testParseDefaultIso() returns error? {
    LocalDate date = check parse("2026-07-22");
    test:assertNotEquals(date, (), "Parsed LocalDate should not be null");
}

@test:Config
function testParseDefaultIsoInvalidFormat() {
    LocalDate|error result = parse("22-07-2026");
    test:assertTrue(result is error, "Parsing invalid ISO date format should result in an error");
}

@test:Config
function testParseWithFormatter() returns error? {
    DateTimeFormatter formatter = check ofPattern("dd.MM.yyyy");
    LocalDate date = check parseWithFormatter("22.07.2026", formatter);
    test:assertNotEquals(date, (), "Parsed LocalDate with custom formatter should not be null");
}

@test:Config
function testParseWithFormatterMismatch() returns error? {
    DateTimeFormatter formatter = check ofPattern("yyyy-MM-dd");
    LocalDate|error result = parseWithFormatter("22.07.2026", formatter);
    test:assertTrue(result is error, "Mismatched pattern and text should result in an error");
}



// ===================================================================
// isAfter / isBefore — comparing LocalDate against LocalDate
// ===================================================================

@test:Config {}
function testIsAfterTrueForLaterDate() {
    LocalDate date1 = checkpanic ofDate(2026, 7, 16);
    LocalDate date2 = checkpanic ofDate(2026, 7, 15);
    test:assertTrue(date1.isAfter(date2), "2026-07-16 should be after 2026-07-15");
}

@test:Config {}
function testIsAfterFalseForEarlierDate() {
    LocalDate date1 = checkpanic ofDate(2026, 7, 14);
    LocalDate date2 = checkpanic ofDate(2026, 7, 15);
    test:assertFalse(date1.isAfter(date2), "2026-07-14 should not be after 2026-07-15");
}

@test:Config {}
function testIsAfterFalseForEqualDates() {
    LocalDate date1 = checkpanic ofDate(2026, 7, 15);
    LocalDate date2 = checkpanic ofDate(2026, 7, 15);
    test:assertFalse(date1.isAfter(date2), "A date cannot be after an equal date");
}

@test:Config {}
function testIsBeforeTrueForEarlierDate() {
    LocalDate date1 = checkpanic ofDate(2026, 7, 14);
    LocalDate date2 = checkpanic ofDate(2026, 7, 15);
    test:assertTrue(date1.isBefore(date2), "2026-07-14 should be before 2026-07-15");
}

@test:Config {}
function testIsBeforeFalseForLaterDate() {
    LocalDate date1 = checkpanic ofDate(2026, 7, 16);
    LocalDate date2 = checkpanic ofDate(2026, 7, 15);
    test:assertFalse(date1.isBefore(date2), "2026-07-16 should not be before 2026-07-15");
}

@test:Config {}
function testIsBeforeFalseForEqualDates() {
    LocalDate date1 = checkpanic ofDate(2026, 7, 15);
    LocalDate date2 = checkpanic ofDate(2026, 7, 15);
    test:assertFalse(date1.isBefore(date2), "A date cannot be before an equal date");
}

// ===================================================================
// isAfter / isBefore — comparing LocalDate against LocalDateTime
// (time component of the LocalDateTime must be ignored)
// ===================================================================

@test:Config {}
function testIsAfterTrueWhenDateLaterThanDateTime() {
    LocalDate date = checkpanic ofDate(2026, 7, 16);
    LocalDateTime dateTime = checkpanic ofDateTime(2026, 7, 15, 23, 59);
    test:assertTrue(date.isAfter(dateTime), "2026-07-16 should be after 2026-07-15T23:59");
}

@test:Config {}
function testIsAfterFalseWhenDateEarlierThanDateTime() {
    LocalDate date = checkpanic ofDate(2026, 7, 14);
    LocalDateTime dateTime = checkpanic ofDateTime(2026, 7, 15, 0, 1);
    test:assertFalse(date.isAfter(dateTime), "2026-07-14 should not be after 2026-07-15T00:01");
}

@test:Config {}
function testIsAfterFalseWhenSameDayIgnoringTime() {
    // Same calendar day, but the LocalDateTime's time is late in the day —
    // this must NOT make the date "before", since time is ignored.
    LocalDate date = checkpanic ofDate(2026, 7, 15);
    LocalDateTime dateTime = checkpanic ofDateTime(2026, 7, 15, 23, 59);
    test:assertFalse(date.isAfter(dateTime), "Same calendar day should not be 'after' regardless of the time component");
}

@test:Config {}
function testIsBeforeFalseWhenSameDayIgnoringTime() {
    // Same calendar day, but the LocalDateTime's time is at the very start —
    // this must NOT make the date "before" either, since time is ignored.
    LocalDate date = checkpanic ofDate(2026, 7, 15);
    LocalDateTime dateTime = checkpanic ofDateTime(2026, 7, 15, 0, 1);
    test:assertFalse(date.isBefore(dateTime), "Same calendar day should not be 'before' regardless of the time component");
}

@test:Config {}
function testIsBeforeTrueWhenDateEarlierThanDateTime() {
    LocalDate date = checkpanic ofDate(2026, 7, 14);
    LocalDateTime dateTime = checkpanic ofDateTime(2026, 7, 15, 0, 1);
    test:assertTrue(date.isBefore(dateTime), "2026-07-14 should be before 2026-07-15T00:01");
}

@test:Config {}
function testIsBeforeFalseWhenDateLaterThanDateTime() {
    LocalDate date = checkpanic ofDate(2026, 7, 16);
    LocalDateTime dateTime = checkpanic ofDateTime(2026, 7, 15, 23, 59);
    test:assertFalse(date.isBefore(dateTime), "2026-07-16 should not be before 2026-07-15T23:59");
}

@test:Config {}
function testIsAfterAndIsBeforeAreMutuallyExclusiveAcrossTypes() {
    LocalDate date = checkpanic ofDate(2026, 8, 1);
    LocalDateTime dateTime = checkpanic ofDateTime(2026, 7, 31, 12, 0);

    boolean after = date.isAfter(dateTime);
    boolean before = date.isBefore(dateTime);

    test:assertTrue(after, "2026-08-01 should be after 2026-07-31T12:00");
    test:assertFalse(before, "2026-08-01 should not also be before 2026-07-31T12:00");
}
