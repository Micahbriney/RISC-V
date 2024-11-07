`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Micah Briney
// 
// Create Date: 02/03/2020 01:00:28 AM
// Design Name: 
// Module Name: Branch_Adder_Gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
//    Immed_Gen #(.n(32)) MY_IG(
//        .ir     (),
//        .u_type (),
//        .i_type (),
//        .s_type (),
//        .b_type (),
//        .j_type ()
//    );
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Immed_Gen(
    ir,
    u_type,
    i_type,
    s_type,
    b_type,
    j_type
    );
    
    parameter n = 32;
    
    input  [n-1:0] ir;
    output [n-1:0] u_type;
    output [n-1:0] i_type;
    output [n-1:0] s_type;
    output [n-1:0] b_type;
    output [n-1:0] j_type;
    
    assign u_type = (ir) ? { ir[31:12],   12'b0} : 1'b1;
    assign i_type = { {21{ir[31]}}, ir[30:25], ir[24:20]};
    assign s_type = { {21{ir[31]}}, ir[30:25], ir[11:7] };
    assign b_type = { {21{ir[31]}}, ir[7],     ir[30:25], ir[11:8],  1'b0};
    assign j_type = { {12{ir[31]}}, ir[19:12], ir[20],    ir[30:21], 1'b0};
    
endmodule
