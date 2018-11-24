function [n_y,y]=derivative_withcoordinates(n_x,x)

length_of_nx=length(n_x);
y=zeros(1,length_of_nx-1);
n_y=n_x(1:length_of_nx-1);
for i=1:1:length_of_nx-1
    y(1,i)=(x(i+1)-x(i))/(n_x(i+1)-n_x(i));
end