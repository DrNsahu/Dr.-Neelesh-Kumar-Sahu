%%DEFINE RANGE OF INPUT VARIABLE%%
function [bvf,bvx]=mainline(no_of_student, no_of_iteration, tf)
no_of_variable = 3; % specify number of variables
lowerlimitofa = 1795.5; % specify the lower bound
upperlimitofa = 2804.5; % specify the upper bound
lowerlimitofb = 0.1;
upperlimitofb = 0.6;
lowerlimitofc = 0.1;
upperlimitofc = 0.6;
for i = 1:no_of_student
% initialization of the variables
a = lowerlimitofa + rand *(upperlimitofa-lowerlimitofa);
b = lowerlimitofb + rand *(upperlimitofb-lowerlimitofb);
c = lowerlimitofc + rand *(upperlimitofc-lowerlimitofc);
x(i,:)=[a b c];
end
%limit array
limit=[lowerlimitofa;upperlimitofa;lowerlimitofb;upperlimitofb;lowerlimitofc;upperlimitofc];
parameter=[no_of_student;no_of_iteration;tf;no_of_variable];
[bvf,bvx]=tlbo1(limit,x,parameter);