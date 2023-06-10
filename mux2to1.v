//mux2to1

module mux2to1(i0,i1,s,y);

input i0,i1,s;
output y;
wire nots,w1,w2;

not (nots,s);
and (w1,i0,nots);
and (w2,i1,s);
or (y,w1,w2);

endmodule 

module test_mux;

reg a,b,sel;
wire f;

mux2to1 test(.i0(a), .i1(b), .s(sel), .y(f));

initial begin 
$monitor (" i0=%b , i1=%b ,s=%b --> y=%b ", a,b,sel,f);

    sel = 1'b0; a=1'b0; b=1'b0;
    #10
    sel = 1'b0; a=1'b1; b=1'b1;
    #10
    sel = 1'b0; a=1'b1; b=1'b0;
    #10
    sel = 1'b0; a=1'b1; b=1'b1;
    #10
    sel = 1'b1; a=1'b0; b=1'b0;
    #10
    sel = 1'b1; a=1'b0; b=1'b1;
    #10
    sel = 1'b1; a=1'b1; b=1'b0;
    #10
    sel = 1'b1; a=1'b1; b=1'b1;
    end 
    
    endmodule
