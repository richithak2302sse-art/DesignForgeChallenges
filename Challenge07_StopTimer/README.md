# Challenge 7 – StopTimer

## Aim

Design an FSM-based stopwatch controller.

---

## Description

The stopwatch has two states:

- IDLE
- RUN

Functions:

- Start begins counting.
- Stop pauses the count.
- Reset clears the count.

---

## Inputs

- clk
- reset
- start
- stop

---

## Output

- time_count (8-bit elapsed count)

---

## FSM

IDLE → RUN (Start)

RUN → IDLE (Stop)

Reset → IDLE

---

## Test Cases

✔ Reset

✔ Start

✔ Count

✔ Stop

✔ Restart

✔ Reset Again

---

## Compile

```bash
iverilog -o stop_timer_sim stop_timer.v stop_timer_tb.v
```

Run

```bash
vvp stop_timer_sim
```

Waveform

```bash
gtkwave stop_timer.vcd
```

---

## Result

The stopwatch controller correctly starts, stops, resumes, and resets the elapsed time count.