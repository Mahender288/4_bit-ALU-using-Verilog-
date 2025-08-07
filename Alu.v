## Features

- Operations: ADD, SUB, MUL, DIV, AND, OR, NAND, NOR
- Testbench included
- Supports waveform generation with EPWave (VCD dump)


module Alu (
  input [3:0] A,
  input [3:0] B,
  input [2:0] Alu_sel,
  output [3:0] Alu_out,
  output carry
);

  reg [3:0] Alu_Result;      // Corrected variable name
  wire [4:0] temp;

  assign Alu_out = Alu_Result;
  assign temp = {1'b0, A} + {1'b0, B};  // Used only for carry detection
  assign carry = temp[4];

  always @(*) begin
    case (Alu_sel)
      3'b000: Alu_Result = A + B;
      3'b001: Alu_Result = A - B;
      3'b010: Alu_Result = A * B;
      3'b011: Alu_Result = (B != 0) ? A / B : 4'b0000; // Division with zero protection
      3'b100: Alu_Result = A & B;
      3'b101: Alu_Result = A | B;
      3'b110: Alu_Result = ~(A & B);
      3'b111: Alu_Result = ~(A | B);
      default: Alu_Result = 4'b0000;
    endcase
  end

endmodule
