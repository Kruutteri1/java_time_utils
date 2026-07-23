import ballerina/test;

// ===== Creation =====

@test:Config {}
function testOfDays() {
    Duration d = ofDays(2);
    test:assertEquals(d.toDays(), 2);
}

@test:Config {}
function testOfHours() {
    Duration d = ofHours(3);
    test:assertEquals(d.toHours(), 3);
}

@test:Config {}
function testOfMinutes() {
    Duration d = ofMinutes(45);
    test:assertEquals(d.toMinutes(), 45);
}

@test:Config {}
function testOfSeconds() {
    Duration d = ofSeconds(90);
    test:assertEquals(d.toSeconds(), 90);
}

@test:Config {}
function testOfSecondsWithNanos() {
    Duration d = ofSecondsWithNanos(5, 500000000);
    test:assertEquals(d.getSeconds(), 5);
    test:assertEquals(d.getNano(), 500000000);
}

@test:Config {}
function testOfMillis() {
    Duration d = ofMillis(1500);
    test:assertEquals(d.toMillis(), 1500);
}

@test:Config {}
function testOfNanos() {
    Duration d = ofNanos(1000000000);
    test:assertEquals(d.getSeconds(), 1);
}

@test:Config {}
function testGetZERO() {
    Duration d = Duration_getZERO();
    test:assertTrue(d.isZero());
}

@test:Config {}
function testParseDuration() {
    Duration d = parseDuration("PT20S");
    test:assertEquals(d.getSeconds(), 20);
}

@test:Config {}
function testBetweenLocalDateTimes() {
    LocalDateTime|error startDate = ofDateTime(2026, 7, 15, 10, 0);
    LocalDateTime|error end = ofDateTime(2026, 7, 15, 14, 30);
    if startDate is error || end is error {
        test:assertFail("setup failed");
    }
    Duration d = between(startDate, end);
    test:assertEquals(d.toHours(), 4);
    test:assertEquals(d.toMinutesPart(), 30);
}

@test:Config {}
function testBetweenLocalTimes() {
    LocalTime|error startDate = ofTime(9, 0);
    LocalTime|error end = ofTime(17, 0);
    if startDate is error || end is error {
        test:assertFail("setup failed");
    }
    Duration d = between(startDate, end);
    test:assertEquals(d.toHours(), 8);
}

@test:Config {}
function testFromIntervalDuration() {
    Duration original = ofSeconds(60);
    Duration converted = fromInterval(original);
    test:assertTrue(original.isEquals(converted));
}

// ===== Output =====

@test:Config {}
function testToString() {
    Duration d = ofSeconds(20);
    test:assertEquals(d.toString(), "PT20S");
}

@test:Config {}
function testToStringZero() {
    Duration d = Duration_getZERO();
    test:assertEquals(d.toString(), "PT0S");
}

// ===== Comparison =====

@test:Config {}
function testIsEqualsTrue() {
    Duration d1 = ofSeconds(100);
    Duration d2 = ofSeconds(100);
    test:assertTrue(d1.isEquals(d2));
}

@test:Config {}
function testIsEqualsFalse() {
    Duration d1 = ofSeconds(100);
    Duration d2 = ofSeconds(200);
    test:assertFalse(d1.isEquals(d2));
}

@test:Config {}
function testHashCodeConsistentWithEquals() {
    Duration d1 = ofSeconds(100);
    Duration d2 = ofSeconds(100);
    test:assertEquals(d1.hashCode(), d2.hashCode());
}

@test:Config {}
function testCompareToBefore() {
    Duration shorter = ofSeconds(10);
    Duration longer = ofSeconds(20);
    test:assertTrue(shorter.compareTo(longer) < 0);
}

@test:Config {}
function testCompareToAfter() {
    Duration shorter = ofSeconds(10);
    Duration longer = ofSeconds(20);
    test:assertTrue(longer.compareTo(shorter) > 0);
}

@test:Config {}
function testCompareToEqual() {
    Duration d1 = ofSeconds(15);
    Duration d2 = ofSeconds(15);
    test:assertEquals(d1.compareTo(d2), 0);
}

// ===== Checks =====

@test:Config {}
function testIsZeroTrue() {
    test:assertTrue(ofSeconds(0).isZero());
}

@test:Config {}
function testIsZeroFalse() {
    test:assertFalse(ofSeconds(1).isZero());
}

@test:Config {}
function testIsPositiveTrue() {
    test:assertTrue(ofSeconds(5).isPositive());
}

@test:Config {}
function testIsPositiveFalseOnZero() {
    // isPositive() excludes zero — zero is neither positive nor negative
    test:assertFalse(ofSeconds(0).isPositive());
}

