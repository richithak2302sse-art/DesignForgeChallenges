module bit_vault(
    input clk,
    input we,
    input [1:0] addr,
    input [7:0] data_in,
    output [7:0] data_out
);

reg [7:0] reg_file [3:0];

// Write Operation
always @(posedge clk)
begin
    if (we)
        reg_file[addr] <= data_in;
end

// Read Operation
assign data_out = reg_file[addr];

endmodule