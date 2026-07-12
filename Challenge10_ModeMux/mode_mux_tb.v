`timescale 1ns/1ps

module mode_mux_tb;


reg clk;
reg reset;
reg [3:0] req;
reg mode;

wire [1:0] grant;
wire valid;



mode_mux DUT(

    .clk(clk),
    .reset(reset),
    .req(req),
    .mode(mode),
    .grant(grant),
    .valid(valid)

);



always #5 clk = ~clk;



initial
begin

    $dumpfile("mode_mux.vcd");
    $dumpvars(0,mode_mux_tb);



    clk = 0;
    reset = 1;
    req = 4'b0000;
    mode = 0;



    #10;
    reset = 0;



    // -----------------------
    // Fixed Priority Testing
    // -----------------------

    mode = 0;


    req = 4'b0001;
    #10;


    req = 4'b0110;
    #10;


    req = 4'b1111;
    #10;



    // -----------------------
    // Round Robin Testing
    // -----------------------

    mode = 1;


    req = 4'b1111;
    #10;


    req = 4'b1111;
    #10;


    req = 4'b1111;
    #10;


    req = 4'b1111;
    #10;



    // Multiple requests

    req = 4'b1010;
    #10;


    req = 4'b0101;
    #10;



    $finish;

end



initial
begin

$monitor(
"Time=%0t | Mode=%b | Request=%b | Grant=%b | Valid=%b",
$time,
mode,
req,
grant,
valid
);

end


endmodule