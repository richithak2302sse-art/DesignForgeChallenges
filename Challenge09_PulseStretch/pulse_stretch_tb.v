`timescale 1ns/1ps

module pulse_stretch_tb;

reg clk;
reg reset;
reg pulse_in;

wire pulse_out;

pulse_stretch uut(
    .clk(clk),
    .reset(reset),
    .pulse_in(pulse_in),
    .pulse_out(pulse_out)
);

always #5 clk = ~clk;

initial
begin

    $dumpfile("pulse_stretch.vcd");
    $dumpvars(0,pulse_stretch_tb);

    $monitor("Time=%0t PulseIn=%b PulseOut=%b",
             $time,pulse_in,pulse_out);

    clk = 0;
    reset = 1;
    pulse_in = 0;

    #10;
    reset = 0;

    // First pulse
    #10;
    pulse_in = 1;
    #10;
    pulse_in = 0;

    // Ignored pulse during stretch
    #20;
    pulse_in = 1;
    #10;
    pulse_in = 0;

    // New pulse after stretch
    #60;
    pulse_in = 1;
    #10;
    pulse_in = 0;

    #80;

    $finish;

end

endmodule