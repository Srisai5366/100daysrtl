task sum(input int a,b,output int c,res);
c=a+b;
#10;
res=1;
endtask
module tb;
int a,b;
int x;
int res;
initial begin
repeat(5)begin
a=$urandom_range(10,20);
b=$urandom_range(5,10);
sum(a,b,x,res);
if(res)
$display("it value of x=%0d at %0t",x,$time);
end
end
endmodule
