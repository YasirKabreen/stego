clc,clear
cover= imread('lighthouse.png');
secret=imread('moon.tif');
cover =imresize(cover,[512,512]);
coverimage=cover;
cov=dec2bin(cover(:,:,3),8);
secret =imresize(secret,[128,128]);

sec=secret(:);
sec=dec2bin(sec);
sec=sec(:,(1:6));
sec=uint8(bin2dec(sec));


[com,info]=norm2huff(sec);
co=dec2bin(com,8);
co=co(:);
l1=length(co);
l2=length(info);
cov((1:l1),8)=co;
cov=uint8(bin2dec(cov));
cov=reshape(cov,512,512);
coverimage(:,:,3)=cov;


MSE=immse(cover,coverimage)
PSNR=psnr(cover,coverimage)

subplot(1,3,1)
imshow(cover)
title('The Cover Image')

subplot(1,3,2)
imshow(coverimage)
title('The Stego Image')

subplot(1,3,3)
imshow(secret)
title('The Secret Image')

