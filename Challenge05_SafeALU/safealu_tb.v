`timescale 1ns/1ps

module safealu_tb;

reg [7:0] A;
reg [7:0] B;
reg [1:0] opcode;

wire [7:0] Result;
wire Zero;
wire Carry;
wire Overflow;

safealu uut(
    .A(A),
    .B(B),
    .opcode(opcode),
    .Result(Result),
    .Zero(Zero),
    .Carry(Carry),
    .Overflow(Overflow)
);

initial begin

    $dumpfile("safealu.vcd");
    $dumpvars(0, safealu_tb);

    $display("------------------------------------------------------------");
    $display("Time\tOpcode\tA\tB\tResult\tZero\tCarry\tOverflow");
    $display("------------------------------------------------------------");

    $monitor("%0t\t%b\t%d\t%d\t%d\t%b\t%b\t%b",
             $time, opcode, A, B, Result, Zero, Carry, Overflow);

    // Test 1: ADD
    A = 20; B = 15; opcode = 2'b00;
    #20;

    // Test 2: SUB
    A = 40; B = 10; opcode = 2'b01;
    #20;

    // Test 3: AND
    A = 8'b10101010;
    B = 8'b11001100;
    opcode = 2'b10;
    #20;

    // Test 4: OR
    A = 8'b10101010;
    B = 8'b11001100;
    opcode = 2'b11;
    #20;

    // Test 5: Overflow
    A = 8'd127;
    B = 8'd1;
    opcode = 2'b00;
    #20;

    // Test 6: Zero flag
    A = 8'd25;
    B = 8'd25;
    opcode = 2'b01;
    #20;

    // Test 7: Carry flag
    A = 8'd255;
    B = 8'd1;
    opcode = 2'b00;
    #20;

    $finish;

end

endmodule