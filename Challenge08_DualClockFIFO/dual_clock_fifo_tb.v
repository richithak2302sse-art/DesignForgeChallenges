`timescale 1ns/1ps

module dual_clock_fifo_tb;

reg wr_clk;
reg rd_clk;
reg reset;

reg wr_en;
reg rd_en;

reg [7:0] data_in;

wire [7:0] data_out;
wire full;
wire empty;

dual_clock_fifo uut(

.wr_clk(wr_clk),
.rd_clk(rd_clk),
.reset(reset),

.wr_en(wr_en),
.rd_en(rd_en),

.data_in(data_in),
.data_out(data_out),

.full(full),
.empty(empty)

);

// Different Clock Domains
always #5 wr_clk = ~wr_clk;
always #7 rd_clk = ~rd_clk;

initial
begin

$dumpfile("dual_clock_fifo.vcd");
$dumpvars(0,dual_clock_fifo_tb);

$monitor("Time=%0t WR=%b RD=%b DataIn=%d DataOut=%d Full=%b Empty=%b",
$time,wr_en,rd_en,data_in,data_out,full,empty);

wr_clk=0;
rd_clk=0;

reset=1;
wr_en=0;
rd_en=0;
data_in=0;

#20;
reset=0;

// Write
wr_en=1;

data_in=11;
#10;

data_in=22;
#10;

data_in=33;
#10;

data_in=44;
#10;

wr_en=0;

// Read
rd_en=1;

#60;

rd_en=0;

#20;

$finish;

end

endmodule