`timescale 1ns/1ns

module tb_Counter;
	// virtual inputs
	reg clk, dir, reset;
	// virtual outputs
	wire [3:0] Q;
	
	// module under test
	Counter dut(clk, dir, reset, Q);
	
	// set delay to 2 time units to simulate one clock period
	// note that the clock changes state every 1 time unit, thus 2 time units equal one period.
	parameter simDelay = 2;
	
	initial begin
		// initial clk
		clk = 0;
		
		#simDelay dir = 0; reset = 0; $display("dir=%d, reset=%d | Q=%d", dir, reset, Q);
				
		#simDelay dir = 0; reset = 1; $display("dir=%d, reset=%d | Q=%d", dir, reset, Q);
		#simDelay dir = 0; reset = 1; $display("dir=%d, reset=%d | Q=%d", dir, reset, Q);
		#simDelay dir = 0; reset = 1; $display("dir=%d, reset=%d | Q=%d", dir, reset, Q);
		#simDelay dir = 0; reset = 1; $display("dir=%d, reset=%d | Q=%d", dir, reset, Q);
	   #simDelay dir = 0; reset = 1; $display("dir=%d, reset=%d | Q=%d", dir, reset, Q);
		#simDelay dir = 0; reset = 1; $display("dir=%d, reset=%d | Q=%d", dir, reset, Q);
		#simDelay dir = 0; reset = 1; $display("dir=%d, reset=%d | Q=%d", dir, reset, Q);
		#simDelay dir = 0; reset = 1; $display("dir=%d, reset=%d | Q=%d", dir, reset, Q);
		
		/* Expected output
		# dir=0, reset=0 | Q=15
		# dir=0, reset=1 | Q= 0
		# dir=0, reset=1 | Q= 1
		# dir=0, reset=1 | Q= 2
		# dir=0, reset=1 | Q= 3
		# dir=0, reset=1 | Q= 4
		# dir=0, reset=1 | Q= 5
		# dir=0, reset=1 | Q= 6
		# dir=0, reset=1 | Q= 7
		*/
	end
	
	always begin
		// clk is updated every 1 time unit, in this case clk will change state every 1 ns.
		#1 clk = ~clk;
	end
endmodule