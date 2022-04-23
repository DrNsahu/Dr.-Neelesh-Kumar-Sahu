%INTIALISE POPULATION%
clear all
clc
no_of_run = 5;
no_of_student = 5; %specify population size
no_of_iteration = 100; %specify number of iterations
tf = 1;
for i = 1:no_of_run
[bvf,bvx]=mainline(no_of_student, no_of_iteration, tf);
bvf1(i,:)=bvf;
bvx1(i,:)=bvx;
end
bvf = bvf1(:,1);
[bvfmin,k0]=min(bvf)
bvxmin = bvx1(k0,:)
bvfmin = bvf1(k0,:)
