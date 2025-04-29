module mult_mux (
    input [2:0] prog_address,
    input [2:0] prog_address2,
    input mult_flag,
    output logic [2:0] address,
    output logic [2:0] address2
);

  timeunit 1ns; timeprecision 100ps;

  always_comb
    unique case (mult_flag)
    0:begin  address = prog_address;
             address2 = prog_address2; end
    1: begin address = 3'd2; address2 = prog_address; end
    endcase
endmodule
