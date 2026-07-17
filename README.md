# java_time_utils

A Ballerina wrapper library around `java.time` — providing `LocalDate`, `LocalDateTime`, and `LocalTime` for working with dates and times without time zones.

> **Note on scope:** This library wraps only the members that are fully implemented. A few Java-side wrapper types (`Month`, `DayOfWeek`, `IsoEra`, `Chronology`, `Class`) are declared as Java bindings internally but have no public members yet, so any method that would return or accept one of those types is intentionally left out of this documentation and out of the public API for now.

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
```

```ballerina
import kruutteri1/java_time_utils.javatime as jt;
```
ы
---

## Table of Contents

- [Quick Start](#quick-start)
- [`LocalDate`](#localdate) — a date without time or time zone (e.g. `2026-07-15`)
- [`LocalDateTime`](#localdatetime) — a date and time without a time zone (e.g. `2026-07-15T14:28:19`)
- [`LocalTime`](#localtime) — a time of day without date or time zone (e.g. `10:15:30`)
- [Error Handling](#error-handling)
- [Inherited Java Object Methods](#inherited-java-object-methods) — shared across all three types

---

## Quick Start

```ballerina
import ballerina/io;
import kruutteri1/java_time_utils.javatime as jt;

public function main() {
    jt:LocalDate date = jt:LocalDate_of(2026, 7, 15);
    jt:LocalTime time = jt:ofHourMinuteSecond(14, 28, 19);
    jt:LocalDateTime dateTime = jt:LocalDateTime_ofLocalDateWithLocalTime(date, time);

    io:println(date.toString());      // 2026-07-15
    io:println(time.toString());      // 14:28:19
    io:println(dateTime.toString());  // 2026-07-15T14:28:19
}
```

---

## `LocalDate`

A date without a time-of-day or time zone component, such as `2026-07-15`.

### Creating a `LocalDate`

#### `LocalDate_now()`
Returns the current date from the system clock in the default time zone.

```ballerina
jt:LocalDate today = jt:LocalDate_now();
```

**Returns:** `LocalDate`

---

#### `LocalDate_of(int year, int month, int day)`
Creates a date from a year, month, and day.

| Parameter | Type | Description |
|---|---|---|
| `year` | int | The year |
| `month` | int | The month (1–12) |
| `day` | int | The day of month (1–31) |

```ballerina
jt:LocalDate d = jt:LocalDate_of(2026, 7, 15);
// 2026-07-15
```

**Returns:** `LocalDate`

⚠️ Throws an error if the day is not valid for the given month/year (e.g. `LocalDate_of(2026, 2, 30)`). See [Error Handling](#error-handling).

---

#### `LocalDate_ofEpochDay(int epochDay)`
Creates a date from a day count relative to the epoch of `1970-01-01`.

| Parameter | Type | Description |
|---|---|---|
| `epochDay` | int | The number of days since `1970-01-01` (may be negative) |

```ballerina
jt:LocalDate d = jt:LocalDate_ofEpochDay(0);
// 1970-01-01
```

**Returns:** `LocalDate`

---

#### `LocalDate_ofYearDay(int year, int dayOfYear)`
Creates a date from a year and a day-of-year value.

| Parameter | Type | Description |
|---|---|---|
| `year` | int | The year |
| `dayOfYear` | int | The day of year (1–365, or 1–366 in a leap year) |

```ballerina
jt:LocalDate d = jt:LocalDate_ofYearDay(2026, 200);
```

**Returns:** `LocalDate`

⚠️ Throws an error if `dayOfYear` exceeds the number of days in that year (e.g. `366` on a non-leap year).

---

#### `LocalDate_getMIN()`
Returns the minimum supported date (`-999999999-01-01`).

```ballerina
jt:LocalDate min = jt:LocalDate_getMIN();
```

**Returns:** `LocalDate`

---

#### `LocalDate_getMAX()`
Returns the maximum supported date (`+999999999-12-31`).

```ballerina
jt:LocalDate max = jt:LocalDate_getMAX();
```

**Returns:** `LocalDate`

---

#### `LocalDate_getEPOCH()`
Returns the Unix epoch date (`1970-01-01`).

```ballerina
jt:LocalDate epoch = jt:LocalDate_getEPOCH();
```

**Returns:** `LocalDate`

---

### Instance Methods

#### Output

##### `toString()`
Returns the ISO-8601 string representation of the date.

```ballerina
string s = d.toString();
// "2026-07-15"
```

**Returns:** `string`

---

#### Component Getters

Take no arguments and return `int`.

| Method | Range | Description |
|---|---|---|
| `getYear()` | any | The year |
| `getMonthValue()` | 1–12 | The month number |
| `getDayOfMonth()` | 1–31 | The day of month |
| `getDayOfYear()` | 1–365/366 | The day of year |

```ballerina
int year = d.getYear();        // 2026
int month = d.getMonthValue(); // 7
int day = d.getDayOfMonth();   // 15
```

---

#### Comparison

##### `'equals(Object other)`
Checks whether this date is equal to another object. Returns `false` (rather than throwing) if `other` is not a `LocalDate` — it never errors just because the types differ.

