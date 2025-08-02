`timescale 1ns / 1ps

module tb_stopwatch_top;

    // Port declaration

    // DUT

    // 50MHz Clock Generation (20ns period)

    // Task: press "start" for 1 clock cycle
    task press_start;
    begin
    
    end
    endtask

    // Task: press "stop" for 1 clock cycle
    task press_stop;
    begin
    
    end
    endtask

    // Stimulus
    initial begin
        // initialize

        // [1] Press start (T0 -> T1)

        // [2] Press start (T1 -> T2)

        // [3] Press start (T2 -> T1)

        // [4] Press stop (T0)
		
    end

    // Monitoring
    initial begin
        // dump waveform
        // dump variables
        // monitoring
    end
endmodule

