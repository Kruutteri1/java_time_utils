import ballerina/test;

// ===== Creation =====

@test:Config {}
function testOfPeriodBasic() {
    Period p = ofPeriod(1, 2, 3);
    test:assertEquals(p.getYears(), 1);
    test:assertEquals(p.getMonths(), 2);
    test:assertEquals(p.getDays(), 3);
}

@test:Config {}
function testOfPeriodDays() {
    Period p = ofPeriodDays(10);
    test:assertEquals(p.getDays(), 10);
    test:assertEquals(p.getYears(), 0);
    test:assertEquals(p.getMonths(), 0);
}

@test:Config {}
function testOfPeriodMonths() {
    Period p = ofPeriodMonths(5);
    test:assertEquals(p.getMonths(), 5);
}

@test:Config {}
function testOfPeriodYears() {
    Period p = ofPeriodYears(2);
    test:assertEquals(p.getYears(), 2);
}

@test:Config {}
function testOfPeriodWeeksConvertsToDays() {
    // java.time.Period has no dedicated "weeks" field — it's stored as days * 7
    Period p = ofPeriodWeeks(1);
    test:assertEquals(p.getDays(), 7);
}

@test:Config {}
function testGetZERO_() {
    Period p = getZero();
    test:assertTrue(p.isZero());
    test:assertEquals(p.getYears(), 0);
    test:assertEquals(p.getMonths(), 0);
    test:assertEquals(p.getDays(), 0);
}

@test:Config {}
function testBetweenTwoDates() {
    LocalDate startDate = checkpanic ofDate(2026, 1, 1);
    LocalDate endDate = checkpanic ofDate(2026, 7, 15);
    Period p = betweenPeriod(startDate, endDate);

    test:assertEquals(p.getYears(), 0);
    test:assertEquals(p.getMonths(), 6);
    test:assertEquals(p.getDays(), 14);
}

@test:Config {}
function testBetweenSameDateIsZero() {
    LocalDate d = checkpanic ofDate(2026, 7, 15);
    Period p = betweenPeriod(d, d);
    test:assertTrue(p.isZero());
}

// ===== Output =====

@test:Config {}
function testToString_() {
    Period p = ofPeriod(1, 2, 3);
    test:assertEquals(p.toString(), "P1Y2M3D");
}

@test:Config {}
function testToStringZero_() {
    Period p = getZero();
    test:assertEquals(p.toString(), "P0D");
}

// ===== Comparison =====

@test:Config {}
function testIsEqualsTrue_() {
    Period p1 = ofPeriod(1, 2, 3);
    Period p2 = ofPeriod(1, 2, 3);
    test:assertTrue(p1.isEquals(p2));
}

@test:Config {}
function testIsEqualsFalse_() {
    Period p1 = ofPeriod(1, 2, 3);
    Period p2 = ofPeriod(1, 2, 4);
    test:assertFalse(p1.isEquals(p2));
}

@test:Config {}
function testHashCodeConsistentWithEquals_() {
    Period p1 = ofPeriod(1, 2, 3);
    Period p2 = ofPeriod(1, 2, 3);
    test:assertEquals(p1.hashCode(), p2.hashCode());
}

// ===== s =====

@test:Config {}
function testIsZeroTrue_() {
    Period p = ofPeriod(0, 0, 0);
    test:assertTrue(p.isZero());
}

@test:Config {}
function testIsZeroFalse_() {
    Period p = ofPeriod(0, 0, 1);
    test:assertFalse(p.isZero());
}

@test:Config {}
function testIsNegativeTrue_() {
    Period p = ofPeriod(0, 0, -5);
    test:assertTrue(p.isNegative());
}

@test:Config {}
function testIsNegativeFalse() {
    Period p = ofPeriod(0, 0, 5);
    test:assertFalse(p.isNegative());
}

// ===== Arithmetic — Addition =====

@test:Config {}
function testPlusDayS() {
    Period p = ofPeriodDays(5);
    Period result = p.plusDays(3);
    test:assertEquals(result.getDays(), 8);
}

@test:Config {}
function testPlusMonths_() {
    Period p = ofPeriodMonths(2);
    Period result = p.plusMonths(1);
    test:assertEquals(result.getMonths(), 3);
}

@test:Config {}
function testPlusYears_() {
    Period p = ofPeriodYears(1);
    Period result = p.plusYears(2);
    test:assertEquals(result.getYears(), 3);
}

// ===== Arithmetic — Subtraction =====

@test:Config {}
function testMinusDayS() {
    Period p = ofPeriodDays(10);
    Period result = p.minusDays(3);
    test:assertEquals(result.getDays(), 7);
}

@test:Config {}
function testMinusMonths_() {
    Period p = ofPeriodMonths(5);
    Period result = p.minusMonths(2);
    test:assertEquals(result.getMonths(), 3);
}

