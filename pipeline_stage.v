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
input alu_count,
input dm_cont,
input extend_cont_1,
input extend_cont_2,
input w_en_rf,
input r2_imm,
input w_en_dm,
input alu_dm,
input [1:0] alu_pc_4,
input [1:0] pcmux_cont,

output alu_count_out,
output dm_cont_out,
output extend_cont_1_out,
output extend_cont_2_out,
output w_en_rf_out,
output r2_imm_out,
output w_en_dm_out,
output alu_dm_out,
output [1:0] alu_pc_4_out,
output [1:0] pcmux_cont_out

    );
 
endmodule
