//  This module will only do the output that you give it
//  or the build in words you wish to output it


`ifndef _FSM_V
`define _FSM_V


// Finite State Machine
`define set_state			 3'd0//0
`define display_state        3'd1//1
`define delay_display        3'd2//2
`define finish_state         3'd3//3

//           mode definition
`define normal     2'd0// normal output
`define congrat    2'd1// output Congratulation  !
`define set_value  2'd2// output Value Set       !
`define guess      2'd3 // output Guess Again     !


module fsm(		
//         -------------- input --------------------
				clk,
				set,
				input_value,
				start,
				end_transmission,
				rst,
				mode,
// ---------------------- output --------------------
				data_out,
				slave_select,
				begin_transmission,
				//  This could be used to notify to change to change the set and start to 0 !!!!!!!!!!!!!!!!!!!!!
				state
				);

parameter input_size = 16;
parameter out_size = 152;





//   ---------------------- inpput ----------------------
input clk,set,start,rst,end_transmission;
input [1:0]     mode;                                                                         
input [input_size-1:0]	input_value; // there are four 4-bit value

//------------------------ output -------------------------
output reg [out_size-1:0] data_out;

output reg slave_select, begin_transmission;
//           done           done
wire  [31:0] ascii_out; // set the value of the ascii code 
output reg [5:0] state; // state notification for checking !!! Actually it is debug-usage


//-------------------------Temporary for state or others -------------------------------
reg [input_size-1 :0] set_value;
reg  end_display;
reg [2:0] current_state, next_state;
reg [26:0] delay_cnt;
//--------------------------------------------------------------------- delay_cnt_max  setting ---------------------------------
parameter delay_cnt_max =  //27'd125_000_000;
   27'd125_00; 
//------------------------------------------------------------------------------------------------------------------------------

//  ---------------- Put the current value to output the ascii code for output
		ascii_encoder decode4 ( set_value[15:12], ascii_out[31:24]);
		ascii_encoder decode3 ( set_value[11:8],  ascii_out[23:16]);
		ascii_encoder decode2 ( set_value[7:4],   ascii_out[15:8]);
		ascii_encoder decode1 ( set_value[3:0],   ascii_out[7:0]);


//     ----------------- State Transition FF --------------------------------------
		always@(posedge clk)begin
				if(rst)
						current_state <= `set_state;
                else
						current_state <= next_state;
		end

//							  NextState Logic Combinational Logic
		always@(clk)begin
				if(rst)begin
						next_state = `set_state;
				end
				else begin
						case(current_state) 
						`set_state : 
									if(start && set)
										next_state = `display_state;
								    else
										next_state = current_state;
						`display_state:
								    if(end_display)
										next_state = `delay_display;
								    else
										next_state = current_state;
						`delay_display://             Newly Add Display Delay
										if(delay_cnt == delay_cnt_max)
												next_state = `finish_state;
										else
												next_state = current_state;
						`finish_state:
										next_state = `set_state;
						default:
										next_state = current_state;
						endcase
				end
		end

