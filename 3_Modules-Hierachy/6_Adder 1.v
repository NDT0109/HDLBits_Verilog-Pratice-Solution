module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout;
    add16 add1(.a(a[15:0]),.b(b[15:0]),.cin(0),.cout(cout),.sum(sum[15:0]));
    add16 add2(.a(a[31:16]),.b(b[31:16]),.cin(cout),.cout(0),.sum(sum[31:16]));  
endmodule