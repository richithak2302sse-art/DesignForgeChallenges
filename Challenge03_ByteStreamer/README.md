# Challenge 3 – ByteStreamer

## Aim

Design an 8-bit Serial-to-Parallel Converter.

---

## Description

The ByteStreamer collects one serial bit on each positive clock edge when
`shift_enable` is HIGH.

After receiving 8 bits:

- The complete byte is available on `parallel_out`
- `byte_ready` becomes HIGH for one clock cycle.

---

## Inputs

| Signal | Description |
|---------|-------------|
| clk | Clock |
| reset | Asynchronous Reset |
| shift_enable | Shift Enable |
| serial_in | Serial Data |

---

## Outputs

| Signal | Description |
|---------|-------------|
| parallel_out | 8-bit Output |
| byte_ready | Byte Complete Flag |

---

## Files

- byte_streamer.v
- byte_streamer_tb.v

---

## Compilation

```bash
iverilog -o byte_streamer_sim byte_streamer.v byte_streamer_tb.v
```

## Simulation

```bash
vvp byte_streamer_sim
```

## Waveform

```bash
gtkwave byte_streamer.vcd
```

---

## Test Cases

- Reset
- Shift 8 serial bits
- Verify parallel output
- Verify byte_ready signal

---

## Expected Output

Input Bits:

10101100

Output Byte:

10101100

byte_ready = 1 after the eighth bit.

---

## Result

The ByteStreamer successfully converts serial data into an 8-bit parallel byte.