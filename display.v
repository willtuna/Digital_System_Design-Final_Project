// Remember to reset the "SPI_CLK_COUNT_MAX"
/*  mode Reference !!!
`define normal     2'd0// normal output
`define congrat    2'd1// output Congratulation  !
`define set_value  2'd2// output Value Set       !
`define guess      2'd3// output Guess Again     !
*/


/*  Tested issue --------------- Currently Not a Big Issue but it may be a bug fo`r the future !!
issue one ----------   if set and start not return back to zero it would keep refresh the display !!
   */
`ifndef _DISPLAY_V
`define _DISPLAY_V


`include "FSM.v"
`include "spi_interface.v"

//    4'b1010 = A
//    4'b1011 = B
module display(
				clk,
				set,
				input_value,// 16bit  4 bit for each digit
				start,
				rst,
				mode,
				
				ss,
				mosi,
				miso,
				sclk,
				state
				);
		input clk, set, start,rst;
	    input [15:0] input_value;
		input miso;
		input [1:0]mode;
		output ss,mosi,sclk;

		output  [5:0] state;


		wire  end_transmission;
		wire  [151:0] data_out;
		wire begin_transmission;
	//	wire [5:0] d_input_value;
		

		fsm MasterFSM(clk,set,input_value,start,end_transmission,rst,mode, data_out, ss ,begin_transmission, state );

		spi_interface spi(clk,rst,data_out,begin_transmission,ss,miso,end_transmission,mosi,sclk);

endmodule



`endif

