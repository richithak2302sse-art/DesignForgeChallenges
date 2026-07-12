# Challenge 5 – SafeALU

## Aim

Design an 8-bit Arithmetic Logic Unit.

---

## Operations

| Opcode | Operation |
|---------|-----------|
|00|Addition|
|01|Subtraction|
|10|AND|
|11|OR|

---

## Flags

- Zero
- Carry
- Overflow

---

## Test Cases

✔ Addition

✔ Subtraction

✔ AND

✔ OR

✔ Overflow

✔ Carry

✔ Zero

---

## Compile

```bash
iverilog -o safe_alu_sim safe_alu.v safe_alu_tb.v
```

Run

```bash
vvp safe_alu_sim
```

Waveform

```bash
gtkwave safe_alu.vcd
```

---

## Result

The SafeALU successfully performs arithmetic and logical operations while generating correct Zero, Carry, and Overflow flags.