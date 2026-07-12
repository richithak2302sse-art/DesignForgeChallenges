module smart_counter(
    input clk,
    input reset,
    input load,
    input enable,
    input [7:0] load_data,
    output reg [7:0] count
);

always @(posedge clk or posedge reset)
begin
    if (reset)
        count <= 8'd0;
    else if (load)
        count <= load_data;
    else if (enable)
        count <= count + 1;
    else
        count <= count;
end

endmodule