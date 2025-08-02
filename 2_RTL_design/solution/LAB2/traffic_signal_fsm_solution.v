`timescale 1ns / 1ps

module trafficsignal_fsm(clk, reset, i_ta, i_tb, o_sa, o_sb);
	// Port declaration
	input 			 clk;
	input 			 reset;
	input 			 i_ta, i_tb; // sensor input
	output reg [1:0] o_sa, o_sb; // signal light
	
	// internal variable & parameter
	reg [1:0] state, next_state;

	parameter S0 = 2'b00;
	parameter S1 = 2'b01;
	parameter S2 = 2'b11;
	parameter S3 = 2'b10;

	parameter RED    = 2'b00;
	parameter YELLOW = 2'b01;
	parameter GREEN  = 2'b10;

	// status register
	always @(posedge clk or posedge reset) begin
		if (reset) state <= S0;
		else       state <= next_state;
	end

	// next state logic
	always @(state or i_ta or i_tb) begin
		case (state)
			S0: if (~i_ta) next_state = S1;
				else      next_state = S0;
			S1: next_state = S2;
			S2: if (~i_tb) next_state = S3;
				else      next_state = S2;
			S3: next_state = S0;
			default: next_state = S0; // avoid latch
		endcase
	end

	// output logic
	always @(state) begin
		if (state == S0) begin
			o_sa = GREEN;
			o_sb = RED;
		end else if (state == S1) begin
			o_sa = YELLOW;
			o_sb = RED;
		end else if (state == S2) begin
			o_sa = RED;
			o_sb = GREEN;
		end else if (state == S3) begin
			o_sa = RED;
			o_sb = YELLOW;
		end
	end

endmodule