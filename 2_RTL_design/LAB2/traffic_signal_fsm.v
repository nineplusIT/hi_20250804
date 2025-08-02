`timescale 1ns / 1ps

module trafficsignal_fsm(clk, reset, i_ta, i_tb, o_sa, o_sb);
	// Port declaration
	
	// internal variable & parameter
	reg [1:0] state, next_state;
	
	// state parameter
	parameter S0 = 2'b00;
	parameter S1 = 2'b01;
	parameter S2 = 2'b11;
	parameter S3 = 2'b10;

	// traffic light parameter
	parameter RED    = 2'b00;
	parameter YELLOW = 2'b01;
	parameter GREEN  = 2'b10;

	// status register
	always @(posedge clk or posedge reset) begin
		if (reset) state <= S0;
		else       state <= next_state;
	end

	// next state logic

	// output logic

endmodule
