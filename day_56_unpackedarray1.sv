module tb;
reg [2:0][7:0]arr[3];
initial begin
arr='{20,11,33};
$display("The size of the array is %0d",$size(arr));
foreach(arr[i])begin
$display("arr[%0b]=%0d",i,arr[i]);
end
$display("The array is: %0p",arr);
arr[0][1]=8'b01010011;
$display("arr[0] is %0b",arr[0]);
foreach(arr[i])begin
$display("arr[%0b]=%0d",i,arr[i]);
end
$display("The array is: %0p",arr);
end
endmodule
