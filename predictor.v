module predictor(input wire request, result, clk, taken, output reg prediction);

reg [1:0] state = 2'b11;
always @(posedge clk) begin
  if (result)
  begin
    if (state == 2'b00)
    begin
      if (taken)
      state <= 2'b01;
      else
      state <= 2'b00;
    end
    if (state == 2'b01)
    begin
      if (taken)
      state <= 2'b10;
      else
      state <= 2'b00;
    end
    if (state == 2'b10)
    begin
      if (taken)
      state <= 2'b11;
      else
      state <= 2'b01;
    end
    if (state == 2'b11)
    begin
      if (taken)
      state <= 2'b11;
      else 
      state <= 2'b10;
    end
  end
  if (request)
    prediction <= state[1];
  
end    

endmodule