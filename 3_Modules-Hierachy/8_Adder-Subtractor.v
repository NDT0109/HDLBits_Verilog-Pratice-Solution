module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire cout;
    wire [31:0] bsub;
    assign bsub = {32{sub}}^b;
    add16 a1(.a(a[15:0]), .b(bsub[15:0]), .cin(sub), .sum(sum[15:0]), .cout(cout));
    add16 a2(.a(a[31:16]), .b(bsub[31:16]), .cin(cout), .sum(sum[31:16]), .cout());
endmodule
