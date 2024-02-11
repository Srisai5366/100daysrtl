module tb;
logic [7:0] arr[];
initial begin
arr=new[9];
for(int i=0;i<$size(arr);i++)begin
arr[i]=$urandom_range(1,20);
end
$display("array items in the given array:");
foreach(arr[i])begin
$display("arr[%0b]=%0d",i,arr[i]);
end
$display("The array is %0p",arr);
$display("The array index value interms of decimal:");
foreach(arr[i])begin
$display("index %0b --> %0d --> arr[%0b]=%0d",i,i,i,arr[i]);
end
end
endmodule
