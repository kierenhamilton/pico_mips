module ROM (
    output logic [7:0] Rdata,
    input [7:0] address
);

timeunit 1ns; timeprecision 100ps;

logic [7:0] mem [7:0];

initial $readmemh ("wave.hex", mem);

always_comb begin
  Rdata = mem[address];
end
endmodule
