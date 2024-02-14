module quebounded;
 int n;
 int queue[$:10];//bounded queue 0->10(11 elements)
 initial begin
 repeat(11)begin
 n=$urandom_range(10,200);
 queue.push_back(n);
 end
 $display("The required bounded queue after assigning is :%0p",queue);
 $display("The elements of the bounded queue is:");
 foreach(queue[i])begin
 $display("queue[%0d]=%0d",i,queue[i]);
 end
 $display("The size of the bounded queue is %0d",queue.size());
 end
endmodule 
