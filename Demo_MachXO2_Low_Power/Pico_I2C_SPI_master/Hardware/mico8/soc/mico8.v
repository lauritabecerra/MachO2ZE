//   ==================================================================
//   >>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
//   ------------------------------------------------------------------
//   Copyright (c) 2006-2011 by Lattice Semiconductor Corporation
//   ------------------------------------------------------------------
//   ALL RIGHTS RESERVED
//
//   IMPORTANT: THIS FILE IS AUTO-GENERATED BY THE LATTICEMICO SYSTEM.
//
//   Permission:
//
//      Lattice Semiconductor grants permission to use this code
//      pursuant to the terms of the Lattice Semiconductor Corporation
//      Open Source License Agreement.
//
//   Disclaimer:
//
//      Lattice Semiconductor provides no warranty regarding the use or
//      functionality of this code. It is the user's responsibility to
//      verify the user�s design for consistency and functionality through
//      the use of formal verification methods.
//
//   --------------------------------------------------------------------
//
//                  Lattice Semiconductor Corporation
//                  5555 NE Moore Court
//                  Hillsboro, OR 97214
//                  U.S.A
//
//                  TEL: 1-800-Lattice (USA and Canada)
//                         503-286-8001 (other locations)
//
//                  web: http://www.latticesemi.com/
//                  email: techsupport@latticesemi.com
//
//   --------------------------------------------------------------------
//
//      Project:           mico8
//      File:              mico8.v
//      Date:              Sat, 17 Mar 2012 16:45:11 EDT
//      Version:           1.3.95
//      Targeted Family:   LCMXO2-1200ZE
//
//   =======================================================================

