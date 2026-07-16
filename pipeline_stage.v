`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2026 21:46:08
// Design Name: 
// Module Name: pipeline_stage
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


module pipeline_stage(
input clk,
input [3:0] alu_count,
input [1:0] dm_cont,
input [2:0] extend_cont_2,
input w_en_rf,
input r2_imm,
input w_en_dm,
input alu_dm,
input [1:0] alu_pc_4,
input [1:0] pcmux_cont,
input [31:0] immediate,
input [31:0] r1,
input [31:0] r2,
input [4:0] rde,
input [31:0] pc,
input [31:0] pc_4,
input [4:0] rs1_addr,
input [4:0] rs2_addr,
input flush,

output reg [3:0] alu_count_out,
output reg [1:0] dm_cont_out,
output reg [2:0] extend_cont_2_out,
output reg w_en_rf_out,
output reg r2_imm_out,
output reg w_en_dm_out,
output reg alu_dm_out,
output reg [1:0] alu_pc_4_out,
output reg [1:0] pcmux_cont_out,
output reg [31:0] immediate_out,
output reg [31:0] r1_out,
output reg [31:0] r2_out,
output reg [4:0] rde_out,
output reg [31:0] pc_out,
output reg [31:0] pc_4_out,
output reg [4:0] rs1_addr_out,
output reg [4:0] rs2_addr_out
    );
 always @(posedge clk) begin 
 if(flush==1) begin
 alu_count_out<=0;
 dm_cont_out<=0;
 extend_cont_2_out<=0;
 w_en_rf_out<=0;
 w_en_dm_out<=0;
 pcmux_cont_out<=0;
 rde_out<=0;
 pc_out<=1;
 end
 else begin
 alu_count_out<=alu_count;
 dm_cont_out<=dm_cont;
 extend_cont_2_out<=extend_cont_2;
 w_en_rf_out<=w_en_rf;
 r2_imm_out<=r2_imm;
 w_en_dm_out<=w_en_dm;
 alu_dm_out<=alu_dm;
 alu_pc_4_out<=alu_pc_4;
 pcmux_cont_out<=pcmux_cont;
 immediate_out<=immediate;
 r1_out<=r1;
 r2_out<=r2;
 rde_out<=rde;
 pc_out<=pc;
 pc_4_out<=pc_4;
 rs1_addr_out<=rs1_addr;
 rs2_addr_out<=rs2_addr;

 end
 end
endmodule
