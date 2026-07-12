module ring_buffer(
    input clk,
    input reset,
    input write_en,
    input read_en,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output full,
    output empty
);

reg [7:0] fifo[0:3];

reg [1:0] write_ptr;
reg [1:0] read_ptr;
reg [2:0] count;

assign full = (count == 4);
assign empty = (count == 0);

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        write_ptr <= 0;
        read_ptr <= 0;
        count <= 0;
        data_out <= 0;
    end
    else
    begin
        // Write
        if(write_en && !full)
        begin
            fifo[write_ptr] <= data_in;
            write_ptr <= write_ptr + 1;
            count <= count + 1;
        end

        // Read
        if(read_en && !empty)
        begin
            data_out <= fifo[read_ptr];
            read_ptr <= read_ptr + 1;
            count <= count - 1;
        end
    end
end

endmodule