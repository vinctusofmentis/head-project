clc;
clear variables;
%%
t=(0:0.001:1)';
omega=2*2*pi;
y=cos(omega*t);
s_y=size(y);
disp(s_y);
%l_y=length(y);
%disp(l_y);

z=randn(size(y));
q=wgn(s_y(1),s_y(2),3);

y1=y+z;
y2=y+q;
y3=awgn(y,1);
Y=[t y y1 y2 y3];
%dlmwrite

f1=figure(1);
s1=subplot(3,1,1);
p1=plot(Y(:,1),Y(:,2));
s2=subplot(3,1,2);
p2=plot(Y(:,1),Y(:,2:3));
s2=subplot(3,1,3);
p2=plot(Y(:,1),Y(:,2),Y(:,1),Y(:,4));

[X,Y]=meshgrid(-4:0.1:4,-4:0.1:4);
R=sqrt(X.^2+Y.^2)+X.^2+Y.^2;
Z=sin(R)./R;
f2=figure(2);
subplot(3,3,1);
mesh(X,Y,Z);


function DoItNice(f1,s1,p1)
    f1.Color=[0.5 0.5 0.5]; %%canva
    s1.Color=[]; %%plot
    p1.Color=[]; %%graphics
end
