`timescale 1ns/1ps

module smart_counter_tb;

reg clk;
reg reset;
reg load;
reg enable;
reg [7:0] load_data;
wire [7:0] count;

smart_counter uut (
    .clk(clk),
    .reset(reset),
    .load(load),
    .enable(enable),
    .load_data(load_data),
    .count(count)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    load = 0;
    enable = 0;
    load_data = 8'd0;

    #10;
    reset = 0;

    // Load value 20
    load = 1;
    load_data = 8'd20;
    #10;
    load = 0;

    // Enable counting
    enable = 1;
    #50;

    enable = 0;
    #20;

    $finish;
end

initial begin
    $dumpfile("smart_counter.vcd");
    $dumpvars(0, smart_counter_tb);
end

endmodule