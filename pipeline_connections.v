`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2026 16:17:29
// Design Name: 
// Module Name: pipeline_connections
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


module pipeline_connections
   (clk,
    rst);
  input clk;
  input rst;

  wire [2:0]InstructionMemory_0_funct3;
  wire [6:0]InstructionMemory_0_funct7;
  wire [24:0]InstructionMemory_0_immediate;
  wire [6:0]InstructionMemory_0_opcode;
  wire [4:0]InstructionMemory_0_rd;
  wire [4:0]InstructionMemory_0_rs1;
  wire [4:0]InstructionMemory_0_rs2;
  wire [31:0]PC_0_ADDR_OUT;
  wire [31:0]PC_4_0_out;
  wire [31:0]PC_IMM_0_out;
  wire [31:0]RegisterFile_0_r1;
  wire [31:0]RegisterFile_0_r2;
  wire alu_0_flag;
  wire [31:0]alu_0_out;
  wire clk;
  wire [3:0]controlunit_0_alu_cont;
  wire controlunit_0_alu_dm;
  wire [1:0]controlunit_0_alu_pc_4;
  wire [1:0]controlunit_0_dm_cont;
  wire [2:0]controlunit_0_extend_cont_1;
  wire [2:0]controlunit_0_extend_cont_2;
  wire [1:0]controlunit_0_pcmux_cont;
  wire controlunit_0_r2_im;
  wire controlunit_0_w_en_dm;
  wire controlunit_0_w_en_rf;
  wire [31:0]data_memory_0_out;
  wire [31:0]extend_1_0_out;
  wire [31:0]extend_2_0_out;
  wire hazard_unit_0_en_d;
  wire hazard_unit_0_en_f;
  wire hazard_unit_0_flush_d;
  wire hazard_unit_0_flush_e;
  wire [1:0]hazard_unit_0_r1_mux;
  wire [1:0]hazard_unit_0_r2_mux;
  wire [31:0]mux_2_1_0_out;
  wire [31:0]mux_2_1_1_out;
  wire [31:0]mux_2_1_2_out;
  wire [31:0]mux_3_1_0_out;
  wire [31:0]mux_3_1_1_out;
  wire [31:0]mux_4_1_0_out;
  wire [31:0]mux_4_1_1_out;
  wire [3:0]pipeline_stage_0_alu_count_out;
  wire pipeline_stage_0_alu_dm_out;
  wire [1:0]pipeline_stage_0_alu_pc_4_out;
  wire [1:0]pipeline_stage_0_dm_cont_out;
  wire [2:0]pipeline_stage_0_extend_cont_2_out;
  wire [31:0]pipeline_stage_0_immediate_out;
  wire [31:0]pipeline_stage_0_pc_4_out;
  wire [31:0]pipeline_stage_0_pc_out;
  wire [1:0]pipeline_stage_0_pcmux_cont_out;
  wire [31:0]pipeline_stage_0_r1_out;
  wire pipeline_stage_0_r2_imm_out;
  wire [31:0]pipeline_stage_0_r2_out;
  wire [4:0]pipeline_stage_0_rd_out;
  wire [4:0]pipeline_stage_0_rs1_addr_out;
  wire [4:0]pipeline_stage_0_rs2_addr_out;
  wire pipeline_stage_0_w_en_dm_out;
  wire pipeline_stage_0_w_en_rf_out;
  wire [2:0]pipeline_stage_1_0_funct3_out;
  wire [6:0]pipeline_stage_1_0_funct7_out;
  wire [24:0]pipeline_stage_1_0_immediate_out;
  wire [6:0]pipeline_stage_1_0_opcode_out;
  wire [31:0]pipeline_stage_1_0_pc_4_out;
  wire [31:0]pipeline_stage_1_0_pc_out;
  wire [4:0]pipeline_stage_1_0_rd_out;
  wire [4:0]pipeline_stage_1_0_rs1_out;
  wire [4:0]pipeline_stage_1_0_rs2_out;
  wire pipeline_stage_2_0_alu_dm_out;
  wire [1:0]pipeline_stage_2_0_alu_pc_4_out;
  wire [31:0]pipeline_stage_2_0_alu_result_out;
  wire [1:0]pipeline_stage_2_0_dm_cont_out;
  wire [2:0]pipeline_stage_2_0_extend_cont_2_out;
  wire [31:0]pipeline_stage_2_0_immediate_out;
  wire [31:0]pipeline_stage_2_0_pc_4_out;
  wire [31:0]pipeline_stage_2_0_pc_imm_out;
  wire [31:0]pipeline_stage_2_0_pc_out;
  wire [31:0]pipeline_stage_2_0_rd2_out;
  wire [4:0]pipeline_stage_2_0_rdm_out;
  wire pipeline_stage_2_0_w_en_dm_out;
  wire pipeline_stage_2_0_w_en_rf_out;
  wire pipeline_stage_3_0_alu_dm_out;
  wire [1:0]pipeline_stage_3_0_alu_pc_4_out;
  wire [31:0]pipeline_stage_3_0_alu_result_out;
  wire [31:0]pipeline_stage_3_0_dm_read_out;
  wire [31:0]pipeline_stage_3_0_immediate_out;
  wire [31:0]pipeline_stage_3_0_pc_4_out;
  wire [31:0]pipeline_stage_3_0_pc_imm_out;
  wire [4:0]pipeline_stage_3_0_rdwb_out;
  wire pipeline_stage_3_0_w_en_rf_out;
  wire rst;

  piplinedcpu_InstructionMemory_0_0 InstructionMemory_0
       (.CLK(clk),
        .PC_IN(PC_0_ADDR_OUT),
        .funct3(InstructionMemory_0_funct3),
        .funct7(InstructionMemory_0_funct7),
        .immediate(InstructionMemory_0_immediate),
        .opcode(InstructionMemory_0_opcode),
        .rd(InstructionMemory_0_rd),
        .rs1(InstructionMemory_0_rs1),
        .rs2(InstructionMemory_0_rs2));
  piplinedcpu_PC_0_0 PC_0
       (.ADDR_IN(mux_4_1_0_out),
        .ADDR_OUT(PC_0_ADDR_OUT),
        .clk(clk),
        .en(hazard_unit_0_en_f),
        .rst(rst));
  piplinedcpu_PC_4_0_0 PC_4_0
       (.out(PC_4_0_out),
        .pc(PC_0_ADDR_OUT));
  piplinedcpu_PC_IMM_0_0 PC_IMM_0
       (.imm(pipeline_stage_0_immediate_out),
        .out(PC_IMM_0_out),
        .pc(pipeline_stage_0_pc_out));
  piplinedcpu_RegisterFile_0_0 RegisterFile_0
       (.clk(clk),
        .r1(RegisterFile_0_r1),
        .r2(RegisterFile_0_r2),
        .rd(pipeline_stage_3_0_rdwb_out),
        .rs1(pipeline_stage_1_0_rs1_out),
        .rs2(pipeline_stage_1_0_rs2_out),
        .rst(rst),
        .w_en_rf(pipeline_stage_3_0_w_en_rf_out),
        .wd(mux_4_1_1_out));
  piplinedcpu_alu_0_0 alu_0
       (.alu_cont(pipeline_stage_0_alu_count_out),
        .flag(alu_0_flag),
        .i0(mux_3_1_1_out),
        .i1(mux_2_1_0_out),
        .out(alu_0_out));
  piplinedcpu_controlunit_0_0 controlunit_0
       (.alu_cont(controlunit_0_alu_cont),
        .alu_dm(controlunit_0_alu_dm),
        .alu_pc_4(controlunit_0_alu_pc_4),
        .dm_cont(controlunit_0_dm_cont),
        .extend_cont_1(controlunit_0_extend_cont_1),
        .extend_cont_2(controlunit_0_extend_cont_2),
        .funct3(pipeline_stage_1_0_funct3_out),
        .funct7(pipeline_stage_1_0_funct7_out),
        .opcode(pipeline_stage_1_0_opcode_out),
        .pcmux_cont(controlunit_0_pcmux_cont),
        .r2_im(controlunit_0_r2_im),
        .w_en_dm(controlunit_0_w_en_dm),
        .w_en_rf(controlunit_0_w_en_rf));
  piplinedcpu_data_memory_0_0 data_memory_0
       (.addr(pipeline_stage_2_0_alu_result_out),
        .clk(clk),
        .dm_cont(pipeline_stage_2_0_dm_cont_out),
        .out(data_memory_0_out),
        .w_en_dm(pipeline_stage_2_0_w_en_dm_out),
        .wd(pipeline_stage_2_0_rd2_out));
  piplinedcpu_extend_1_0_0 extend_1_0
       (.cont(controlunit_0_extend_cont_1),
        .in(pipeline_stage_1_0_immediate_out),
        .out(extend_1_0_out));
  piplinedcpu_extend_2_0_0 extend_2_0
       (.cont(pipeline_stage_2_0_extend_cont_2_out),
        .in(data_memory_0_out),
        .out(extend_2_0_out));
  piplinedcpu_hazard_unit_0_0 hazard_unit_0
       (.alu_dm_e(pipeline_stage_0_alu_dm_out),
        .en_d(hazard_unit_0_en_d),
        .en_f(hazard_unit_0_en_f),
        .flush_d(hazard_unit_0_flush_d),
        .flush_e(hazard_unit_0_flush_e),
        .pc_mux_cont(pipeline_stage_0_pcmux_cont_out),
        .r1_mux(hazard_unit_0_r1_mux),
        .r2_mux(hazard_unit_0_r2_mux),
        .rde(pipeline_stage_0_rd_out),
        .rdm(pipeline_stage_2_0_rdm_out),
        .rdwb(pipeline_stage_3_0_rdwb_out),
        .rs1d(pipeline_stage_1_0_rs1_out),
        .rs1e(pipeline_stage_0_rs1_addr_out),
        .rs2d(pipeline_stage_1_0_rs2_out),
        .rs2e(pipeline_stage_0_rs2_addr_out),
        .w_en_rf_e(pipeline_stage_0_w_en_rf_out),
        .w_en_rf_m(pipeline_stage_2_0_w_en_rf_out),
        .w_en_rf_wb(pipeline_stage_3_0_w_en_rf_out));
  piplinedcpu_mux_2_1_0_0 mux_2_1_0
       (.i0(mux_3_1_0_out),
        .i1(pipeline_stage_0_immediate_out),
        .out(mux_2_1_0_out),
        .sel(pipeline_stage_0_r2_imm_out));
  piplinedcpu_mux_2_1_1_0 mux_2_1_1
       (.i0(PC_4_0_out),
        .i1(PC_IMM_0_out),
        .out(mux_2_1_1_out),
        .sel(alu_0_flag));
  piplinedcpu_mux_2_1_2_0 mux_2_1_2
       (.i0(pipeline_stage_3_0_alu_result_out),
        .i1(pipeline_stage_3_0_dm_read_out),
        .out(mux_2_1_2_out),
        .sel(pipeline_stage_3_0_alu_dm_out));
  piplinedcpu_mux_3_1_0_0 mux_3_1_0
       (.i0(pipeline_stage_0_r2_out),
        .i1(pipeline_stage_2_0_alu_result_out),
        .i2(mux_4_1_1_out),
        .out(mux_3_1_0_out),
        .sel(hazard_unit_0_r2_mux));
  piplinedcpu_mux_3_1_1_0 mux_3_1_1
       (.i0(pipeline_stage_0_r1_out),
        .i1(pipeline_stage_2_0_alu_result_out),
        .i2(mux_4_1_1_out),
        .out(mux_3_1_1_out),
        .sel(hazard_unit_0_r1_mux));
  piplinedcpu_mux_4_1_0_0 mux_4_1_0
       (.i0(PC_4_0_out),
        .i1(alu_0_out),
        .i2(mux_2_1_1_out),
        .i3(PC_IMM_0_out),
        .out(mux_4_1_0_out),
        .sel(pipeline_stage_0_pcmux_cont_out));
  piplinedcpu_mux_4_1_1_0 mux_4_1_1
       (.i0(mux_2_1_2_out),
        .i1(pipeline_stage_3_0_pc_4_out),
        .i2(pipeline_stage_3_0_pc_imm_out),
        .i3(pipeline_stage_3_0_immediate_out),
        .out(mux_4_1_1_out),
        .sel(pipeline_stage_3_0_alu_pc_4_out));
  piplinedcpu_pipeline_stage_0_0 pipeline_stage_0
       (.alu_count(controlunit_0_alu_cont),
        .alu_count_out(pipeline_stage_0_alu_count_out),
        .alu_dm(controlunit_0_alu_dm),
        .alu_dm_out(pipeline_stage_0_alu_dm_out),
        .alu_pc_4(controlunit_0_alu_pc_4),
        .alu_pc_4_out(pipeline_stage_0_alu_pc_4_out),
        .clk(clk),
        .dm_cont(controlunit_0_dm_cont),
        .dm_cont_out(pipeline_stage_0_dm_cont_out),
        .extend_cont_2(controlunit_0_extend_cont_2),
        .extend_cont_2_out(pipeline_stage_0_extend_cont_2_out),
        .flush(hazard_unit_0_flush_e),
        .immediate(extend_1_0_out),
        .immediate_out(pipeline_stage_0_immediate_out),
        .pc(pipeline_stage_1_0_pc_out),
        .pc_4(pipeline_stage_1_0_pc_4_out),
        .pc_4_out(pipeline_stage_0_pc_4_out),
        .pc_out(pipeline_stage_0_pc_out),
        .pcmux_cont(controlunit_0_pcmux_cont),
        .pcmux_cont_out(pipeline_stage_0_pcmux_cont_out),
        .r1(RegisterFile_0_r1),
        .r1_out(pipeline_stage_0_r1_out),
        .r2(RegisterFile_0_r2),
        .r2_imm(controlunit_0_r2_im),
        .r2_imm_out(pipeline_stage_0_r2_imm_out),
        .r2_out(pipeline_stage_0_r2_out),
        .rde(pipeline_stage_1_0_rd_out),
        .rde_out(pipeline_stage_0_rd_out),
        .rs1_addr(pipeline_stage_1_0_rs1_out),
        .rs1_addr_out(pipeline_stage_0_rs1_addr_out),
        .rs2_addr(pipeline_stage_1_0_rs2_out),
        .rs2_addr_out(pipeline_stage_0_rs2_addr_out),
        .w_en_dm(controlunit_0_w_en_dm),
        .w_en_dm_out(pipeline_stage_0_w_en_dm_out),
        .w_en_rf(controlunit_0_w_en_rf),
        .w_en_rf_out(pipeline_stage_0_w_en_rf_out));
  piplinedcpu_pipeline_stage_1_0_0 pipeline_stage_1_0
       (.clk(clk),
        .en(hazard_unit_0_en_d),
        .flush_d(hazard_unit_0_flush_d),
        .funct3(InstructionMemory_0_funct3),
        .funct3_out(pipeline_stage_1_0_funct3_out),
        .funct7(InstructionMemory_0_funct7),
        .funct7_out(pipeline_stage_1_0_funct7_out),
        .immediate(InstructionMemory_0_immediate),
        .immediate_out(pipeline_stage_1_0_immediate_out),
        .opcode(InstructionMemory_0_opcode),
        .opcode_out(pipeline_stage_1_0_opcode_out),
        .pc(PC_0_ADDR_OUT),
        .pc_4(PC_4_0_out),
        .pc_4_out(pipeline_stage_1_0_pc_4_out),
        .pc_out(pipeline_stage_1_0_pc_out),
        .rd(InstructionMemory_0_rd),
        .rd_out(pipeline_stage_1_0_rd_out),
        .rs1(InstructionMemory_0_rs1),
        .rs1_out(pipeline_stage_1_0_rs1_out),
        .rs2(InstructionMemory_0_rs2),
        .rs2_out(pipeline_stage_1_0_rs2_out));
  piplinedcpu_pipeline_stage_2_0_0 pipeline_stage_2_0
       (.alu_dm(pipeline_stage_0_alu_dm_out),
        .alu_dm_out(pipeline_stage_2_0_alu_dm_out),
        .alu_pc_4(pipeline_stage_0_alu_pc_4_out),
        .alu_pc_4_out(pipeline_stage_2_0_alu_pc_4_out),
        .alu_result(alu_0_out),
        .alu_result_out(pipeline_stage_2_0_alu_result_out),
        .clk(clk),
        .dm_cont(pipeline_stage_0_dm_cont_out),
        .dm_cont_out(pipeline_stage_2_0_dm_cont_out),
        .extend_cont_2(pipeline_stage_0_extend_cont_2_out),
        .extend_cont_2_out(pipeline_stage_2_0_extend_cont_2_out),
        .immediate(pipeline_stage_0_immediate_out),
        .immediate_out(pipeline_stage_2_0_immediate_out),
        .pc(pipeline_stage_0_pc_out),
        .pc_4(pipeline_stage_0_pc_4_out),
        .pc_4_out(pipeline_stage_2_0_pc_4_out),
        .pc_imm(PC_IMM_0_out),
        .pc_imm_out(pipeline_stage_2_0_pc_imm_out),
        .pc_out(pipeline_stage_2_0_pc_out),
        .rd2(mux_3_1_0_out),
        .rd2_out(pipeline_stage_2_0_rd2_out),
        .rdm(pipeline_stage_0_rd_out),
        .rdm_out(pipeline_stage_2_0_rdm_out),
        .rst(rst),
        .w_en_dm(pipeline_stage_0_w_en_dm_out),
        .w_en_dm_out(pipeline_stage_2_0_w_en_dm_out),
        .w_en_rf(pipeline_stage_0_w_en_rf_out),
        .w_en_rf_out(pipeline_stage_2_0_w_en_rf_out));
  piplinedcpu_pipeline_stage_3_0_0 pipeline_stage_3_0
       (.alu_dm(pipeline_stage_2_0_alu_dm_out),
        .alu_dm_out(pipeline_stage_3_0_alu_dm_out),
        .alu_pc_4(pipeline_stage_2_0_alu_pc_4_out),
        .alu_pc_4_out(pipeline_stage_3_0_alu_pc_4_out),
        .alu_result(pipeline_stage_2_0_alu_result_out),
        .alu_result_out(pipeline_stage_3_0_alu_result_out),
        .clk(clk),
        .dm_read(extend_2_0_out),
        .dm_read_out(pipeline_stage_3_0_dm_read_out),
        .immediate(pipeline_stage_2_0_immediate_out),
        .immediate_out(pipeline_stage_3_0_immediate_out),
        .pc(pipeline_stage_2_0_pc_out),
        .pc_4(pipeline_stage_2_0_pc_4_out),
        .pc_4_out(pipeline_stage_3_0_pc_4_out),
        .pc_imm(pipeline_stage_2_0_pc_imm_out),
        .pc_imm_out(pipeline_stage_3_0_pc_imm_out),
        .rdwb(pipeline_stage_2_0_rdm_out),
        .rdwb_out(pipeline_stage_3_0_rdwb_out),
        .rst(rst),
        .w_en_rf(pipeline_stage_2_0_w_en_rf_out),
        .w_en_rf_out(pipeline_stage_3_0_w_en_rf_out));
endmodule
