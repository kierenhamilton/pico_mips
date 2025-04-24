module alu_mux (
    input [7:0] prog_value,
    input [7:0] Rdata_rom,
    input [7:0] Rdata1_ram,
    input [7:0] Rdata2_ram,
    input alu_flag,

    output logic [7:0] out1,
    output logic [7:0] out2
);
  timeunit 1ns; timeprecision 100ps;

  always_comb
    unique case (alu_flag)
      0: begin
        out1 = Rdata_rom;
        out2 = prog_value;
      end
      1: begin
        out1 = Rdata1_ram;
        out2 = Rdata2_ram;
      end
    endcase

endmodule

