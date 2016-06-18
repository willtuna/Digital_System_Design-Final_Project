`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc.
// Engineers: Andrew Skreen
//				  Josh Sackos
// 
// Create Date:    11:04:49 06/18/2012 
// Module Name:    spi_interface 
// Project Name: 	 PmodCLS Demo
// Target Devices: Nexys3
// Tool versions:  ISE 14.1
// Description:  This module is responsible for both writing and reading data
//					  to and from the PmodCLS.
//
// Revision: 1.0
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////

// ==============================================================================
// 										  Define Module
// ==============================================================================
module spi_interface(
    clk,
    rst,
    send_data,
    begin_transmission,
    slave_select,
    miso,
    end_transmission,
    mosi,
    sclk
    );

	// ===========================================================================
	// 										Port Declarations
	// ===========================================================================

parameter datasize = 152;
    input clk;
    input rst;
    input [datasize-1:0] send_data;
    input begin_transmission;
    input slave_select;
    input miso;
    output end_transmission;
    output mosi;
    output sclk;

	// ===========================================================================
	// 							  Parameters, Regsiters, and Wires
	// ===========================================================================

	// Output wires and registers
	wire sclk;
	reg mosi, end_transmission;

	// SPI Interface FSM states
	parameter [1:0] stateIdle = 0,
						 stateRxTx = 1,
						 stateHold = 2;

	// Current state
	reg [1:0] STATE;

	
	// Amount to divide 100 Mhz onboard clock by

//----------------------------------------------------------------- Changing the speed -------------------------------------------------

//	parameter [11:0] SPI_CLK_COUNT_MAX = 12'H1F4;			// 500

	parameter [11:0] SPI_CLK_COUNT_MAX = 12'd10;			// 500
	//-------------------------------------------------------------------------------------------------------------------------------
	// Toggle sclk when count reaches SPI_CLK_COUNT_MAX
	reg [11:0] spi_clk_count;

	// Leads sclk_previous to detect rising/falling edges for data read/write
	reg sclk_buffer;
	reg sclk_previous;
	
	// Determines the number of bits to send/receive
	parameter [7:0] RX_COUNT_MAX = 8'd152;                                             //      This must fit the size of input
	// The number of data bits sent/received during data transmission
	reg [7:0] rx_count;

	// Holds the data being sent/received
	reg [datasize-1:0] shift_register;
	 
	// ===========================================================================
	// 										Implementation
	// ===========================================================================

	// Assign SPI Clock Signal
	assign sclk = sclk_previous;

	
	// SPI Interface FSM, operates in SPI mode3
	always @(posedge clk) begin
			if(rst == 1'b1) begin
					mosi <= 1'b1;
					STATE <= stateIdle;
					shift_register <= 'd0;
					end_transmission <= 1'b0;
					rx_count <= 8'h0;
			end
			else begin
					case(STATE)

							// Idle State
							stateIdle : begin
									end_transmission <= 1'b0;
									
									if(begin_transmission == 1'b1) begin
											STATE <= stateRxTx;
											rx_count <= 8'h0;
											shift_register <= send_data;
									end
							end

							// RxTx State
							stateRxTx : begin
									if(rx_count < RX_COUNT_MAX) begin
											// Send bit
											if(sclk_previous == 1'b1 && sclk_buffer == 1'b0) begin
													mosi <= shift_register[datasize-1];
											end
											// Recieve bit
											else if(sclk_previous == 1'b0 && sclk_buffer == 1'b1) begin
													shift_register[datasize-1:1] <= shift_register[datasize-2:0];
													shift_register[0] <= miso;
													rx_count <= rx_count + 1'b1;
											end
									end
									else begin
											STATE <= stateHold;
											end_transmission <=1'b1;
									end
							end

							// Hold State
							stateHold : begin
									end_transmission <= 1'b0;
									
									if(slave_select == 1'b1) begin
											mosi <= 1'b1;
											STATE <= stateIdle;
									end
									else if(begin_transmission == 1'b1) begin
											STATE <= stateRxTx;
											rx_count <= 4'h0;
											shift_register <= send_data;
									end
							end
							
							// When signals indicate an invalid state
							default : begin
									// Null
							end

					endcase
			end
	end
	// End SPI Interface FSM


	// SPI Clock Generator
	always @(posedge clk) begin
			if(rst == 1'b1) begin
					sclk_previous <= 1'b1;
					sclk_buffer <= 1'b0;
					spi_clk_count <= 12'h000;
			end
			else if(STATE == stateRxTx) begin
					if(spi_clk_count == SPI_CLK_COUNT_MAX) begin
							sclk_buffer <= ~sclk_buffer;
							spi_clk_count <= 12'h000;
					end
					else begin
							sclk_previous <= sclk_buffer;
							spi_clk_count <= spi_clk_count + 1'b1;
					end
			end
			else begin
					sclk_previous <= 1'b1;
			end
	end
	// End SPI Clock Generator
	
endmodule

