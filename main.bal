//import my_library.javacollections;

import ballerina/io;

import kruutteri1/java_time_utils.javatime as jt;

public function main() returns error? {

    jt:LocalTime localTime = jt:LocalTime_now();
    io:println("local time: ", localTime);

    var time = jt:LocalTime_now();
    io:println("Текущее время: ", time);

    jt:LocalDate today = jt:LocalDate_now();
    io:println("Сегодняшняя дата: ", today.toString());

    jt:LocalDate today1 = jt:LocalDate_now();

    io:print("equals: ", today.'equals(today1));

    jt:LocalDateTime todayDate = jt:LocalDateTime_now();
    io:println("Сегодняшняя дата: ", todayDate.toString());

    todayDate = todayDate.minusDays(1);
    todayDate = todayDate.minusYears(1);

    io:println("Сегодняшняя дата после минус 1 дня и года: ", todayDate.toString());

    io:print(todayDate.getClass().toString());

}
