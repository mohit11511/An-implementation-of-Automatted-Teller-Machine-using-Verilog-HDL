`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.08.2019 22:46:07
// Design Name: 
// Module Name: atm_1
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


module atm_1(
    input clk,
    input reset,
    input card_insert,
    input language,
    input type_of_account,
    input enter_pin,
    input enter_amount,
    input wait_while,
    input receive_amount,
    output reg out,
    output reg [2:0] state,
    output reg [2:0] count
    );
parameter [2:0]s0=3'b000;
parameter [2:0]s1=3'b001;
parameter [2:0]s2=3'b010;
parameter [2:0]s3=3'b011;
parameter [2:0]s4=3'b100;
parameter [2:0]s5=3'b101;
parameter [2:0]s6=3'b110;
parameter [2:0]s7=3'b111;

initial
begin
	state=3'b000;
	count=3'b000;
end

always @(state)
begin
	case(state)
	3'b000:
		begin
			if(card_insert==1'b1)
			begin
			state=3'b001;
			count=3'b001; //1
			end
			else
			state=3'b000;
			count=3'b000; //0
		end
	3'b001:
		begin
			if(language==1'b1)
			begin
			state=3'b010;
			count=3'b010; //2
			end
			else
			state=3'b001;
			count=3'b001; //1
		end
	3'b010:
		begin
			if(type_of_account==1'b1)
				begin
				state=3'b011;
				count=3'b011; //3
				end
			else
				state=3'b010;
				count=3'b010; //2
		end
	3'b011:
		begin
			if(enter_pin==1'b1)
				begin
				state=3'b100;
				count=3'b100; //4
				end
			else
				state=3'b011;
				count=3'b011; //3
		end
	3'b100:
		begin
			if(enter_amount==1'b1)
				begin
				state=3'b101;
				count=3'b101; //5
				end
			else
				state=3'b100;
				count=3'b100; //4
		end
	3'b101:
		begin
			if(wait_while==1'b1)
				begin
				state=3'b000;
				count=3'b110; //6
				end
			else
				state=3'b101;
				count=3'b101; //5
		end
	default:
		begin
			state=3'b000;
			count=3'b000; //0
		end
	endcase
end

always @(state)
begin
case(state)
3'b000: 
	begin 
		$display("Welcome to State Bank of India"); 
		$display("Please insert your card");                     
	end
3'b001:
	begin
		$display("Enter the Language: 1.English 2.Hindi");
	end
3'b010:
	begin
		$display("Choose type of account: 1.Saving 2.Current");
	end
3'b011:
	begin
		$display("Please enter your Pin");
	end
3'b100:
	begin
		$display("Enter the Amount");
	end
3'b101:
	begin
		$display("Wait! While transaction is in progress");
	end
endcase
end 

always @(posedge clk)
if(reset)
	begin
		if(count==3'b101)
		begin
		out=1'b1;
		end
		else
		out=1'b0;
	end
endmodule
