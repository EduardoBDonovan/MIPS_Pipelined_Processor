`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2022 03:26:09 PM
// Design Name: 
// Module Name: TopModule
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TopModule(
input clk, rst
    );
    
    wire Stall;
    wire ForwardAD;
    wire ForwardBD;
    wire Flush;
    wire [1:0] ForwardAE;
    wire [1:0] ForwardBE;
    wire [31:0] PC;
    wire [31:0] PCR;
    wire [31:0] PCF;
    wire [31:0] PCp1F;
    wire [31:0] IMOut;
    wire [31:0] InstrD;
    wire [5:0] opcode;
    wire [5:0] funct;    
    wire [4:0] RsD;
    wire [4:0] RsE;
    wire [4:0] RtD;
    wire [4:0] RtE;
    wire [4:0] RdD;
    wire [4:0] RdE;
    wire [4:0] shamt;
    wire [15:0] Imm;
    wire [31:0] SImmD;
    wire [31:0] SImmE;
    wire [25:0] JumpI;    
    wire RFWED;
    wire RFWEE;
    wire RFWEM;
    wire RFWEW;
    wire MtoRFSelD;
    wire MtoRFSelE;
    wire MtoRFSelM;
    wire MtoRFSelW;
    wire DMWED;
    wire DMWEE;
    wire DMWEM;
    wire BranchD;
    wire ALUInSelD;
    wire ALUInSelE;
    wire RFDSelD;
    wire RFDSelE;
    wire JumpSel;
    wire [3:0] ALUSelD;
    wire [3:0] ALUSelE;
    wire [31:0] PCBranchD;
    wire [31:0] ResultW;
    wire [31:0] RFOut1;
    wire [31:0] RFOut2;
    wire [31:0] lilMuxOut1;
    wire [31:0] lilMuxOut2;
    wire [31:0] PCp1D;
    wire [31:0] RFRD1E;
    wire [31:0] RFRD2E;
    wire [31:0] ALUIn1E;
    wire [31:0] ALUIn2E;
    wire [31:0] DMdinE;
    wire [31:0] DMdinM;
    wire [31:0] ALUOutE;
    wire [31:0] ALUOutM;
    wire [31:0] ALUOutW;
    wire [4:0] RFAE;
    wire [4:0] RFAM;
    wire [4:0] RFAW;
    wire [31:0] DMOutM;
    wire [31:0] DMOutW;
    
    wire [31:0] JAddr;
    assign JAddr = {PCp1F[31:26], JumpI};
    
    wire PCSelComp = (lilMuxOut1 == lilMuxOut2) & BranchD;
    
    //MUXES
    MUX #(.sizeVal(32)) PCMux (.select(PCSelComp), .in0(PCp1F), .in1(PCBranchD), .muxOut(PC));
    MUX #(.sizeVal(32)) RFRD1Mux (.select(ForwardAD), .in0(RFOut1), .in1(ALUOutM), .muxOut(lilMuxOut1));
    MUX #(.sizeVal(32)) RFRD2Mux (.select(ForwardBD), .in0(RFOut2), .in1(ALUOutM), .muxOut(lilMuxOut2));
    MUX #(.sizeVal(5)) RFDSelEMux (.select(RFDSelE), .in0(RtE), .in1(RdE), .muxOut(RFAE));
    MUX #(.sizeVal(32)) ALUInSelEMux (.select(ALUInSelE), .in0(DMdinE), .in1(SImmE), .muxOut(ALUIn2E));
    MUX #(.sizeVal(32)) JumpMux (.select(JumpSel), .in0(PC), .in1(JAddr), .muxOut(PCR));
    MUX #(.sizeVal(32)) MtoRFSelMux (.select(MtoRFSelW), .in0(ALUOutW), .in1(DMOutW), .muxOut(ResultW));

    //REGISTER
    Register #(.dataW(32)) PCReg (.clk(clk), .rst(rst), .en(~Stall), .dataIn(PCR), .dataOut(PCF));
    
    //INSTRUCTION MEMORY
    InstructionMemory #(.sizeVal(32), .File("MIPSCode.mem")) IM (.IMA(PCF), .IMRD(IMOut));
    
    /*
    wire [31:0] BranchAd;
    
    assign BranchAd = SImmD << 2;
    */
    //ADDERS
    Adder #(.inw1(32), .inw2(2)) PCadder (.in1(PCF), .in2(1), .dataOut(PCp1F));
    Adder #(.inw1(32), .inw2(32)) Branchadder (.in1(SImmD), .in2(PCp1D), .dataOut(PCBranchD));
    
    //PIPELINED STAGES REGISTERS
    IFRegister #(.sizeVal(32)) IFtoID (.clk(clk), .rst(PCSelComp | rst), .en(~Stall), .RD(IMOut), .PCp1F(PCp1F), .InstrD(InstrD), .PCp1D(PCp1D));
    IDRegister #(.sizeVal(32), .sizeAd(5)) IDtoEXE (.clk(clk), .rst(Flush | rst), .RFWED(RFWED), .MtoRFSelD(MtoRFSelD), .DMWED(DMWED), .ALUInSelD(ALUInSelD), .RFDSelD(RFDSelD),
 .ALUSelD(ALUSelD), .RFRD1D(lilMuxOut1), .RFRD2D(lilMuxOut2), .RsD(RsD), .RtD(RtD), .RdD(RdD), .SImmD(SImmD), .RFWEE(RFWEE), .MtoRFSelE(MtoRFSelE), .DMWEE(DMWEE), .ALUInSelE(ALUInSelE), .RFDSelE(RFDSelE), .ALUSelE(ALUSelE), .RFRD1E(RFRD1E), .RFRD2E(RFRD2E), .RsE(RsE), .RtE(RtE), .RdE(RdE), .SImmE(SImmE));
    EXERegister #(.sizeVal(32), .sizeAd(5)) EXEtoMem (.clk(clk), .rst(rst), .RFWEE(RFWEE), .MtoRFSelE(MtoRFSelE), .DMWEE(DMWEE), .RFAE(RFAE),
 .ALUOutE(ALUOutE), .DMdinE(DMdinE), .RFWEM(RFWEM), .MtoRFSelM(MtoRFSelM), .DMWEM(DMWEM), .RFAM(RFAM), .ALUOutM(ALUOutM), .DMdinM(DMdinM));
    MEMRegister #(.sizeVal(32)) MEMtoWB (.clk(clk), .rst(rst), .RFWEM(RFWEM), .MtoRFSelM(MtoRFSelM), .ALUOutM(ALUOutM), .DMOutM(DMOutM), .RFAM(RFAM), .RFWEW(RFWEW), .MtoRFSelW(MtoRFSelW), .ALUOutW(ALUOutW), .DMOutW(DMOutW), .RFAW(RFAW));
    
    //INSTRUCTION DECODER
    InstructionDecoder Decode(.inst(InstrD), .opcode(opcode), .rs(RsD), .rt(RtD), .rd(RdD), .shamt(shamt), .funct(funct), .imm(Imm), .jump(JumpI));

    //SIGN EXTENDER
    SignExtend #(.inw(16), .outw(32)) SExt (.Imm(Imm), .SImm(SImmD));
    
    //CONTROL UNIT
    ControlUnit CU (.opcode(opcode), .funct(funct), .MtoRFSel(MtoRFSelD), .DMWE(DMWED), .Branch(BranchD), .ALUinSel(ALUInSelD), .RFDSel(RFDSelD), .RFWE(RFWED), .JumpSel(JumpSel), .ALUSel(ALUSelD));
    
    //REGISTER FILE
    RegisterFile #(.sizeVal(32), .sizeAd(5)) RF (.RFWE(RFWEW), .clk(~clk), .RFWD(ResultW), .RFWA(RFAW), .RFRA1(RsD), .RFRA2(RtD), .RFRD1(RFOut1), .RFRD2(RFOut2));
    
    //BIG MUXES
    BigMUX #(.selectSize(2), .sizeVal (32)) RFRD1EtoALU (.select(ForwardAE), .in0(RFRD1E), .in1(ResultW), .in2(ALUOutM), .muxOut(ALUIn1E));
    BigMUX #(.selectSize(2), .sizeVal (32)) RFRD2EtoALU (.select(ForwardBE), .in0(RFRD2E), .in1(ResultW), .in2(ALUOutM), .muxOut(DMdinE));

    //ALU
    ALU #(.sizeVal(32)) Alu (.ALUIn1(ALUIn1E), .ALUIn2(ALUIn2E), .ALUsel(ALUSelE), .shamt(shamt), .outreg(ALUOutE));

    //DATA MEMORY
    DataMemory #(.sizeVal(32), .File("datamem.mem")) DM (.clk(clk), .DMWE(DMWEM), .DMA(ALUOutM), .DMWD(DMdinM), .DMOUT(DMOutM));

    //Hazard Unit
    HazardUnit #(.sizeAd(5)) HU (.BranchD(BranchD), .RsD(RsD), .RtD(RtD), .RsE(RsE), .RtE(RtE), .RFWEE(RFWEE), .MtoRFSelE(MtoRFSelE), .MtoRFSelM(MtoRFSelM), .RFWEM(RFWEM), .RFWEW(RFWEW), .RFAE(RFAE), .RFAM(RFAM), .RFAW(RFAW), .Stall(Stall), .ForwardAD(ForwardAD), .ForwardBD(ForwardBD), .Flush(Flush), .ForwardAE(ForwardAE), .ForwardBE(ForwardBE));

    
endmodule
