%%TLBO%%
function [bvf,bvx]=tlbo1(limit,x,parameter)
no_of_student = parameter(1);
no_of_iteration = parameter(2);
tf = parameter(3);
no_of_variable = parameter(4);
for i = 1:no_of_student
variable = x(i,:);%arrange variable row wise for 100 
[funxz]=fun(variable);
fxx(i,1)=funxz;%arrange columnwise function value
end
for ng1 = 1:no_of_iteration;
m = mean(x);%calculate mean of each design variable
[sfx,k0]=min(fxx);%getting the min function value
bt = x(k0,:);
for i = 1:no_of_student
k = 1;
for j = 1:no_of_variable
xs(i,j)=x(i,j)+rand *(bt(1,j)-tf*m(1,j));
if xs(i,j)<limit(k) || xs(i,j)>limit(k + 1)
x1(i,j)=x(i,j);
else
x1(i,j)=xs(i,j);
end
k = j + 2;
end
variable = x1(i,:);%best function variable
end
for i = 1:no_of_student
variable = x1(i,:);
[funxz]=fun(variable);
fxx1(i,1)=funxz;
end
for i = 1:no_of_student
if fxx1(i,1)>fxx(i,1)
fxx1(i,:)=fxx(i,:);
x1(i,:)=x(i,:);
end
end
[sfx1,k1]=min(fxx1);
bs = x1(k1,:);
for i = 1:no_of_student
k = 1;
for j = 1:no_of_variable
xs(i,j)=x1(i,j)+rand *(bs(1,j)-x1(i,j));
if xs(i,j)<limit(k) || xs(i,j)>limit(k + 1)
x(i,j)=x1(i,j);
else
x(i,j)=xs(i,j);
end
k = j + 2;
end
variable = x(i,:);
end
for i = 1:no_of_student
variable = x(i,:);
[funxz]=fun(variable);
fxx(i,1)=funxz;
end
for i = 1:no_of_student
if fxx(i,1)>fxx1(i,1)
fxx(i,:)=fxx1(i,:);
x(i,:)=x1(i,:);
end
end
end
[bvff,k2]=min(fxx);
bvf(1,:)=fxx(k2,:);
bvx = x(k2,:);