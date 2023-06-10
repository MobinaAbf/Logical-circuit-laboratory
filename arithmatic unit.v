//arithmatic unit
module Mux4to1(sel0, sel1, i0, i1, i2, i3, f);

input sel0, sel1, i0, i1, i2, i3;
output f;
wire w0, w1, w2, w3, nsel1, nsel0;

not(nsel1, sel1);
not(nsel0, sel0);

and(w0, nsel1, nsel0, i0);
and(w1, nsel1, sel0, i1);
and(w2, sel1, nsel0, i2);
and(w3, sel1, sel0, i3);
or(f, w0, w1, w2, w3);

endmodule

module mux4to1x8(sel0, sel1, i0, i1, i2, i3, f);

input sel0, sel1;
input [7:0]i0, i1, i2, i3;
output [7:0]f;

Mux4to1 mux0(.sel0(sel0), .sel1(sel1), .i0(i0[0]), .i1(i1[0]), .i2(i2[0]), .i3(i3[0]), .f(f[0]));
Mux4to1 mux1(.sel0(sel0), .sel1(sel1), .i0(i0[1]), .i1(i1[1]), .i2(i2[1]), .i3(i3[1]), .f(f[1]));
Mux4to1 mux2(.sel0(sel0), .sel1(sel1), .i0(i0[2]), .i1(i1[2]), .i2(i2[2]), .i3(i3[2]), .f(f[2]));
Mux4to1 mux3(.sel0(sel0), .sel1(sel1), .i0(i0[3]), .i1(i1[3]), .i2(i2[3]), .i3(i3[3]), .f(f[3]));
Mux4to1 mux4(.sel0(sel0), .sel1(sel1), .i0(i0[4]), .i1(i1[4]), .i2(i2[4]), .i3(i3[4]), .f(f[4]));
Mux4to1 mux5(.sel0(sel0), .sel1(sel1), .i0(i0[5]), .i1(i1[5]), .i2(i2[5]), .i3(i3[5]), .f(f[5]));
Mux4to1 mux6(.sel0(sel0), .sel1(sel1), .i0(i0[6]), .i1(i1[6]), .i2(i2[6]), .i3(i3[6]), .f(f[6]));
Mux4to1 mux7(.sel0(sel0), .sel1(sel1), .i0(i0[7]), .i1(i1[7]), .i2(i2[7]), .i3(i3[7]), .f(f[7]));

endmodule

module fulladder(x, y, cin, cout, sum);

input x, y, cin;
output cout, sum;
wire w1, w2, w3;

xor(sum, x, y, cin);
and(w1, x, y);
and(w2, y, cin);
and(w3, x, cin);
or(cout, w1, w2, w3);

endmodule

module fulladderx8(x, y, cin, cout, sum);


input [7:0]x, y;
input cin;
output cout;
output [7:0]sum;
wire c0, c1, c2, c3, c4, c5, c6;

fulladder f0(.x(x[0]), .y(y[0]), .cin(cin), .cout(c0), .sum(sum[0]));
fulladder f1(.x(x[1]), .y(y[1]), .cin(c0), .cout(c1), .sum(sum[1]));
fulladder f2(.x(x[2]), .y(y[2]), .cin(c1), .cout(c2), .sum(sum[2]));
fulladder f3(.x(x[3]), .y(y[3]), .cin(c2), .cout(c3), .sum(sum[3]));
fulladder f4(.x(x[4]), .y(y[4]), .cin(c3), .cout(c4), .sum(sum[4]));
fulladder f5(.x(x[5]), .y(y[5]), .cin(c4), .cout(c5), .sum(sum[5]));
fulladder f6(.x(x[6]), .y(y[6]), .cin(c5), .cout(c6), .sum(sum[6]));
fulladder f7(.x(x[7]), .y(y[7]), .cin(c6), .cout(cout), .sum(sum[7]));

endmodule

module arithmatic_unit(sel0, sel1, x, y, cin, cout, f);

input [7:0]x, y;
input sel0, sel1, cin;
output [7:0]f;
output cout;
wire c0, c1, ncin, c2, c3;
wire [7:0]ny, s0, s1, s2, s3;

not(ncin, cin);
not(ny[0], y[0]);
not(ny[1], y[1]);
not(ny[2], y[2]);
not(ny[3], y[3]);
not(ny[4], y[4]);
not(ny[5], y[5]);
not(ny[6], y[6]);
not(ny[7], y[7]);

fulladderx8 f12(.x(x), .y(8'b00000000), .cin(cin), .cout(c0), .sum(s0));
fulladderx8 f34(.x(x), .y(y), .cin(cin), .cout(c1), .sum(s1));
fulladderx8 f56(.x(x), .y(ny), .cin(ncin), .cout(c2), .sum(s2));
fulladderx8 f78(.x(x), .y(8'b11111111), .cin(cin), .cout(c3), .sum(s3));

mux4to1x8 muxx8(.sel0(sel0), .sel1(sel1), .i0(s0), .i1(s1), .i2(s2), .i3(s3), .f(f));
Mux4to1 muxx1(.sel0(sel0), .sel1(sel1), .i0(c0), .i1(c1), .i2(c2), .i3(c3), .f(cout));

endmodule

module testArithmatic();
reg ci, s1, s0;
  reg [7:0] a,b;
  wire co;
  wire [7:0] f;
  
arithmatic_unit arth(.sel0(s0), .sel1(s1), .x(a), .y(b), .cin(ci), .cout(co), .f(f));


  initial begin
    $monitor("x=%d y=%d sel1 =%b sel0 =%b cin=%b==> f=%d  cout=%b " ,a,b, s1, s0, ci, f,co);
    a=8'b00100100; b=8'b00011000; {s1, s0, ci} = 3'b000; 
    #10
     {s1, s0, ci} = 3'b001;
    #10
     {s1, s0, ci} = 3'b010;
    #10
     {s1, s0, ci} = 3'b011;
    #10
    {s1, s0, ci} = 3'b100;
    #10
    {s1, s0, ci} = 3'b101;
    #10
     {s1, s0, ci} = 3'b110;
    #10
    {s1, s0, ci} = 3'b111;
 end
 endmodule
