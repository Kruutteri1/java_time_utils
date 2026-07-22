import ballerina/test;

@test:Config {}
function testEnumMethods() {
    Month jan = getJanuary();
    
    // Тест name() и toString()
    test:assertEquals(jan.name(), "JANUARY");
    test:assertEquals(jan.toString(), "JANUARY");

    // Тест ordinal()
    test:assertEquals(jan.ordinal(), 0, "January should have ordinal 0");

    // Тест hashCode()
    test:assertNotEquals(jan.hashCode(), 0);

    // Тест getClass() — проверяем сам объект Class, а не его внутренний jObj напрямую
    Class cls = jan.getClass();
    test:assertEquals(cls.toString(), "class java.time.Month");

    // Тест getDeclaringClass()
    Class declCls = jan.getDeclaringClass();
    test:assertEquals(declCls.toString(), "class java.time.Month");

    // Тест isEquals()
    Month janCopy = getJanuary();
    Month feb = getFebruary();
    test:assertTrue(jan.isEquals(janCopy));
    test:assertFalse(jan.isEquals(feb));

    // Тест compareTo()
    test:assertEquals(jan.compareTo(janCopy), 0);
    test:assertTrue(jan.compareTo(feb) < 0, "January should come before February");
}

@test:Config {}
function testOfEnumValue() {
    Class cls = getJanuary().getClass();
    
    Enum|error found = ofEnumValue(cls, "JULY");
    test:assertFalse(found is error, "Should find JULY enum constant");
    if found is Enum {
        test:assertEquals(found.name(), "JULY");
        test:assertEquals(found.ordinal(), 6);
    }
}

@test:Config {}
function testNegativeOfEnumValue() {
    Class cls = getJanuary().getClass();
    
    Enum|error invalid = ofEnumValue(cls, "NON_EXISTENT_MONTH");
    test:assertTrue(invalid is error, "Should return an error for non-existent constant name");
}