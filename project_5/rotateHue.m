A = (imread('col1.jpg'));
hsv = rgb2hsv(A);
for h = 0 : 0.2 : 0.8
    tmp = hsvchanger(hsv , h , 1 , 0); 
    for s = 0.5 : 0.3 : 1.4
        tmp2 = hsvchanger(tmp , 0 , s , 0);
        for v = 0.5:0.25:0.75
            tmp3 = hsvchanger(tmp2 , 0 , 1 , v);
            newA = uint8(255 * hsv2rgb(tmp3));
            figure;
            title(strcat(num2str(h),' ',num2str(s),' ',num2str(v)));
            image(newA);
            pause(0.5);
        end
    end
    pause(3);
end