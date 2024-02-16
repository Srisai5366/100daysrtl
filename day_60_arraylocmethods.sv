module eleloc;
 int arr[];
 int arr1[5];
 int val[$];
 initial begin
 arr = new[6];
 arr1='{1,2,3,3,4};
 foreach(arr[i])begin
 arr[i]=$urandom_range(10,50);
 end
 $display("The Required array is :%0p",arr);
 $display("---------------------------------------------");
 val=arr.find(x) with (x<25);
 $display("The value of given array is %0p",val);
 val=arr.find_first(x) with (x>10 && x<25);
 $display("The value of givne array find_first is %0p",val);
 val=arr.find_last(x) with (x>10 && x<25);
 $display("The value of the given array find_last is %0p",val);
 $display("The array after uniquem is %0p",arr1.unique());
 val=arr.min();
 $display("The min element in the array is %0p",val);
 val=arr.max();
 $display("The max element in the array is %0p",val);
 end
endmodule

module arrindxloc;
int arr[];
int arr1[6];
int val[$];
initial begin
arr=new[10];
arr1='{1,1,8,3,10,5};
foreach(arr[i])begin
arr[i]=$urandom_range(30,100);
end
$display("The required array is %0p",arr);
val=arr.find_index(x) with (x%2==0);
$display("The index of even values as per the expression is:%p",val);
val=arr.find_first_index with (item<50);
$display("The first_index of array values as per the expression is :%0p",val);
val=arr.find_last_index with (item<50);
$display("The last_index of array elememnts as per the expression is :%0p",val);
val=arr1.unique_index;
$display("The unique index elements in the array is %0p",val);
end
endmodule
