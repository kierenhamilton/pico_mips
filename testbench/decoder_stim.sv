module decoder_stim;

  timeunit 1ns; timeprecision 100ps;

  logic [31:0] random;
  logic [1:0] instruction;

  wire alu_flag;
  wire ram_flag;
  wire alu_ctrl;
  wire bran;
  wire nw;
  wire mult_flag;

  decoder decoder_dut (
      .instruction(instruction),
      .alu_flag(alu_flag),
      .ram_flag(ram_flag),
      .alu_ctrl(alu_ctrl),
      .bran(bran),
      .nw(nw),
      .mult_flag(mult_flag)
  );

  initial begin
    for (int i = 0; i < 1000; i++) begin

      random = $urandom(i);
      instruction = random[1:0];

      #50;
      unique case (instruction)
        00: if ({bran, alu_flag, mult_flag, ram_flag, alu_ctrl, nw} != 6'b001110) $display("fail");
        01: if ({bran, alu_flag, mult_flag, ram_flag, alu_ctrl, nw} != 6'b000000) $display("fail");
        10: if ({bran, alu_flag, mult_flag, ram_flag, alu_ctrl, nw} != 6'b010100) $display("fail");
        11: if ({bran, alu_flag, mult_flag, ram_flag, alu_ctrl, nw} != 6'b100001) $display("fail");
      endcase
      #50;
    end
    $finish;
  end
endmodule
