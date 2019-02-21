function allHsvTest( A, fileName )
hsv = rgb2hsv(A);
for h = 0 : 0.2 : 0.8
    tmp = hsvchanger(hsv , h , 1 , 0); 
    for s = 0.6 : 0.3 : 1.8
        tmp2 = hsvchanger(tmp , 0 , s , 0);
        for v = 0.7:0.1:0.8
            tmp3 = hsvchanger(tmp2 , 0 , 1 , v);
            newA = uint8(255 * hsv2rgb(tmp3));
%             figure('name',strcat('h = ',num2str(h),'s = ',num2str(s),'v = ',num2str(v)));
%             image(newA);
            imwrite(newA,strcat('new\',fileName,'hsv ','h = ',num2str(h),'s = ',num2str(s),'v = ',num2str(v),'.jpg'));
            pause(0.5);
        end
    end
    pause(3);
end

end

