% a)
n=randi([10,20],1,1);
a=randi([-10,10],1,n)
odd_sum=sum(a(1:2:end))

% b)
b=a(a~=0)
mean_b=mean(b)