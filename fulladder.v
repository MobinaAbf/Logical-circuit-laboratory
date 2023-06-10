//fulladder 
module fulladder(x,y,cin,c,s);
input x,y,cin;
output c,s;
wire w1,w2,w3;
xor (s,x,y,cin);
and (w1,y,cin);
and (w2,x,cin);
and (w3,x,y);
or(c,w1,w2,w3);
endmodule

module fulladder_test;
reg a,b,cin1;
wire c1,s1;
fulladder test(.x(a), .y(b), .cin(cin1), .c(c1), .s(s1));
initial begin 
$monitor("x=%b , y=%b , cin=%b : c=%b , s=%b",a,b,cin1,c1,s1);
a=1'b0;b=1'b0;cin1=1'b0;
#15
a=1'b0;b=1'b0;cin1=1'b1;
#15
a=1'b0;b=1'b1;cin1=1'b0;
#15
a=1'b0;b=1'b1;cin1=1'b1;
#15
a=1'b1;b=1'b0;cin1=1'b0;
#15
a=1'b1;b=1'b0;cin1=1'b1;
#15
a=1'b1;b=1'b1;cin1=1'b0;
#15
a=1'b1;b=1'b1;cin1=1'b1;
end 
endmodule
