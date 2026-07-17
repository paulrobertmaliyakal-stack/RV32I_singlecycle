`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 21:47:18
// Design Name: 
// Module Name: hazard_unit
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


module hazard_unit(
input [4:0] rs1e,
input [4:0] rs2e,
input [4:0] rdm,
input [4:0] rdwb,
input w_en_rf_m,
input w_en_rf_wb,
input [4:0] rs1d,
input [4:0] rs2d,
input [4:0] rde,
input alu_dm_e,
input w_en_rf_e,
input [1:0] pc_mux_cont,
input flag_e,

output reg [1:0] r1_mux,
output reg [1:0] r2_mux,
output reg en_f,
output reg en_d,
output reg flush_e,
output reg flush_d
    );
    initial begin
    en_f=0;
    en_d=0;
    flush_e=0;
    end
    always@(*) begin
    if(rs1e==rdm && w_en_rf_m==1 && rs1e!=0)r1_mux=1;
    else if(rs1e==rdwb && w_en_rf_wb==1 && rs1e!=0)r1_mux=2;
    else r1_mux=0;
    
    if(rs2e==rdm && w_en_rf_m==1 && rs2e!=0)r2_mux=1;
    else if(rs2e==rdwb && w_en_rf_wb==1 && rs2e!=0)r2_mux=2;
    else r2_mux=0;
    
    if(alu_dm_e==1 && w_en_rf_e==1 && (rs1d==rde || rs2d==rde)) begin
    flush_e=1;
    en_f=1;
    en_d=1;
    end
    else begin
    flush_e=0;
    en_f=0;
    en_d=0;
    end
    
    if((pc_mux_cont==2 && flag_e==1) || (pc_mux_cont==1) || (pc_mux_cont==2)) begin
    flush_d<=1;
    flush_e<=1;
    end
    else begin
    flush_d<=0;
    flush_e<=0;
    end
    end
endmodule
