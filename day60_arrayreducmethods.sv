module arrredmet;
int arr[];
initial begin
arr = new[10];
foreach(arr[i])begin
arr[i]=$urandom_range(10,50);
end
$display("The array is %0p",arr);
$display("The and operation of the given array is %0d",arr.and());
$display("The or operation of the given array is %0d",arr.or());
$display("The xor operation of the given array is %0d",arr.xor());
$display("The sum of the elements in the given array is %0d",arr.sum());
$display("The produxt fo the elements in the given array is %0d",arr.product());
end
endmodule