@test:Config {}
function testIsNegativeTrue() {
    test:assertTrue(ofSeconds(-5).isNegative());
}

@test:Config {}
function testIsNegativeFalseOnZero() {
    test:assertFalse(ofSeconds(0).isNegative());
}

// ===== Conversions =====

@test:Config {}
function testToDaysPartVsToDays() {
    // 26 hours = 1 day, 2 hours
    Duration d = ofHours(26);
    test:assertEquals(d.toDays(), 1);
    test:assertEquals(d.toDaysPart(), 1);
    test:assertEquals(d.toHoursPart(), 2);
}

@test:Config {}
function testToHoursPartWraps() {
    // 25 hours -> toHours() = 25 (total), toHoursPart() = 1 (after removing whole days)
    Duration d = ofHours(25);
    test:assertEquals(d.toHours(), 25);
    test:assertEquals(d.toHoursPart(), 1);
}

@test:Config {}
function testToMinutesPartWraps() {
    Duration d = ofMinutes(90);
    test:assertEquals(d.toMinutes(), 90);
    test:assertEquals(d.toHoursPart(), 1);
    test:assertEquals(d.toMinutesPart(), 30);
}

@test:Config {}
function testToSecondsPartWraps() {
    Duration d = ofSeconds(125);
    test:assertEquals(d.toMinutesPart(), 2);
    test:assertEquals(d.toSecondsPart(), 5);
}

@test:Config {}
function testToMillisPart() {
    Duration d = ofSecondsWithNanos(1, 250000000);
    test:assertEquals(d.toMillisPart(), 250);
}

@test:Config {}
function testToNanosPart() {
    Duration d = ofSecondsWithNanos(1, 250000000);
    test:assertEquals(d.toNanosPart(), 250000000);
}

@test:Config {}
function testToNanosTotal() {
    Duration d = ofSeconds(1);
    test:assertEquals(d.toNanos(), 1000000000);
}

@test:Config {}
function testToMillisTotal() {
    Duration d = ofSeconds(2);
    test:assertEquals(d.toMillis(), 2000);
}

// ===== Arithmetic — Addition =====

@test:Config {}
function testPlusDurationInstance() {
    Duration d1 = ofSeconds(10);
    Duration d2 = ofSeconds(20);
    Duration result = d1.plus(d2);
    test:assertEquals(result.toSeconds(), 30);
}

@test:Config {}
function testPlusDays() {
    Duration d = ofDays(1);
    Duration result = d.plusDays(2);
    test:assertEquals(result.toDays(), 3);
}

@test:Config {}
function testPlusHours() {
    Duration d = ofHours(1);
    Duration result = d.plusHours(2);
    test:assertEquals(result.toHours(), 3);
}

@test:Config {}
function testPlusMinutes() {
    Duration d = ofMinutes(10);
    Duration result = d.plusMinutes(5);
    test:assertEquals(result.toMinutes(), 15);
}

@test:Config {}
function testPlusSeconds() {
    Duration d = ofSeconds(10);
    Duration result = d.plusSeconds(5);
    test:assertEquals(result.toSeconds(), 15);
}

@test:Config {}
function testPlusMillis() {
    Duration d = ofMillis(500);
    Duration result = d.plusMillis(500);
    test:assertEquals(result.toMillis(), 1000);
}

@test:Config {}
function testPlusNanos() {
    Duration d = ofNanos(500000000);
    Duration result = d.plusNanos(500000000);
    test:assertEquals(result.getSeconds(), 1);
}

// ===== Arithmetic — Subtraction =====

@test:Config {}
function testMinusDurationInstance() {
    Duration d1 = ofSeconds(30);
    Duration d2 = ofSeconds(10);
    Duration result = d1.minus(d2);
    test:assertEquals(result.toSeconds(), 20);
}

@test:Config {}
function testMinusDays() {
    Duration d = ofDays(5);
    Duration result = d.minusDays(2);
    test:assertEquals(result.toDays(), 3);
}

@test:Config {}
function testMinusHours() {
    Duration d = ofHours(5);
    Duration result = d.minusHours(2);
    test:assertEquals(result.toHours(), 3);
}

@test:Config {}
function testMinusMinutes() {
    Duration d = ofMinutes(30);
    Duration result = d.minusMinutes(10);
    test:assertEquals(result.toMinutes(), 20);
}

@test:Config {}
function testMinusSeconds() {
    Duration d = ofSeconds(30);
    Duration result = d.minusSeconds(10);
    test:assertEquals(result.toSeconds(), 20);
}

