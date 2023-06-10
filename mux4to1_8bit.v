//mux4to1_8bit

module mux4to1(s0,s1,i0,i1,i2,i3,y);
input s0,s1,i0,i1,i2,i3;
output y;
wire ns0,ns1,w1,w2,w3w,w4;

not (ns0,s0);
not (ns1,s1);
and (w1,ns0,ns1,i0);
and (w2,ns0,s1,i1);
and (w3,s0,ns1,i2);
and (w4,s0,s1,i3);
or  (y,w1,w2,w3,w4);

endmodule
///////////////////////////////////////////////////

module mux4to1_8bit(s0,s1,i0,i1,i2,i3,y);
input  s0,s1;
input  [7:0]i0,i1,i2,i3;
output [7:0]y;

mux4to1 mux0 (.s0(s0), .s1(s1), .i0(i0[0]), .i1(i1[0]), .i2(i2[0]), .i3(i3[0]), .y(y[0]));
mux4to1 mux1 (.s0(s0), .s1(s1), .i0(i0[1]), .i1(i1[1]), .i2(i2[1]), .i3(i3[1]), .y(y[1]));
mux4to1 mux2 (.s0(s0), .s1(s1), .i0(i0[2]), .i1(i1[2]), .i2(i2[2]), .i3(i3[2]), .y(y[2]));
mux4to1 mux3 (.s0(s0), .s1(s1), .i0(i0[3]), .i1(i1[3]), .i2(i2[3]), .i3(i3[3]), .y(y[3]));
mux4to1 mux4 (.s0(s0), .s1(s1), .i0(i0[4]), .i1(i1[4]), .i2(i2[4]), .i3(i3[4]), .y(y[4]));
mux4to1 mux5 (.s0(s0), .s1(s1), .i0(i0[5]), .i1(i1[5]), .i2(i2[5]), .i3(i3[5]), .y(y[5]));
mux4to1 mux6 (.s0(s0), .s1(s1), .i0(i0[6]), .i1(i1[6]), .i2(i2[6]), .i3(i3[6]), .y(y[6]));
mux4to1 mux7 (.s0(s0), .s1(s1), .i0(i0[7]), .i1(i1[7]), .i2(i2[7]), .i3(i3[7]), .y(y[7]));

endmodule
/////////////////////////////////////////

module mux4to1_test;

reg sel0,sel1;
reg [7:0]a,b,c,d;
wire [7:0]f;

mux4to1_8bit test (.s0(sel0), .s1(sel1), .i0(a), .i1(b), .i2(c), .i3(d), .y(f));
initial begin
$monitor ("s0=%b , s1=%b : i0=%b , i1=%b, i2=%b, i3=%b --> y=%b", sel0,sel1,a,b,c,d,f);
 sel0=1'b0; sel1=1'b0; a=8'b10100100; b=8'b00001111; c=8'b00011101; d=8'b10011100;
 end
 endmodule
