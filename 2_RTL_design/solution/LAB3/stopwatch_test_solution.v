`timescale 1ns / 1ps

module sec_counter(clk, reset_n, en, sec_count);

    // port declaration
    input             clk;
    input             reset_n;
    input      [1:0]  en;
    output reg [18:0] sec_count; // 50MHz

	// Logic
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            sec_count <= 19'd0;
        else if (en == 2'b01) begin // enable
            if (sec_count == 19'd9) // for test. if you want "1 sec", 19'd499_999
                sec_count <= 19'd0;
            else
                sec_count <= sec_count + 1'b1;
        end
        else if (en == 2'b10) begin
            sec_count <= sec_count; // stop temporarily
        end
        else
            sec_count = 0; // not active
    end

endmodule

module timer(clk, reset_n, sec_count, stop, d, e, f, g, h, i);

    // port declaration
    input        clk;
    input        reset_n;
    input [18:0] sec_count;
    input        stop;

    output reg [3:0] d;
    output reg [3:0] e;
    output reg [3:0] f;
    output reg [3:0] g;
    output reg [3:0] h;
    output reg [3:0] i;

	// Logic
    always @(posedge clk or negedge reset_n) begin
        if (~reset_n)                           d <= 4'd0;
        else begin
            if ((d==4'b1010) || ~stop)          d <= 4'd0; 
            else begin
                if (sec_count == 19'd9)   d <= d + 4'd1; // for test. if you want "1 sec", 19'd499_999
                else;
            end
        end
    end

    always @(posedge clk or negedge reset_n) begin
        if (~reset_n)                       e <= 4'd0;
        else begin
            if ((e==4'b1010) || ~stop)      e <= 4'd0; 
            else begin
                if (d ==4'b1010)            e <= e + 4'd1;
                else;
            end
        end
    end

    always @(posedge clk or negedge reset_n) begin
        if (~reset_n)                       f <= 4'd0;
        else begin
            if ((f==4'b1010) || ~stop)      f <= 4'd0; 
            else begin
                if (e ==4'b1010)            f <= f + 4'd1;
                else;
            end
        end
    end

    always @(posedge clk or negedge reset_n) begin
        if (~reset_n)                       g <= 4'd0;
        else begin
            if ((g==4'b0110) || ~stop)      g <= 4'd0; 
            else begin
                if (f ==4'b1010)            g <= g + 4'd1;
                else;
            end
        end
    end
    
    always @(posedge clk or negedge reset_n) begin
        if (~reset_n)                       h <= 4'd0;
        else begin
            if ((h==4'b1010) || ~stop)      h <= 4'd0; 
            else begin
                if (g ==4'b0110)            h <= h + 4'd1;
                else;
            end
        end
    end
    
    always @(posedge clk or negedge reset_n) begin
        if (~reset_n)                       i <= 4'd0;
        else begin
            if ((i==4'b0110) || ~stop)      i <= 4'd0; 
            else begin
                if (h ==4'b1010)            i <= i + 4'd1;
                else;
            end
        end
    end

endmodule



module stopwatch_fsm(clk, reset_n, start, stop, en);
    
    //port declaration
    input            clk;
    input            reset_n;
    input            start;
    input            stop;
    output reg [1:0] en;

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
    always @(state or start or stop) begin
        if (~stop)
            nextstate = T0;
        else begin
            case(state)
                T0 : if (start==0)  nextstate = T1;
                     else           nextstate = T0;
                T1 : if (start==0)  nextstate = T2;
                     else           nextstate = T1;
                T2 : if (start==0)  nextstate = T1;
                     else           nextstate = T2;
                default :           nextstate = T0;
            endcase
        end
    end

    // Output logic
    always @(state) begin
        case(state)
            T1 :      en = T1;
            T2 :      en = T2;
            default : en = T0;
        endcase
    end
endmodule


module stopwatch_top(clk, reset_n, start, stop, d, e, f, g, h, i);
    // port declaration
    input clk;
    input reset_n;
    input start;
    input stop;

    output [3:0] d;
    output [3:0] e;
    output [3:0] f;
    output [3:0] g;
    output [3:0] h;
    output [3:0] i;

    wire [18:0] sec_count;
    wire [1:0]  en;

	// Instanciate
    sec_counter     sec_counter(
        .clk       (clk      ),
        .reset_n   (reset_n  ),
        .en        (en       ),
        .sec_count (sec_count)
    );

    stopwatch_fsm stopwatch_fsm(
        .clk       (clk      ),
        .reset_n   (reset_n  ),
        .start     (start    ),
        .stop      (stop     ),
        .en        (en       )
    );

    timer                 timer(
        .clk       (clk      ),
        .reset_n   (reset_n  ),
        .sec_count (sec_count),
        .stop      (stop     ),
        .d         (d        ),
        .e         (e        ),
        .f         (f        ),
        .g         (g        ),
        .h         (h        ),
        .i         (i        )
    );
endmodule
