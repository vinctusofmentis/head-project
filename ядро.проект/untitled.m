%% андрюха если ты это читаешь напиши мне 
clc;
clear variables;
%% пункт 3 из лабы1
t=(0:0.001:1)';
omega=2*2*pi;
y=cos(omega*t);


s_y=size(y);
%%disp(s_y);
%%l_y=length(y);
%%disp(l_y);
z=randn(size(y));%% z=randn(1001,1); еще один вариант рандy
q=wgn(s_y(1),s_y(2),3);

y1=y+z;
y2=y+q;
y3=awgn(y,1);
Y=[t; y; y1; y2; y3];
%% пункт 3.3 3.4 из лабы 1
f1=figure(1);
s1=subplot(3,1,1);
p1=plot(Y(:,1:3));



