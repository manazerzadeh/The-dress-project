function  drawWeightsColors( points, weights, sizeMax )
S = uint8(weights*sizeMax+1);
C = [points(:,1)/256,points(:,2)/256,points(:,3)/256];
scatter3(points(:,1),points(:,2),points(:,3),S,C,'filled');
xlim([0,255]);
ylim([0,255]);
zlim([0,255]);
xlabel('r');
ylabel('g');
zlabel('b');

end

