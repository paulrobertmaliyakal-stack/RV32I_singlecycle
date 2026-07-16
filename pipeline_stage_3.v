`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 19:27:24
// Design Name: 
// Module Name: pipeline_stage_3
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


module pipeline_stage_3(
input rst,
input clk,
input [31:0] alu_result,
input [31:0] dm_read,
input w_en_rf,
input [1:0] alu_pc_4,
input alu_dm,
input [31:0] pc_4,
input [31:0] pc_imm,
input [31:0] immediate,
input [4:0] rdwb,
input [31:0] pc,

output reg [31:0] alu_result_out,
output reg [31:0] dm_read_out,
output reg w_en_rf_out,
output reg [1:0] alu_pc_4_out,
output reg alu_dm_out,
output reg [31:0] pc_4_out,
output reg [31:0] pc_imm_out,
output reg [31:0] immediate_out,
output reg [4:0] rdwb_out,
output reg [31:0] pc_out
    );
    always @(posedge clk) begin  
    if(rst==1) begin
    w_en_rf_out<=0;
    rdwb_out<=0;
    end
    else begin
    alu_result_out<=alu_result;
    dm_read_out<=dm_read;
    w_en_rf_out<=w_en_rf;
    alu_pc_4_out<=alu_pc_4;
    alu_dm_out<=alu_dm;
    pc_4_out<=pc_4;
    pc_imm_out<=pc_imm;
    immediate_out<=immediate_out;
    rdwb_out<=rdwb;
    pc_out<=pc;
    end
    end
endmodule
