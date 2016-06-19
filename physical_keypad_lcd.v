`include "keyin_counter.v"
`include "keypad.v"
`include "display.v"
/*reference
`define state_1st  3'd1
`define state_2nd  3'd2
`define state_3rd  3'd3
`define state_4th  3'd4
`define state_Ent  3'd5
`define keyin_finish_state 3'd6
*/
module physical_keypad_display(clk,rst,col_in,row_out,miso, ss, mosi, sclk,physical_keyin_state);
input clk,rst;
input [3:0] col_in;
input miso;
output [3:0] row_out;
output ss,mosi,sclk;

output reg [5:0] physical_keyin_state;

wire pressed;

wire [15:0] value_out;
wire [3:0] enc_out;
wire [2:0] keyin_state;
wire [1:0] mode;

wire [5:0] state;


//wire m_clk;
//clock_gen main_clk(clk,rst,m_clk);

keypad_Interface keypad1(clk,rst,col_in,row_out,enc_out,pressed);


keyin_counter keyin_cnt(clk,rst,enc_out,pressed,2'd2,value_out,mode,keyin_state);


display disp(clk,1'b1,value_out,1'b1,rst,mode, ss,mosi,miso,sclk,state);

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



module clock_gen(clk,rst,clk_out);
parameter dividend = 1024;


input clk,rst;
output reg clk_out;
reg [19:0] counter;
always@(posedge clk)begin
		if(rst) begin
				clk_out <= 'b0;
				counter <= 'd0;
		end
		else begin
				if(counter < (dividend/2)) begin
						clk_out <= 'b0;
						counter <= counter + 'd1;
				end
				else if(counter < dividend) begin
						clk_out <= 'b1;
						counter <= counter +  'd1;
				end
				else
						counter <= 'd0;

		end
end


endmodule







