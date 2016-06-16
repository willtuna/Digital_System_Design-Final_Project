


`ifndef _keypad_v
`define _keypad_v


module Keypad_Top(clk, rst, col_in, row_out, enc_out, pressed);
		input clk, rst;
		input [3:0] col_in;
		output [3:0] row_out;
		output [7:0] enc_out;
		output pressed;
		wire [7:0] keypad_code;  //   pattern {col[3:0], row[3:0]}


		Keypad keypad_sweep(clk,rst,col_in,row_out,keypad_code, pressed);

		Keypad_Encoder keypad_enc(keypad_code, enc_out);

endmodule





//   Frequency Divider for keypad //  200 Hz
module Freq_Keypad(clk, rst ,keypad_clk);
		input clk,rst;
		output reg keypad_clk;

		integer i =0 ;


		always@(posedge clk or posedge rst )begin
		if(rst) begin
				i =0;
				keypad_clk = 1'b0;
				end
		else if(i<3125000)begin
				keypad_clk = 1'b0;
				i = i +1;
		end
		else if(i<6250000)begin
				keypad_clk = 1'b1;
				i = i +1;		
        end

		else begin
		i = 0;
		keypad_clk = 1'b0;
end

		end
endmodule



//   column_in,            row _ sewwp
module  Keypad( clk, rst, in, row_sweep,press_pos, pressed );
		input clk, rst;
		input [3:0] in;
		output [3:0] row_sweep; // updated 
		output [7:0]press_pos;
		output  pressed;



     	reg [3:0] row_next, row_current;

		reg [7:0] press_pos;//目前的row和column

		wire freq4keypad;
		

		Freq_Keypad freq_key(clk,rst,freq4keypad);
/*
//---------------- Enable Logic --- Lock the frequency -------------
		reg enable;

		always@(*)begin
				if(rst) enable = 1'b1;
				else if( &in == 1'b0 ) enable = 1'b0 ;
				// to stop the clock  *************
				else enable = 1'b1;
		end
// -------------------  notify that the bottom has been pressed
		assign pressed = ~enable;

//------------------------------------------------------------------
*/
		wire [3:0] db_column_in;
		wire db_pressed;
		debounce_counter db_cnt(clk,rst,in,db_column_in, db_pressed);

		assign pressed = db_pressed;

// ------------------- Row Shifting -----------------------
		always@(posedge freq4keypad or posedge rst)begin
				if(rst) row_current <= 4'b1110;
				else row_current <= row_next;
		end
//            Level Trigger
		always@(row_current or db_pressed or rst)begin
				if(rst)
				row_next = 4'b1101;
				else if( ~pressed )
				row_next = {row_current[0],row_current[3:1]};
				else
				row_next = row_current;
		end
		

        assign row_sweep = row_current;


//   This is for press_pos detection
		always@(*)begin
				if(rst) press_pos = 8'b11111111;
				else if( db_pressed ) begin
				press_pos = {db_column_in,row_sweep};
				end
				else press_pos = 8'b11111111;// for error detection
		end

//  Because of our keypad configuration is {column[3:0], row[3:0] }




endmodule

/*
				1 2 3 4			

		1		F E D C		
		2		B 3 6 9
		3		A 2 5 8
		4		0 1 4 7

*/
//     column 1234, row 1234
`define zero   8'b0111_1110
`define one    8'b1011_1110
`define two    8'b1011_1101
`define three  8'b1011_1011
`define four   8'b1101_1110
`define five   8'b1101_1101
`define six    8'b1101_1011
`define seven  8'b1110_1110
`define eight  8'b1110_1101
`define nine   8'b1110_1011
`define A      8'b0111_1101
`define B      8'b0111_1011
`define F      8'b0111_0111
`define C      8'b1110_0111
`define E	   8'b1011_0111
`define D      8'b1101_0111


//      Functional Encoed Output
`define encout_ADD    8'b11110001   
`define encout_SUB    8'b11110010
`define encout_Mult   8'b11110011
`define encout_Div    8'b11110100
`define encout_Equ    8'b11110101
`define encout_Clear  8'b11110110



module Keypad_Encoder(in,out);
		input [7:0] in;
		output reg [7:0] out;
		always@(*) begin
				case(in)
				`zero  : out =  8'b0;
				`one   : out =  8'd1;
				`two   : out =  8'd2;
				`three : out =  8'd3;
				`four  : out =  8'd4;
				`five  : out =  8'd5;
				`six   : out =  8'd6;
				`seven : out =  8'd7;
				`eight : out =  8'd8;
				`nine  : out =  8'd9;

				`A : out =  `encout_ADD;
				`B : out =  `encout_SUB;
				`F : out =  `encout_Mult;
				`E : out =  `encout_Equ;
				`D : out =  `encout_Div;
				`C : out =  `encout_Clear;
				
				default : out = 8'b11111111;
		endcase
		end
endmodule




//--------------------------- Debounce for the input and the pressed sensor ---------------------------------
module debounce_counter(clk,rst,in,press_col,pressed);
input rst,clk;

input [3:0] in;
output [3:0] press_col;
output reg pressed;

reg [5:0] count;
		always@(posedge clk or posedge rst)begin
				if(rst)count <= 6'd0;
				else if(&in == 'd0 && ~pressed ) count <= count +1; // having input and counting
				else if(&in == 'd0 && pressed ) count <= 6'd30;
				else if(&in == 1'b1) count <= 0;
				else count <=0;
		end

		always@(*)begin
				if(rst) pressed = 6'd0;
				else if (count == 6'd30) pressed = 1'b1;
				else pressed = 1'b0;
		end
		
		assign press_col = (pressed)? in : 4'b1111;

endmodule





`endif
