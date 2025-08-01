`timescale 1ns / 1ps

module sec_counter(clk, reset_n, en, sec_count);

    // port declaration

    // Logic
    // initialize counter at 10 clock cycle

endmodule

module timer(clk, reset_n, sec_count, stop, d, e, f, g, h, i);

    // port declaration
    
    // Logic
    // d~i, initialize g at 6

endmodule



module stopwatch_fsm(clk, reset_n, start, stop, en);
    
    //port declaration

    reg [1:0] state;
    reg [1:0] nextstate;

    parameter T0 = 2'b00; //base
    parameter T1 = 2'b01; //countup
    parameter T2 = 2'b10; //stop

    // state register
    always @(posedge clk or negedge reset_n) begin
        if (~reset_n) state <= T0;
        else          state <= nextstate;
    end

    // next state logic

    // Output logic


module stopwatch_top(clk, reset_n, start, stop, d, e, f, g, h, i);
    // port declaration

    // Instanciate

endmodule
