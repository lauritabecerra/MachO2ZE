//   ==================================================================
//   >>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
//   ------------------------------------------------------------------
//   Copyright (c) 2006-2011 by Lattice Semiconductor Corporation
//   ALL RIGHTS RESERVED 
//   ------------------------------------------------------------------
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
//                        FILE DETAILS
// Project          : MachXO2 EFB
// File             : efb.v
// Title            : MachXO2 Embedded Functions Block
// Description      : Implements the logic to interface with the MachXO2 EFB 
//                    primitive.
// =============================================================================
//                        REVISION HISTORY
// Version          : 3.0
// Mod. Date        : Jan 06, 2011
// Changes Made     : Initial Creation
// =============================================================================
`include "system_conf.v"

module efb
  #(parameter MACHXO2_EFB_SPI_SLAVE_COUNT = 1
    )
   (
    input CLK,
    input RESET,
   
    // I2C 1
`ifdef MACHXO2_EFB_I2C1
    inout i2c1_scl,
    inout i2c1_sda,
`endif
   
    // I2C 2
`ifdef MACHXO2_EFB_I2C2
    inout i2c2_scl,
    inout i2c2_sda,
`endif
   
    // SPI
`ifdef MACHXO2_EFB_SPI
 `ifdef MACHXO2_EFB_SPI_GENERIC
    input spi_scsn,
 `endif
 `ifdef MACHXO2_EFB_SPI_SLAVE
    input spi_scsn,
 `endif
 `ifdef MACHXO2_EFB_SPI_GENERIC
    output [MACHXO2_EFB_SPI_SLAVE_COUNT-1:0] spi_csn,
 `endif
 `ifdef MACHXO2_EFB_SPI_MASTER
    output [MACHXO2_EFB_SPI_SLAVE_COUNT-1:0] spi_csn,
 `endif
    inout spi_clk,
    inout spi_miso,
    inout spi_mosi,
`endif
   
    // Timer
`ifdef MACHXO2_EFB_TIMER
 `ifdef MACHXO2_EFB_TIMER_DYNAMIC
    input tc_ic,
 `endif
    output tc_oc,
`endif
   
    // PLL 
`ifdef MACHXO2_EFB_PLL0
    input [8:0] pll0_bus_i,
    output [16:0] pll0_bus_o,
 `ifdef MACHXO2_EFB_PLL1
    input [8:0] pll1_bus_i,
    output [16:0] pll1_bus_o,
 `endif
`endif

`ifdef MACHXO2_EFB_SPI_WAKEUP_EN
    output cfg_wake,
    output cfg_stdby,
`else
 `ifdef MACHXO2_EFB_I2C2_WAKEUP_EN
    output cfg_wake,
    output cfg_stdby,
 `else
  `ifdef MACHXO2_EFB_I2C1_WAKEUP_EN
    output cfg_wake,
    output cfg_stdby,
  `endif
 `endif
`endif
   
    // WISHBONE
    input WB_CYC_I,
    input WB_STB_I,
    input WB_WE_I,
    input [7:0] WB_ADR_I,
    input [7:0] WB_DAT_I,
    input WB_SEL_I,
    input [2:0] WB_CTI_I,
    input [1:0] WB_BTE_I,
    input WB_LOCK_I,
    output WB_ACK_O,
    output WB_ERR_O,
    output WB_RTY_O,
    output [7:0] WB_DAT_O,
    output WB_INT_O
    );
   
   wire i2c1_irqo, i2c2_irqo, spi_irq, tc_int, wbc_ufm_irq;
   
   assign WB_ERR_O = 1'b0;
   assign WB_RTY_O = 1'b0;

   // Interrupt generation
   assign WB_INT_O = (0
`ifdef MACHXO2_EFB_I2C1
		      | i2c1_irqo
`endif
`ifdef MACHXO2_EFB_I2C2
		      | i2c2_irqo
`endif
`ifdef MACHXO2_EFB_SPI_IRQ_EN
		      | spi_irq
`endif
`ifdef MACHXO2_EFB_TIMER
		      | tc_int
`endif
`ifdef MACHXO2_EFB_UFM
		      | wbc_ufm_irq
`endif
		      );

   machxo2_efb efb_u
     (
`ifdef MACHXO2_EFB_I2C1
      .i2c1_scl   (i2c1_scl),
      .i2c1_sda   (i2c1_sda),
      .i2c1_irqo  (i2c1_irqo),
`endif
`ifdef MACHXO2_EFB_I2C2
      .i2c2_scl   (i2c2_scl),
      .i2c2_sda   (i2c2_sda),
      .i2c2_irqo  (i2c2_irqo),
`endif
`ifdef MACHXO2_EFB_SPI
      .spi_clk    (spi_clk),
      .spi_miso   (spi_miso),
      .spi_mosi   (spi_mosi),
 `ifdef MACHXO2_EFB_SPI_SLAVE
      .spi_scsn   (spi_scsn),
 `else
  `ifdef MACHXO2_EFB_SPI_GENERIC
      .spi_scsn   (spi_scsn),
  `endif
 `endif
 `ifdef MACHXO2_EFB_SPI_MASTER
      .spi_csn    (spi_csn),
 `else
  `ifdef MACHXO2_EFB_SPI_GENERIC
      .spi_csn    (spi_csn),
  `endif
 `endif
 `ifdef MACHXO2_EFB_SPI_IRQ_EN
      .spi_irq    (spi_irq),
 `endif
`endif //  `ifdef spi
`ifdef MACHXO2_EFB_TIMER
      .tc_clki    (CLK),
      .tc_rstn    (~RESET),
      .tc_int     (tc_int),
 `ifdef MACHXO2_EFB_TIMER_DYNAMIC
      .tc_ic      (tc_ic),
 `endif
      .tc_oc      (tc_oc),
`endif
`ifdef MACHXO2_EFB_PLL0
      .pll0_bus_i (pll0_bus_i),
      .pll0_bus_o (pll0_bus_o),
 `ifdef MACHXO2_EFB_PLL1
      .pll1_bus_i (pll1_bus_i),
      .pll1_bus_o (pll1_bus_o),
 `endif
`endif
`ifdef MACHXO2_EFB_UFM
      .wbc_ufm_irq(wbc_ufm_irq),
`endif
      .wb_clk_i   (CLK),
      .wb_rst_i   (RESET),
      .wb_cyc_i   (WB_CYC_I),
      .wb_stb_i   (WB_STB_I),
      .wb_adr_i   (WB_ADR_I),
      .wb_dat_i   (WB_DAT_I),
      .wb_we_i    (WB_WE_I),
      .wb_dat_o   (WB_DAT_O),
      .wb_ack_o   (WB_ACK_O)
      );
   
endmodule
