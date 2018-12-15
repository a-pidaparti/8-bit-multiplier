`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2018 03:02:27 PM
// Design Name: 
// Module Name: CombLogic1
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


module CombLogic1(
    input [7:0] Mcand,
    input [7:0] Mplier,
    input load,
    output reg [15:0] product,
    output done,
    input clock,
    output reg [16:0] ACC,  //would not be included in final version
    output reg [1:0] state //would not be included in final version
    );
    reg [2:0] counter;
    reg done;
//    reg [1:0] state;  //would not be commented in final version
//    reg [16:0] ACC;
    initial 
    begin
        ACC <= 17'b00000000000000000;
        state <= 0;
        counter <= 0;
    end

    always@(posedge clock) 
    begin      
        case(state)
            0: begin
                state = Mcand[0] + 1;
                if(load)
                begin
                    state <= 0;
                    ACC <= 0;
                    counter <= 0;
                end
                end
            1: begin
                ACC <= {0, ACC[16:1]};
                counter <= counter + 1;
                if(counter == 7)
                begin
                    state <= 3;
                    ACC <= {1'b0, ACC[16:1]};
 
                end
                else
                begin
                    state <= Mcand[counter + 1] + 1;

                end
                if(load)
                begin
                    state <= 0;
                    ACC <= 0;
                    counter <= 0;
                end
            end
            2: begin
                ACC = {ACC[16:8] + {0, Mplier}, ACC[7:0]};
                ACC = {0, ACC[16:1]};
                counter <= counter + 1;
                if(counter == 7)
                begin
                    state <= 3;
                   ACC <= {1'b0, ACC[16:1]};
                 
                end
                else
                begin
                    state = Mcand[counter + 1] + 1;
                end
                if(load)
                begin
                    state <= 0;
                    ACC <= 0;
                    counter <= 0;
                end                
            end
            3: begin
                done <= 1;

                product <= ACC[15:0];
            end
                
            
                
        endcase
    end //always
    
//    always   //if load is pressed, the state, product, and counter are reset
//    begin
//        if(load)
//        begin
//            state <= 0;
//            counter <= 0;
//        end
//    end
            
endmodule
