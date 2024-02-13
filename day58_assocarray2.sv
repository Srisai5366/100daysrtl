module tb;
 int arr[string];
 string str;
 initial begin
 arr='{"K0":1,"K1":2,"K2":3,"K3":4,"K4":5};
 $display("The size of the array is %0d",$size(arr));
 foreach(arr[i])begin
 $display("arr[%0s]=%0d",i,arr[i]);
 end
 $display("The number of the elements in the array is %0d",arr.num());
 $display("------------------------------------------");
 arr.delete("K2");
 $display("After delete specified index array is %0p",arr);
 $display("-------------------------------------------");
 str="K1";
 $display("The element is present for given index is %0d",arr.exists("K3"));
 $display("-------------------------------------------");
 $display("the first element of the given index %0s is %0d",str,arr.first(str));
 $display("-------------------------------------------");
 $display("The last element of the given index %0s is %0d",str,arr.last(str));
 $display("-------------------------------------------");
 $display("The previous element of the given index %0s is %0d",str,arr.prev(str));
 $display("------------------------------------------");
 $display("The next element of the given index %0s is %0d",str,arr.next(str));
 end
endmodule
