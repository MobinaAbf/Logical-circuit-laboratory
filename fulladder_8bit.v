//fulladder8bit
module fulladder (x,y,cin,c,s);
input x,y,cin;
output c,s;
wire w1,w2,w3;
xor(s,x,y,cin);
and (w1,x,cin);
and (w2,y,cin);
and (w3,x,y);
or (c,w1,w2,w3);
endmodule

module fulladder_8bit(x,y,cin,c,s);
input cin;
input [7:0]x,y;
output c;
output [7:0]s;
wire [6:0]w;
fulladder test0 (.x(x[0]), .y(y[0]), .cin(cin), .c(w[0]), .s(s[0]));
fulladder test1 (.x(x[1]), .y(y[1]), .cin(w[0]), .c(w[1]), .s(s[1]));
fulladder test2 (.x(x[2]), .y(y[2]), .cin(w[1]), .c(w[2]), .s(s[2]));
fulladder test3 (.x(x[3]), .y(y[3]), .cin(w[2]), .c(w[3]), .s(s[3]));
fulladder test4 (.x(x[4]), .y(y[4]), .cin(w[3]), .c(w[4]), .s(s[4]));
fulladder test5 (.x(x[5]), .y(y[5]), .cin(w[4]), .c(w[5]), .s(s[5]));
fulladder test6 (.x(x[6]), .y(y[6]), .cin(w[5]), .c(w[6]), .s(s[6]));
fulladder test7 (.x(x[7]), .y(y[7]), .cin(w[6]), .c(c), .s(s[7]));
endmodule

module fulladder_8bittest;
reg cin1;
reg [7:0]a,b;
wire c1;
wire [7:0]s1;
fulladder_8bit test(.x(a), .y(b), .cin(cin1), .c(c1), .s(s1));
initial begin
$monitor("x=%d , y=%d , cin=%d : c=%d , s=%d",a,b,cin1,c1,s1);
    a = 8'b01101011; b = 8'b01011101; cin1 = 1'b0;
    #10
    a = 8'b10000000; b = 8'b00100001; cin1 = 1'b0;
    #10
    a = 8'b01000000; b = 8'b00010001; cin1 = 1'b1;
    end 
    endmodule
