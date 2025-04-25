module prog_mem (
    input [4:0] address,
    output logic [12:0] Rdata
);

  logic [12:0] mem[0:12];

  initial $readmemb("prog.bin", mem);

  assign Rdata = mem[address];

endmodule
