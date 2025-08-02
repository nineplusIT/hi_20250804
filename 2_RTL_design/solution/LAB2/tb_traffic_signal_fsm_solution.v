`timescale 1ns / 1ps

module tb_traffic_signal_fsm();
  // Port declaration
  reg clk, reset;
  reg i_ta, i_tb;
  wire [1:0] o_sa, o_sb;
  
  // internal parameter
  parameter clk_period = 10;

  // DUT
  traffic_signal_fsm U0 (
      .clk(clk),
      .reset(reset),
      .i_ta(i_ta), .i_tb(i_tb),    // sensor input
      .o_sa(o_sa), .o_sb(o_sb)     // signal light
  );
  
  // Reset sequence
  initial begin
      reset = 0;
      #13 reset = 1;
      #(clk_period) reset = 0;
  end
  
  // Clock generation
  always begin
      clk = 0;
      forever #(clk_period/2) clk = ~clk;
  end
  
  // Stimulus
  initial begin
      i_ta = 0; i_tb = 0; #3;
      i_ta = 0; i_tb = 1; #(clk_period);
      i_ta = 1; i_tb = 0; #(clk_period);
      i_ta = 0; i_tb = 1; #(clk_period);
      i_ta = 0; i_tb = 0;
  end

endmodule
