%
% ELEC 4700 PA 5
%
% Harmonic Wave Equation in 2D FD and Modes
%
% Tom Palmer - 101045113
%
% 07 FEB 2020
%

clear
clc

nx = 50;
ny = 50;

G = sparse(nx*ny);
B = zeros (1,nx*ny);

for i = 1:nx
    for j = 1:ny
        n = j + (i-1)*ny;
        
        if i == 1
            G(n,:) = 0;
            G(n,n) = 1;
            B(n) = 1;
        elseif i == nx
            G(n,:) = 0;
            G(n,n) = 1;
            B(n) = 1;
        elseif j == 1
            G(:,n) = 0;
            G(n,n) = 1;
            B(n) = 1;
        elseif j == ny
            G(:,n) = 0;
            G(n,n) = 1;
            B(n) = 1;
        else
            nxm = j + (i-2)*ny;
            nxp = j + (i)*ny;
            nym = j-1 + (i-1)*ny;
            nyp = j+1 + (i-1)*ny;
            
            G(n,n) = -4;
            G(n,nxm) = 1;
            G(n,nxp) = 1;
            G(n,nym) = 1;
            G(n,nyp) = 1;
        end
    end
end

figure(1)
spy(G)

[E,D] = eigs(G,9,'SM');
x = linspace(1,9,9);
y = zeros(1,9);
for c = 1:9
    y(1,c) = D(c,c);
end
figure(2)
plot(x,y(1,x))

data_1 = zeros(nx,ny);
data_2 = zeros(nx,ny);
data_3 = zeros(nx,ny);
data_4 = zeros(nx,ny);
data_5 = zeros(nx,ny);
data_6 = zeros(nx,ny);
data_7 = zeros(nx,ny);
data_8 = zeros(nx,ny);
data_9 = zeros(nx,ny);

data_x = linspace(1,nx,nx);
data_y = linspace(1,ny,ny);

for i = 1:nx
    for j = 1:ny
        position = j + (i-1)*ny;
        data_1(i,j) = E(position,1);
    end
end
figure(3)
surf(data_x,data_y,data_1)

for i = 1:nx
    for j = 1:ny
        position = j + (i-1)*ny;
        data_2(i,j) = E(position,2);
    end
end
figure(4)
surf(data_x,data_y,data_2)

for i = 1:nx
    for j = 1:ny
        position = j + (i-1)*ny;
        data_3(i,j) = E(position,3);
    end
end
figure(5)
surf(data_x,data_y,data_3)

for i = 1:nx
    for j = 1:ny
        position = j + (i-1)*ny;
        data_4(i,j) = E(position,4);
    end
end
figure(6)
surf(data_x,data_y,data_4)

for i = 1:nx
    for j = 1:ny
        position = j + (i-1)*ny;
        data_5(i,j) = E(position,5);
    end
end
figure(7)
surf(data_x,data_y,data_5)

for i = 1:nx
    for j = 1:ny
        position = j + (i-1)*ny;
        data_6(i,j) = E(position,6 );
    end
end
figure(8)
surf(data_x,data_y,data_6)

for i = 1:nx
    for j = 1:ny
        position = j + (i-1)*ny;
        data_7(i,j) = E(position,7);
    end
end
figure(9)
surf(data_x,data_y,data_7)

for i = 1:nx
    for j = 1:ny
        position = j + (i-1)*ny;
        data_8(i,j) = E(position,8);
    end
end
figure(10)
surf(data_x,data_y,data_8)

for i = 1:nx
    for j = 1:ny
        position = j + (i-1)*ny;
        data_9(i,j) = E(position,9);
    end
end
figure(11)
surf(data_x,data_y,data_9)