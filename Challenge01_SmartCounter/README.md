# Challenge 1 – SmartCounter

## Aim
Design an 8-bit Smart Counter with asynchronous reset, load, and enable inputs.

## Description
The Smart Counter performs the following operations:

- Asynchronous Reset: Clears the counter to zero immediately.
- Load: Loads an 8-bit value into the counter.
- Enable: Increments the counter by one on every positive clock edge.
- Hold: Maintains the current value when neither reset, load, nor enable is active.

## Inputs

| Signal | Description |
|---------|-------------|
| clk | Clock Signal |
| reset | Asynchronous Reset |
| load | Load Enable |
| enable | Counter Enable |
| load_data | 8-bit Input Data |

## Output

| Signal | Description |
|---------|-------------|
| count | 8-bit Counter Output |

## Files

- smart_counter.v
- smart_counter_tb.v

## Simulation

Compile:

```bash
iverilog smart_counter.v smart_counter_tb.v
```

Run:

```bash
vvp a.out
```

Open Waveform:

```bash
gtkwave smart_counter.vcd
```

## Test Cases

1. Reset Counter
2. Load Value 25
3. Increment Counter
4. Hold Counter Value
5. Load Value 100
6. Increment Again

## Expected Output

| Operation | Count |
|-----------|------|
| Reset | 0 |
| Load 25 | 25 |
| Increment | 26 |
| Increment | 27 |
| Increment | 28 |
| Hold | 28 |
| Load 100 | 100 |
| Increment | 101 |
| Increment | 102 |

## Result

The Smart Counter was successfully designed and verified using the testbench.

## Conclusion

The Smart Counter correctly performs reset, load, increment, and hold operations according to the specifications.