`timescale 1ns/1ps

module stop_timer_tb;

reg clk;
reg reset;
reg start;
reg stop;

wire [7:0] time_count;

stop_timer uut(
    .clk(clk),
    .reset(reset),
    .start(start),
    .stop(stop),
    .time_count(time_count)
);

// Clock generation
always #5 clk = ~clk;

initial
begin

    $dumpfile("stop_timer.vcd");
    $dumpvars(0, stop_timer_tb);

    $monitor("Time=%0t Reset=%b Start=%b Stop=%b Count=%d",
             $time, reset, start, stop, time_count);

    clk = 0;
    reset = 1;
    start = 0;
    stop = 0;

    // Reset
    #10;
    reset = 0;

    // Start stopwatch
    #10;
    start = 1;
    #10;
    start = 0;

    // Run for 5 clock cycles
    #50;

    // Stop stopwatch
    stop = 1;
    #10;
    stop = 0;

    // Wait
    #30;

    // Start again
    start = 1;
    #10;
    start = 0;

    // Run for 3 clock cycles
    #30;

    // Reset
    reset = 1;
    #10;
    reset = 0;

    #20;

    $finish;

end

endmodule