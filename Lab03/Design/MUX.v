module MUX
(
	input [63:0] a,
	input [63:0] b,
	input select,
	output reg [63:0] data
);
	always @ (a or b or select)
		begin
			case({select})
				1'b1: data <= b;
				1'b0: data <= a;
			endcase
		end
endmodule