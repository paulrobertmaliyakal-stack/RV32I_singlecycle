`timescale 1ns/1ps

module top_module (
    input clk,
    input rst
);

  wire [2:0]  InstructionMemory_0_funct3;
  wire [6:0]  InstructionMemory_0_funct7;
  wire [24:0] InstructionMemory_0_immediate;
  wire [6:0]  InstructionMemory_0_opcode;
  wire [4:0]  InstructionMemory_0_rd;
  wire [4:0]  InstructionMemory_0_rs1;
  wire [4:0]  InstructionMemory_0_rs2;
  wire [31:0] PC_0_ADDR_OUT;
  wire [31:0] PC_4_0_out;
  wire [31:0] PC_IMM_0_out;
  wire [31:0] RegisterFile_0_r1;
  wire [31:0] RegisterFile_0_r2;
  wire        alu_0_flag;
  wire [31:0] alu_0_out;
  wire [3:0]  controlunit_0_alu_cont;
  wire        controlunit_0_alu_dm;
  wire [1:0]  controlunit_0_alu_pc_4;
  wire [1:0]  controlunit_0_dm_cont;
  wire [2:0]  controlunit_0_extend_cont_1;
  wire [2:0]  controlunit_0_extend_cont_2;
  wire [1:0]  controlunit_0_pcmux_cont;
  wire        controlunit_0_r2_im;
  wire        controlunit_0_w_en_dm;
  wire        controlunit_0_w_en_rf;
  wire [31:0] data_memory_1_out;
  wire [31:0] extend_1_0_out;
  wire [31:0] extend_2_0_out;
  wire [31:0] mux_2_1_0_out;
  wire [31:0] mux_2_1_1_out;
  wire [31:0] mux_2_1_2_out;
  wire [31:0] mux_4_1_0_out;
  wire [31:0] mux_4_1_1_out;

  InstructionMemory InstructionMemory_0
       (.CLK      (clk),
        .PC_IN    (PC_0_ADDR_OUT),
        .funct3   (InstructionMemory_0_funct3),
        .funct7   (InstructionMemory_0_funct7),
        .immediate(InstructionMemory_0_immediate),
        .opcode   (InstructionMemory_0_opcode),
        .rd       (InstructionMemory_0_rd),
        .rs1      (InstructionMemory_0_rs1),
        .rs2      (InstructionMemory_0_rs2));

  PC PC_0
       (.ADDR_IN  (mux_4_1_1_out),
        .ADDR_OUT (PC_0_ADDR_OUT),
        .clk      (clk),
        .rst      (rst));

  PC_4 PC_4_0
       (.out (PC_4_0_out),
        .pc  (PC_0_ADDR_OUT));

  PC_IMM PC_IMM_0
       (.imm (extend_1_0_out),
        .out (PC_IMM_0_out),
        .pc  (PC_0_ADDR_OUT));

  RegisterFile RegisterFile_0
       (.clk     (clk),
        .r1      (RegisterFile_0_r1),
        .r2      (RegisterFile_0_r2),
        .rd      (InstructionMemory_0_rd),
        .rs1     (InstructionMemory_0_rs1),
        .rs2     (InstructionMemory_0_rs2),
        .rst     (rst),
        .w_en_rf (controlunit_0_w_en_rf),
        .wd      (mux_4_1_0_out));

  alu alu_0
       (.alu_cont (controlunit_0_alu_cont),
        .flag     (alu_0_flag),
        .i0       (RegisterFile_0_r1),
        .i1       (mux_2_1_0_out),
        .out      (alu_0_out));

  controlunit controlunit_0
       (.alu_cont      (controlunit_0_alu_cont),
        .alu_dm        (controlunit_0_alu_dm),
        .alu_pc_4      (controlunit_0_alu_pc_4),
        .dm_cont       (controlunit_0_dm_cont),
        .extend_cont_1 (controlunit_0_extend_cont_1),
        .extend_cont_2 (controlunit_0_extend_cont_2),
        .funct3        (InstructionMemory_0_funct3),
        .funct7        (InstructionMemory_0_funct7),
        .opcode        (InstructionMemory_0_opcode),
        .pcmux_cont    (controlunit_0_pcmux_cont),
        .r2_im         (controlunit_0_r2_im),
        .w_en_dm       (controlunit_0_w_en_dm),
        .w_en_rf       (controlunit_0_w_en_rf));

  data_memory data_memory_1
       (.addr    (alu_0_out),
        .clk     (clk),
        .dm_cont (controlunit_0_dm_cont),
        .out     (data_memory_1_out),
        .w_en_dm (controlunit_0_w_en_dm),
        .wd      (RegisterFile_0_r2));

  extend_1 extend_1_0
       (.cont (controlunit_0_extend_cont_1),
        .in   (InstructionMemory_0_immediate),
        .out  (extend_1_0_out));

  extend_2 extend_2_0
       (.cont (controlunit_0_extend_cont_2),
        .in   (data_memory_1_out),
        .out  (extend_2_0_out));

  mux_2_1 mux_2_1_0
       (.i0  (RegisterFile_0_r2),
        .i1  (extend_1_0_out),
        .out (mux_2_1_0_out),
        .sel (controlunit_0_r2_im));

  mux_2_1 mux_2_1_1
       (.i0  (alu_0_out),
        .i1  (extend_2_0_out),
        .out (mux_2_1_1_out),
        .sel (controlunit_0_alu_dm));

  mux_2_1 mux_2_1_2
       (.i0  (PC_4_0_out),
        .i1  (PC_IMM_0_out),
        .out (mux_2_1_2_out),
        .sel (alu_0_flag));

  mux_4_1 mux_4_1_0
       (.i0  (mux_2_1_1_out),
        .i1  (PC_4_0_out),
        .i2  (PC_IMM_0_out),
        .i3  (extend_1_0_out),
        .out (mux_4_1_0_out),
        .sel (controlunit_0_alu_pc_4));

  mux_4_1 mux_4_1_1
       (.i0  (PC_4_0_out),
        .i1  (alu_0_out),
        .i2  (mux_2_1_2_out),
        .i3  (PC_IMM_0_out),
        .out (mux_4_1_1_out),
        .sel (controlunit_0_pcmux_cont));

endmodule