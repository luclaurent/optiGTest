function y = levy(x)
% 
% Levy function 
% Matlab Code by A. Hedar (Nov. 23, 2005).
% The number of variables n should be adjusted below.
% The default value of n =2.
% 
n = numel(x);
for i = 1:n; z(i) = 1+(x(i)-1)/4; end
s = sin(pi*z(1))^2;
% s
for i = 1:n-1
    s = s+(z(i)-1)^2*(1+10*(sin(pi*z(i)+1))^2);
    disp('la')
     (z(i)-1)^2
     (1+10*(sin(pi*z(i)+1))^2)
%     s
end 
y = s+(z(n)-1)^2*(1+(sin(2*pi*z(n)))^2);

% z
% y
