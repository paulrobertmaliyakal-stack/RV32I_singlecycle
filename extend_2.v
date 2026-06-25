`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 10:58:23
// Design Name: 
// Module Name: extend_2
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


module extend_2(
    input [31:0] in,
    input [2:0] cont,
    output reg [31:0] out
    );
    always @(*)
    begin
        case(cont)
        0:out=in;
        1:out={{24{in[7]}},in[7:0]};
        2:out={{16{in[15]}},in[15:0]};
        3:out={24'b0,in[7:0]};
        4:out={16'b0,in[15:0]};
        endcase
    end
endmodule
