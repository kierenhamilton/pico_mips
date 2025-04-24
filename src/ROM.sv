module ROM (
    output logic [7:0] Rdata,
    input [7:0] address
);

  timeunit 1ns; timeprecision 100ps;

  logic [7:0] mem[255:0];

  initial $readmemh("wave.hex", mem);

  assign Rdata = mem[address];

endmodule
