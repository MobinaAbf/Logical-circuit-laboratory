//mux4to1
module mux4to1 (s0,s1,i0,i1,i2,i3,y);
input s0,s1,i0,i1,i2,i3;
output y;
wire ns0,ns1,w1,w2,w3w,w4;

not (ns0,s0);
not (ns1,s1);
and (w1,ns0,ns1,i0);
and (w2,ns0,s1,i1);
and (w3,s0,ns1,i2);
and (w4,s0,s1,i3);
or (y,w1,w2,w3,w4);

endmodule

module test_mux4to1;
reg sel0,sel1,a,b,c,d;
wire f;
mux4to1 test (.s0(sel0), .s1(sel1), .i0(a), .i1(b), .i2(c), .i3(d));
initial begin 
$monitor ("s0=%b , s1=%b : i0=%b ,i1=%b ,i2=%b ,i3=%b", sel0,sel1,a,b,c,d);
    sel0=1'b0; sel1=1'b0; a=1'b1; b=1'b0; c=1'b0; d=1'b0;
    #10
    sel0=1'b0; sel1=1'b1; a=1'b0; b=1'b1; c=1'b0; d=1'b0;
    #10
    sel0=1'b1; sel1=1'b0; a=1'b0; b=1'b0; c=1'b1; d=1'b0;
    #10
    sel0=1'b1; sel1=1'b1; a=1'b0; b=1'b0; c=1'b0; d=1'b1;
    #10
    sel0=1'b0; sel1=1'b0; a=1'b0; b=1'b1; c=1'b1; d=1'b1;
    #10
    sel0=1'b0; sel1=1'b1; a=1'b1; b=1'b0; c=1'b1; d=1'b1;
    #10
    sel0=1'b1; sel1=1'b0; a=1'b1; b=1'b1; c=1'b0; d=1'b1;
    #10
    sel0=1'b1; sel1=1'b1; a=1'b1; b=1'b1; c=1'b1; d=1'b0;
    end 
    endmodule
