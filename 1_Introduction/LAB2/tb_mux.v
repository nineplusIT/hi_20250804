`timescale 1ns / 1ps

module tb_mux (); // top module(no need port)

// declaration stimulus signal
 wire out;
 reg sel;
 reg in_1;
 reg in_2;

// instantiation of DUT
 mux U0
 (
	 .out(out),
	 .sel(sel),
	 .in_1(in_1),
	 .in_2(in_2)
 );
// Def Task for repetitive tasks
task display;
	begin
		$display
		(
			"$time=%0d", $time, " ns"
			, " sel =", sel
			, " in_1 =", in_1
			, " in_2 = ", in_2
			, " out=", out
		);
	end
endtask

// Gen Stimulus
initial begin
	sel = 0 ; in_1 = 0; in_2 = 1; #10 ; display;
	sel = 0 ; in_1 = 1; in_2 = 0; #10 ; display;
	sel = 1 ; in_1 = 0; in_2 = 1; #10 ; display;
	sel = 1 ; in_1 = 1; in_2 = 0; #10 ; display;
	$finish;
end

// Gen Dumpfile for post-processing mode
initial begin
	$dumpfile("./mux.vcd");
	$dumpvars(0, tb_mux);
end
	
endmodule
