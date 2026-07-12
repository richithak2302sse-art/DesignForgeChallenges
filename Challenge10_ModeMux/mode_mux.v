module mode_mux(
    input clk,
    input reset,
    input [3:0] req,
    input mode,              // 0 = Fixed Priority, 1 = Round Robin

    output reg [1:0] grant,
    output reg valid
);

reg [1:0] pointer;


// Round Robin priority pointer
always @(posedge clk or posedge reset)
begin

    if(reset)
    begin
        pointer <= 2'b00;
        grant <= 2'b00;
        valid <= 1'b0;
    end

    else
    begin

        valid <= 1'b0;


        // ---------------------------
        // Fixed Priority Mode
        // Priority: req3 > req2 > req1 > req0
        // ---------------------------

        if(mode == 1'b0)
        begin

            if(req[3])
            begin
                grant <= 2'b11;
                valid <= 1'b1;
            end

            else if(req[2])
            begin
                grant <= 2'b10;
                valid <= 1'b1;
            end

            else if(req[1])
            begin
                grant <= 2'b01;
                valid <= 1'b1;
            end

            else if(req[0])
            begin
                grant <= 2'b00;
                valid <= 1'b1;
            end

        end



        // ---------------------------
        // Round Robin Mode
        // ---------------------------

        else
        begin

            case(pointer)

            2'b00:
            begin
                if(req[0])
                begin
                    grant <= 2'b00;
                    pointer <= 2'b01;
                    valid <= 1'b1;
                end
                else if(req[1])
                begin
                    grant <= 2'b01;
                    pointer <= 2'b10;
                    valid <= 1'b1;
                end
                else if(req[2])
                begin
                    grant <= 2'b10;
                    pointer <= 2'b11;
                    valid <= 1'b1;
                end
                else if(req[3])
                begin
                    grant <= 2'b11;
                    pointer <= 2'b00;
                    valid <= 1'b1;
                end
            end



            2'b01:
            begin
                if(req[1])
                begin
                    grant <= 2'b01;
                    pointer <= 2'b10;
                    valid <= 1'b1;
                end
                else if(req[2])
                begin
                    grant <= 2'b10;
                    pointer <= 2'b11;
                    valid <= 1'b1;
                end
                else if(req[3])
                begin
                    grant <= 2'b11;
                    pointer <= 2'b00;
                    valid <= 1'b1;
                end
                else if(req[0])
                begin
                    grant <= 2'b00;
                    pointer <= 2'b01;
                    valid <= 1'b1;
                end
            end



            2'b10:
            begin
                if(req[2])
                begin
                    grant <= 2'b10;
                    pointer <= 2'b11;
                    valid <= 1'b1;
                end
                else if(req[3])
                begin
                    grant <= 2'b11;
                    pointer <= 2'b00;
                    valid <= 1'b1;
                end
                else if(req[0])
                begin
                    grant <= 2'b00;
                    pointer <= 2'b01;
                    valid <= 1'b1;
                end
                else if(req[1])
                begin
                    grant <= 2'b01;
                    pointer <= 2'b10;
                    valid <= 1'b1;
                end
            end



            2'b11:
            begin
                if(req[3])
                begin
                    grant <= 2'b11;
                    pointer <= 2'b00;
                    valid <= 1'b1;
                end
                else if(req[0])
                begin
                    grant <= 2'b00;
                    pointer <= 2'b01;
                    valid <= 1'b1;
                end
                else if(req[1])
                begin
                    grant <= 2'b01;
                    pointer <= 2'b10;
                    valid <= 1'b1;
                end
                else if(req[2])
                begin
                    grant <= 2'b10;
                    pointer <= 2'b11;
                    valid <= 1'b1;
                end
            end

            endcase

        end

    end

end

endmodule