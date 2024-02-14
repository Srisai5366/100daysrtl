module quemeth;
 int queue[$];
 int n,v;
 int popf,popb;
 initial begin
 n=$urandom_range(10,20);
 repeat(n)begin
 v=$urandom_range(30,100);
 queue.push_back(v);
 end
 $display("The required queue is %0p",queue);
 $display("The size of the queue is :%0d",queue.size());
 queue.insert(5,111);//insert an item at particular index
 $display("After the insert an item queue is %0p",queue);
 queue.delete(3);//delete an item at specified index
 $display("After the deleting element then queue is %0p",queue);
 queue.push_front(101);//insert an item at the front of the queue
 $display("After the push_front an item then queue is %0p",queue);
 queue.push_back(108);//insert an item at the back of queue
 $display("After the push_back an item then queue is %0p",queue);
 popf=queue.pop_front();//removes and returns the first element of the queue
 $display("After the pop_front an item then queue popf=%0d",popf);
 popb=queue.pop_back();//removes and returns the last element of the queue
 $display("After the pop_back an item then queue popb=%0d",popb);
 queue.shuffle();//shuffle the elements of queue
 $display("After the shuffle the elements then queue is %0p",queue);
 queue.delete();//delete all the items in the queue
 $display("After the deleting the queue is %0p",queue);
 end
endmodule
