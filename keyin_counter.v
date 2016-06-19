`ifndef _keyin_counter_v
`define _keyin_counter_v

`include "keypad.v"
`include "display.v"
`define state_1st  3'd1
`define state_2nd  3'd2
`define state_3rd  3'd3
`define state_4th  3'd4
`define state_Ent  3'd5
`define keyin_finish_state 3'd6





module keyin_counter(clk,off,enc_in,pressed,op,value_out,mode,keyin_state);
input clk,off,pressed;

input [3:0] enc_in;
input [1:0] op;
output  [15:0] value_out;
output reg [1:0] mode;
output reg [2:0] keyin_state; // indicator



reg [2:0] c_state , n_state;
reg [3:0] keyin [4:0];

//------------------   Current State FF -----------------------
always@(posedge clk)begin
		if(off) c_state <= `state_1st;
		else c_state <= n_state;
end
//------------------    NextState CL --------------------------
always@(*)begin
		if(off) n_state <= `state_1st;
		else begin
				case(c_state)
				`state_1st: begin
								if(~pressed && keyin[4] != 4'hf)n_state <= `state_2nd;
								else n_state <= c_state;
						end
				`state_2nd: begin
								if(~pressed && keyin[3] != 4'hf)n_state <= `state_3rd;
								else n_state <= c_state;
						end

				`state_3rd: begin
								if(~pressed && keyin[2] != 4'hf)n_state <= `state_4th;
								else n_state <= c_state;
						end

				`state_4th: begin
								if(~pressed && keyin[1] != 4'hf)n_state <= `state_Ent;
								else n_state <= c_state;
						end

				`state_Ent: begin
								if(~pressed && keyin[0] != 4'hf)n_state <= `keyin_finish_state;
								else n_state <= c_state;
						end
				`keyin_finish_state: 
								n_state <= c_state;

				default:
								n_state <= c_state;
				endcase

		end
end
// ----------------------------------------  keyin[] ----------------------------------------
		always@(posedge clk)begin
				if(off) {keyin[4],keyin[3],keyin[2],keyin[1],keyin[0]} <= 20'hfffff;
				else begin
						case(c_state)
								`state_1st:
												keyin[4] <= pressed ? enc_in : keyin[4];
								`state_2nd:
												keyin[3] <= pressed ? enc_in : keyin[3];
								`state_3rd:
												keyin[2] <= pressed ? enc_in : keyin[2];
								`state_4th:
												keyin[1] <= pressed ? enc_in : keyin[1];
								`state_Ent:
												keyin[0] <= (pressed && enc_in == `Enter) ? enc_in : keyin[0];

						default:
												{keyin[4],keyin[3],keyin[2],keyin[1],keyin[0]} <= {keyin[4],keyin[3],keyin[2],keyin[1],keyin[0]};			
						endcase
				end
		end	
//--------------------------------------- value_out -----------------------------------------------
		assign		value_out = {keyin[4],keyin[3],keyin[2],keyin[1]};

//--------------------------------------- mode ----------------------------------------------------

		always@(posedge clk)begin
				if(off) mode <= 2'd0;
				else begin
				case(c_state)
								`state_1st:	mode <= 2'd0;
								`state_2nd: mode <= 2'd0;
								`state_3rd: mode <= 2'd0;
								`state_4th: mode <= 2'd0;
								`state_Ent:	mode <= op;
								`keyin_finish_state: mode <= op;
						default :
								mode <= 2'd0;
				endcase

				end

		end


//--------------------------           keyin_state --------------------------------

always@(*)begin
		case(c_state)
								`state_1st:  keyin_state = 3'd1;
								`state_2nd:  keyin_state = 3'd2;  
								`state_3rd:  keyin_state = 3'd3;
								`state_4th:  keyin_state = 3'd4;
								`state_Ent:  keyin_state = 3'd5;
								`keyin_finish_state: keyin_state = 3'd6;
						default:
										keyin_state = 3'd7; /// indicate into error state
		endcase
end





endmodule


`endif
