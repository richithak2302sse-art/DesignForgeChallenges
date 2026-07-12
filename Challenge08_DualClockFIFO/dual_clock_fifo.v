module dual_clock_fifo(
    input wr_clk,
    input rd_clk,
    input reset,

    input wr_en,
    input rd_en,

    input [7:0] data_in,
    output reg [7:0] data_out,

    output full,
    output empty
);

parameter DEPTH = 4;

reg [7:0] mem [0:DEPTH-1];

// Binary pointers
reg [2:0] wr_ptr_bin;
reg [2:0] rd_ptr_bin;

// Gray pointers
reg [2:0] wr_ptr_gray;
reg [2:0] rd_ptr_gray;

// Binary → Gray
function [2:0] bin2gray;
input [2:0] bin;
begin
    bin2gray = (bin >> 1) ^ bin;
end
endfunction

assign full =
    ((wr_ptr_bin + 1) % DEPTH) == (rd_ptr_bin % DEPTH);

assign empty =
    (wr_ptr_bin == rd_ptr_bin);

// Write Clock
always @(posedge wr_clk or posedge reset)
begin
    if(reset)
    begin
        wr_ptr_bin <= 0;
        wr_ptr_gray <= 0;
    end
    else if(wr_en && !full)
    begin
        mem[wr_ptr_bin[1:0]] <= data_in;
        wr_ptr_bin <= wr_ptr_bin + 1;
        wr_ptr_gray <= bin2gray(wr_ptr_bin + 1);
    end
end

// Read Clock
always @(posedge rd_clk or posedge reset)
begin
    if(reset)
    begin
        rd_ptr_bin <= 0;
        rd_ptr_gray <= 0;
        data_out <= 0;
    end
    else if(rd_en && !empty)
    begin
        data_out <= mem[rd_ptr_bin[1:0]];
        rd_ptr_bin <= rd_ptr_bin + 1;
        rd_ptr_gray <= bin2gray(rd_ptr_bin + 1);
    end
end

endmodule