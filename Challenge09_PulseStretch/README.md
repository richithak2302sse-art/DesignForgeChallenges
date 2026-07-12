# Challenge 9 – PulseStretch

## Aim

Design a pulse stretcher that extends every input pulse to exactly five clock cycles.

---

## Features

- Detects short input pulse
- Output remains HIGH for 5 clock cycles
- Ignores additional pulses while active
- Accepts new pulse after completion

---

## Inputs

- clk
- reset
- pulse_in

---

## Output

- pulse_out

---

## Test Cases

✔ Reset

✔ Single pulse

✔ Multiple rapid pulses

✔ Ignore pulse during stretch

✔ Accept new pulse after completion

---

## Compile

```bash
iverilog -o pulse_stretch_sim pulse_stretch.v pulse_stretch_tb.v
```

Run

```bash
vvp pulse_stretch_sim
```

Waveform

```bash
gtkwave pulse_stretch.vcd
```

---

## Result

The PulseStretch module correctly stretches each detected pulse to five clock cycles while ignoring overlapping input pulses.