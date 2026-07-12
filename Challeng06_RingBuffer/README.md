# Challenge 6 – RingBuffer

## Aim

Design a FIFO (Ring Buffer) with depth 4.

---

## Features

- FIFO depth = 4
- 8-bit data
- Write Enable
- Read Enable
- Full flag
- Empty flag

---

## Inputs

- clk
- reset
- write_en
- read_en
- data_in

---

## Outputs

- data_out
- full
- empty

---

## Test Cases

✔ Reset

✔ Push four values

✔ Verify FULL flag

✔ Pop four values

✔ Verify EMPTY flag

✔ Wrap-around write/read

---

## Compile

```bash
iverilog -o ring_buffer_sim ring_buffer.v ring_buffer_tb.v
```

Run

```bash
vvp ring_buffer_sim
```

Waveform

```bash
gtkwave ring_buffer.vcd
```

---

## Result

The FIFO correctly stores and retrieves data while maintaining proper FULL and EMPTY status.