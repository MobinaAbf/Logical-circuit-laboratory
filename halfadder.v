//halfadder
module halfadder(x,y,c,s);
input x,y;
output c,s;
xor (s,x,y);
and (c,x,y);
endmodule

module halfadder_test;
reg a,b;
wire c1,s1;
halfadder test(.x(a), .y(b), .c(c1), .s(s1));
initial begin 
$monitor("x=%b , y=%b : c=%b , s=%b", a,b,c1,s1);
a=1'b0;b=1'b0;
#13
a=1'b0;b=1'b1;
#13
a=1'b1;b=1'b0;
#13
a=1'b1;b=1'b1;
end
endmodule
