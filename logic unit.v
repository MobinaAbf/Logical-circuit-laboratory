//logic unit
module mux4to1(s0,s1,i0,i1,i2,i3,f);
input s0,s1,i0,i1,i2,i3;
output f;
wire w0,w1,w2,w3,ns0,ns1;
not(ns0,s0);
not(ns1,s1);
and (w0,ns0,ns1,i0);
and (w1,ns0,s1,i1);
and (w2,s0,ns1,i2);
and (w3,s0,s1,i3);
or  (f,w0,w1,w2,w3);
endmodule

module mux4to18bit(s0,s1,i0,i1,i2,i3,f);
input s0,s1;
input [7:0]i0,i1,i2,i3;
output [7:0]f;
mux4to1 mux0(.s0(s0), .s1(s1), .i0(i0[0]), .i1(i1[0]), .i2(i2[0]), .i3(i3[0]), .f(f[0]));
mux4to1 mux1(.s0(s0), .s1(s1), .i0(i0[1]), .i1(i1[1]), .i2(i2[1]), .i3(i3[1]), .f(f[1]));
mux4to1 mux2(.s0(s0), .s1(s1), .i0(i0[2]), .i1(i1[2]), .i2(i2[2]), .i3(i3[2]), .f(f[2]));
mux4to1 mux3(.s0(s0), .s1(s1), .i0(i0[3]), .i1(i1[3]), .i2(i2[3]), .i3(i3[3]), .f(f[3]));
mux4to1 mux4(.s0(s0), .s1(s1), .i0(i0[4]), .i1(i1[4]), .i2(i2[4]), .i3(i3[4]), .f(f[4]));
mux4to1 mux5(.s0(s0), .s1(s1), .i0(i0[5]), .i1(i1[5]), .i2(i2[5]), .i3(i3[5]), .f(f[5]));
mux4to1 mux6(.s0(s0), .s1(s1), .i0(i0[6]), .i1(i1[6]), .i2(i2[6]), .i3(i3[6]), .f(f[6]));
mux4to1 mux7(.s0(s0), .s1(s1), .i0(i0[7]), .i1(i1[7]), .i2(i2[7]), .i3(i3[7]), .f(f[7]));
endmodule

module logicunit8bit(x,y,s0,s1,f);
input s0,s1;
input [7:0]x,y;
output[7:0]f;
wire [7:0]xandy,xory,xxory,xnot;
and (xandy[0], x[0], y[0]);
and (xandy[1], x[1], y[1]);
and (xandy[2], x[2], y[2]);
and (xandy[3], x[3], y[3]);
and (xandy[4], x[4], y[4]);
and (xandy[5], x[5], y[5]);
and (xandy[6], x[6], y[6]);
and (xandy[7], x[7], y[7]);

or (xory[0], x[0], y[0]);
or (xory[1], x[1], y[1]);
or (xory[2], x[2], y[2]);
or (xory[3], x[3], y[3]);
or (xory[4], x[4], y[4]);
or (xory[5], x[5], y[5]);
or (xory[6], x[6], y[6]);
or (xory[7], x[7], y[7]);
 
xor (xxory[0], x[0], y[0]);
xor (xxory[1], x[1], y[1]);
xor (xxory[2], x[2], y[2]);
xor (xxory[3], x[3], y[3]);
xor (xxory[4], x[4], y[4]);
xor (xxory[5], x[5], y[5]);
xor (xxory[6], x[6], y[6]);
xor (xxory[7], x[7], y[7]);

not(xnot[0], x[0]);
not(xnot[1], x[1]);
not(xnot[2], x[2]);
not(xnot[3], x[3]);
not(xnot[4], x[4]);
not(xnot[5], x[5]);
not(xnot[6], x[6]);
not(xnot[7], x[7]);

mux4to18bit mux4to1(.s0(s0), .s1(s1), .i0(xory), .i1(xandy), .i2(xxory), .i3(xnot), .f(f));
endmodule

module logicunit8bit_test;
reg sel0,sel1;
reg [7:0]a,b;
wire [7:0]f1;
logicunit8bit test(.s0(sel0), .s1(sel1), .x(a), .y(b), .f(f1));
initial begin
$monitor("x=%b , y=%b , s0=%b , s1=%b --> f=%b ",a,b,sel0,sel1,f1);
    a=8'b01101100; b=8'b00010111; sel1=1'b0; sel0=1'b0;
    #10
    a=8'b01101100; b=8'b00010111; sel1=1'b0; sel0=1'b1;
    #10
    a=8'b01101100; b=8'b00010111; sel1=1'b1; sel0=1'b0;
    #10
    a=8'b01101100; b=8'b00010111; sel1=1'b1; sel0=1'b1; 
  end
endmodule