@test:Config {}
function testMinusYears_() {
    Period p = ofPeriodYears(5);
    Period result = p.minusYears(1);
    test:assertEquals(result.getYears(), 4);
}

// ===== Multiplication / Negation =====

@test:Config {}
function testMultipliedBy_() {
    Period p = ofPeriod(1, 2, 3);
    Period result = p.multipliedBy(2);
    test:assertEquals(result.getYears(), 2);
    test:assertEquals(result.getMonths(), 4);
    test:assertEquals(result.getDays(), 6);
}

@test:Config {}
function testMultipliedByNegativeScalar() {
    Period p = ofPeriod(1, 2, 3);
    Period result = p.multipliedBy(-1);
    test:assertTrue(result.isNegative());
}

@test:Config {}
function testNegated_() {
    Period p = ofPeriodDays(5);
    Period result = p.negated();
    test:assertEquals(result.getDays(), -5);
    test:assertTrue(result.isNegative());
}

@test:Config {}
function testNegatedTwiceReturnsOriginal() {
    Period p = ofPeriod(1, 2, 3);
    Period result = p.negated().negated();
    test:assertTrue(p.isEquals(result));
}

// ===== Normalization =====

@test:Config {}
function testNormalizedCarriesMonthsIntoYears() {
    // 14 months -> 1 year, 2 months
    Period p = ofPeriod(0, 14, 0);
    Period result = p.normalized();
    test:assertEquals(result.getYears(), 1);
    test:assertEquals(result.getMonths(), 2);
}

@test:Config {}
function testNormalizedDoesNotTouchDays() {
    // normalized() only carries months into years — days are left alone
    Period p = ofPeriod(0, 14, 40);
    Period result = p.normalized();
    test:assertEquals(result.getDays(), 40);
}

// ===== Total Months =====

@test:Config {}
function testToTotalMonths() {
    Period p = ofPeriod(1, 2, 0);
    // 1 year * 12 + 2 months = 14
    test:assertEquals(p.toTotalMonths(), 14);
}

@test:Config {}
function testToTotalMonthsIgnoresDays() {
    Period p = ofPeriod(0, 3, 100);
    test:assertEquals(p.toTotalMonths(), 3);
}

// ===== Altering Individual Fields (with*) =====

@test:Config {}
function testWithDays() {
    Period p = ofPeriod(1, 2, 3);
    Period result = p.withDays(10);
    test:assertEquals(result.getDays(), 10);
    // years/months should stay untouched
    test:assertEquals(result.getYears(), 1);
    test:assertEquals(result.getMonths(), 2);
}

@test:Config {}
function testWithMonths() {
    Period p = ofPeriod(1, 2, 3);
    Period result = p.withMonths(6);
    test:assertEquals(result.getMonths(), 6);
}

@test:Config {}
function testWithYears() {
    Period p = ofPeriod(1, 2, 3);
    Period result = p.withYears(10);
    test:assertEquals(result.getYears(), 10);
}

// ===== Immutability =====

@test:Config {}
function testImmutability_() {
    Period original = ofPeriod(1, 2, 3);
    Period _ = original.plusDays(100);
    // original must be unchanged
    test:assertEquals(original.getDays(), 3);
}

// ===== More coverage on core methods =====

@test:Config {}
function testBetweenReversedDatesIsNegative() {
    // end before start -> negative period
    LocalDate startDate =  checkpanic ofDate(2026, 7, 15);
    LocalDate endDate = checkpanic ofDate(2026, 1, 1);
    Period p = betweenPeriod(startDate, endDate);
    test:assertTrue(p.isNegative());
}

@test:Config {}
function testIsNegativeWithMixedSigns() {
    // isNegative() is true if ANY of the three fields is negative,
    // even if the others are positive.
    Period p = ofPeriod(1, -2, 3);
    test:assertTrue(p.isNegative());
}

@test:Config {}
function testMultipliedByZeroGivesZero() {
    Period p = ofPeriod(1, 2, 3);
    Period result = p.multipliedBy(0);
    test:assertTrue(result.isZero());
    test:assertTrue(result.isEquals(getZero()));
}

@test:Config {}
function testMultipliedByOne() {
    Period p = ofPeriod(1, 2, 3);
    Period result = p.multipliedBy(1);
    test:assertTrue(p.isEquals(result));
}

@test:Config {}
function testChainedWithMethods() {
    Period p = getZero().withYears(5).withMonths(6).withDays(7);
    test:assertEquals(p.getYears(), 5);
    test:assertEquals(p.getMonths(), 6);
    test:assertEquals(p.getDays(), 7);
}

