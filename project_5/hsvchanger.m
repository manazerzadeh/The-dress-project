function newhsv = hsvchanger(hsv , hadder , sadder , vadder)
hsv(:,:,1) = hsv(:,:,1) + hadder;
selec = uint8(zeros(size(hsv)));
selec(:,:,1) = (hsv(:,:,1) > 1 );
hsv(logical(selec)) = hsv(logical(selec)) - 1;

hsv(:,:,2) = hsv(:,:,2) * sadder;
selec = zeros(size(hsv));
selec(:,:,2) = logical((hsv(:,:,2) > 1 ));
hsv(logical(selec)) = 1;

hsv(:,:,3) = hsv(:,:,3) - mean(mean(hsv(:,:,3))) + vadder;
selec = zeros(size(hsv));
selec(:,:,3) = logical((hsv(:,:,3) > 1 ));
hsv(logical(selec)) = 1 ;
newhsv = hsv;
end

