module stop_timer(
    input clk,
    input reset,
    input start,
    input stop,
    output reg [7:0] time_count
);

parameter IDLE = 1'b0;
parameter RUN  = 1'b1;

reg state;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        state <= IDLE;
        time_count <= 8'd0;
    end
    else
    begin
        case(state)

        IDLE:
        begin
            if(start)
                state <= RUN;
        end

        RUN:
        begin
            if(stop)
                state <= IDLE;
            else
                time_count <= time_count + 1;
        end

        endcase
    end
end

endmodule