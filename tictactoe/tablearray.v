`define write 2'b10
`define read  2'b11
`define checkwin 2'b01

/*data_represent
//  userA  'b11   ===== > 10
//  userB  'b10   ===== > 01

*/
module tablearray(rst, op ,index_pos,data, game_end,winner)
parameter data_size = 2;
parameter op_size =2;
reg [data_size-1:0]  array [8:0] ;

		input rst;
		input [op_size-1:0]op;
		input [3:0] index_pos;
		inout reg [data_size -1:0] data;

		output game_end;
		output winner;


		integer i;
//----------------- Writing Operaton ----------------------
		always@(*)begin
				if(rst)
						for(i =0 ; i < 'd9 ; i = i+1)begin
								array[i] <=  'b00;
						end
				else if(op == `write )begin
								array[index_pos] <= data[0] ? ;
				end

		end
//----------------  Reading Operation ---------------------
		always@(*)begin
				if(rst)
								data <= 'b00;
				else if(op == `read )begin
								data <= array[index_pos];
				end

		end
// ---------------- checkwin ----------------------
		always@(*)
				if(rst)
						game_end <= 'b0;
				else if(op == `checkwin)
						if(array[1][1] & array[2][1] & array [3][1])
		end


endmodule



