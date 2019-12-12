`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2019 15:36:03
// Design Name: 
// Module Name: atm_tb
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

module atm_tb;
wire out;
wire [2:0]state;
wire [2:0]count;
reg reset,clk,card_insert,language,type_of_account,enter_pin,enter_amount,wait_while,receive_amount;
atm  atm1(out,state,count,reset,clk,card_insert,language,type_of_account,enter_pin,enter_amount,wait_while,receive_amount);

initial
begin
clk=1'b1; reset=1'b0;
card_insert=1'b0;language=1'b0;type_of_account=1'b0;enter_pin=1'b0;enter_amount=1'b0;wait_while=1'b0;receive_amount=1'b0;
#50 card_insert=1'b1;language=1'b0;type_of_account=1'b0;enter_pin=1'b0;enter_amount=1'b0;wait_while=1'b0;receive_amount=1'b0;
#50 card_insert=1'b1;language=1'b1;type_of_account=1'b0;enter_pin=1'b0;enter_amount=1'b0;wait_while=1'b0;receive_amount=1'b0;
#50 card_insert=1'b1;language=1'b1;type_of_account=1'b1;enter_pin=1'b0;enter_amount=1'b0;wait_while=1'b0;receive_amount=1'b0;
#50 card_insert=1'b1;language=1'b1;type_of_account=1'b1;enter_pin=1'b1;enter_amount=1'b0;wait_while=1'b0;receive_amount=1'b0;
#50 card_insert=1'b1;language=1'b1;type_of_account=1'b1;enter_pin=1'b1;enter_amount=1'b1;wait_while=1'b0;receive_amount=1'b0;
#50 card_insert=1'b1;language=1'b1;type_of_account=1'b1;enter_pin=1'b1;enter_amount=1'b1;wait_while=1'b1;receive_amount=1'b0;
#50 card_insert=1'b1;language=1'b1;type_of_account=1'b1;enter_pin=1'b1;enter_amount=1'b1;wait_while=1'b1;receive_amount=1'b1;
end
always #10 reset=~reset;
always #10 clk=~clk;
endmodule
