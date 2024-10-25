module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cin,cout_a0,cin1,cin2;
    wire [15:0] sum_a0,sum_a1,sum_a2;
    assign cin1=0;
    assign cin2=1;
    add16 a0(.a(a[15:0]),.b(b[15:0]),.cin(cin),.sum(sum_a0[15:0]),.cout(cout_a0));
    add16 a1(.a(a[31:16]),.b(b[31:16]),.cin(cin1),.sum(sum_a1[15:0]),.cout());
    add16 a2(.a(a[31:16]),.b(b[31:16]),.cin(cin2),.sum(sum_a2[15:0]),.cout());
    always @* begin
        case(cout_a0)
                 1'b0: sum = {sum_a1,sum_a0};
                 1'b1: sum = {sum_a2,sum_a0};
                 default: sum = {sum_a1,sum_a0};
    endcase
    end
endmodule
