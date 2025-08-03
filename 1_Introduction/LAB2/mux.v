`timescale 1ns / 1ps
module mux (out, sel, in_1, in_2); // enumeartion of port list

// port declaration and IO direction
output out;
input wire sel;
input wire in_1;
input wire in_2;


// behavioral modeling
reg out;
always @(sel, in_1, in_2) begin
	if (sel == 1)
		out <= in_1;
	else // sel = 0
		out <= in_2;
end
	
endmodule