@test:Config {}
function testMinusMillis() {
    Duration d = ofMillis(1000);
    Duration result = d.minusMillis(500);
    test:assertEquals(result.toMillis(), 500);
}

@test:Config {}
function testMinusNanos() {
    Duration d = ofSeconds(1);
    Duration result = d.minusNanos(500000000);
    test:assertEquals(result.toMillis(), 500);
}

// ===== Multiplication / Division =====

@test:Config {}
function testMultipliedBy() {
    Duration d = ofSeconds(10);
    Duration result = d.multipliedBy(3);
    test:assertEquals(result.toSeconds(), 30);
}

@test:Config {}
function testMultipliedByZero() {
    Duration d = ofSeconds(10);
    Duration result = d.multipliedBy(0);
    test:assertTrue(result.isZero());
}

@test:Config {}
function testDividedByInt() {
    Duration d = ofSeconds(30);
    Duration result = d.dividedBy(3);
    test:assertEquals(result.toSeconds(), 10);
}

@test:Config {}
function testDividedByDurationInstance() {
    Duration d1 = ofSeconds(30);
    Duration d2 = ofSeconds(10);
    int result = d1.dividedByDuration(d2);
    test:assertEquals(result, 3);
}

// ===== Negation / Absolute Value =====

@test:Config {}
function testNegated() {
    Duration d = ofSeconds(10);
    Duration result = d.negated();
    test:assertEquals(result.toSeconds(), -10);
    test:assertTrue(result.isNegative());
}

@test:Config {}
function testAbsOnNegativeDuration() {
    Duration d = ofSeconds(-10);
    Duration result = d.abs();
    test:assertEquals(result.toSeconds(), 10);
    test:assertTrue(result.isPositive());
}

@test:Config {}
function testAbsOnPositiveDurationUnchanged() {
    Duration d = ofSeconds(10);
    Duration result = d.abs();
    test:assertEquals(result.toSeconds(), 10);
}

// ===== Altering Individual Fields (with*) =====

@test:Config {}
function testWithSeconds() {
    Duration d = ofSecondsWithNanos(5, 500000000);
    Duration result = d.withSeconds(20);
    test:assertEquals(result.getSeconds(), 20);
    // nanos should be untouched
    test:assertEquals(result.getNano(), 500000000);
}

@test:Config {}
function testWithNanos() {
    Duration d = ofSecondsWithNanos(5, 500000000);
    Duration result = d.withNanos(100);
    test:assertEquals(result.getNano(), 100);
    // seconds should be untouched
    test:assertEquals(result.getSeconds(), 5);
}

// ===== Immutability =====

@test:Config {}
function testImmutability() {
    Duration original = ofSeconds(10);
    Duration _ = original.plusSeconds(100);
    test:assertEquals(original.toSeconds(), 10);
}

// ===== Negative tests — expected panics =====
//
// Duration stores seconds as a Java `long`, which matches Ballerina's
// 64-bit `int` exactly — so overflow boundaries here are
// Long.MAX_VALUE / Long.MIN_VALUE (9223372036854775807 /
// -9223372036854775808), NOT the int32 boundaries used by Period.
// Division by zero also panics with ArithmeticException.
// Use `trap` to catch these as errors instead of letting them panic.

@test:Config {}
function testPlusSecondsOverflowThrows() {
    Duration d = ofSeconds(9223372036854775807);
    Duration|error result = trap d.plusSeconds(1);
    test:assertTrue(result is error);
}

@test:Config {}
function testPlusDaysOverflowThrows() {
    Duration d = ofSeconds(9223372036854775807);
    Duration|error result = trap d.plusDays(1);
    test:assertTrue(result is error);
}

@test:Config {}
function testMultipliedByOverflowThrows() {
    Duration d = ofSeconds(9223372036854775807);
    Duration|error result = trap d.multipliedBy(2);
    test:assertTrue(result is error);
}

@test:Config {}
function testDividedByZeroThrows() {
    Duration d = ofSeconds(10);
    Duration|error result = trap d.dividedBy(0);
    test:assertTrue(result is error);
}

@test:Config {}
function testDividedByZeroDurationThrows() {
    Duration d = ofSeconds(10);
    Duration zero = Duration_getZERO();
    int|error result = trap d.dividedByDuration(zero);
    test:assertTrue(result is error);
}

@test:Config {}
function testMultipliedByDoesNotThrowOnSafeValues() {
    // sanity check — a normal, non-overflowing case must NOT panic
    Duration d = ofSeconds(100);
    Duration|error result = trap d.multipliedBy(1000);
    test:assertTrue(result is Duration);
}
