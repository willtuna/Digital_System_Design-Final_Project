`include "core_fsm.v"
`include "keyin_counter.v"
`include "display.v"

module Game(clk,rst,col_in,row_out,miso,ss,mosi,sclk,physical_keyin_state);
input clk,rst;
input [3:0] col_in;
input miso;
output [3:0] row_out;
output ss,mosi,sclk;

output reg [5:0] physical_keyin_state;

wire pressed;

wire [15:0] value_out,core_value_out;
wire [3:0] enc_out;
wire [2:0] keyin_state;

wire [5:0] display_state;
wire [1:0] key_in_mode,core_op,core_mode;
wire off;

reg key_in_off;

wire set,start;
keypad_Interface keypad1(clk,rst,col_in,row_out,enc_out,pressed);

keyin_counter keyin_cnt(clk,key_in_off,enc_out,pressed,core_op,value_out,key_in_mode,keyin_state);
core_fsm  core_fsm(clk,rst,pressed,keyin_state,value_out,key_in_mode,display_state,
				off,core_op,core_mode,set,start,core_value_out);


display disp(clk,set,core_value_out,start,rst,core_mode, ss,mosi,miso,sclk,display_state);



always@(*)begin
		if(enc_out == 'd14)
				key_in_off = 1'b1;
		else
				key_in_off = off;
end





always@(*)begin
		if(rst) physical_keyin_state[5:0] = 6'b111111;
		else begin
				case(keyin_state)
						'd1:	physical_keyin_state[5:0] = 6'b000001;
						'd2:	physical_keyin_state[5:0] = 6'b000010;
						'd3:	physical_keyin_state[5:0] = 6'b000100;
						'd4:	physical_keyin_state[5:0] = 6'b001000;
						'd5:	physical_keyin_state[5:0] = 6'b010000;
						'd6:	physical_keyin_state[5:0] = 6'b100000;
				default:
								physical_keyin_state[5:0] = 6'b111111;
				endcase
		end
end

endmodule

