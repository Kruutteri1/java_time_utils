# java_time_utils

A Ballerina wrapper library around `java.time` — providing `LocalDate`, `LocalDateTime`, and `LocalTime` for working with dates and times without time zones.

> **Note on scope:** This library wraps only the members that are fully implemented. A few Java-side wrapper types (`Month`, `DayOfWeek`, `IsoEra`, `Chronology`, `IsoChronology`, `Class`) are declared as Java bindings internally but have no public members yet, so any method that would return or accept one of those types (e.g. `getMonth()`, `getDayOfWeek()`, `getEra()`, `getChronology()`, `getClass()`) is intentionally left out of this documentation and out of the public API for now.

---

## Requirements

- Ballerina Swan Lake `2201.13.4` or later
- Java 21 runtime (bundled with the Ballerina distribution — no separate install needed)

## Installation

```toml
# Ballerina.toml
[[dependency]]
org = "kruutteri1"
name = "java_time_utils"
version = "1.0.3"  # check central.ballerina.io for the latest version
```

```ballerina
import kruutteri1/java_time_utils.javatime as jt;
```

---

## Table of Contents

- [Quick Start](#quick-start)
- [LocalDate](#localdate)
- [LocalDateTime](#localdatetime)
- [LocalTime](#localtime)
- [A Note on Method Naming](#a-note-on-method-naming)
- [Error Handling](#error-handling)
- [Inherited Java Object Methods](#inherited-java-object-methods)

---

## Quick Start

```ballerina
import ballerina/io;
import kruutteri1/java_time_utils.javatime as jt;

public function main() {
    jt:LocalDate date = jt:ofDate(2026, 7, 15);
    jt:LocalTime time = jt:ofTimeWithSecond(14, 28, 19);
    jt:LocalDateTime dateTime = jt:ofLocalDateWithLocalTime(date, time);

    io:println(date.toString());
    io:println(time.toString());
    io:println(dateTime.toString());
}
```

---

## LocalDate

A date without a time-of-day or time zone component, such as `2026-07-15`.

### Creating a LocalDate

- `getCurrentDate()` returns `LocalDate` — current date from the system clock
- `ofDate(int year, int month, int day)` returns `LocalDate` — panics on invalid input
- `ofEpochDay(int epochDay)` returns `LocalDate`
- `ofYearDay(int year, int dayOfYear)` returns `LocalDate` — panics if dayOfYear exceeds the year length
- `getMINDate()` returns `LocalDate` — minimum supported date
- `getMAXDate()` returns `LocalDate` — maximum supported date
- `getEPOCHDate()` returns `LocalDate` — 1970-01-01

```ballerina
jt:LocalDate d = jt:ofDate(2026, 7, 15);
```

### Instance Methods

**Output:** `toString()` returns `string`

**Component getters (no args, return int):** `getYear()`, `getMonthValue()`, `getDayOfMonth()`, `getDayOfYear()`

**Comparison:** `isEquals(Object other)` returns `boolean` — returns false rather than panicking on a type mismatch. `hashCode()` also available (see Inherited Java Object Methods).

**Checks:** `isLeapYear()`, `lengthOfMonth()`, `lengthOfYear()`, `toEpochDay()`

**Combining with time (produces LocalDateTime):**
- `atStartOfDay()` — 00:00
- `atTime(int hour, int minute)`
- `atTimeDetailed(int hour, int minute, int second)`
- `atTimeFull(int hour, int minute, int second, int nano)`
- `atLocalTime(LocalTime time)` — combines with an already-built LocalTime; never panics

**Date ranges:**
- `datesUntil(LocalDate endExclusive)` returns `Stream` — every date up to (not including) endExclusive. The `Stream` type is a low-level binding not documented in depth here.

**Arithmetic (immutable, returns new LocalDate):**
- Add: `plusYears`, `plusMonths`, `plusWeeks`, `plusDays`
- Subtract: `minusYears`, `minusMonths`, `minusWeeks`, `minusDays`
- `plusMonths`/`plusYears`/`minusMonths`/`minusYears` **clamp** the day-of-month on overflow (e.g. Jan 31 + 1 month → Feb 28/29) — this does not panic.

**Altering fields (`with*`, panics on invalid value instead of clamping):**
`withYear(int year)`, `withMonth(int month)`, `withDayOfMonth(int dayOfMonth)`, `withDayOfYear(int dayOfYear)`

### LocalDate — Example

```ballerina
import ballerina/io;
import kruutteri1/java_time_utils.javatime as jt;

public function main() {
    jt:LocalDate d = jt:ofDate(2026, 7, 15);
    jt:LocalDate nextWeek = d.plusWeeks(1);
    jt:LocalDate newYearDay = d.withMonth(1).withDayOfMonth(1);

    io:println("Year: ", d.getYear());
    io:println("Leap year: ", d.isLeapYear());
    io:println(d.toString());
    io:println(nextWeek.toString());

    jt:LocalDateTime dt = d.atTime(9, 0);
    io:println(dt.toString());

    jt:LocalDate|error invalid = trap jt:ofDate(2026, 2, 30);
    if invalid is error {
        io:println("Rejected as expected: ", invalid.message());
    }
}
```

---

## LocalDateTime

A date and time without a time zone, such as `2026-07-15T14:28:19`.

### Creating a LocalDateTime

- `getCurrentDateTime()` returns `LocalDateTime`
- `ofDateTime(int year, int month, int dayOfMonth, int hour, int minute)` returns `LocalDateTime`
- `ofWithSeconds(int year, int month, int dayOfMonth, int hour, int minute, int second)` returns `LocalDateTime`
- `ofWithNanos(int year, int month, int dayOfMonth, int hour, int minute, int second, int nanoOfSecond)` returns `LocalDateTime`
- `ofLocalDateWithLocalTime(LocalDate date, LocalTime time)` returns `LocalDateTime` — never panics, both inputs already validated
- `getMINDateTime()` returns `LocalDateTime`
- `getMAXDateTime()` returns `LocalDateTime`

```ballerina
jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 28);
```

### Instance Methods

**Output:** `toString()` returns `string`

**Component getters:** `getYear()`, `getMonthValue()`, `getDayOfMonth()`, `getDayOfYear()`, `getHour()`, `getMinute()`, `getSecond()`, `getNano()`

**Comparison:** `isEquals(Object other)` returns `boolean`. `hashCode()` also available.

**Splitting:** `toLocalDate()` returns `LocalDate`, `toLocalTime()` returns `LocalTime`

**Arithmetic (immutable):**
- Add: `plusYears`, `plusMonths`, `plusWeeks`, `plusDays`, `plusHours`, `plusMinutes`, `plusSeconds`, `plusNanos`
- Subtract: `minusYears`, `minusMonths`, `minusWeeks`, `minusDays`, `minusHours`, `minusMinutes`, `minusSeconds`, `minusNanos`
- ⚠️ Rollover past midnight in `plusHours`/`plusMinutes`/etc. **advances the calendar date**, unlike `LocalTime` which just wraps within the same day.

**Altering fields (`with*`, panics on invalid value):**
`withYear`, `withMonth`, `withDayOfMonth`, `withDayOfYear`, `withHour`, `withMinute`, `withSecond`, `withNano`

### LocalDateTime — Example

```ballerina
import ballerina/io;
import kruutteri1/java_time_utils.javatime as jt;

public function main() {
    jt:LocalDateTime dt = jt:ofDateTime(2026, 7, 15, 14, 28);
    jt:LocalDateTime tomorrow = dt.plusDays(1);

    jt:LocalDate d = dt.toLocalDate();
    jt:LocalTime t = dt.toLocalTime();
    jt:LocalDateTime combined = jt:ofLocalDateWithLocalTime(d, t);

    io:println(dt.toString());
    io:println(tomorrow.toString());

    // Midnight rollover advances the date
    jt:LocalDateTime nearMidnight = jt:ofWithSeconds(2026, 7, 15, 23, 30, 0);
    jt:LocalDateTime rolledOver = nearMidnight.plusHours(1);
    io:println(rolledOver.toString()); // 2026-07-16T00:30
}
```

---

## LocalTime

A time of day without a date or time zone, such as `10:15:30`.

> `LocalTime` is a value-based type — identity operators (`==`) are unreliable. Use `isEquals`, `compareTo`, `isAfter`, or `isBefore`.

### Creating a LocalTime

- `getCurrentTime()` returns `LocalTime`
- `ofTime(int hour, int minute)` returns `LocalTime`
- `ofTimeWithSecond(int hour, int minute, int second)` returns `LocalTime`
- `ofTimeWithSecondNano(int hour, int minute, int second, int nanoOfSecond)` returns `LocalTime`
- `ofNanoOfDay(int nanoOfDay)` returns `LocalTime`
- `ofSecondOfDay(int secondOfDay)` returns `LocalTime`
- `getMinTime()` returns `LocalTime` — minimum (00:00)
- `getMAXTime()` returns `LocalTime` — maximum (23:59:59.999999999)
- `getMIDNIGHT()` returns `LocalTime`
- `getNOON()` returns `LocalTime`

```ballerina
jt:LocalTime t = jt:ofTimeWithSecond(10, 15, 30);
```

### Instance Methods

**Output:** `toString()` returns `string`

**Component getters:** `getHour()`, `getMinute()`, `getSecond()`, `getNano()`

**Comparison — unlike LocalDate/LocalDateTime, these are all public here:**
- `isEquals(Object other)` returns `boolean`
- `compareTo(LocalTime other)` returns `int`
- `isAfter(LocalTime other)` returns `boolean`
- `isBefore(LocalTime other)` returns `boolean`
- `hashCode()` also available

**Combining with a date:** `atDate(LocalDate date)` returns `LocalDateTime` — never panics

**As seconds/nanoseconds of day:** `toSecondOfDay()`, `toNanoOfDay()`

**Arithmetic (immutable, wraps cyclically — never panics):**
- Add: `plusHours`, `plusMinutes`, `plusSeconds`, `plusNanos`
- Subtract: `minusHours`, `minusMinutes`, `minusSeconds`, `minusNanos`
- e.g. `23:00` + 2 hours = `01:00` — stays within the same day, unlike `LocalDateTime`.

**Altering fields (`with*`, panics on invalid value instead of wrapping):**
`withHour`, `withMinute`, `withSecond`, `withNano`

### LocalTime — Example

```ballerina
import ballerina/io;
import kruutteri1/java_time_utils.javatime as jt;

public function main() {
    jt:LocalTime t = jt:ofTimeWithSecond(10, 15, 30);
    jt:LocalTime inTwoHours = t.plusHours(2);

    boolean isLater = inTwoHours.isAfter(t); // true

    io:println(t.toString());
    io:println(inTwoHours.toString());

    jt:LocalDate d = jt:ofDate(2026, 7, 15);
    jt:LocalDateTime dt = t.atDate(d);
    io:println(dt.toString());

    // Wraparound near midnight (stays within the same day)
    jt:LocalTime lateNight = jt:ofTimeWithSecond(23, 0, 0);
    jt:LocalTime wrapped = lateNight.plusHours(2);
    io:println(wrapped.toString()); // 01:00:00
}
```

---

## A Note on Method Naming

Ballerina does not support method/function overloading, so this library's function names don't mirror `java.time` one-to-one:

- **Creation functions carry a suffix indicating arity**, since Ballerina can't have multiple functions named `of` in the same module. `LocalDate` uses `ofDate(...)`; `LocalDateTime` uses `ofDateTime(...)` / `ofWithSeconds(...)` / `ofWithNanos(...)`; `LocalTime` uses `ofTime(...)` / `ofTimeWithSecond(...)` / `ofTimeWithSecondNano(...)`.
- **`equals` is exposed as `isEquals`.** Ballerina reserves `equals` as a keyword-adjacent identifier; this library uses the plain, unescaped name `isEquals(Object other)` on all three types instead.
- **`wait`/`wait2`/`wait3` are exposed as `doWait` / `waitWithTimeout` / `waitWithTimeoutAndNanos`** — same reasoning, see [Inherited Java Object Methods](#inherited-java-object-methods).
- **`compareTo`, `isAfter`, `isBefore` are only public on `LocalTime`** — on `LocalDate` and `LocalDateTime` these exist internally but aren't part of the current public API.

---

## Error Handling

Functions and methods that validate their input — creation functions like `ofDate`, and any `with*` method — **panic** on an out-of-range value (e.g. month `13`, or February 30th). They return a plain `T`, not `T|error`; invalid input triggers a runtime panic from the underlying Java `DateTimeException`.

Use `trap` to convert the panic into a catchable `error`:

```ballerina
import ballerina/io;
import kruutteri1/java_time_utils.javatime as jt;

public function main() {
    jt:LocalDate|error d = trap jt:ofDate(2026, 2, 30);

    if d is error {
        io:println("Invalid date: ", d.message());
    } else {
        io:println("Created: ", d.toString());
    }
}
```

If you're confident the input is always valid (e.g. hardcoded constants), you can skip `trap` — but any dynamic or user-supplied input should go through this pattern to avoid an unhandled panic crashing your program.

This applies uniformly to `LocalDate`, `LocalDateTime`, and `LocalTime`.

---

## Inherited Java Object Methods

All three types inherit these from `java.lang.Object`, mainly for low-level thread synchronization — you almost certainly don't need them in ordinary business logic.

| Method | Parameters | Description |
|---|---|---|
| `notify()` | — | Wakes a single thread waiting on the object's monitor |
| `notifyAll()` | — | Wakes all threads waiting on the object's monitor |
| `doWait()` | — | Waits for a notification (may return `InterruptedException`) |
| `waitWithTimeout(int timeoutMillis)` | timeoutMillis | Waits with a millisecond timeout |
| `waitWithTimeoutAndNanos(int timeoutMillis, int nanos)` | timeoutMillis, nanos | Waits with a timeout (ms + ns) |
| `hashCode()` | — | Hash code, consistent with `isEquals` |

```ballerina
jt:InterruptedException? err = d.doWait();
if err is jt:InterruptedException {
    // handle interruption
}
```

Available identically on `LocalDate`, `LocalDateTime`, and `LocalTime`.