`include "keypad.v"
`include "display.v"
`include "keyin_counter.v"
`include "core_fsm.v"
module test_core_fsm;


reg clk,rst;
reg [3:0] col_in;

reg miso;


wire [3:0]row_out,enc_out;
wire pressed;
wire [1:0] mode;
wire [1:0] key_in_mode;
wire  [15:0] key_in_value_out,core_value_out;
wire off,set,start;
wire [1:0] core_op,core_mode;

wire [2:0] keyin_state;

wire [5:0] display_state;
wire mosi,sclk,ss;

keypad_Interface  key_interface(clk,rst,col_in,row_out,enc_out,pressed);
keyin_counter keyin_cnt(clk,off,enc_out,pressed,core_op,key_in_value_out, key_in_mode, keyin_state);

core_fsm    core(clk,rst,pressed,keyin_state,key_in_value_out,key_in_mode,display_state,off,core_op,core_mode,set,start,core_value_out);




display disp(clk,set,core_value_out,start,rst,core_mode,ss,mosi,miso,sclk,display_state);



initial  begin
clk = 'b0; rst ='b1; 
col_in = 4'd0;
miso='b1;
col_in = 4'b1111;
forever 
		#1clk =~clk;


end


initial begin
#10  rst = 'b0; 
end

initial #100000 col_in = 4'b1110;
initial #200000 col_in = 4'b1111;

initial #300000 col_in = 4'b1101;
initial #400000 col_in = 4'b1111;

initial #500100 col_in = 4'b1011;
initial #600000 col_in = 4'b1111;

initial #700000 col_in = 4'b0111;
initial #800000 col_in = 4'b1111;
initial begin
		#1500000 col_in =4'b1011;
		#100000 col_in = 4'b1111;


		#1800000 col_in = 4'b1110;//9
		#100000 col_in = 4'b1111;
		#100000 col_in = 4'b1101;//6
		#100000 col_in = 4'b1111;
		#100100 col_in = 4'b1011;//3
		#100000 col_in = 4'b1111;
		#1000000 col_in = 4'b1110;
		#100000 col_in = 4'b1111;
		#3500000 col_in =4'b1011;
		#100000 col_in = 4'b1111;


		#5500000 col_in = 4'b1110;
		#100000 col_in = 4'b1111;
		#100000 col_in = 4'b1101;
		#100000 col_in = 4'b1111;
		#100000 col_in = 4'b1011;
		#100000 col_in = 4'b1111;
		#100000 col_in = 4'b0111;
		#100000 col_in = 4'b1111;

		#1500000 col_in =4'b1011;
		#100000 col_in = 4'b1111;

		#10000 $stop;
end


endmodule


















