// clk : clk input
// dir : count direction, 0: up, 1:down
// reset : active low
// Q : count output
module Counter(clk, dir, reset, Q);
	input clk, dir, reset;
	output reg [3:0] Q = 0;
	
	always @(posedge clk, negedge reset) begin
		if (reset == 0)
			Q <= 0;
		else begin
			if (dir == 0)
				Q <= Q + 1;
			else 
				Q <= Q - 1;
		end
	end
endmodule