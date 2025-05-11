module VariableClock(clk, clkOut, prescaler);
	input clk;
	
	output reg clkOut = 0;
	
	input [15:0] prescaler;
	reg [15:0] count = 0;
	
	always @(posedge clk) begin
		count <= count + 1;
		
		if (count >= prescaler) begin
			count <= 0;
			clkOut <= ~clkOut;
		end
	end
endmodule