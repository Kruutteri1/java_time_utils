import ballerina/test;

@test:Config {}
function testDayOfWeekConstants() {
    DayOfWeek mon = getMonday();
    DayOfWeek tue = getTuesday();
    DayOfWeek wed = getWednesday();
    DayOfWeek thu = getThursday();
    DayOfWeek fri = getFriday();
    DayOfWeek sat = getSaturday();
    DayOfWeek sun = getSunday();

    test:assertEquals(mon.name(), "MONDAY");
    test:assertEquals(mon.getValue(), 1);
    test:assertEquals(mon.ordinal(), 0);

    test:assertEquals(tue.name(), "TUESDAY");
    test:assertEquals(tue.getValue(), 2);

    test:assertEquals(wed.name(), "WEDNESDAY");
    test:assertEquals(wed.getValue(), 3);

    test:assertEquals(thu.name(), "THURSDAY");
    test:assertEquals(thu.getValue(), 4);

    test:assertEquals(fri.name(), "FRIDAY");
    test:assertEquals(fri.getValue(), 5);

    test:assertEquals(sat.name(), "SATURDAY");
    test:assertEquals(sat.getValue(), 6);

    test:assertEquals(sun.name(), "SUNDAY");
    test:assertEquals(sun.getValue(), 7);
    test:assertEquals(sun.ordinal(), 6);
}

@test:Config {}
function testOfDay() returns error? {
    DayOfWeek day1 = check ofDay(1);
    test:assertEquals(day1.name(), "MONDAY");

    DayOfWeek day7 = check ofDay(7);
    test:assertEquals(day7.name(), "SUNDAY");
}

@test:Config {}
function testNegativeOfDay() {
    DayOfWeek|error low = ofDay(0);
    test:assertTrue(low is error, "Day value 0 should be out of range");

    DayOfWeek|error high = ofDay(8);
    test:assertTrue(high is error, "Day value 8 should be out of range");

    DayOfWeek|error negative = ofDay(-1);
    test:assertTrue(negative is error, "Negative day value should be out of range");
}

@test:Config {}
function testDayOfWeekArithmetic() {
    DayOfWeek mon = getMonday();

    DayOfWeek nextWed = mon.plusDays(2);
    test:assertEquals(nextWed.name(), "WEDNESDAY");

    DayOfWeek wrapSun = mon.plusDays(6);
    test:assertEquals(wrapSun.name(), "SUNDAY");

    DayOfWeek wrapCycle = mon.plusDays(8);
    test:assertEquals(wrapCycle.name(), "TUESDAY");

    DayOfWeek prevFri = mon.minusDays(3);
    test:assertEquals(prevFri.name(), "FRIDAY");
}

@test:Config {}
function testValueOfDayName() returns error? {
    DayOfWeek wed = check valueOfDayName("WEDNESDAY");
    test:assertEquals(wed.getValue(), 3);
}

@test:Config {}
function testNegativeValueOfDayName() {
    DayOfWeek|error invalid = valueOfDayName("NOT_A_DAY");
    test:assertTrue(invalid is error, "Should return an error for invalid day name");
}

@test:Config {}
function testGetWeekValues() returns error? {
    DayOfWeek[] days = check getWeekValues();
    test:assertEquals(days.length(), 7);
    test:assertEquals(days[0].name(), "MONDAY");
    test:assertEquals(days[6].name(), "SUNDAY");
}

@test:Config {}
function testWeekValuesIntegrity() returns error? {
    DayOfWeek[] days = check getWeekValues();

    string[] expectedNames = ["MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY", "SUNDAY"];

    foreach int i in 0 ..< days.length() {
        test:assertEquals(days[i].name(), expectedNames[i]);
        test:assertEquals(days[i].ordinal(), i);
        test:assertEquals(days[i].getValue(), i + 1);
    }
}
