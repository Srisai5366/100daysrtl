module arrordmet;
 int arr[];
 initial begin
 arr=new[10];
 foreach(arr[i])begin
 arr[i]=$urandom_range(10,30);
 end
 $display("The required array is %0p",arr);
 $display("--------------------------------");
 arr.shuff le();
 $display("Shuff le the elements in the array is %0p",arr);
 arr.sort();
 $display("sort the elements in the array in ascending order",arr);
 arr.rsort();
 $display("Sorting the elements in the array in descending order",arr);
 arr.reverse();
 $display("After Reverse the elements in the array is %0p",arr);
 $display("------------------------------------");
 end
endmodule
