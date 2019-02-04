module TB
(
);
	reg [63:0] x;
	reg [63:0] y;
	reg sel;
	wire [63:0] z;

	MUX m1
	(
		.a(x),
		.b(y),
		.select(sel),
		.data(z)
	);
	
	initial
	begin
	x <= 64'b1000000000000000000000000000000000000000000000000000000000000000;
	y <= 64'b0100000000000000000000000000000000000000000000000000000000000000;
	sel <= 1'b0;

	#70 y[63] = 1'b1;
	#50 y[63] = 1'b0;
	end

	always
	#50 sel = ~sel;
	
	initial
	$monitor("Time = ", $time, "---> Output = %d", z);
endmodule