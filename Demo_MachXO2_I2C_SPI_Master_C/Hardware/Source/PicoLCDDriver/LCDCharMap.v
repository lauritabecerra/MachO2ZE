/* Verilog netlist generated by SCUBA Diamond_1.4_Production (80) */
/* Module Version: 5.0 */
/* C:\lscc\diamond\1.4\ispfpga\bin\nt\scuba.exe -w -lang verilog -synth synplify -bus_exp 7 -bb -arch xo2c00 -type bram -wp 00 -rp 1100 -addr_width 8 -data_width 7 -num_rows 256 -outdata REGISTERED -cascade -1 -resetmode SYNC -sync_reset -memfile lcdcharmap.mem -memformat bin -e  */
/* Wed Feb 29 13:10:01 2012 */


`timescale 1 ns / 1 ps
module LCDCharMap (Address, OutClock, OutClockEn, Reset, Q);
    input wire [7:0] Address;
    input wire OutClock;
    input wire OutClockEn;
    input wire Reset;
    output wire [6:0] Q;

    wire scuba_vhi;
    wire scuba_vlo;

    VHI scuba_vhi_inst (.Z(scuba_vhi));

    VLO scuba_vlo_inst (.Z(scuba_vlo));

    defparam LCDCharMap_0_0_0.INIT_DATA = "STATIC" ;
    defparam LCDCharMap_0_0_0.ASYNC_RESET_RELEASE = "SYNC" ;
    defparam LCDCharMap_0_0_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
    defparam LCDCharMap_0_0_0.INITVAL_01 = "0x0FE7B07E1106C150AA4100E1205E18018400562A08E160C2790124201C0604246006080481106C15" ;
    defparam LCDCharMap_0_0_0.INITVAL_00 = "0x0AA4100E1205E18018400562A08E160C2790124201C060424600608020000F00202419060240F240" ;
    defparam LCDCharMap_0_0_0.CSDECODE_B = "0b111" ;
    defparam LCDCharMap_0_0_0.CSDECODE_A = "0b000" ;
    defparam LCDCharMap_0_0_0.WRITEMODE_B = "NORMAL" ;
    defparam LCDCharMap_0_0_0.WRITEMODE_A = "NORMAL" ;
    defparam LCDCharMap_0_0_0.GSR = "ENABLED" ;
    defparam LCDCharMap_0_0_0.RESETMODE = "SYNC" ;
    defparam LCDCharMap_0_0_0.REGMODE_B = "NOREG" ;
    defparam LCDCharMap_0_0_0.REGMODE_A = "OUTREG" ;
    defparam LCDCharMap_0_0_0.DATA_WIDTH_B = 9 ;
    defparam LCDCharMap_0_0_0.DATA_WIDTH_A = 9 ;
    DP8KC LCDCharMap_0_0_0 (.DIA8(scuba_vlo), .DIA7(scuba_vlo), .DIA6(scuba_vlo), 
        .DIA5(scuba_vlo), .DIA4(scuba_vlo), .DIA3(scuba_vlo), .DIA2(scuba_vlo), 
        .DIA1(scuba_vlo), .DIA0(scuba_vlo), .ADA12(scuba_vlo), .ADA11(scuba_vlo), 
        .ADA10(Address[7]), .ADA9(Address[6]), .ADA8(Address[5]), .ADA7(Address[4]), 
        .ADA6(Address[3]), .ADA5(Address[2]), .ADA4(Address[1]), .ADA3(Address[0]), 
        .ADA2(scuba_vlo), .ADA1(scuba_vlo), .ADA0(scuba_vhi), .CEA(OutClockEn), 
        .OCEA(OutClockEn), .CLKA(OutClock), .WEA(scuba_vlo), .CSA2(scuba_vlo), 
        .CSA1(scuba_vlo), .CSA0(scuba_vlo), .RSTA(Reset), .DIB8(scuba_vlo), 
        .DIB7(scuba_vlo), .DIB6(scuba_vlo), .DIB5(scuba_vlo), .DIB4(scuba_vlo), 
        .DIB3(scuba_vlo), .DIB2(scuba_vlo), .DIB1(scuba_vlo), .DIB0(scuba_vlo), 
        .ADB12(scuba_vlo), .ADB11(scuba_vlo), .ADB10(scuba_vlo), .ADB9(scuba_vlo), 
        .ADB8(scuba_vlo), .ADB7(scuba_vlo), .ADB6(scuba_vlo), .ADB5(scuba_vlo), 
        .ADB4(scuba_vlo), .ADB3(scuba_vlo), .ADB2(scuba_vlo), .ADB1(scuba_vlo), 
        .ADB0(scuba_vlo), .CEB(scuba_vhi), .OCEB(scuba_vhi), .CLKB(scuba_vlo), 
        .WEB(scuba_vlo), .CSB2(scuba_vlo), .CSB1(scuba_vlo), .CSB0(scuba_vlo), 
        .RSTB(scuba_vlo), .DOA8(), .DOA7(), .DOA6(Q[6]), .DOA5(Q[5]), .DOA4(Q[4]), 
        .DOA3(Q[3]), .DOA2(Q[2]), .DOA1(Q[1]), .DOA0(Q[0]), .DOB8(), .DOB7(), 
        .DOB6(), .DOB5(), .DOB4(), .DOB3(), .DOB2(), .DOB1(), .DOB0())
             /* synthesis MEM_LPC_FILE="LCDCharMap.lpc" */
             /* synthesis MEM_INIT_FILE="lcdcharmap.mem" */;



    // exemplar begin
    // exemplar attribute LCDCharMap_0_0_0 MEM_LPC_FILE LCDCharMap.lpc
    // exemplar attribute LCDCharMap_0_0_0 MEM_INIT_FILE lcdcharmap.mem
    // exemplar end

endmodule
