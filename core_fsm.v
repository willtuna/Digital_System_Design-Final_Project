`ifndef _core_fsm_v
`define _core_fsm_vsm


`define state_set_sol 3'd0
`define state_guess   3'd1
`define state_compute 3'd2
`define state_result  3'd3
`define state_congrat 3'd4


module core_fsm(clk,rst,pressed,key_in_state,value_out,key_in_mode,display_state,
				off,core_op,core_mode,set,start,core_value_out);

input clk,rst,pressed;
input [2:0] key_in_state;
input [15:0] value_out;
input [1:0] key_in_mode;
input [5:0] display_state;




output reg off,set,start;
		//done   done done
output reg [1:0] core_op, core_mode;
		//       done		done
output reg [15:0] core_value_out;
		//			done


reg [2:0] c_state, n_state;
		// done		done
wire  again;
		//done


reg  [15:0] solution, guess_value;
//			done		done

wire [3:0] num_A, num_B;
//--------------------------------------- checkout ------------------------------------------------------------
checkout comput(rst,solution,guess_value,again,num_A,num_B);
//-------------------------------------------------------------------------------------------------------------
always@(posedge clk)begin
		if(rst) core_value_out <= 16'hffff;
		else begin
				case(c_state)
				`state_set_sol:	core_value_out <= value_out;
				`state_guess:	core_value_out <= value_out;
				`state_compute: core_value_out <= 16'hffff;
				`state_result:  core_value_out <= {num_A,4'd10,num_B,4'd11};
				`state_congrat: core_value_out <= 16'hffff;
				default:
								core_value_out <= 16'hffff;
				endcase
		end
end

