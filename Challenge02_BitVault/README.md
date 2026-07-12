# Challenge 2 – BitVault

## Aim

To design a 4×8 Register File with one write port.

---

## Description

The register file contains four 8-bit registers.

- 2-bit address selects one register.
- When Write Enable is HIGH, data is written.
- Data is continuously available at the output.

---

## Inputs

| Signal | Description |
|--------|-------------|
| clk | Clock |
| we | Write Enable |
| addr | Register Address |
| data_in | Input Data |

---

## Output

| Signal | Description |
|--------|-------------|
| data_out | Register Data |

---

## Files

- bit_vault.v
- bit_vault_tb.v

---

## Simulation

Compile

```bash
iverilog -o bit_vault_sim bit_vault.v bit_vault_tb.v
```

Run

```bash
vvp bit_vault_sim
```

Waveform

```bash
gtkwave bit_vault.vcd
```

---

## Test Cases

✔ Write to Register 0

✔ Write to Register 1

✔ Write to Register 2

✔ Write to Register 3

✔ Read all registers

✔ Verify write protection

---

## Expected Result

Register0 = 10

Register1 = 20

Register2 = 30

Register3 = 40

Overwrite attempt with WE=0 should fail.

---

## Result

The BitVault register file successfully stores and retrieves data.