//Blocking assignments 
module swap;
reg [3:0] a,b;
reg [3:0] temp;
initial begin
a=10;b=11;
$display("____USING BLOCKING SWAP THE NUMBERS_____");
#10;
temp=b;
b=a;
a=temp;
#20 $finish();
end
initial
$monitor($time," values of a=%d,b=%d",a,b);
endmodule


//non blocking assignments 
module swap;
reg [3:0]a,b;
initial begin
$display("________USING NON BLOCKING SWAP A NUMBERS______");
a=11;b=10;
#10;
a<=b;
b<=a;
#20 $finish();
end
initial
$monitor($time,"values of a=%d,b=%d",a,b);