`timescale 1ns / 100 ps
module arbiter2
#(
	parameter MAX_DAT_WIDTH = 32,
	parameter WBS_DAT_WIDTH = 32,
	parameter WBM0_DAT_WIDTH = 32,
	parameter WBM1_DAT_WIDTH = 32
)(
	// Multiple Master Port0
	WBM0_ADR_O,
	WBM0_DAT_O,
	WBM0_DAT_I,
	WBM0_SEL_O,
	WBM0_WE_O,
	WBM0_ACK_I,
	WBM0_ERR_I,
	WBM0_RTY_I,
	WBM0_CTI_O,
	WBM0_BTE_O,
	WBM0_LOCK_O,
	WBM0_CYC_O,
	WBM0_STB_O,
	// Multiple Master Port1
	WBM1_ADR_O,
	WBM1_DAT_O,
	WBM1_DAT_I,
	WBM1_SEL_O,
	WBM1_WE_O,
	WBM1_ACK_I,
	WBM1_ERR_I,
	WBM1_RTY_I,
	WBM1_CTI_O,
	WBM1_BTE_O,
	WBM1_LOCK_O,
	WBM1_CYC_O,
	WBM1_STB_O,
	// Single Slave Port
	WBS_ADR_I,
	WBS_DAT_I,
	WBS_DAT_O,
	WBS_SEL_I,
	WBS_WE_I,
	WBS_ACK_O,
	WBS_ERR_O,
	WBS_RTY_O,
	WBS_CTI_I,
	WBS_BTE_I,
	WBS_LOCK_I,
	WBS_CYC_I,
	WBS_STB_I,

	clk,
	reset
);

input clk, reset;
input [31:0]WBM0_ADR_O;
input [WBM0_DAT_WIDTH-1:0] WBM0_DAT_O;
output [WBM0_DAT_WIDTH-1:0] WBM0_DAT_I;
input [WBM0_DAT_WIDTH/8-1:0] WBM0_SEL_O;
input  WBM0_WE_O;
output  WBM0_ACK_I;
output  WBM0_ERR_I;
output  WBM0_RTY_I;
input [2:0]WBM0_CTI_O;
input [1:0]WBM0_BTE_O;
input  WBM0_LOCK_O;
input  WBM0_CYC_O;
input  WBM0_STB_O;
input [31:0]WBM1_ADR_O;
input [WBM1_DAT_WIDTH-1:0] WBM1_DAT_O;
output [WBM1_DAT_WIDTH-1:0] WBM1_DAT_I;
input [WBM1_DAT_WIDTH/8-1:0] WBM1_SEL_O;
input  WBM1_WE_O;
output  WBM1_ACK_I;
output  WBM1_ERR_I;
output  WBM1_RTY_I;
input [2:0]WBM1_CTI_O;
input [1:0]WBM1_BTE_O;
input  WBM1_LOCK_O;
input  WBM1_CYC_O;
input  WBM1_STB_O;
output [31:0]WBS_ADR_I;
output [WBS_DAT_WIDTH-1:0] WBS_DAT_I;
input [WBS_DAT_WIDTH-1:0] WBS_DAT_O;
output [WBS_DAT_WIDTH/8-1:0] WBS_SEL_I;
output  WBS_WE_I;
input  WBS_ACK_O;
input  WBS_ERR_O;
input  WBS_RTY_O;
output [2:0]WBS_CTI_I;
output [1:0]WBS_BTE_I;
output  WBS_LOCK_I;
output  WBS_CYC_I;
output  WBS_STB_I;
wire [MAX_DAT_WIDTH-1:0] WBM0_DAT_I_INT;
wire [MAX_DAT_WIDTH-1:0] WBM0_DAT_O_INT;
wire [MAX_DAT_WIDTH/8-1:0] WBM0_SEL_O_INT;
wire [MAX_DAT_WIDTH-1:0] WBM1_DAT_I_INT;
wire [MAX_DAT_WIDTH-1:0] WBM1_DAT_O_INT;
wire [MAX_DAT_WIDTH/8-1:0] WBM1_SEL_O_INT;
wire [MAX_DAT_WIDTH-1:0] WBS_DAT_O_INT;
wire [MAX_DAT_WIDTH-1:0] WBS_DAT_I_INT;
wire [MAX_DAT_WIDTH/8-1:0] WBS_SEL_I_INT;

generate
	if ((WBS_DAT_WIDTH == 8) && ((WBM0_DAT_WIDTH == 32) || (WBM1_DAT_WIDTH == 32))) begin
		assign WBS_DAT_I = ((WBS_ADR_I[1:0] == 2'b00)
			? WBS_DAT_I_INT[31:24]
			: ((WBS_ADR_I[1:0] == 2'b01)
			? WBS_DAT_I_INT[23:16]
			: ((WBS_ADR_I[1:0] == 2'b10)
			? WBS_DAT_I_INT[15:8]
			: WBS_DAT_I_INT[7:0]
			)));
		assign WBS_SEL_I = ((WBS_ADR_I[1:0] == 2'b00)
			? WBS_SEL_I_INT[3]
			: ((WBS_ADR_I[1:0] == 2'b01)
			? WBS_SEL_I_INT[2]
			: ((WBS_ADR_I[1:0] == 2'b10)
			? WBS_SEL_I_INT[1]
			: WBS_SEL_I_INT[0]
			)));
		assign WBS_DAT_O_INT = {4{WBS_DAT_O}};
	end
	else begin
		assign WBS_DAT_I = WBS_DAT_I_INT;
		assign WBS_SEL_I = WBS_SEL_I_INT;
		assign WBS_DAT_O_INT = WBS_DAT_O;
	end
endgenerate

generate
	if ((WBS_DAT_WIDTH == 32) && (WBM0_DAT_WIDTH == 8)) begin
		assign WBM0_DAT_I = ((WBM0_ADR_O[1:0] == 2'b00)
			? WBM0_DAT_I_INT[31:24]
			: ((WBM0_ADR_O[1:0] == 2'b01)
			? WBM0_DAT_I_INT[23:16]
			: ((WBM0_ADR_O[1:0] == 2'b10)
			? WBM0_DAT_I_INT[15:8]
			: WBM0_DAT_I_INT[7:0]
			)));
		assign WBM0_DAT_O_INT = {4{WBM0_DAT_O}};
		assign WBM0_SEL_O_INT = ((WBM0_ADR_O[1:0] == 2'b00)
			? {WBM0_SEL_O, 3'b000}
			: ((WBM0_ADR_O[1:0] == 2'b01)
			? {1'b0, WBM0_SEL_O, 2'b00}
			: ((WBM0_ADR_O[1:0] == 2'b10)
			? {2'b00, WBM0_SEL_O, 1'b0}
			: {3'b000, WBM0_SEL_O}
			)));
	end
	else if ((WBS_DAT_WIDTH == 8) && (MAX_DAT_WIDTH == 32)) begin
		assign WBM0_DAT_I = WBM0_DAT_I_INT;
		assign WBM0_SEL_O_INT = {4{WBM0_SEL_O}};
		assign WBM0_DAT_O_INT = {4{WBM0_DAT_O}};
	end
	else begin
		assign WBM0_DAT_I = WBM0_DAT_I_INT;
		assign WBM0_SEL_O_INT = WBM0_SEL_O;
		assign WBM0_DAT_O_INT = WBM0_DAT_O;
	end
endgenerate

generate
	if ((WBS_DAT_WIDTH == 32) && (WBM1_DAT_WIDTH == 8)) begin
		assign WBM1_DAT_I = ((WBM1_ADR_O[1:0] == 2'b00)
			? WBM1_DAT_I_INT[31:24]
			: ((WBM1_ADR_O[1:0] == 2'b01)
			? WBM1_DAT_I_INT[23:16]
			: ((WBM1_ADR_O[1:0] == 2'b10)
			? WBM1_DAT_I_INT[15:8]
			: WBM1_DAT_I_INT[7:0]
			)));
		assign WBM1_DAT_O_INT = {4{WBM1_DAT_O}};
		assign WBM1_SEL_O_INT = ((WBM1_ADR_O[1:0] == 2'b00)
			? {WBM1_SEL_O, 3'b000}
			: ((WBM1_ADR_O[1:0] == 2'b01)
			? {1'b0, WBM1_SEL_O, 2'b00}
			: ((WBM1_ADR_O[1:0] == 2'b10)
			? {2'b00, WBM1_SEL_O, 1'b0}
			: {3'b000, WBM1_SEL_O}
			)));
	end
	else if ((WBS_DAT_WIDTH == 8) && (MAX_DAT_WIDTH == 32)) begin
		assign WBM1_DAT_I = WBM1_DAT_I_INT;
		assign WBM1_SEL_O_INT = {4{WBM1_SEL_O}};
		assign WBM1_DAT_O_INT = {4{WBM1_DAT_O}};
	end
	else begin
		assign WBM1_DAT_I = WBM1_DAT_I_INT;
		assign WBM1_SEL_O_INT = WBM1_SEL_O;
		assign WBM1_DAT_O_INT = WBM1_DAT_O;
	end
endgenerate


reg [2-1:0] 		selected; // which master is selected.
reg locked;
always @(posedge clk or posedge reset)
begin
	if (reset) begin
		selected <= #1 0;
		locked   <= #1 0;
	end
	else begin
		if (selected == 0) begin
			if (WBM0_STB_O) begin
				selected <= #1 2'd1;
				locked   <= #1 WBM0_LOCK_O;
			end
			else if (WBM1_STB_O) begin
				selected <= #1 2'd2;
				locked   <= #1 WBM1_LOCK_O;
			end
		end
		else if (selected == 2'd1) begin
			if ((WBS_ACK_O || WBS_ERR_O || locked) && ((WBM0_CTI_O == 3'b000) || (WBM0_CTI_O == 3'b111) || locked) && !WBM0_LOCK_O) begin
				selected <= #1 0;
				locked <= #1 0;
			end
		end
		else if (selected == 2'd2) begin
			if ((WBS_ACK_O || WBS_ERR_O || locked) && ((WBM1_CTI_O == 3'b000) || (WBM1_CTI_O == 3'b111) || locked) && !WBM1_LOCK_O) begin
				selected <= #1 0;
				locked <= #1 0;
			end
		end
	end
end

assign WBS_ADR_I = 
	(selected == 2'd1 ? WBM0_ADR_O : 
	(selected == 2'd2 ? WBM1_ADR_O : 
	0));
assign WBS_DAT_I_INT = 
	(selected == 2'd1 ? WBM0_DAT_O_INT : 
	(selected == 2'd2 ? WBM1_DAT_O_INT : 
	0));
assign WBS_SEL_I_INT = 
	(selected == 2'd1 ? WBM0_SEL_O_INT : 
	(selected == 2'd2 ? WBM1_SEL_O_INT : 
	0));
assign WBS_WE_I = 
	(selected == 2'd1 ? WBM0_WE_O : 
	(selected == 2'd2 ? WBM1_WE_O : 
	0));
assign WBS_CTI_I = 
	(selected == 2'd1 ? WBM0_CTI_O : 
	(selected == 2'd2 ? WBM1_CTI_O : 
	0));
assign WBS_BTE_I = 
	(selected == 2'd1 ? WBM0_BTE_O : 
	(selected == 2'd2 ? WBM1_BTE_O : 
	0));
assign WBS_LOCK_I = 
	(selected == 2'd1 ? WBM0_LOCK_O : 
	(selected == 2'd2 ? WBM1_LOCK_O : 
	0));
assign WBS_CYC_I = 
	(selected == 2'd1 ? WBM0_CYC_O : 
	(selected == 2'd2 ? WBM1_CYC_O : 
	0));
assign WBS_STB_I = 
	(selected == 2'd1 ? WBM0_STB_O : 
	(selected == 2'd2 ? WBM1_STB_O : 
	0));

assign WBM0_DAT_I_INT = WBS_DAT_O_INT;
assign WBM0_ACK_I = (selected == 2'd1 ? WBS_ACK_O : 0);
assign WBM0_ERR_I = (selected == 2'd1 ? WBS_ERR_O : 0);
assign WBM0_RTY_I = (selected == 2'd1 ? WBS_RTY_O : 0);

assign WBM1_DAT_I_INT = WBS_DAT_O_INT;
assign WBM1_ACK_I = (selected == 2'd2 ? WBS_ACK_O : 0);
assign WBM1_ERR_I = (selected == 2'd2 ? WBS_ERR_O : 0);
assign WBM1_RTY_I = (selected == 2'd2 ? WBS_RTY_O : 0);

endmodule

`include "system_conf.v"
`include "../components/lm8/rtl/verilog/lm8_include_all.v"
`include "../components/uart_core/rtl/verilog/uart_core.v"
`include "../components/slave_passthru/rtl/verilog/slave_passthru.v"
`include "../components/slave_passthru/rtl/verilog/passthru.v"


