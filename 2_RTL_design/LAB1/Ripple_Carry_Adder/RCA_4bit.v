`timescale 1ns / 1ps
// 4-bit Ripple Carry Adder

module RCA_4bit (A, B, C0, S, C4);
    
    // Port declarations
    input  wire [3:0] A, B;
    input  wire       C0;
    output wire [3:0] S;
    output wire       C4;

    // Internal carry signals
    wire C1, C2, C3;

    // Full Adder for each bit
    assign S[0] = A[0] ^ B[0] ^ C0;
    assign C1   = (A[0] & B[0]) | (C0 & (A[0] ^ B[0]));

    assign S[1] = A[1] ^ B[1] ^ C1;
    assign C2   = (A[1] & B[1]) | (C1 & (A[1] ^ B[1]));

    assign S[2] = A[2] ^ B[2] ^ C2;
    assign C3   = (A[2] & B[2]) | (C2 & (A[2] ^ B[2]));

    assign S[3] = A[3] ^ B[3] ^ C3;
    assign C4   = (A[3] & B[3]) | (C3 & (A[3] ^ B[3]));

endmodule
