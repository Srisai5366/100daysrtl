module array;
 int arr[10];
 initial begin
 arr='{10,20,12,23,16,17,11,27,13,7};
 $display("Size of the given array is:%0d",$size(arr));
 $display("The given array is %0p",arr);
 $display("elements in the given array:");
 foreach(arr[i])begin
 $display("arr[%0d]=%0d",i,arr[i]);
 end
 end
endmodule

module evenOddarryele;
int arr[10];
initial begin
$display("Assigning the values given array:");
foreach(arr[i])begin
arr[i]=$urandom_range(10,50);
$display("arr[%0d]=%0d",i,arr[i]);
end
$display("Required array after assigning value is %0p",arr);
$display("------------------------");
foreach(arr[i])begin
if(arr[i]%2==0)
$display("even item:arr[%0d]=%0d",i,arr[i]);
else
$display("odd item:arr[%0d]=%0d",i,arr[i]);
end
end
endmodule
