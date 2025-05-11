module Top(clk, dir, reset, Q, prescaler);
	input clk, dir, reset;
	output [3:0] Q;
	
	wire clkOut_w;
	input [7:0] prescaler;
	
	// set a predefined prescaler on the lower 8 bits (so that DESim will not freeze for high frequencies)
	reg [7:0] scaler_L8 = 8'd255;
	
	VariableClock cv1(.clk(clk), .clkOut(clkOut_w), .prescaler({prescaler,scaler_L8}));
	Counter c1(.clk(clkOut_w), .dir(dir), .reset(reset), .Q(Q));
endmodule