module pulse_stretch(
    input clk,
    input reset,
    input pulse_in,
    output reg pulse_out
);

reg [2:0] counter;
reg active;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        pulse_out <= 0;
        counter <= 0;
        active <= 0;
    end
    else
    begin
        if(!active)
        begin
            if(pulse_in)
            begin
                active <= 1;
                pulse_out <= 1;
                counter <= 3'd5;
            end
            else
            begin
                pulse_out <= 0;
            end
        end
        else
        begin
            if(counter > 1)
            begin
                counter <= counter - 1;
                pulse_out <= 1;
            end
            else
            begin
                counter <= 0;
                pulse_out <= 0;
                active <= 0;
            end
        end
    end
end

endmodule