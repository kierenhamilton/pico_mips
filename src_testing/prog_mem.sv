module prog_mem (
    input [4:0] address,
    output logic [12:0] Rdata
);

  timeunit 1ns; timeprecision 100ps;

  logic [12:0] mem[0:22];

  initial $readmemb("./include/prog.bin", mem);

  assign Rdata = mem[address];

endmodule
