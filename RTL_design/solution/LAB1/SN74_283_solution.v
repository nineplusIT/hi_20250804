`timescale 1ns / 1ps
// SN74_283: 4-bit Binary Full Adder with Fast Carry

module SN74_283 (A, B, C0, S, C4);
	
    // Port declarations
    input  wire [3:0] A, B;
    input  wire       C0;
    output wire [3:0] S;
    output wire       C4;
	
    // Internal nets declarations
    wire [3:0] G, P;
	
    // Internal signal Logic
    assign G = A & B;   // Generate
    assign P = A ^ B;   // Propagate
	
    // Carry Lookahead Logic
    wire C1, C2, C3;
    assign C1 = G[0] | (P[0] & C0);
    assign C2 = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C0);
    assign C3 = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C0);
    assign C4 = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) |
		(P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C0);
		
    // Final Output Sum
    assign S[0] = P[0] ^ C0;
    assign S[1] = P[1] ^ C1;
    assign S[2] = P[2] ^ C2;
    assign S[3] = P[3] ^ C3;
	
endmodule


