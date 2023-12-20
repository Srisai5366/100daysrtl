module dla(input d,en, output q,qb);
assign q=en?d:q;
assign qb=~q;
endmodule


module tb;
reg d,en;
wire q,qb;
dla da(d,en,q,qb);
initial begin
en=0;
#10 en=1;d=0;
#10 d=1;
#10 en=0;
#50 $finish();
end
initial
$monitor($time,”en=%b,d=%b,q=%b,qb=%b”,en,d,q,qb);
endmodule
