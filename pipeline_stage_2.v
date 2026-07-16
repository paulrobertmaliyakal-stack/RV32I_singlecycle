`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 18:56:01
// Design Name: 
// Module Name: pipeline_stage_2
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


module pipeline_stage_2(
input rst,
input clk,
input [31:0] alu_result,
input [31:0] rd2,
input [1:0] dm_cont,
input [2:0] extend_cont_2,
input w_en_rf,
input alu_dm,
input [1:0] alu_pc_4,
input w_en_dm,
input [31:0] pc_4,
input [31:0] pc_imm,
input [31:0] immediate,
input [4:0] rdm,
input [31:0] pc,

output reg [31:0] alu_result_out,
output reg [31:0] rd2_out,
output reg [1:0] dm_cont_out,
output reg [2:0] extend_cont_2_out,
output reg w_en_rf_out,
output reg alu_dm_out,
output reg [1:0] alu_pc_4_out,
output reg w_en_dm_out,
output reg [31:0] pc_4_out,
output reg [31:0] pc_imm_out,
output reg [31:0] immediate_out,
output reg [4:0] rdm_out,
output reg [31:0] pc_out
    );
    
    always @ (posedge clk) begin
    if(rst==1) begin 
    dm_cont_out<=0;
    w_en_rf_out<=0;
    rdm_out<=0;
    end 
    alu_result_out<=alu_result;
    rd2_out<=rd2;
    dm_cont_out<=dm_cont;
    extend_cont_2_out<=extend_cont_2;
    w_en_rf_out<=w_en_rf;
    alu_pc_4_out<=alu_pc_4;
    w_en_dm_out<=w_en_dm;
    alu_dm_out<=alu_dm;
    pc_4_out<=pc_4;
    pc_imm_out<=pc_imm;
    immediate_out<=immediate;
    rdm_out<=rdm;
    pc_out<=pc;
    end
endmodule
