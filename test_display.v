`timescale 100ps/1ps
`include "display.v"
module test_display;

reg clk,set,start,rst;
reg [3:0] in [3:0];
reg miso;
reg [1:0]mode;
wire ss,mosi,sclk;
wire [5:0] state;
integer i;

display dis(clk,set,{in[3],in[2],in[1],in[0]},start,rst,mode,ss, mosi,miso,sclk,state);

//--------------------------------------------------------

		initial
		begin

		clk = 1'b0;
		set = 1'b0;
		start = 1'b0;
		rst = 1'b0;
		mode = 2'd0;
		for(i=0;i<4;i = i +1)begin
				in[i] <= 4'd0;
		end
		miso = 1'b0;
		

		forever begin
		#1 clk = ~clk;
		end
		
		end
//---------------------------------------------------------
initial begin
#1 rst = 1'b1;
#10 rst = 1'b0;
    mode = 2'd0;
end

initial #100000 {in[3],in[2],in[1],in[0]} = {4'd3,4'd15,4'd15,4'd15};

initial begin
		#100010 set = 1'b1; start =1'b1;
		end
initial #200000 {in[3],in[2],in[1],in[0]} = {4'd3,4'd2,4'd15,4'd15};

initial begin
		#200010 set = 1'b1; start =1'b1;

		#100000 {in[3],in[2],in[1],in[0]} = {4'd3,4'd2,4'd1,4'd15};
		#100000 set = 1'b1; start =1'b1;
		

		#100000 {in[3],in[2],in[1],in[0]} = {4'd3,4'd2,4'd1,4'd0};
		#100000 set = 1'b1; start =1'b1;

		#100000 set = 1'b0; start =1'b0;
		        mode = 2'd1;

		#100000   set = 1'b1; start =1'b1;

		#100000 set = 1'b0; start =1'b0;
				{in[3],in[2],in[1],in[0]} = {4'd9,4'd6,4'd5,4'd8};
				mode = 2'd2;

		#100000   set = 1'b1; start =1'b1;
		#100000 set = 1'b0; start =1'b0;
				{in[3],in[2],in[1],in[0]} = {4'd1,4'd10,4'd3,4'd11};
				mode = 2'd3;

		#100000   set = 1'b1; start =1'b1;

		#100000 $stop;
		

		
		end


endmodule 
