`include "keypad.v"
`include "display.v"
`include "keyin_counter.v"
module test_keyin_counter;


reg clk,rst,off_key_cnt;
reg [3:0] col_in;
reg [1:0] op;
reg set,start,miso;


wire [3:0]row_out,enc_out;
wire pressed;
wire [1:0] mode;

wire  [15:0] value_out;
keypad_Interface  key_interface(clk,rst,col_in,row_out,enc_out,pressed);

wire [2:0] keyin_state;
keyin_counter keyin_cnt(clk,off_key_cnt,enc_out,pressed,op,value_out, mode, keyin_state);

wire [5:0] display_state;
wire mosi,sclk,ss;

display disp(clk,set,value_out,start,rst,mode,ss,mosi,miso,sclk,display_state);



initial  begin
clk = 'b0; rst ='b1; off_key_cnt ='b1;
col_in = 4'd0;
set = 'b0; start = 'b0; miso='b1;
col_in = 4'b1111;
op = 2'd2;
forever 
		#1clk =~clk;


end


initial begin
#10  rst = 'b0; off_key_cnt = 'b0;
set = 'b1; start='b1;
end

initial #100000 col_in = 4'b1110;
initial #200000 col_in = 4'b1111;

initial #300000 col_in = 4'b1101;
initial #400000 col_in = 4'b1111;

initial #500100 col_in = 4'b1011;
initial #600000 col_in = 4'b1111;

initial #700000 col_in = 4'b1110;
initial #800000 col_in = 4'b1111;
initial #900000 col_in = 4'b1110;
initial#1000000 col_in = 4'b1111;
initial begin
		#1100000 off_key_cnt = 1'b1;  op = 2'd3;
		#1000	 off_key_cnt = 1'b0;
		#100000 col_in = 4'b1110;
		#100000 col_in = 4'b1111;
		#100000 col_in = 4'b1101;
		#100000 col_in = 4'b1111;
		#100100 col_in = 4'b1011;
		#100000 col_in = 4'b1111;
		#100000 col_in = 4'b1110;
		#100000 col_in = 4'b1111;
		#100000 col_in = 4'b1110;
		#100000 col_in = 4'b1111;

		#10000 $stop;
end


endmodule


















