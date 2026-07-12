module byte_streamer(
    input clk,
    input reset,
    input shift_enable,
    input serial_in,
    output reg [7:0] parallel_out,
    output reg byte_ready
);

reg [2:0] bit_count;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        parallel_out <= 8'b00000000;
        bit_count <= 3'd0;
        byte_ready <= 1'b0;
    end

    else if(shift_enable)
    begin
        parallel_out <= {parallel_out[6:0], serial_in};

        if(bit_count == 3'd7)
        begin
            bit_count <= 3'd0;
            byte_ready <= 1'b1;
        end
        else
        begin
            bit_count <= bit_count + 1;
            byte_ready <= 1'b0;
        end
    end

    else
        byte_ready <= 1'b0;

end

endmodule