| Parameter | Type | Description |
|---|---|---|
| `other` | Object | The object to compare against |

```ballerina
boolean same = d.'equals(otherDate);
```

**Returns:** `boolean`

> `hashCode()` is also available on `LocalDate` — see [Inherited Java Object Methods](#inherited-java-object-methods).

---

#### Checks and Metadata (no arguments)

| Method | Returns | Description |
|---|---|---|
| `isLeapYear()` | boolean | Whether the year is a leap year |
| `lengthOfMonth()` | int | The number of days in the current month |
| `lengthOfYear()` | int | The number of days in the current year (365 or 366) |
| `toEpochDay()` | int | The number of days since the epoch `1970-01-01` |

```ballerina
boolean leap = d.isLeapYear();       // true / false
int daysInMonth = d.lengthOfMonth(); // e.g. 31
int daysInYear = d.lengthOfYear();   // 365 or 366
int epochDay = d.toEpochDay();       // e.g. 20648
```

---

#### Combining with Time (producing a `LocalDateTime`)

Combine the date with a time of day. All parameters are `int`. See [A Note on Method Naming](#a-note-on-method-naming) for why there are three variants.

##### `atStartOfDay()`
Combines the date with the start of the day (`00:00`).

```ballerina
jt:LocalDateTime dt = d.atStartOfDay();
// 2026-07-15T00:00
```

**Returns:** `LocalDateTime`

---

##### `atTime(int hour, int minute)`
Combines the date with an hour and minute.

| Parameter | Type | Range |
|---|---|---|
| `hour` | int | 0–23 |
| `minute` | int | 0–59 |

```ballerina
jt:LocalDateTime dt = d.atTime(14, 28);
// 2026-07-15T14:28
```

**Returns:** `LocalDateTime`

⚠️ Throws an error if `hour` or `minute` is out of range.

---

##### `atTimeDetailed(int hour, int minute, int second)`
Combines the date with an hour, minute, and second.

```ballerina
jt:LocalDateTime dt = d.atTimeDetailed(14, 28, 19);
// 2026-07-15T14:28:19
```

**Returns:** `LocalDateTime`

⚠️ Throws an error if any parameter is out of range.

---

##### `atTimeFull(int hour, int minute, int second, int nano)`
Combines the date with an hour, minute, second, and nanosecond.

```ballerina
jt:LocalDateTime dt = d.atTimeFull(14, 28, 19, 500000000);
```

**Returns:** `LocalDateTime`

⚠️ Throws an error if any parameter is out of range.

---

#### Arithmetic — Addition

Return a **new** `LocalDate` object (the original is not modified).

| Method | Parameter | Description |
|---|---|---|
| `plusYears(int years)` | years | Add N years |
| `plusMonths(int months)` | months | Add N months |
| `plusWeeks(int weeks)` | weeks | Add N weeks |
| `plusDays(int days)` | days | Add N days |

```ballerina
jt:LocalDate tomorrow = d.plusDays(1);
jt:LocalDate nextMonth = d.plusMonths(1);
```

**Returns:** `LocalDate`

⚠️ `plusMonths`/`plusYears` clamp the day-of-month when the target month is shorter (e.g. Jan 31 + 1 month → Feb 28/29). This does not throw — the day is silently adjusted.

---

#### Arithmetic — Subtraction

| Method | Parameter | Description |
|---|---|---|
| `minusYears(int years)` | years | Subtract N years |
| `minusMonths(int months)` | months | Subtract N months |
| `minusWeeks(int weeks)` | weeks | Subtract N weeks |
| `minusDays(int days)` | days | Subtract N days |

```ballerina
jt:LocalDate yesterday = d.minusDays(1);
```

**Returns:** `LocalDate`

Same clamping behavior as `plusMonths`/`plusYears` applies here.

---

#### Altering Individual Fields (`with*`)

Return a new `LocalDate` with the given field replaced.

| Method | Parameter | Range |
|---|---|---|
| `withYear(int year)` | year | any |
| `withMonth(int month)` | month | 1–12 |
| `withDayOfMonth(int dayOfMonth)` | dayOfMonth | 1–31 |
| `withDayOfYear(int dayOfYear)` | dayOfYear | 1–365/366 |

```ballerina
jt:LocalDate changed = d.withYear(2030).withMonth(1).withDayOfMonth(1);
```

**Returns:** `LocalDate`

⚠️ Unlike `plusMonths`/`plusYears`, this **throws** an error rather than clamping if the resulting date is invalid (e.g. `withDayOfMonth(30)` while the month is February).

---

### `LocalDate` — Full Example

```ballerina
import ballerina/io;
import kruutteri1/java_time_utils.javatime as jt;

public function main() {
    // Creation
    jt:LocalDate d = jt:LocalDate_of(2026, 7, 15);

    // Modification
    jt:LocalDate nextWeek = d.plusWeeks(1);
    jt:LocalDate newYearDay = d.withMonth(1).withDayOfMonth(1);

    // Reading components
    io:println("Year: ", d.getYear());
    io:println("Month: ", d.getMonthValue());
    io:println("Day: ", d.getDayOfMonth());
    io:println("Leap year: ", d.isLeapYear());
    io:println("Days in month: ", d.lengthOfMonth());

    // Output
    io:println(d.toString());         // 2026-07-15
    io:println(nextWeek.toString());  // 2026-07-22

    // Combining with a time
    jt:LocalDateTime dt = d.atTime(9, 0);
    io:println(dt.toString());        // 2026-07-15T09:00

    // Safe creation with invalid input
    jt:LocalDate|error invalid = jt:LocalDate_of(2026, 2, 30);
    if invalid is error {
        io:println("Rejected as expected: ", invalid.message());
    }
}
```

> Note: `main()` above returns `()`, so `check` can't be used directly inside it in this example — see [Error Handling](#error-handling) for the `check`-based pattern when propagation is what you want.

### `LocalDate` — Important Notes

- All `plus*`, `minus*`, and `with*` methods are **immutable** — they return a new object rather than modifying the original.
- `plus*`/`minus*` **clamp** the day-of-month on overflow; `with*` **throws** instead. This is a meaningful difference in behavior — don't assume they're interchangeable.
- `atTime*` and `atStartOfDay()` create a `LocalDateTime` by combining the current date with a given time.
- `toEpochDay()` is useful for quickly comparing dates or computing the difference in days (`d1.toEpochDay() - d2.toEpochDay()`).

---

## `LocalDateTime`

A date and time without a time zone, such as `2026-07-15T14:28:19`.

### Creating a `LocalDateTime`

#### `LocalDateTime_now()`
Returns the current date-time from the system clock in the default time zone.

```ballerina
jt:LocalDateTime now = jt:LocalDateTime_now();
```

**Returns:** `LocalDateTime`

---

#### `LocalDateTime_of(int year, int month, int dayOfMonth, int hour, int minute)`
Creates a date-time from a year, month, day, hour, and minute.

| Parameter | Type | Description |
|---|---|---|
| `year` | int | The year |
| `month` | int | The month (1–12) |
| `dayOfMonth` | int | The day of month (1–31) |
| `hour` | int | The hour (0–23) |
| `minute` | int | The minute (0–59) |

```ballerina
jt:LocalDateTime dt = jt:LocalDateTime_of(2026, 7, 15, 14, 28);
// 2026-07-15T14:28
```

**Returns:** `LocalDateTime`

⚠️ Throws an error if the day/hour/minute is invalid (e.g. `LocalDateTime_of(2026, 2, 30, 0, 0)`).

---

#### `LocalDateTime_ofFull(int year, int month, int dayOfMonth, int hour, int minute, int second)`
Creates a date-time from a year, month, day, hour, minute, and second.

```ballerina
jt:LocalDateTime dt = jt:LocalDateTime_ofFull(2026, 7, 15, 14, 28, 19);
// 2026-07-15T14:28:19
```

**Returns:** `LocalDateTime`

⚠️ Throws an error if any field is invalid.

---

#### `LocalDateTime_ofFullWithNano(int year, int month, int dayOfMonth, int hour, int minute, int second, int nanoOfSecond)`
Creates a date-time from a year, month, day, hour, minute, second, and nanosecond.

| Parameter | Type | Description |
|---|---|---|
| `nanoOfSecond` | int | The nanosecond (0–999,999,999) |

```ballerina
jt:LocalDateTime dt = jt:LocalDateTime_ofFullWithNano(2026, 7, 15, 14, 28, 19, 500000000);
```

**Returns:** `LocalDateTime`

⚠️ Throws an error if any field is invalid.

---

#### `LocalDateTime_ofLocalDateWithLocalTime(LocalDate date, LocalTime time)`
Creates a date-time by combining an existing `LocalDate` and `LocalTime`. Since both inputs are already-validated objects, this never throws.

| Parameter | Type | Description |
|---|---|---|
| `date` | LocalDate | The date |
| `time` | LocalTime | The time |

```ballerina
jt:LocalDate d = jt:LocalDate_of(2026, 7, 15);
jt:LocalTime t = jt:ofHourMinute(14, 28);
jt:LocalDateTime dt = jt:LocalDateTime_ofLocalDateWithLocalTime(d, t);
// 2026-07-15T14:28
```

**Returns:** `LocalDateTime`

---

#### `LocalDateTime_getMIN()`
Returns the minimum supported date-time (`-999999999-01-01T00:00:00`).

```ballerina
jt:LocalDateTime min = jt:LocalDateTime_getMIN();
```

**Returns:** `LocalDateTime`

---

#### `LocalDateTime_getMAX()`
Returns the maximum supported date-time (`+999999999-12-31T23:59:59.999999999`).

```ballerina
jt:LocalDateTime max = jt:LocalDateTime_getMAX();
```

**Returns:** `LocalDateTime`

---

### Instance Methods

#### Output

##### `toString()`
Returns the ISO-8601 string representation of the date-time.

```ballerina
string s = dt.toString();
// "2026-07-15T14:28:19"
```

**Returns:** `string`

---

#### Component Getters

Take no arguments and return `int`.

| Method | Range | Description |
|---|---|---|
| `getYear()` | any | The year |
| `getMonthValue()` | 1–12 | The month number |
| `getDayOfMonth()` | 1–31 | The day of month |
| `getDayOfYear()` | 1–365/366 | The day of year |
| `getHour()` | 0–23 | The hour |
| `getMinute()` | 0–59 | The minute |
| `getSecond()` | 0–59 | The second |
| `getNano()` | 0–999,999,999 | The nanosecond |

```ballerina
int year = dt.getYear();      // 2026
int hour = dt.getHour();      // 14
int minute = dt.getMinute();  // 28
int second = dt.getSecond();  // 19
```

---

#### Comparison

##### `'equals(Object other)`
Checks whether this date-time is equal to another object. Returns `false` (rather than throwing) if `other` is not a `LocalDateTime`.

| Parameter | Type | Description |
|---|---|---|
| `other` | Object | The object to compare against |

```ballerina
boolean same = dt.'equals(otherDateTime);
```

**Returns:** `boolean`

> `hashCode()` is also available on `LocalDateTime` — see [Inherited Java Object Methods](#inherited-java-object-methods).

---

#### Extracting Date and Time

Split a `LocalDateTime` into its date and time components.

| Method | Returns | Description |
|---|---|---|
| `toLocalDate()` | `LocalDate` | The date part, without the time |
| `toLocalTime()` | `LocalTime` | The time part, without the date |

```ballerina
jt:LocalDate d = dt.toLocalDate(); // 2026-07-15
jt:LocalTime t = dt.toLocalTime(); // 14:28:19
```

---

#### Arithmetic — Addition

Return a **new** `LocalDateTime` object (the original is not modified).

| Method | Parameter | Description |
|---|---|---|
| `plusYears(int years)` | years | Add N years |
| `plusMonths(int months)` | months | Add N months |
| `plusWeeks(int weeks)` | weeks | Add N weeks |
| `plusDays(int days)` | days | Add N days |
| `plusHours(int hours)` | hours | Add N hours |
| `plusMinutes(int minutes)` | minutes | Add N minutes |
| `plusSeconds(int seconds)` | seconds | Add N seconds |
| `plusNanos(int nanos)` | nanos | Add N nanoseconds |

```ballerina
jt:LocalDateTime tomorrow = dt.plusDays(1);
jt:LocalDateTime inTwoHours = dt.plusHours(2);
```

**Returns:** `LocalDateTime`

⚠️ **Key difference from `LocalTime`:** a rollover past midnight in `plusHours`/`plusMinutes`/etc. **increments the calendar date** instead of wrapping within the same day. `plusMonths`/`plusYears` clamp the day-of-month the same way as in `LocalDate`.

---

#### Arithmetic — Subtraction

| Method | Parameter | Description |
|---|---|---|
| `minusYears(int years)` | years | Subtract N years |
| `minusMonths(int months)` | months | Subtract N months |
| `minusWeeks(int weeks)` | weeks | Subtract N weeks |
| `minusDays(int days)` | days | Subtract N days |
| `minusHours(int hours)` | hours | Subtract N hours |
| `minusMinutes(int minutes)` | minutes | Subtract N minutes |
| `minusSeconds(int seconds)` | seconds | Subtract N seconds |
| `minusNanos(int nanos)` | nanos | Subtract N nanoseconds |

```ballerina
jt:LocalDateTime yesterday = dt.minusDays(1);
jt:LocalDateTime anHourAgo = dt.minusHours(1);
```

**Returns:** `LocalDateTime`

---

#### Altering Individual Fields (`with*`)

Return a new `LocalDateTime` with the given field replaced.

| Method | Parameter | Range |
|---|---|---|
| `withYear(int year)` | year | any |
| `withMonth(int month)` | month | 1–12 |
| `withDayOfMonth(int dayOfMonth)` | dayOfMonth | 1–31 |
| `withDayOfYear(int dayOfYear)` | dayOfYear | 1–365/366 |
| `withHour(int hour)` | hour | 0–23 |
| `withMinute(int minute)` | minute | 0–59 |
| `withSecond(int second)` | second | 0–59 |
| `withNano(int nano)` | nano | 0–999,999,999 |

```ballerina
jt:LocalDateTime changed = dt.withHour(0).withMinute(0).withSecond(0);
```

**Returns:** `LocalDateTime`

⚠️ Throws an error if the value is out of the valid range (e.g. `withDayOfMonth(30)` in February).

---

### `LocalDateTime` — Full Example

```ballerina
import ballerina/io;
import kruutteri1/java_time_utils.javatime as jt;

public function main() {
    // Creation
    jt:LocalDateTime dt = jt:LocalDateTime_of(2026, 7, 15, 14, 28);

    // Modification
    jt:LocalDateTime tomorrow = dt.plusDays(1);
    jt:LocalDateTime midnight = dt.withHour(0).withMinute(0).withSecond(0);

    // Reading components
    io:println("Year: ", dt.getYear());
    io:println("Hour: ", dt.getHour());
    io:println("Minute: ", dt.getMinute());

    // Extracting date and time
    jt:LocalDate d = dt.toLocalDate();
    jt:LocalTime t = dt.toLocalTime();

    // Output
    io:println(dt.toString());        // 2026-07-15T14:28
    io:println(tomorrow.toString());  // 2026-07-16T14:28

    // Building from a date and a time
    jt:LocalDateTime combined = jt:LocalDateTime_ofLocalDateWithLocalTime(d, t);

    // Midnight rollover advances the date (unlike LocalTime)
    jt:LocalDateTime nearMidnight = jt:LocalDateTime_ofFull(2026, 7, 15, 23, 30, 0);
    jt:LocalDateTime rolledOver = nearMidnight.plusHours(1);
    io:println(rolledOver.toString()); // 2026-07-16T00:30
}
```

### `LocalDateTime` — Propagating Errors with `check`

```ballerina
import ballerina/io;
import kruutteri1/java_time_utils.javatime as jt;

function buildAppointment(int year, int month, int day, int hour, int minute) returns jt:LocalDateTime|error {
    return check jt:LocalDateTime_of(year, month, day, hour, minute);
}

public function main() returns error? {
    jt:LocalDateTime appointment = check buildAppointment(2026, 7, 15, 14, 28);
    io:println(appointment.toString()); // 2026-07-15T14:28
}
```

### `LocalDateTime` — Important Notes

- All `plus*`, `minus*`, and `with*` methods are **immutable** — they return a new object rather than modifying the original.
- `toLocalDate()` and `toLocalTime()` split a `LocalDateTime` into its `LocalDate` and `LocalTime` components.
- `LocalDateTime_ofLocalDateWithLocalTime` is the most convenient way to assemble a `LocalDateTime` from an existing `LocalDate` and `LocalTime`, and it never throws.
- Field ranges and validation rules (day-of-month, hour, minute, etc.) are identical to the corresponding fields in `LocalDate` and `LocalTime`.
- **Midnight rollover advances the date** — this is the key behavioral difference from a standalone `LocalTime`, where rollover just wraps within the same day.

---

## `LocalTime`

A time of day without a date or time zone, such as `10:15:30`.

> ⚠️ `LocalTime` is a value-based type: identity-sensitive operations (such as comparing with `==`) may behave unpredictably. Use `'equals`, `compareTo`, `isAfter`, or `isBefore` to compare values instead.

### Creating a `LocalTime`

#### `LocalTime_now()`
Returns the current time from the system clock in the default time zone.

```ballerina
jt:LocalTime now = jt:LocalTime_now();
```

**Returns:** `LocalTime`

---

#### `ofHourMinute(int hour, int minute)`
Creates a time from an hour and a minute.

| Parameter | Type | Description |
|---|---|---|
| `hour` | int | The hour (0–23) |
| `minute` | int | The minute (0–59) |

```ballerina
jt:LocalTime t = jt:ofHourMinute(10, 15);
// 10:15
```

**Returns:** `LocalTime`

⚠️ Throws an error if the hour or minute is out of range.

---

#### `ofHourMinuteSecond(int hour, int minute, int second)`
Creates a time from an hour, minute, and second.

```ballerina
jt:LocalTime t = jt:ofHourMinuteSecond(10, 15, 30);
// 10:15:30
```

**Returns:** `LocalTime`

⚠️ Throws an error if any parameter is out of range.

---

#### `ofHourMinuteSecondNano(int hour, int minute, int second, int nanoOfSecond)`
Creates a time from an hour, minute, second, and nanosecond.

| Parameter | Type | Description |
|---|---|---|
| `nanoOfSecond` | int | The nanosecond (0–999,999,999) |

```ballerina
jt:LocalTime t = jt:ofHourMinuteSecondNano(10, 15, 30, 500000000);
```

**Returns:** `LocalTime`

⚠️ Throws an error if any parameter is out of range.

---

#### `ofNanoOfDay(int nanoOfDay)`
Creates a time from a nanosecond-of-day value.

| Parameter | Type | Description |
|---|---|---|
| `nanoOfDay` | int | The number of nanoseconds since the start of the day (0 – 86,399,999,999,999) |

```ballerina
jt:LocalTime t = jt:ofNanoOfDay(0);
// 00:00
```

**Returns:** `LocalTime`

⚠️ Throws an error if `nanoOfDay` is negative or exceeds `86,399,999,999,999`.

---

#### `ofSecondOfDay(int secondOfDay)`
Creates a time from a second-of-day value.

| Parameter | Type | Description |
|---|---|---|
| `secondOfDay` | int | The number of seconds since the start of the day (0–86,399) |

```ballerina
jt:LocalTime t = jt:ofSecondOfDay(3600);
// 01:00
```

**Returns:** `LocalTime`

⚠️ Throws an error if `secondOfDay` is negative or exceeds `86,399`.

---

#### `getMin()`
Returns the minimum supported time (`00:00`).

```ballerina
jt:LocalTime min = jt:getMin();
```

**Returns:** `LocalTime`

---

#### `getMAX()`
Returns the maximum supported time (`23:59:59.999999999`).

```ballerina
jt:LocalTime max = jt:getMAX();
```

**Returns:** `LocalTime`

---

#### `getMIDNIGHT()`
Returns the time of midnight (`00:00`).

```ballerina
jt:LocalTime midnight = jt:getMIDNIGHT();
```

**Returns:** `LocalTime`

---

#### `getNOON()`
Returns the time of noon (`12:00`).

```ballerina
jt:LocalTime noon = jt:getNOON();
```

**Returns:** `LocalTime`

---

### Instance Methods

#### Output

##### `toString()`
Returns the ISO-8601 string representation of the time.

```ballerina
string s = t.toString();
// "10:15:30"
```

**Returns:** `string`

---

#### Component Getters

Take no arguments and return `int`.

| Method | Range | Description |
|---|---|---|
| `getHour()` | 0–23 | The hour |
| `getMinute()` | 0–59 | The minute |
| `getSecond()` | 0–59 | The second |
| `getNano()` | 0–999,999,999 | The nanosecond |

```ballerina
int hour = t.getHour();     // 10
int minute = t.getMinute(); // 15
int second = t.getSecond(); // 30
```

---

#### Comparison

`LocalTime` is a value-based type, so identity operators (`==`) are unreliable — always use these methods instead.

| Method | Parameter | Returns | Description |
|---|---|---|---|
| `'equals(Object other)` | other: Object | boolean | Checks equality with another object. Returns `false` if `other` is not a `LocalTime` — never throws on a type mismatch. |
| `compareTo(LocalTime other)` | other: LocalTime | int | Negative, zero, or positive if this time is before, equal to, or after the specified time |
| `isAfter(LocalTime other)` | other: LocalTime | boolean | Checks whether this time is after the specified time |
| `isBefore(LocalTime other)` | other: LocalTime | boolean | Checks whether this time is before the specified time |

```ballerina
boolean same = t.'equals(otherTime);
int cmp = t.compareTo(otherTime);
boolean later = t.isAfter(otherTime);
boolean earlier = t.isBefore(otherTime);
```

> `hashCode()` is also available on `LocalTime` — see [Inherited Java Object Methods](#inherited-java-object-methods).

---

#### Combining with a Date

##### `atDate(LocalDate date)`
Combines this time with a date, producing a `LocalDateTime`. Since `date` is already a validated object, this never throws.

| Parameter | Type | Description |
|---|---|---|
| `date` | LocalDate | The date to combine the time with |

```ballerina
jt:LocalDate d = jt:LocalDate_of(2026, 7, 15);
jt:LocalDateTime dt = t.atDate(d);
// 2026-07-15T10:15:30
```

**Returns:** `LocalDateTime`

---

#### Representing as Seconds / Nanoseconds of the Day

| Method | Returns | Description |
|---|---|---|
| `toSecondOfDay()` | int | The time as a count of seconds since the start of the day |
| `toNanoOfDay()` | int | The time as a count of nanoseconds since the start of the day |

```ballerina
int secOfDay = t.toSecondOfDay();  // e.g. 36930
int nanoOfDay = t.toNanoOfDay();   // e.g. 36930000000000
```

---

#### Arithmetic — Addition

Return a **new** `LocalTime` object (the original is not modified). A rollover past midnight simply wraps around within the same day (e.g. `23:00` + 2 hours = `01:00`) — this **never throws**, regardless of how large the added value is.

| Method | Parameter | Description |
|---|---|---|
| `plusHours(int hours)` | hours | Add N hours |
| `plusMinutes(int minutes)` | minutes | Add N minutes |
| `plusSeconds(int seconds)` | seconds | Add N seconds |
| `plusNanos(int nanos)` | nanos | Add N nanoseconds |

```ballerina
jt:LocalTime inTwoHours = t.plusHours(2);
jt:LocalTime inTenMinutes = t.plusMinutes(10);
```

**Returns:** `LocalTime`

⚠️ **Key difference from `LocalDateTime`:** rollover here wraps cyclically within the same 24-hour day and does not affect any date. If you need the date to advance on rollover, use `LocalDateTime` instead.

---

#### Arithmetic — Subtraction

| Method | Parameter | Description |
|---|---|---|
| `minusHours(int hours)` | hours | Subtract N hours |
| `minusMinutes(int minutes)` | minutes | Subtract N minutes |
| `minusSeconds(int seconds)` | seconds | Subtract N seconds |
| `minusNanos(int nanos)` | nanos | Subtract N nanoseconds |

```ballerina
jt:LocalTime anHourAgo = t.minusHours(1);
jt:LocalTime tenMinutesAgo = t.minusMinutes(10);
```

**Returns:** `LocalTime`

Same cyclical wraparound behavior as `plus*` applies here.

---

#### Altering Individual Fields (`with*`)

Return a new `LocalTime` with the given field replaced.

| Method | Parameter | Range |
|---|---|---|
| `withHour(int hour)` | hour | 0–23 |
| `withMinute(int minute)` | minute | 0–59 |
| `withSecond(int second)` | second | 0–59 |
| `withNano(int nano)` | nano | 0–999,999,999 |

```ballerina
jt:LocalTime changed = t.withHour(0).withMinute(0).withSecond(0);
```

**Returns:** `LocalTime`

⚠️ Unlike `plus*`/`minus*`, this **throws** an error if the value is out of the valid range (e.g. `withHour(25)`) rather than wrapping.

---

### `LocalTime` — Full Example

```ballerina
import ballerina/io;
import kruutteri1/java_time_utils.javatime as jt;

public function main() {
    // Creation
    jt:LocalTime t = jt:ofHourMinuteSecond(10, 15, 30);

    // Modification
    jt:LocalTime inTwoHours = t.plusHours(2);
    jt:LocalTime midnight = t.withHour(0).withMinute(0).withSecond(0);

    // Reading components
    io:println("Hour: ", t.getHour());
    io:println("Minute: ", t.getMinute());
    io:println("Second: ", t.getSecond());

    // Comparison
    boolean isLater = inTwoHours.isAfter(t); // true

    // Output
    io:println(t.toString());          // 10:15:30
    io:println(inTwoHours.toString()); // 12:15:30

    // Combining with a date
    jt:LocalDate d = jt:LocalDate_of(2026, 7, 15);
    jt:LocalDateTime dt = t.atDate(d);
    io:println(dt.toString());         // 2026-07-15T10:15:30

    // Wraparound near midnight (stays within the same day)
    jt:LocalTime lateNight = jt:ofHourMinuteSecond(23, 0, 0);
    jt:LocalTime wrapped = lateNight.plusHours(2);
    io:println(wrapped.toString());    // 01:00:00
}
```

### `LocalTime` — Important Notes

- All `plus*`, `minus*`, and `with*` methods are **immutable** — they return a new object rather than modifying the original.
- `plus*`/`minus*` arithmetic **wraps cyclically**: crossing midnight does not throw an error, it simply wraps around within the same 24-hour day (e.g. `23:30` + 1 hour = `00:30`). `with*` methods, by contrast, **throw** on out-of-range values instead of wrapping.
- This wraparound behavior is unique to `LocalTime` — `LocalDate` handles month/year overflow via the calendar (clamping), and `LocalDateTime` advances the date on midnight rollover instead of wrapping.
- `atDate(LocalDate)` is the primary way to obtain a `LocalDateTime` by combining a time with a date, and it never throws.
- Use `'equals`, `compareTo`, `isAfter`, and `isBefore` to compare times — not identity operators — since `LocalTime` is a value-based type.
- `toSecondOfDay()` and `toNanoOfDay()` are useful for quickly comparing times or computing a time difference.

---

## Error Handling

Functions and methods across this library that validate their input — creation functions like `LocalDate_of`, and any `with*` method — return a union of `T|error`. When given an out-of-range value (e.g. month `13`, or February 30th), the returned value **is** an `error`, rather than a valid instance.

The idiomatic way to handle this in Ballerina is `check`, which unwraps the value on success and **propagates the error out of the enclosing function** on failure. This works in any function whose return type includes `error` (or `error?`):

```ballerina
import ballerina/io;
import kruutteri1/java_time_utils.javatime as jt;

public function createBirthday(int year, int month, int day) returns jt:LocalDate|error {
    jt:LocalDate date = check jt:LocalDate_of(year, month, day);
    return date;
}

public function main() returns error? {
    jt:LocalDate d = check createBirthday(2026, 7, 15);
    io:println(d.toString()); // 2026-07-15

    jt:LocalDate|error invalid = createBirthday(2026, 2, 30);
    if invalid is error {
        io:println("Invalid date: ", invalid.message());
    }
}
```

If you want to inspect the error **locally** instead of propagating it up the call stack, skip `check` and branch on `is error` directly:

```ballerina
jt:LocalDate|error d = jt:LocalDate_of(2026, 2, 30);

if d is error {
    io:println("Invalid date: ", d.message());
} else {
    io:println("Created: ", d.toString());
}
```

Use `check` when the caller should stop and bubble the failure up; use an explicit `is error` check when you want to recover or respond to the failure right where it happens. Avoid using `check` inside a function that doesn't declare `error` in its return type — the compiler will reject it, since there'd be nowhere for the error to propagate to.

This applies uniformly to `LocalDate`, `LocalDateTime`, and `LocalTime` — every ⚠️ note in this document referring to "throws an error" follows this exact `T|error` pattern.

---

## Inherited Java Object Methods

All three types (`LocalDate`, `LocalDateTime`, `LocalTime`) inherit the following methods from `java.lang.Object`. These are exposed because the underlying Java bindings carry them, but they exist for **low-level thread synchronization** in Java and have no meaningful use in ordinary Ballerina business logic — you almost certainly don't need these.

| Method | Parameters | Description |
|---|---|---|
| `notify()` | — | Wakes up a single thread waiting on the object's monitor |
| `notifyAll()` | — | Wakes up all threads waiting on the object's monitor |
| `'wait()` | — | Waits for a notification (may return an `InterruptedException`) |
| `wait2(int timeoutMillis)` | timeoutMillis | Waits for a notification with a millisecond timeout |
| `wait3(int timeoutMillis, int nanos)` | timeoutMillis, nanos | Waits for a notification with a timeout (ms + ns) |
| `hashCode()` | — | Returns the object's hash code, consistent with `'equals` |

```ballerina
jt:InterruptedException? err = d.'wait();
if err is jt:InterruptedException {
    // handle interruption
}
```

**Returns:** `notify()`/`notifyAll()` — nothing; `'wait()`, `wait2()`, `wait3()` — `InterruptedException?`; `hashCode()` — `int`

These are available identically on `LocalDate`, `LocalDateTime`, and `LocalTime` — the signatures above apply to all three without variation.
