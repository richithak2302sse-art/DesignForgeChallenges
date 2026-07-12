`timescale 1ns/1ps

module priority_lock_tb;

reg clk;
reg reset;
reg [3:0] req;

wire [3:0] grant;

priority_lock uut(
    .clk(clk),
    .reset(reset),
    .req(req),
    .grant(grant)
);

always #5 clk = ~clk;

initial
begin

    $dumpfile("priority_lock.vcd");
    $dumpvars(0,priority_lock_tb);

    $monitor("Time=%0t Req=%b Grant=%b",
              $time,req,grant);

    clk=0;
    reset=1;
    req=4'b0000;

    #10;
    reset=0;

    // Single request
    #10 req=4'b0001;

    // Multiple requests
    #20 req=4'b1110;

    // Persistent requests
    #40 req=4'b1111;

    // Request changes
    #40 req=4'b0101;

    // No request
    #30 req=4'b0000;

    #20;

    $finish;

end

endmodule