`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2018 03:03:44 PM
// Design Name: 
// Module Name: testbench
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


module testbench(

    );
    reg [7:0] Mplier;
    reg [7:0] Mcand;
    reg load;
    wire [15:0] product;
    wire done;
    reg clock;
    wire [16:0] ACC;
    wire [1:0] state;
    
    
    CombLogic1 instance1(
        .Mplier(Mplier),
        .Mcand(Mcand),
        .load(load),
        .product(product),
        .done(done),
        .clock(clock),
        .ACC(ACC),
        .state(state));
    
    
    initial
    begin
        Mplier <= 8'b10101110;
        Mcand <= 8'b00000001;
        clock = 0;
    end
    
    always #20 clock = ~clock;
endmodule