// -------------------------- end_display -----------------------------		
		always@(*)begin
				case(current_state)
						`display_state:
										if(end_transmission == 1'b1)
												end_display = 1'b1;
										else
												end_display = 1'b0;
						default:
										end_display = 1'b0;
				endcase
		end
// -------------------------- set_value -----------------------------

		always@(*)begin
		if(rst) set_value[input_size-1:0] <= 'd0;
		else if(set)
				set_value[input_size-1:0] <= input_value[input_size-1:0];

		end
/*
		always@(*)begin
				case(count_end)
						4'd0:			data_out[7:0]= 8'h1B;		// Esc
						4'd1:			data_out[7:0]= 8'h5B;		// [
						4'd2:			data_out[7:0]= 8'h6A;		// j
                                                      
						 // Set the cursor p_osition to row 0 column 3
						4'd3:           data_out[7:0]= ascii_out[15:8];
						4'd4:          data_out[7:0]= ascii_out[7:0];
						4'd5:          data_out[7:0]= 8'h00;       // NULL
						                    
				default:
								data_out[7:0] = 8'h1B;

				endcase
		end
*/

/*   Reference !!!
`define normal     2'd0// normal output
`define congrat    2'd1// output Congratulation  !
`define set_value  2'd2// output Value Set       !
`define guess      2'd3// output Guess Again     !
*/





always@(posedge clk)begin
		if(rst) data_out[out_size-1:0] <= 'd0;
		else  begin
				case(mode)
		`normal: data_out[out_size-1:0] <= {24'h1B5B6A,ascii_out[31:24],ascii_out[23:16],ascii_out[15:8],ascii_out[7:0],88'h2020202020202020202020,8'h00};
						//						  
		`congrat: data_out[out_size-1:0] <= {144'h1B5B6A_434F4E47524154554C4154494F4E53,8'h00};
						//						  esc[j  C O N G R A T U L A T I O N S   NULL
		`set_value: data_out[out_size-1:0] <= {24'h1B5B6A,ascii_out[31:24],ascii_out[23:16],ascii_out[15:8],ascii_out[7:0],16'h2020,56'H414E532D534554,16'H2020,8'h00};
						//																							  A N S _ S E T              null
        `guess: data_out[out_size-1:0] <= {24'h1B5B6A,ascii_out[31:24],ascii_out[23:16],ascii_out[15:8],ascii_out[7:0],88'h202054525920414741494E,8'h00};
						//																							  T R Y   A G A I N
				default:
						data_out[out_size-1 : 0] <= {24'h1B5B6A,40'h4552524F52,80'h20202020202020202020,8'h00};
						//											E R R O R                             NULL
		endcase
		end
end


reg  first_begin_done;


always@(clk)begin
		if(current_state == `display_state)begin
		    		if(begin_transmission == 1'b1)
						first_begin_done <= 1'b1;
				    else 
						first_begin_done <= first_begin_done;
		end
		else
						first_begin_done <= 1'b0;
end


reg [3:0] end_buf;
always@(posedge clk)begin
				if(rst) end_buf[3:0] <= 4'b0;
				else begin
						end_buf[0] <= end_transmission;
						end_buf[3:1] <= end_buf [2:0];
				end
end

//                  begin transmission shot only once
// ------------------------- Begin_Transmission -------------------------------
		always@(posedge clk)begin
		   case(current_state)
				`display_state:
								if(end_display == 1'b1) 
										begin_transmission <= 1'b0;
								else if(end_display == 'd0 && first_begin_done == 1'b0) 
										begin_transmission <= 1'b1;
								else
										begin_transmission <= 1'b0;
				default:
								begin_transmission <= 1'b0;
		   endcase

		end
//-----------------------------------------------------------------------	

//------------------------------ delay_cnt -------------------------------
		always@(posedge clk)begin
				if(rst)
						delay_cnt <= 'd0;
				else begin
						case(current_state)
								`delay_display:  
												 if(delay_cnt < delay_cnt_max)
														delay_cnt <= delay_cnt + 'd1;
												 else
														delay_cnt <= 'd0;
										default:
												delay_cnt <= 'd0;
						endcase

				end
		end
//------------------------ state ------------------------------------
		always@(clk)begin
				if(rst)begin
						state = 6'b0;
				end
				else begin
						case(current_state) 
						`set_state : 
										state = 6'b000_001;
						`display_state:
										state = 6'b000_010;
						`delay_display://             Newly Add Display Delay
										state = 6'b000_100;
						`finish_state:
										state = 6'b001_000;
						default:
										state = 6'b111_111;
						endcase
				end
		end


endmodule









// 4_bit in  to  ascii 8 bit out
//------------------------------ Binary2ASCII module ------------------------
`define	ascii0 8'b0011_0000
`define	ascii1 8'b0011_0001
`define	ascii2 8'b0011_0010
`define	ascii3 8'b0011_0011
`define	ascii4 8'b0011_0100
`define	ascii5 8'b0011_0101
`define	ascii6 8'b0011_0110
`define	ascii7 8'b0011_0111
`define	ascii8 8'b0011_1000
`define	ascii9 8'b0011_1001
`define asciiA 8'h41
`define asciiB 8'h42

module ascii_encoder(in, out);
		input [3:0] in; // input from 0 to 15

		output reg [7:0] out;//


		reg [5:0] digit1;
		always@(in)begin
				digit1  = in;
		end

//---------------------------------- Digit1 Decode ------------------------------
		always@(*)begin
				case(digit1)
					4'd0 : out[7:0] =  `ascii0;
                    4'd1 : out[7:0] =  `ascii1;
                    4'd2 : out[7:0] =  `ascii2;
                    4'd3 : out[7:0] =  `ascii3;
                    4'd4 : out[7:0] =  `ascii4;
                    4'd5 : out[7:0] =  `ascii5;
                    4'd6 : out[7:0] =  `ascii6;
                    4'd7 : out[7:0] =  `ascii7;
                    4'd8 : out[7:0] =  `ascii8;
                    4'd9 : out[7:0] =  `ascii9;
				  4'b1010: out[7:0] =  `asciiA;
				  4'b1011: out[7:0] =  `asciiB;   
				default :
						out[7:0] = 8'h20;
				endcase
		end
endmodule



`endif
