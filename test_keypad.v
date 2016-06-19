`include "keypad.v"
`timescale 100ps/1ps
module Test_keypad;

    reg clk, rst;
	reg [3:0]in ;
	wire [3:0] row_select;
	wire [3:0] enc_out;
	wire pressed; 
    Keypad_Top keypad(clk, rst, in, row_select,enc_out,pressed);
    /*initial begin
		$fsdbDumpfile("waveform.fsdb");
		$fsdbDumpvars;
    end*/
    

    initial
    begin
//	outfile= $fopen("OUTPUT.out");
	clk= 1'b0;
	rst= 1'b0;
    in = 4'b1111;
    end

    always begin
	#1 clk= ~clk;
    end
    
/*    always@(out)
    begin
	#5 $fdisplay(outfile, "%d out= %b   an=%d\n", $time, out, an);
    end
*/    
    initial 
    begin
	#1 rst= 1'b1;
    #10 rst = 1'b0;
	end
    initial begin
    #10000_ in =4'b1110;
    #10000_00 in =4'b1111;
    #10000_0000 in =4'b1101;
    #10000_00 in =4'b1111;
    #10000_0000 in =4'b1011;
    #10000_00 in =4'b1111;
    #10000_0000 in =4'b0111;
    #10000_00 in =4'b1111;
    #10000_0000 in =4'b1011;
    #10000_00 in =4'b1111;
    #10000_00 $stop;
    end

endmodule
