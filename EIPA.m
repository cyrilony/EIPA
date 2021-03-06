close all
clear 
clc

nx = 50;
ny = 50;

G = sparse(nx*ny,nx*ny);

    
for i = 1:nx
   for j = 1:ny
       n = j + (i-1)*ny;
        
        if i == 1 || i == nx ||j == 1 || j == ny
            G(n, :) = 0;
            G(n, n) = 1;
        else
            G(n, n) = -4;
            G(n, n-1) = 1;
            G(n, n+1) = 1;
            G(n, n-ny) = 1;
            G(n, n+ny) = 1;
        end
    end
end
figure(1) 
spy(G)
[E, D] = eigs(G, 9, 'SM');

newE = zeros(nx, ny, 9);
figure(2)

for m = 1:9
   newE(:, :, m) = reshape(E(:, m), nx, ny);
   subplot(3, 3, m)
   surf(newE(:, :, m))
end