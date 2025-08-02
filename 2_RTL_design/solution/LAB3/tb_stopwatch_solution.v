`timescale 1ns / 1ps

module tb_stopwatch_top;

	// Port declaration
    reg clk;
    reg reset_n;
    reg start;
    reg stop;

    wire [3:0] d, e, f, g, h, i;

    // DUT
    stopwatch_top uut (
        .clk     (clk),
        .reset_n (reset_n),
        .start   (start),
        .stop    (stop),
        .d       (d),
        .e       (e),
        .f       (f),
        .g       (g),
        .h       (h),
        .i       (i)
    );

    // 50MHz Clock Generation (20ns period)
    initial clk = 0;
    always #10 clk = ~clk;

    // Task: press "start" for 1 clock cycle
    task press_start;
    begin
        start = 0;
        #(20);   // 1 clock cycle
        start = 1;
    end
    endtask

    // Task: press "stop" for 1 clock cycle
    task press_stop;
    begin
        stop = 0;
        #(20);
        stop = 1;
    end
    endtask

    // Stimulus
    initial begin
        // initialize
        reset_n = 0;
        start   = 1;
        stop    = 1;
        #50 reset_n = 1;

        // [1] Press start (T0 -> T1)
        press_start();
        #2000;

        // [2] Press start (T1 -> T2)
        press_start();
        #2000;

        // [3] Press start (T2 -> T1)
        press_start();
        #8000000; // to check "g" signal initializing at 6

        // [4] Press stop (T0)
        press_stop();
        #1000 $finish;
		
    end

    // Monitoring
    initial begin
        $dumpfile("waveform.vcd"); // dump waveform
        $dumpvars(0, tb_stopwatch_top); // dump variables
        $display("    TIME     d e f g h i   start   stop"); // monitoring
        $monitor("%8d:   %d %d %d %d %d %d     %b     %b", 
            $time, d, e, f, g, h, i, start, stop);
    end
endmodule

