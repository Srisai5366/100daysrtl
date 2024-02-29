function int sumOfab(int a,int b);
  return a+b;
endfunction
module tb;
  int a,b;
  initial begin
    repeat(5)begin
      a=$urandom_range(3,10);
      b=$urandom_range(5,10);
      $display("The sum of a=%0d,b=%0d is %0d",a,b,sumOfab(a,b));
    end
  end
endmodule


function automatic int factOfNum(int num);
  if(num<=0)
    return 1;
  return num*factOfNum(num-1);
endfunction
module factval;
  int fact;
  int num;
  initial begin
    repeat(5)begin
      num=$urandom_range(5,10);
      fact=factOfNum(num);
      $display("The factorial of num:%0d is %0d",num,fact);
    end
  end
endmodule
