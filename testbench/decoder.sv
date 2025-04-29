module decoder (
    input [1:0] instruction,
    output logic alu_flag,
    output logic ram_flag,
    output logic alu_ctrl,
    output logic bran,
    output logic nw,
    output logic mult_flag
);

  timeunit 1ns; timeprecision 100ps;

  always_comb begin
    alu_flag = 0;
    ram_flag = 0;
    alu_ctrl = 0;
    nw = 0;
    bran = 0;
    mult_flag = 0;
    unique case (instruction)
      0: begin  // ADD
        ram_flag = 1;
        alu_flag = 1;
        alu_ctrl = 1;
      end
      1: begin  // IMM
      end
      2: begin  // MULT
        ram_flag = 1;
        mult_flag = 1;
        alu_flag = 0;
      end
      3: begin  // BRAN
        nw = 1;
        bran = 1;
      end
    endcase
  end

endmodule
