%%
A = randn(6);
B = randn(6);
v = randn(6, 1);
w = randn(6, 1);
Vir=(A*B-B*A^(-1))*v*w'; 
MinA = min(min(A));
MinB = min(min(B));
MaxA = max(max(A));
MaxB = max(max(B));
MA = mean(mean(A));
MB = mean(mean(B));
fprintf('matrica A razmera %dX%d :\n', size (A)); disp(A); 
fprintf ('MaxA = %f, MinA = %f, MA = %f\n\n', MaxA, MinA, MA);
fprintf('matrica B razmera %dX%d :\n', size (B)); disp(B);
fprintf ('MaxB = %f, MinB = %f, MB = %f\n\n', MaxB, MinB, MB);
fprintf('vector v razmera  %dX%d :\n', size (v)); disp(v);
fprintf('vector w razmera %dX%d :\n', size (w)); disp(w);

%2.2
g = [v w];
b = bar (g);
legend ('v vector', 'w vector', 'Location', 'bestoutside');
b(1).FaceColor = 'red'; 
b(2).FaceColor = 'green'; 

%3.1
clear variables;
t = (0 : 0.001 : 1)'; 
f = 2;
y = (cos(2*pi*f*t)); 
z = randn(size(y));
q = wgn(length(y), 1, 1);

%3.2
y1 = y + z; 
y2 = y + q;
y3 = awgn(y,10);
Y = horzcat(t, y, y1, y2, y3);

file_1 = fopen('Y_file.txt', 'w');
for i = 1:size(Y, 1)
    for j = 1:size(Y, 2)
        fprintf(file_1, '%2.4f',Y(i,j));
        if j < size(Y, 2)
            fprintf(file_1,'; ');
        end
    end
    fprintf(file_1, '\n');
end
fclose(file_1);
save('Y.mat', 'Y');

dlmwrite('Y_file.csv', Y,  ';');

%3.3
figure(2);
clf;
subplot(3,1,1);
plot(t, y, 'LineWidth', 2);
ax = gca;
ax.Title.String = 'fynkcia plot for shag 0.001';
ax.Title.Color = 'black';
ax.Title.FontSize = 10;
ax.XLabel.String = 'Time, [s]';
ax.YLabel.String = 'y = cos(\omega t)';
ax.XLabel.Color = 'black';
ax.YLabel.Color = 'black';

subplot(3,1,2);
stairs (t, y, 'red','LineWidth', 2);
bx = gca;
bx.Title.String = 'fynkcia stairs for shag 0.001';
bx.Title.Color = 'black';
bx.Title.FontSize = 10;
bx.XLabel.String = 'Time, [s]';
bx.YLabel.String = 'y = cos(\omega t)';
bx.XLabel.Color = 'black';
bx.YLabel.Color = 'black';

subplot(3,1,3);
stem (t, y, 'black', ':');
cx = gca;
cx.Title.String = 'fynkcia stem for shag 0.001';
cx.Title.Color = 'black';
cx.Title.FontSize = 10;
cx.XLabel.String = 'Time, [s]';
cx.YLabel.String = 'y = cos(\omega t)';
cx.XLabel.Color = 'black';
cx.YLabel.Color = 'black';

%3.4
figure(3);
clf;
r = Y(:,2); 
r1 = Y(:,3);
r2 = Y(:,4); 
r3 = Y(:,5); 
subplot(3,1,1);
plot(t,r1,'black');
hold on;
plot (t,r,'red', 'LineWidth', 2);
hold off;
mx = gca;
legend ('y_1 - signal s shymom','Y - signal' , 'Location', 'bestoutside');
mx.Title.String = 'Signal i shym';
mx.Title.FontSize = 10;
mx.YLabel.String = 'y = f(t)';

subplot(3,1,2); 
plot(t,r2,'black');
hold on;
plot (t,r,'red', 'LineWidth', 2);
hold off;
nx = gca;
legend ('y_2 - signal s shymom','Y - signal' , 'Location', 'bestoutside');
nx.Title.String = 'Signal i shym';
nx.Title.FontSize = 10;
nx.YLabel.String = 'y = f(t)';

subplot(3,1,3); 
plot(t,r3,'black');
hold on;
plot (t,r,'red','LineWidth', 2);
hold off;
kx = gca;
legend ('y_3 - signal s shymom','Y - signal' , 'Location', 'bestoutside');
kx.Title.String = 'Signal i shym';
kx.Title.FontSize = 10;
kx.YLabel.String = 'y = f(t)';

%4.1 i 4.2
clear variables;
[X,Y]=meshgrid(-4:0.1:4);
R=sqrt(X.^2+Y.^2)+X.^2+Y.^2; 
Z=sin(R)./R;
figure('color','white');
clf;

p1=subplot(2,2,1);
mesh(X,Y,Z); 
colormap(p1,'summer');
view(240,25);
xlabel('X');
ylabel('Y');
zlabel({'sin(R)';'R'});

p2=subplot(2,2,3);
surf(X,Y,Z);
colormap(p2,'autumn');
view(240,25);
xlabel('X');
ylabel('Y');
zlabel({'sin(R)';'R'});

p3=subplot(1,2,2);
surf(X,Y,Z);
shading flat;
colormap(p3,'cool');
colorbar(p3,'southoutside');
view(240,15);
xlabel('X');
ylabel('Y');
zlabel({'sin(R)';'R'});