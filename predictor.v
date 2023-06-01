module predictor(input wire request, result, clk, taken, output reg prediction);

reg [1:0] state = 2'b00;
always @(posedge clk) begin
	if (result)
	begin
	switch(state):
	case 2'b00:
	begin
	if (taken)
	state = 2'b01;
	else
	state = 2'b00;
	end
	case 2'b01:
	begin
	if (taken)
	state = 2'b10;
	else
	state = 2'b00;
	end
	case 2'b10:
	begin
	if (taken)
	state = 2'b11;
	else
	state = 2'b01;
	case 2'b11:
	begin
	if (taken)
	state = 2'b11;
	else 
	state = 2'b10;
	end
	default: state = 2'b00;
end
	if (request)
	begin
	prediction = state[1];
	end
	
end		

endmodule