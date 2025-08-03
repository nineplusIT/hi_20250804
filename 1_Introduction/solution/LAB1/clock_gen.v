`timescale 1ns / 1ps // delay + precision

module clock_gen ();
	reg clk;


	always
		#5 clk = ~clk; // 5ns toggle -> 10ns


	initial begin
		clk = 1'b0;

		#100
		$finish;
	end


endmodule




