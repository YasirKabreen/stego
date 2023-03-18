clc,close all
cov=coverimage(:,:,3);
cov=dec2bin(cov,8);

com=cov((1:l1),8);
com=reshape(com,((length(com)/8)),8);
com=uint8(bin2dec(com));



decom=(huff2norm(com,info))';
isequal(decom,sec)
se=dec2bin(decom,6);
se=[se,se(:,(5:6))];
se=uint8(bin2dec(se));
se=reshape(se,128,128);
subplot(2,2,1)
imshow(coverimage)
title('The Original Image')

subplot(2,2,2)
imshow(se)
title('The Compressed Image')