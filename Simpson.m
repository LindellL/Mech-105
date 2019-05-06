function [I] = Simpson(x,y)
%This function solves integrals of data by using the Simpsons 1/3
%method. The function will use the trapazoidal rule if there is an odd
%amount of inputs.
%   Function solves for the integral of data by using the Simpsons 1/3
%   rule. x is the independent variable while y is dependent upon x. Input
%   the values as a vector using "[]" for both x and y. If you use an odd
%   amound of inputs, the last value will be calculated using the
%   trapazoidal rule.

%Check to see if values of x are evenly spaced.
xm= round(((x(1)+x(end))/2));
if range(x(1:xm))-range(x(xm:end))~=0
    error('x values are not evenly spaced')
end

%Check to see if trapazoidal rule will need to be used.
remainder= length(x);
if rem(remainder,2)~=0
    warning('trapazoidal rule will be used for last value because of odd amount of inputs')
end

%Set even and odd x values that will be used as summations in the equation below.
even= y(2:2:end);
odd= y(1:2:end);

%Solve integral using Simpsons 1/3 rule as well as trapazoidal rule if
%needed.
if rem(remainder,2)==0
    I= (x(end)-x(1))*((x(1)+2*sum(even)+4*sum(odd)+x(end))/(3*length(x)));
else
    I= (x(end-1)-x(1))*((x(1)+2*sum(even)+4*sum(odd)+x(end-1))/(3*(length(x)-1)))+(x(end)-x(end-1))*((y(end)+y(end-1))/2);
    
end
