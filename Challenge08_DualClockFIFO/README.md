# Challenge 8 – DualClockFIFO

## Aim

Design a FIFO having separate write and read clocks.

---

## Features

- Independent Write Clock
- Independent Read Clock
- FIFO Depth = 4
- Gray Code Pointer Conversion
- Full Flag
- Empty Flag

---

## Inputs

- wr_clk
- rd_clk
- reset
- wr_en
- rd_en
- data_in

---

## Outputs

- data_out
- full
- empty

---

## Test Cases

✔ Reset

✔ Multiple Writes

✔ Multiple Reads

✔ Different Clock Frequencies

✔ Full Flag

✔ Empty Flag

---

## Compile

```bash
iverilog -o dual_clock_fifo_sim dual_clock_fifo.v dual_clock_fifo_tb.v
```

Run

```bash
vvp dual_clock_fifo_sim
```

Waveform

```bash
gtkwave dual_clock_fifo.vcd
```

---

## Result

The FIFO successfully transfers data between different write and read clock domains while using Gray-code pointers.