module safealu(
    input [7:0] A,
    input [7:0] B,
    input [1:0] opcode,
    output reg [7:0] Result,
    output reg Zero,
    output reg Carry,
    output reg Overflow
);

reg [8:0] temp;

always @(*) begin
    // Default values
    Result = 8'b0;
    Carry = 1'b0;
    Overflow = 1'b0;

    case(opcode)

        // ADD
        2'b00: begin
            temp = A + B;
            Result = temp[7:0];
            Carry = temp[8];
            Overflow = (~A[7] & ~B[7] & Result[7]) |
                       (A[7] & B[7] & ~Result[7]);
        end

        // SUB
        2'b01: begin
            temp = A - B;
            Result = temp[7:0];
            Carry = temp[8];
            Overflow = (~A[7] & B[7] & Result[7]) |
                       (A[7] & ~B[7] & ~Result[7]);
        end

        // AND
        2'b10: begin
            Result = A & B;
        end

        // OR
        2'b11: begin
            Result = A | B;
        end

    endcase

    Zero = (Result == 8'b00000000);

end

endmodule