module mico8 ( 
	clk_i,reset_n
, uartSIN
, uartSOUT
, slave_LCDclk
, slave_LCDrst
, slave_LCDslv_adr
, slave_LCDslv_master_data
, slave_LCDslv_slave_data
, slave_LCDslv_strb
, slave_LCDslv_cyc
, slave_LCDslv_ack
, slave_LCDslv_err
, slave_LCDslv_rty
, slave_LCDslv_sel
, slave_LCDslv_we
, slave_LCDslv_bte
, slave_LCDslv_cti
, slave_LCDslv_lock
, slave_LCDintr_active_high
, slave_EFBclk
, slave_EFBrst
, slave_EFBslv_adr
, slave_EFBslv_master_data
, slave_EFBslv_slave_data
, slave_EFBslv_strb
, slave_EFBslv_cyc
, slave_EFBslv_ack
, slave_EFBslv_err
, slave_EFBslv_rty
, slave_EFBslv_sel
, slave_EFBslv_we
, slave_EFBslv_bte
, slave_EFBslv_cti
, slave_EFBslv_lock
, slave_EFBintr_active_high
);
input	clk_i, reset_n;
genvar i;
wire [31:0] zwire = 32'hZZZZZZZZ;
wire [31:0] zerowire = 32'h00000000;
wire [31:0] SHAREDBUS_ADR_I;
wire [31:0] SHAREDBUS_DAT_I;
wire [31:0] SHAREDBUS_DAT_O;
wire [3:0] SHAREDBUS_SEL_I;
wire   SHAREDBUS_WE_I;
wire   SHAREDBUS_ACK_O;
wire   SHAREDBUS_ERR_O;
wire   SHAREDBUS_RTY_O;
wire [2:0] SHAREDBUS_CTI_I;
wire [1:0] SHAREDBUS_BTE_I;
wire   SHAREDBUS_LOCK_I;
wire   SHAREDBUS_CYC_I;
wire   SHAREDBUS_STB_I;
wire SHAREDBUS_en;

