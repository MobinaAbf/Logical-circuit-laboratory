//shitRight
module mux4to1(sel1, sel0, i0, i1, i2, i3 , f);
  input sel1, sel0, i0, i1, i2, i3;
  output f;
  wire w1, w2, w3, w4, nsel1, nsel0;
  not(nsel1, sel1);
  not(nsel0, sel0);
  
  and(w1, nsel1, nsel0, i0);
  and(w2, nsel1, sel0, i1);
  and(w3, sel1, nsel0, i2);
  and(w4, sel1, sel0, i3);
  
  or(f, w1, w2, w3, w4);
  
endmodule

module mux4to1_8bit(sel1, sel0, i0, i1, i2, i3 , f);
  input sel1, sel0;
  input [7:0]i3, i2, i1, i0;
  output [7:0]f;

  mux4to1 mux1(.sel1(sel1), .sel0(sel0), .i0(i0[0]), .i1(i1[0]), .i2(i2[0]), .i3(i3[0]), .f(f[0]));
  mux4to1 mux2(.sel1(sel1), .sel0(sel0), .i0(i0[1]), .i1(i1[1]), .i2(i2[1]), .i3(i3[1]), .f(f[1]));
  mux4to1 mux3(.sel1(sel1), .sel0(sel0), .i0(i0[2]), .i1(i1[2]), .i2(i2[2]), .i3(i3[2]), .f(f[2]));
  mux4to1 mux4(.sel1(sel1), .sel0(sel0), .i0(i0[3]), .i1(i1[3]), .i2(i2[3]), .i3(i3[3]), .f(f[3]));
  mux4to1 mux5(.sel1(sel1), .sel0(sel0), .i0(i0[4]), .i1(i1[4]), .i2(i2[4]), .i3(i3[4]), .f(f[4]));
  mux4to1 mux6(.sel1(sel1), .sel0(sel0), .i0(i0[5]), .i1(i1[5]), .i2(i2[5]), .i3(i3[5]), .f(f[5]));
  mux4to1 mux7(.sel1(sel1), .sel0(sel0), .i0(i0[6]), .i1(i1[6]), .i2(i2[6]), .i3(i3[6]), .f(f[6]));
  mux4to1 mux8(.sel1(sel1), .sel0(sel0), .i0(i0[7]), .i1(i1[7]), .i2(i2[7]), .i3(i3[7]), .f(f[7]));
endmodule

module shiftright(sel0,sel1,cin,x,f,cout);
input sel0,sel1,cin;
input [7:0]x;
output cout;
output [7:0]f;
wire [7:0]w0,w1,w2,w3;

//logic
buf (w0[7],0);
buf (w0[6],x[7]);
buf (w0[5],x[6]);
buf (w0[4],x[5]);
buf (w0[3],x[4]);
buf (w0[2],x[3]);
buf (w0[1],x[2]);
buf (w0[0],x[1]);

//Rotate right
buf (w1[7],x[0]);
buf (w1[6],x[7]);
buf (w1[5],x[6]);
buf (w1[4],x[5]);
buf (w1[3],x[4]);
buf (w1[2],x[3]);
buf (w1[1],x[2]);
buf (w1[0],x[1]);

//Rotate with carry
buf (w2[7],cin);
buf (w2[6],x[7]);
buf (w2[5],x[6]);
buf (w2[4],x[5]);
buf (w2[3],x[4]);
buf (w2[2],x[3]);
buf (w2[1],x[2]);
buf (w2[0],x[1]);
buf (cout,x[0]);

//Arithmatic
buf (w3[7],x[7]);
buf (w3[6],x[7]);
buf (w3[5],x[6]);
buf (w3[4],x[5]);
buf (w3[3],x[4]);
buf (w3[2],x[3]);
buf (w3[1],x[2]);
buf (w3[0],x[1]);

mux4to1_8bit shift (.sel1(sel1), .sel0(sel0), .i0(w0), .i1(w1), .i2(w2), .i3(w3) , .f(f));
endmodule

module shiftright_test;
reg s0,s1,ci;
reg [7:0]a;
wire co;
wire [7:0]y;
shiftright test(.sel1(s1), .sel0(s0), .cin(ci), .cout(co), .x(a), .f(y));
initial begin 
a = 8'b10110101;
{s1,s0} = 2'b00;
ci = 1'b1;
$monitor("x = %b s1,s0 = %b,%b f = %b",a,s1,s0,y);
#50
{s1,s0} = 2'b01;
$monitor("x = %b s1,s0 = %b,%b f = %b",a,s1,s0,y);
#50
{s1,s0} = 2'b10;
$monitor("x = %b s1,s0 = %b,%b cin = %b cout = %b f = %b ",a,s1,s0,ci,co,y);
#50
{s1,s0} = 2'b11;
$monitor("x = %b s1,s0 = %b,%b f = %b",a,s1,s0,y);
end
endmodule