//---------------------------------  solution ------------------------------------------------------------------------
always@(posedge clk)begin
		if(rst) solution <= 16'b0;
		else if(	(c_state == `state_set_sol) &&	(key_in_state == 'd5) )
				solution[15:0] <= value_out[15:0];
		else solution[15:0] <= solution[15:0];
end
//---------------------------------  guess_value ----------------------------------------------------------
always@(posedge clk)begin
		if(rst) guess_value <= 16'b0;
		else if(	(c_state == `state_guess) &&	(key_in_state == 'd5) )
				guess_value[15:0] <= value_out[15:0];
		else guess_value[15:0] <= guess_value[15:0];
end




//--------------------------------- core_op core_mode ----------------------------------------------------------------
always@(posedge clk)begin
		if(rst) begin
				core_op <= 2'd0;  core_mode <= 2'd0;
		end
		else begin
				case(c_state)
						`state_set_sol: begin
										core_op <= 2'd2;
										core_mode <= key_in_mode;
						end				
						`state_guess  : begin
										core_op <= 2'd0;
										core_mode <= key_in_mode;
						end
						`state_result: begin
										core_op <= 2'd0;
										core_mode <= 2'd3;
						end				
						`state_congrat  : begin
										core_op <= 2'd0; 
										core_mode <= 2'd1;
						end

						default:		begin
										core_op <= core_op;
										core_mode <= core_mode;
						end
				endcase
		end
end


//--------------------------------------- set and start for display --------------------------------------------------
always@(posedge clk)begin
		if(rst) begin
						set <= 'b0;
						start <= 'b0;
		end
		else begin
				case(c_state)
						`state_set_sol: begin
										set <= 'b1; start<= 'b1;
						end				
						`state_guess: begin
										set <= 'b1; start <='b1;
						end
						`state_result: begin
										set <= 'b1; start<= 'b1;
						end				
						`state_congrat  : begin
										set <= 'b1; start <= 'b1;
						end

						default:		begin
										set <= 'b0; start <= 'b0;
						end
				endcase
		end
end



//----------------------------------------------------------------------------------------------



//---------------------------------------------- off ----------------------------------------
always@(posedge clk)begin
		if(rst) off <= 'b1;
		else begin
				case(c_state)
						`state_set_sol:	if(key_in_state == 3'd6) 
												off<= 1'b1;
										else 
												off<= 1'b0;
						`state_guess  : if(key_in_state == 3'd6) 
												off<= 1'b1;
										else 
												off <= 1'b0;
						default:		
												off<= 1'b1;
				endcase
		end
end
//----------------------------------------------- state logic --------------------------------------------------------------
always@(posedge clk)begin
		if(rst) c_state <= `state_set_sol;
		else c_state <= n_state;
end


always@(posedge clk)begin
		if(rst) n_state <= `state_set_sol;
		else begin
				case(c_state)
						`state_set_sol:	if(key_in_state == 3'd6)n_state <= `state_guess;
										else n_state <= c_state;
						`state_guess:	if(key_in_state == 3'd6)n_state <= `state_compute;
										else n_state <= c_state;
						`state_compute:	if(again) n_state <= `state_result;
										else if( ~again) n_state <= `state_congrat;
										else n_state <= c_state;
						`state_result:  if(pressed) n_state <= `state_guess;
										else n_state <= c_state;
						`state_congrat:	if(pressed) n_state <= `state_set_sol;
										else n_state <= c_state;

						default:		n_state <= c_state;

				endcase

		end
end
//---------------------------------------------------------------------------------------------------------------------------------



endmodule






module checkout(rst,solution,guess_value,again,num_A,num_B);
input rst;
input [15:0] solution,guess_value;
output again;
output reg [3:0] num_A , num_B;


reg [3:0] allmatch [3:0];

reg [3:0] B_match [11:0];
// ------------------ num_A -----------------------------
always@(*)begin
		if(solution[15:12] == guess_value[15:12]) allmatch[3] <= 3'd1;
		else allmatch[3] <= 3'd0;
		
		if(solution[11:8] == guess_value[11:8]) allmatch[2] <= 3'd1;
		else allmatch[2] <= 3'd0;

		if(solution[7:4] == guess_value[7:4]) allmatch[1] <= 3'd1;
		else allmatch[1] <= 3'd0;
		
		if(solution[3:0] == guess_value[3:0]) allmatch[0] <= 3'd1;
		else allmatch[0] <= 3'd0;
end

always@(*)begin
		num_A = allmatch[3] + allmatch[2] + allmatch[1] + allmatch[0];
end

always@(*)begin
		if(solution[11:8] == guess_value[15:11])  B_match[2] <= 3'd1;   else B_match[2] <= 3'd0;
		if(solution[7:4]  == guess_value[15:11])  B_match[1] <= 3'd1;   else B_match[1] <= 3'd0;
		if(solution[3:0 ] == guess_value[15:11])  B_match[0] <= 3'd1;   else B_match[0] <= 3'd0;
		
		if(solution[15:12] == guess_value[11:8])  B_match[5] <= 3'd1;   else B_match[5] <= 3'd0;
		if(solution[7:4]   == guess_value[11:8])  B_match[4] <= 3'd1;   else B_match[4] <= 3'd0;
		if(solution[3:0 ]  == guess_value[11:8])  B_match[3] <= 3'd1;   else B_match[3] <= 3'd0;

		if(solution[15:12] == guess_value[7:4])  B_match[8] <= 3'd1;   else B_match[8] <= 3'd0;
		if(solution[11:8]  == guess_value[7:4])  B_match[7] <= 3'd1;   else B_match[7] <= 3'd0;
		if(solution[3:0 ]  == guess_value[7:4])  B_match[6] <= 3'd1;   else B_match[6] <= 3'd0;
		
		if(solution[15:12] ==guess_value[3:0])  B_match[11] <= 3'd1;   else B_match[11] <= 3'd0;
		if(solution[11:8]  ==guess_value[3:0])  B_match[10] <= 3'd1;   else B_match[10] <= 3'd0;
		if(solution[7:4]   ==guess_value[3:0])  B_match[9] <= 3'd1;    else B_match[9] <= 3'd0;

end


always@(*)begin
		num_B = B_match[0] +  
				B_match[1] + 
		        B_match[2] + 
				B_match[3] + 
				B_match[4] + 
				B_match[5] + 
				B_match[6] + 
				B_match[7] + 
				B_match[8] + 
				B_match[9] + 
				B_match[10]+ 
				B_match[11]; 
end

assign  again = (num_A == 'd4) ?  'b0 : 'b1;
endmodule



`endif
