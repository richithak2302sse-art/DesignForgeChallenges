# Challenge 4 – PriorityLock

## Aim

Design a 4-input Round Robin Arbiter.

---

## Description

PriorityLock grants access to one requester at a time.

Instead of always giving priority to Request0,
the priority rotates after each successful grant.

This prevents starvation.

---

## Inputs

| Signal | Description |
|---------|-------------|
| clk | Clock |
| reset | Reset |
| req | 4-bit Request |

---

## Output

| Signal | Description |
|---------|-------------|
| grant | 4-bit Grant |

---

## Features

- Round Robin Scheduling
- Fair Arbitration
- One Grant Per Clock
- No Starvation

---

## Test Cases

✔ Single Request

✔ Multiple Requests

✔ Persistent Requests

✔ No Request

---

## Compile

```bash
iverilog -o priority_lock_sim priority_lock.v priority_lock_tb.v
```

Run

```bash
vvp priority_lock_sim
```

Waveform

```bash
gtkwave priority_lock.vcd
```

---

## Result

The arbiter successfully grants access to only one requester each cycle while rotating priority fairly.