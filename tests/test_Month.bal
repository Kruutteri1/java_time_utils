import ballerina/test;

@test:Config {}
function testMonthConstants() {
    Month jan = getJanuary();
    test:assertEquals(jan.getValue(), 1, "January value should be 1");
    test:assertEquals(jan.name(), "JANUARY", "January name should be JANUARY");

    Month dec = getDecember();
    test:assertEquals(dec.getValue(), 12, "December value should be 12");
    test:assertEquals(dec.name(), "DECEMBER", "December name should be DECEMBER");
}

@test:Config {}
function testGetMonthOf() {
    Month july = checkpanic getMonthOf(7);
    test:assertEquals(july.getValue(), 7, "Month 7 should be July");
    test:assertEquals(july.toString(), "JULY", "toString should match JULY");
}

@test:Config {}
function testMonthArithmetic() {
    Month jan = getJanuary();
    Month feb = jan.plus(1);
    test:assertEquals(feb.getValue(), 2, "January + 1 month should be February");

    Month dec = getDecember();
    Month nov = dec.minus(1);
    test:assertEquals(nov.getValue(), 11, "December - 1 month should be November");
}

@test:Config {}
function testMonthLengths() {
    Month feb = getFebruary();
    test:assertEquals(feb.length(false), 28, "February length in non-leap year should be 28");
    test:assertEquals(feb.length(true), 29, "February length in leap year should be 29");
    test:assertEquals(feb.minLength(), 28, "Min length of February should be 28");
    test:assertEquals(feb.maxLength(), 29, "Max length of February should be 29");

    Month jul = getJuly();
    test:assertEquals(jul.length(false), 31, "July length should be 31");
}

@test:Config {}
function testMonthCompareAndEquals() {
    Month jan1 = getJanuary();
    Month jan2 = checkpanic getMonthOf(1);
    Month feb = getFebruary();

    test:assertTrue(jan1.isEquals(jan2), "January instances should be equal");
    test:assertFalse(jan1.isEquals(feb), "January and February should not be equal");
    test:assertEquals(jan1.compareTo(feb), -1, "January should be less than February");
    test:assertEquals(jan1.hashCode(), jan2.hashCode(), "Hash codes for equal months should match");
}

@test:Config {}
function testMonthValuesArray() {
    Month[]|error values = getMonthValues();
    test:assertFalse(values is error, "getMonthValues should not return an error");
    if (values is Month[]) {
        test:assertEquals(values.length(), 12, "There should be 12 months in a year");
        test:assertEquals(values[0].getValue(), 1, "First month should be January");
        test:assertEquals(values[11].getValue(), 12, "Last month should be December");
    }
}

@test:Config {}
function testMonthValueOf() {
    Month march = checkpanic getMonthValueOf("MARCH");
    test:assertEquals(march.getValue(), 3, "ValueOf MARCH should return Month 3");
}