wire [31:0] LM8I_ADR_O;
wire [7:0] LM8I_DAT_O;
wire [7:0] LM8I_DAT_I;
wire [0:0] LM8I_SEL_O;
wire   LM8I_WE_O;
wire   LM8I_ACK_I;
wire   LM8I_ERR_I;
wire   LM8I_RTY_I;
wire [2:0] LM8I_CTI_O;
wire [1:0] LM8I_BTE_O;
wire   LM8I_LOCK_O;
wire   LM8I_CYC_O;
wire   LM8I_STB_O;
wire [31:0] LM8D_ADR_O;
wire [7:0] LM8D_DAT_O;
wire [7:0] LM8D_DAT_I;
wire [0:0] LM8D_SEL_O;
wire   LM8D_WE_O;
wire   LM8D_ACK_I;
wire   LM8D_ERR_I;
wire   LM8D_RTY_I;
wire [2:0] LM8D_CTI_O;
wire [1:0] LM8D_BTE_O;
wire   LM8D_LOCK_O;
wire   LM8D_CYC_O;
wire   LM8D_STB_O;
wire [7:0] LM8interrupts;

wire [7:0] uartUART_DAT_O;
wire   uartUART_ACK_O;
wire   uartUART_ERR_O;
wire   uartUART_RTY_O;
wire uartUART_en;
wire uartINTR;
input  uartSIN;
output  uartSOUT;

