`timescale 1ns/1ps

module byte_streamer_tb;

reg clk;
reg reset;
reg shift_enable;
reg serial_in;

wire [7:0] parallel_out;
wire byte_ready;

byte_streamer uut(
    .clk(clk),
    .reset(reset),
    .shift_enable(shift_enable),
    .serial_in(serial_in),
    .parallel_out(parallel_out),
    .byte_ready(byte_ready)
);

// Clock generation
always #5 clk = ~clk;

initial
begin

    $dumpfile("byte_streamer.vcd");
    $dumpvars(0, byte_streamer_tb);

    $monitor("Time=%0t Reset=%b Shift=%b Serial=%b Parallel=%b Ready=%b",
             $time, reset, shift_enable, serial_in,
             parallel_out, byte_ready);

    clk = 0;
    reset = 1;
    shift_enable = 0;
    serial_in = 0;

    #10;
    reset = 0;
    shift_enable = 1;

    // Send 10101100

    serial_in = 1; #10;
    serial_in = 0; #10;
    serial_in = 1; #10;
    serial_in = 0; #10;
    serial_in = 1; #10;
    serial_in = 1; #10;
    serial_in = 0; #10;
    serial_in = 0; #10;

    shift_enable = 0;

    #20;

    $finish;

end

endmodule