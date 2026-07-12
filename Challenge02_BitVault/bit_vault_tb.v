`timescale 1ns/1ps

module bit_vault_tb;

reg clk;
reg we;
reg [1:0] addr;
reg [7:0] data_in;

wire [7:0] data_out;

// Instantiate DUT
bit_vault uut(
    .clk(clk),
    .we(we),
    .addr(addr),
    .data_in(data_in),
    .data_out(data_out)
);

// Clock generation
always #5 clk = ~clk;

initial
begin

    $dumpfile("bit_vault.vcd");
    $dumpvars(0, bit_vault_tb);

    $monitor("Time=%0t WE=%b ADDR=%d DATA_IN=%d DATA_OUT=%d",
              $time,we,addr,data_in,data_out);

    clk = 0;
    we = 0;
    addr = 0;
    data_in = 0;

    // Write 10 to Register 0
    #10;
    we = 1;
    addr = 2'b00;
    data_in = 8'd10;

    #10;

    // Write 20 to Register 1
    addr = 2'b01;
    data_in = 8'd20;

    #10;

    // Write 30 to Register 2
    addr = 2'b10;
    data_in = 8'd30;

    #10;

    // Write 40 to Register 3
    addr = 2'b11;
    data_in = 8'd40;

    #10;

    // Disable Write
    we = 0;

    // Read Register 0
    addr = 2'b00;

    #10;

    // Read Register 1
    addr = 2'b01;

    #10;

    // Read Register 2
    addr = 2'b10;

    #10;

    // Read Register 3
    addr = 2'b11;

    #10;

    // Try overwrite while WE=0
    addr = 2'b01;
    data_in = 8'd99;

    #10;

    // Read Register 1 again
    addr = 2'b01;

    #20;

    $finish;

end

endmodule