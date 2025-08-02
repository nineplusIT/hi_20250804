`timescale 1ns / 1ps

module tb_SN74_283();

	// Port declarations
    reg  [3:0] A, B;
    reg        C0;
    wire [3:0] S;
    wire       C4;
	
	// DUT
    SN74_283 u0 (
        .A(A), .B(B), .C0(C0), .S(S), .C4(C4)
    );
	
	// stimulus
    initial begin
		A = 4'b0000; B = 4'b0000; C0 = 1'b0; #10;
        A = 4'b0101; B = 4'b0011; C0 = 1'b0; #10;
        A = 4'b1111; B = 4'b0001; C0 = 1'b0; #10;
        A = 4'b1111; B = 4'b1111; C0 = 1'b1; #10;
        A = 4'b1010; B = 4'b0101; C0 = 1'b1; #10;
        $finish;
    end
	
endmodule