wire [7:0] slave_LCDS_DAT_O;
wire   slave_LCDS_ACK_O;
wire   slave_LCDS_ERR_O;
wire   slave_LCDS_RTY_O;
wire slave_LCDS_en;
wire slave_LCDINTR_O;
output  slave_LCDclk;
output  slave_LCDrst;
output [32-1:0] slave_LCDslv_adr;
output [8-1:0] slave_LCDslv_master_data;
input [8-1:0] slave_LCDslv_slave_data;
output  slave_LCDslv_strb;
output  slave_LCDslv_cyc;
input  slave_LCDslv_ack;
input  slave_LCDslv_err;
input  slave_LCDslv_rty;
output [3:0]  slave_LCDslv_sel;
output  slave_LCDslv_we;
output [1:0]  slave_LCDslv_bte;
output [2:0]  slave_LCDslv_cti;
output  slave_LCDslv_lock;
input  slave_LCDintr_active_high;

wire [7:0] slave_EFBS_DAT_O;
wire   slave_EFBS_ACK_O;
wire   slave_EFBS_ERR_O;
wire   slave_EFBS_RTY_O;
wire slave_EFBS_en;
wire slave_EFBINTR_O;
output  slave_EFBclk;
output  slave_EFBrst;
output [32-1:0] slave_EFBslv_adr;
output [8-1:0] slave_EFBslv_master_data;
input [8-1:0] slave_EFBslv_slave_data;
output  slave_EFBslv_strb;
output  slave_EFBslv_cyc;
input  slave_EFBslv_ack;
input  slave_EFBslv_err;
input  slave_EFBslv_rty;
output [3:0]  slave_EFBslv_sel;
output  slave_EFBslv_we;
output [1:0]  slave_EFBslv_bte;
output [2:0]  slave_EFBslv_cti;
output  slave_EFBslv_lock;
input  slave_EFBintr_active_high;
reg [2:0] counter;
wire sys_reset = !counter[2];
always @(posedge clk_i or negedge reset_n)
if (reset_n == 1'b0)
counter <= #1 3'b000;
else
if (counter[2] == 1'b0)
counter <= #1 counter + 1'b1;


wire one_zero = 1'b0;
wire[1:0] two_zero = 2'b00;
wire[2:0] three_zero = 3'b000;
wire[3:0] four_zero = 4'b0000;
wire[31:0] thirtytwo_zero = 32'b0000_0000_0000_0000_0000_0000_0000_0000;

arbiter2
#(
.MAX_DAT_WIDTH ( 8 )
,.WBS_DAT_WIDTH ( 8 )
,.WBM0_DAT_WIDTH ( 8 )
,.WBM1_DAT_WIDTH ( 8 )
)
arbiter (
.WBM0_ADR_O(LM8I_ADR_O),
.WBM0_DAT_O(LM8I_DAT_O[7:0]),
.WBM0_DAT_I(LM8I_DAT_I),
.WBM0_SEL_O(LM8I_SEL_O),
.WBM0_WE_O(LM8I_WE_O),
.WBM0_ACK_I(LM8I_ACK_I),
.WBM0_ERR_I(LM8I_ERR_I),
.WBM0_RTY_I(LM8I_RTY_I),
.WBM0_CTI_O(LM8I_CTI_O),
.WBM0_BTE_O(LM8I_BTE_O),
.WBM0_LOCK_O(LM8I_LOCK_O),
.WBM0_CYC_O(LM8I_CYC_O),
.WBM0_STB_O(LM8I_STB_O),
.WBM1_ADR_O(LM8D_ADR_O),
.WBM1_DAT_O(LM8D_DAT_O[7:0]),
.WBM1_DAT_I(LM8D_DAT_I),
.WBM1_SEL_O(LM8D_SEL_O),
.WBM1_WE_O(LM8D_WE_O),
.WBM1_ACK_I(LM8D_ACK_I),
.WBM1_ERR_I(LM8D_ERR_I),
.WBM1_RTY_I(LM8D_RTY_I),
.WBM1_CTI_O(LM8D_CTI_O),
.WBM1_BTE_O(LM8D_BTE_O),
.WBM1_LOCK_O(LM8D_LOCK_O),
.WBM1_CYC_O(LM8D_CYC_O),
.WBM1_STB_O(LM8D_STB_O),
.WBS_ADR_I(SHAREDBUS_ADR_I[31:0]),
.WBS_DAT_I(SHAREDBUS_DAT_I[7:0]),
.WBS_DAT_O(SHAREDBUS_DAT_O[7:0]),
.WBS_SEL_I(SHAREDBUS_SEL_I[0]),
.WBS_WE_I(SHAREDBUS_WE_I),
.WBS_ACK_O(SHAREDBUS_ACK_O),
.WBS_ERR_O(SHAREDBUS_ERR_O),
.WBS_RTY_O(SHAREDBUS_RTY_O),
.WBS_CTI_I(SHAREDBUS_CTI_I),
.WBS_BTE_I(SHAREDBUS_BTE_I),
.WBS_LOCK_I(SHAREDBUS_LOCK_I),
.WBS_CYC_I(SHAREDBUS_CYC_I),
.WBS_STB_I(SHAREDBUS_STB_I),
.clk (clk_i),
.reset (sys_reset));
assign SHAREDBUS_DAT_O = 
uartUART_en ? {4{uartUART_DAT_O[7:0]}} : 
slave_LCDS_en ? {4{slave_LCDS_DAT_O[7:0]}} : 
slave_EFBS_en ? {4{slave_EFBS_DAT_O[7:0]}} : 
0;
assign SHAREDBUS_ERR_O = SHAREDBUS_CYC_I & !(
(!uartUART_ERR_O & uartUART_en) | 
(!slave_LCDS_ERR_O & slave_LCDS_en) | 
(!slave_EFBS_ERR_O & slave_EFBS_en) | 
0);
assign SHAREDBUS_ACK_O = 
uartUART_en ? uartUART_ACK_O : 
slave_LCDS_en ? slave_LCDS_ACK_O : 
slave_EFBS_en ? slave_EFBS_ACK_O : 
0;
assign SHAREDBUS_RTY_O = 
uartUART_en ? uartUART_RTY_O : 
slave_LCDS_en ? slave_LCDS_RTY_O : 
slave_EFBS_en ? slave_EFBS_RTY_O : 
0;
lm8 
#(
.CFG_REGISTER_16(1),
.CFG_REGISTER_32(0),
.CFG_CALL_STACK_8(0),
.CFG_CALL_STACK_16(1),
.CFG_CALL_STACK_32(0),
.CFG_PROM_SIZE(2048),
.CFG_PROM_INIT_FILE("C:/Users/shchen/Documents/VMshare/work/AE12_release_0329/Software/I2C_SPI_master/prom_init.mem"), 
.CFG_PROM_INIT_FILE_FORMAT("hex"),
.SP_BASE_ADDRESS(32'h0),
.SP_SIZE(1024),
.SP_PORT_ENABLE(1),
.CFG_SP_INIT_FILE("C:/Users/shchen/Documents/VMshare/work/AE12_release_0329/Software/I2C_SPI_master/scratchpad_init.mem"),
.CFG_SP_INIT_FILE_FORMAT("hex"),
.CFG_EXT_SIZE_8(0),
.CFG_EXT_SIZE_16(1),
.CFG_EXT_SIZE_32(0),
.LATTICE_FAMILY("MachXO2"),
.CFG_ROM_EN(0),
.CFG_ROM_BASE_ADDRESS(32'h0),
.I_CFG_XIP(0))
 LM8( 
.I_ADR_O(LM8I_ADR_O),
.I_DAT_O(LM8I_DAT_O),
.I_DAT_I(LM8I_DAT_I),
.I_SEL_O(LM8I_SEL_O),
.I_WE_O(LM8I_WE_O),
.I_ACK_I(LM8I_ACK_I),
.I_ERR_I(LM8I_ERR_I),
.I_RTY_I(LM8I_RTY_I),
.I_CTI_O(LM8I_CTI_O),
.I_BTE_O(LM8I_BTE_O),
.I_LOCK_O(LM8I_LOCK_O),
.I_CYC_O(LM8I_CYC_O),
.I_STB_O(LM8I_STB_O),
.D_ADR_O(LM8D_ADR_O),
.D_DAT_O(LM8D_DAT_O),
.D_DAT_I(LM8D_DAT_I),
.D_SEL_O(LM8D_SEL_O),
.D_WE_O(LM8D_WE_O),
.D_ACK_I(LM8D_ACK_I),
.D_ERR_I(LM8D_ERR_I),
.D_RTY_I(LM8D_RTY_I),
.D_CTI_O(LM8D_CTI_O),
.D_BTE_O(LM8D_BTE_O),
.D_LOCK_O(LM8D_LOCK_O),
.D_CYC_O(LM8D_CYC_O),
.D_STB_O(LM8D_STB_O),
.interrupts(LM8interrupts),
.clk_i (clk_i), .rst_i (sys_reset));


wire [7:0] uartUART_DAT_I;
assign uartUART_DAT_I = SHAREDBUS_DAT_I[7:0];
wire [0:0] uartUART_SEL_I;
assign uartUART_SEL_I = SHAREDBUS_SEL_I;
assign uartUART_en = ( SHAREDBUS_ADR_I[31:4] == 28'b1000000000000000000000010000);
uart_core 
#(
.UART_WB_DAT_WIDTH(8),
.UART_WB_ADR_WIDTH(4),
.CLK_IN_MHZ(12),
.BAUD_RATE(115200),
.STDOUT_SIM(0),
.STDOUT_SIMFAST(0),
.LCR_DATA_BITS(8),
.LCR_STOP_BITS(1),
.LCR_PARITY_ENABLE(0),
.LCR_PARITY_ODD(0),
.LCR_PARITY_STICK(0),
.LCR_SET_BREAK(0),
.FIFO(0))
 uart( 
.UART_ADR_I(SHAREDBUS_ADR_I[3:0]),
.UART_DAT_I(uartUART_DAT_I[7:0]),
.UART_DAT_O(uartUART_DAT_O[7:0]),
.UART_SEL_I(uartUART_SEL_I),
.UART_WE_I(SHAREDBUS_WE_I),
.UART_ACK_O(uartUART_ACK_O),
.UART_ERR_O(uartUART_ERR_O),
.UART_RTY_O(uartUART_RTY_O),
.UART_CTI_I(SHAREDBUS_CTI_I),
.UART_BTE_I(SHAREDBUS_BTE_I),
.UART_LOCK_I(SHAREDBUS_LOCK_I),
.UART_CYC_I(SHAREDBUS_CYC_I & uartUART_en),
.UART_STB_I(SHAREDBUS_STB_I & uartUART_en),
.SIN(uartSIN),
.SOUT(uartSOUT),
.INTR(uartINTR),
.CLK(clk_i), .RESET(sys_reset));


wire [7:0] slave_LCDS_DAT_I;
assign slave_LCDS_DAT_I = SHAREDBUS_DAT_I[7:0];
wire [0:0] slave_LCDS_SEL_I;
assign slave_LCDS_SEL_I = SHAREDBUS_SEL_I;
assign slave_LCDS_en = ( SHAREDBUS_ADR_I[31:4] == 28'b1000000000000000000000100000);
slave_passthru 
#(
.S_WB_DAT_WIDTH(8),
.S_WB_ADR_WIDTH(32))
 slave_LCD( 
.S_ADR_I(SHAREDBUS_ADR_I[31:0]),
.S_DAT_I(slave_LCDS_DAT_I[7:0]),
.S_DAT_O(slave_LCDS_DAT_O[7:0]),
.S_SEL_I(slave_LCDS_SEL_I),
.S_WE_I(SHAREDBUS_WE_I),
.S_ACK_O(slave_LCDS_ACK_O),
.S_ERR_O(slave_LCDS_ERR_O),
.S_RTY_O(slave_LCDS_RTY_O),
.S_CTI_I(SHAREDBUS_CTI_I),
.S_BTE_I(SHAREDBUS_BTE_I),
.S_LOCK_I(SHAREDBUS_LOCK_I),
.S_CYC_I(SHAREDBUS_CYC_I & slave_LCDS_en),
.S_STB_I(SHAREDBUS_STB_I & slave_LCDS_en),
.clk(slave_LCDclk),
.rst(slave_LCDrst),
.slv_adr(slave_LCDslv_adr),
.slv_master_data(slave_LCDslv_master_data),
.slv_slave_data(slave_LCDslv_slave_data),
.slv_strb(slave_LCDslv_strb),
.slv_cyc(slave_LCDslv_cyc),
.slv_ack(slave_LCDslv_ack),
.slv_err(slave_LCDslv_err),
.slv_rty(slave_LCDslv_rty),
.slv_sel(slave_LCDslv_sel),
.slv_we(slave_LCDslv_we),
.slv_bte(slave_LCDslv_bte),
.slv_cti(slave_LCDslv_cti),
.slv_lock(slave_LCDslv_lock),
.intr_active_high(slave_LCDintr_active_high),
.INTR_O(slave_LCDINTR_O),
.CLK_I(clk_i), .RST_I(sys_reset));


wire [7:0] slave_EFBS_DAT_I;
assign slave_EFBS_DAT_I = SHAREDBUS_DAT_I[7:0];
wire [0:0] slave_EFBS_SEL_I;
assign slave_EFBS_SEL_I = SHAREDBUS_SEL_I;
assign slave_EFBS_en = ( SHAREDBUS_ADR_I[31:8] == 24'b100000000000000000000000);
slave_passthru 
#(
.S_WB_DAT_WIDTH(8),
.S_WB_ADR_WIDTH(32))
 slave_EFB( 
.S_ADR_I(SHAREDBUS_ADR_I[31:0]),
.S_DAT_I(slave_EFBS_DAT_I[7:0]),
.S_DAT_O(slave_EFBS_DAT_O[7:0]),
.S_SEL_I(slave_EFBS_SEL_I),
.S_WE_I(SHAREDBUS_WE_I),
.S_ACK_O(slave_EFBS_ACK_O),
.S_ERR_O(slave_EFBS_ERR_O),
.S_RTY_O(slave_EFBS_RTY_O),
.S_CTI_I(SHAREDBUS_CTI_I),
.S_BTE_I(SHAREDBUS_BTE_I),
.S_LOCK_I(SHAREDBUS_LOCK_I),
.S_CYC_I(SHAREDBUS_CYC_I & slave_EFBS_en),
.S_STB_I(SHAREDBUS_STB_I & slave_EFBS_en),
.clk(slave_EFBclk),
.rst(slave_EFBrst),
.slv_adr(slave_EFBslv_adr),
.slv_master_data(slave_EFBslv_master_data),
.slv_slave_data(slave_EFBslv_slave_data),
.slv_strb(slave_EFBslv_strb),
.slv_cyc(slave_EFBslv_cyc),
.slv_ack(slave_EFBslv_ack),
.slv_err(slave_EFBslv_err),
.slv_rty(slave_EFBslv_rty),
.slv_sel(slave_EFBslv_sel),
.slv_we(slave_EFBslv_we),
.slv_bte(slave_EFBslv_bte),
.slv_cti(slave_EFBslv_cti),
.slv_lock(slave_EFBslv_lock),
.intr_active_high(slave_EFBintr_active_high),
.INTR_O(slave_EFBINTR_O),
.CLK_I(clk_i), .RST_I(sys_reset));


assign LM8interrupts[0] = uartINTR ;
assign LM8interrupts[1] = slave_LCDINTR_O ;
assign LM8interrupts[2] = slave_EFBINTR_O ;
assign LM8interrupts[3] = 0;
assign LM8interrupts[4] = 0;
assign LM8interrupts[5] = 0;
assign LM8interrupts[6] = 0;
assign LM8interrupts[7] = 0;
endmodule
