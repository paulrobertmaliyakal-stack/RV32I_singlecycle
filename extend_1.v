`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 10:58:23
// Design Name: 
// Module Name: extend_1
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


module extend_1(
    input [31:7] in,
    input [2:0] cont,
    output reg [31:0] out
    );
    always@(*)
    begin
        case(cont)
        0:out={{24{in[31]}},in[31:20]};
        1:out={{20{in[31]}},in[31:25],in[11:7]};
        2:out={{19{in[31]}},in[31],in[7],in[30:25],in[11:8],1'b0};
        3:out={in[31:12],12'b0};
        4:out={{11{in[31]}},in[31],in[19:12],in[20],in[30:21],1'b0};
        5:out={27'b0,in[24:20]};
        endcase
    end
endmodule
