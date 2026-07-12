`timescale 1ns/1ps

module ring_buffer_tb;

reg clk;
reg reset;
reg write_en;
reg read_en;
reg [7:0] data_in;

wire [7:0] data_out;
wire full;
wire empty;

ring_buffer uut(
    .clk(clk),
    .reset(reset),
    .write_en(write_en),
    .read_en(read_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
);

// Clock
always #5 clk = ~clk;

initial
begin

    $dumpfile("ring_buffer.vcd");
    $dumpvars(0, ring_buffer_tb);

    $monitor("Time=%0t WE=%b RE=%b DataIn=%d DataOut=%d Full=%b Empty=%b",
             $time, write_en, read_en, data_in, data_out, full, empty);

    clk = 0;
    reset = 1;
    write_en = 0;
    read_en = 0;
    data_in = 0;

    #10;
    reset = 0;

    // Write 10
    write_en = 1;
    data_in = 10;
    #10;

    // Write 20
    data_in = 20;
    #10;

    // Write 30
    data_in = 30;
    #10;

    // Write 40
    data_in = 40;
    #10;

    write_en = 0;

    // Read 10
    read_en = 1;
    #10;

    // Read 20
    #10;

    // Read 30
    #10;

    // Read 40
    #10;

    read_en = 0;

    // Wrap-around test
    write_en = 1;
    data_in = 55;
    #10;

    data_in = 66;
    #10;

    write_en = 0;

    read_en = 1;
    #20;

    read_en = 0;

    #20;

    $finish;

end

endmodule