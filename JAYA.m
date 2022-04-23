%% MATLAB CODE FOR JAYA ALGORITHM%%
% function Jaya()
clc;
clear all;
RUNS=10;%number of generation
runs=0;
while(runs<RUNS)
pop=10; % population size
var=8; % no. of design variables
maxFes=100;
maxGen=floor(maxFes/pop);
mini=[0.5 5 1 1 1 1 1 1];
maxi=[1050 181 35 3 20 2 99 100];
[row,var]=size(mini);
x=zeros(pop,var);
for i=1:var
x(:,i)=mini(i)+(maxi(i)-mini(i))*rand(pop,1);
end
for m = 1:pop
h =x(m,:);%arrange variable row wise for number of population
%fxx(m,1)= 28.61-0.0249.*h(1)-41.98.*h(2)-12.86.*h(3)+0.000006.*h(1).^2+65.97.*h(2).^2+2.328.*h(3).^2+0.033.*(h(1).*h(2))+0.0035.*(h(1).*h(3));
%fxx(m,1)= -0.0292+0.000084.*h(1)-0.000186.*h(2) + 0.003501.*h(3)-0.0830.*h(4)+0.001953.*h(7)-0.000988.*h(8)- 0.000047.*(h(1).*h(4))+ 0.000008.*(h(2).*h(3)) + 0.000095.*(h(3).*h(8))- 0.000886.*(h(4).*h(7));
fxx(m,1)=0.4353+ 0.000017.*h(1)-0.000322.*h(2)+ 0.001285.*h(3)+ 0.001801.*h(5) + 0.0445.*h(6)+ 0.004054.*h(7)- 0.000000 .*(h(1).*h(2)) + 0.000030.*(h(2).*h(3))- 0.000018.*(h(2).*h(5)) - 0.002589.*(h(6).*h(7));
end
gen=0;
while(gen<maxGen)
[row,col]=size(x);
[t,tindex]=min(fxx);
Best=x(tindex,:);
% disp(Best);
[w,windex]=max(fxx);
worst=x(windex,:);
xnew=zeros(row,col);
for k=1:row
for j=1:col
r=rand(1,2);
xnew(k,j)=x(k,j)+r(1).*(Best(j)-abs(x(k,j)))-r(2).*(worst(j)-abs(x(k,j)));
end
end
for i=1:col
xnew(xnew(:,i)<mini(i),i)=mini(i);
xnew(xnew(:,i)>maxi(i),i)=maxi(i);
end
for n = 1: pop
g= xnew(n,:);
%fnew(n,1) = 28.61-0.0249.*g(1)-41.98.*g(2)-12.86.*g(3)+0.000006.*g(1).^2+65.97.*g(2).^2+2.328.*g(3).^2+0.033.*(g(1).*g(2))+0.0035.*(g(1).*g(3));
%fnew(n,1) =-0.0292+0.000084.*g(1)-0.000186.*g(2) + 0.003501.*g(3)-0.0830.*g(4)+0.001953.*g(7)-0.000988.*g(8)- 0.000047.*(g(1).*g(4))+ 0.000008.*(g(2).*g(3)) + 0.000095.*(g(3).*g(8))- 0.000886.*(g(4).*g(7));0.05539 + 0.000032.*g(1)- 0.000566.*g(2) + 0.002637.*g(3) - 0.002549.*g(5)+ 0.000173.*g(8)+ 0.000001.*(g(1).*g(2))+ 0.000044.*(g(2).*g(5))+ 0.000001.*(g(3).*g(8))- 0.000030 .*(g(5).*g(7));
fnew(n,1)=0.4353+ 0.000017.*g(1)-0.000322.*g(2)+ 0.001285.*g(3)+ 0.001801.*g(5) + 0.0445.*g(6)+ 0.004054.*g(7)- 0.000000 .*(g(1).*g(2)) + 0.000030.*(g(2).*g(3))- 0.000018.*(g(2).*g(5)) - 0.002589.*(g(6).*g(7));
end
for c=1:pop
if(fnew(c)<fxx(c))
xs(c,:)=xnew(c,:);
fxx1(c,1)=fnew(c,1);
else
xs(c,:)=x(c,:);
fxx1(c,1)=fxx(c,1);
end
end
% disp('%%%%%%%% Final population %%%%%%%%%');
fnew=[];
xnew=[];
gen=gen+1;
fopt(gen)=min(fxx1);
end
runs=runs+1;
disp([xs,fxx1]);
[bvf(runs),bvx(runs)]=min(fopt);
xopt=bvx(runs);
[val,ind]=min(fopt);
Fes(runs)=pop*ind;
best(runs)=val;
%s=min(xs);
end
bbest=min(best);
wbest=max(best);
disp(bbest);
disp(wbest);
%disp(s);
