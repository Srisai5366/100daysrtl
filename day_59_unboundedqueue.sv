module unboundedque;
 int queue[$];
 initial begin
 queue='{1,20,23,13,14};
 $display("The size of the queue is %0d",queue.size());
 $display("The elements of the queue is:");
 foreach(queue[i])begin
 $display("queue[%0d]=%0d ",i,queue[i]);
 end
 $display("The queue is %0p",queue);
 end
endmodule