@test:Config {}
function testChainedPlusMethods() {
    Period p = (ofPeriodYears(1)).plusMonths(2).plusDays(3);
    test:assertEquals(p.getYears(), 1);
    test:assertEquals(p.getMonths(), 2);
    test:assertEquals(p.getDays(), 3);
}

@test:Config {}
function testNormalizedNegativeMonths() {
    // -14 months -> -1 year, -2 months
    Period p = ofPeriod(0, -14, 0);
    Period result = p.normalized();
    test:assertEquals(result.getYears(), -1);
    test:assertEquals(result.getMonths(), -2);
}

@test:Config {}
function testToStringWithOnlyDays() {
    Period p = ofPeriodDays(5);
    test:assertEquals(p.toString(), "P5D");
}

@test:Config {}
function testToStringWithOnlyMonths() {
    Period p = ofPeriodMonths(3);
    test:assertEquals(p.toString(), "P3M");
}

@test:Config {}
function testGetYearsMonthsDaysAllZeroByDefault() {
    Period p = ofPeriodDays(5);
    // only days was set — years and months should default to 0
    test:assertEquals(p.getYears(), 0);
    test:assertEquals(p.getMonths(), 0);
}

// ===== Negative tests — expected panics on arithmetic overflow =====
//
// java.time.Period's plus*/minus*/multipliedBy/toTotalMonths methods
// internally use Java's exact-math operators (Math.addExact,
// Math.multiplyExact) and throw ArithmeticException on int32 overflow.
// These panic in Ballerina rather than returning T|error — use `trap`
// to catch them safely (see the library's Error Handling docs).

@test:Config {}
function testPlusYearsOverflowThrows() {
    Period p = ofPeriodYears(2147483647); // int32 max
    Period|error result = trap p.plusYears(1);
    test:assertTrue(result is error);
}

@test:Config {}
function testMinusYearsOverflowThrows() {
    Period p = ofPeriodYears(-2147483648); // int32 min
    Period|error result = trap p.minusYears(1);
    test:assertTrue(result is error);
}

@test:Config {}
function testPlusMonthsOverflowThrows() {
    Period p = ofPeriodMonths(2147483647);
    Period|error result = trap p.plusMonths(1);
    test:assertTrue(result is error);
}

@test:Config {}
function testMinusMonthsOverflowThrows() {
    Period p = ofPeriodMonths(-2147483648);
    Period|error result = trap p.minusMonths(1);
    test:assertTrue(result is error);
}

@test:Config {}
function testPlusDaysOverflowThrows_() {
    Period p = ofPeriodDays(2147483647);
    Period|error result = trap p.plusDays(1);
    test:assertTrue(result is error);
}

@test:Config {}
function testMinusDaysOverflowThrows() {
    Period p = ofPeriodDays(-2147483648);
    Period|error result = trap p.minusDays(1);
    test:assertTrue(result is error);
}

@test:Config {}
function testMultipliedByOverflowThrows_() {
    Period p = ofPeriodYears(2000000000);
    Period|error result = trap p.multipliedBy(2);
    test:assertTrue(result is error);
}

@test:Config {}
function testMultipliedByOverflowOnDaysThrows() {
    Period p = ofPeriodDays(1500000000);
    Period|error result = trap p.multipliedBy(2);
    test:assertTrue(result is error);
}

@test:Config {}
function testToTotalMonthsHandlesMaxYearsWithoutOverflow() {
    // Unlike plus*/minus*/multipliedBy, toTotalMonths() computes
    // (years * 12L + months) using long arithmetic internally, so it
    // does NOT overflow even at Integer.MAX_VALUE years. This must
    // succeed, not panic.
    Period p = ofPeriodYears(2147483647);
    int|error result = trap p.toTotalMonths();
    test:assertTrue(result is int);
    test:assertEquals(result, 2147483647 * 12);
}

@test:Config {}
function testMultipliedByDoesNotThrowOnSafeValues_() {
    // sanity : a normal, non-overflowing case must NOT panic
    Period p = ofPeriod(1, 2, 3);
    Period|error result = trap p.multipliedBy(1000);
    test:assertTrue(result is Period);
}

@test:Config
function testParsePeriodValid() returns error? {
    Period period = check parsePeriod("P1Y2M3D");
    test:assertNotEquals(period, (), "Parsed Period should not be null");
}

@test:Config
function testParsePeriodWeeks() returns error? {
    Period period = check parsePeriod("P2W");
    test:assertNotEquals(period, (), "Parsed Period with weeks should not be null");
}

@test:Config
function testParsePeriodInvalidFormat() {
    Period|error result = parsePeriod("1Y-2M-3D");
    test:assertTrue(result is error, "Parsing invalid Period format should result in an error");
}

@test:Config
function testParsePeriodEmptyString() {
    Period|error result = parsePeriod("");
    test:assertTrue(result is error, "Parsing empty string as Period should result in an error");
}