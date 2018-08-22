clc;
clear all;

%读入图像
orig_img=imread('metal-parts-01.png');
if size(orig_img,3)==3 
    orig_img = rgb2gray(orig_img);
end
% 先进行FFT变换
fft_img = abs(fft2(orig_img));
% 对数变换
log_fft_img=log(1+fft_img);
% log_fft_img=fftshift(log_fft_img);

%倒谱计算
cep_img=ifft2(log_fft_img);
cep_img=ifftshift(cep_img);
%figure,imshow(exp(abs((cep_img))),[]),title('显示倒频谱')

% 提取倒谱边缘
input_img = (100*abs(cep_img));
figure,imshow(input_img)

%增加运动模糊
len = 25;
theta =20;
PSF = fspecial('motion',len,theta);
blurred_img = imfilter(orig_img,PSF,'circular','conv');
img=double(blurred_img);
imwrite(blurred_img,'metal-parts-20-5.png')

% img=imread('metal-parts-1111.png');

%估计运动角度
est_ang=Estimate_Angle(img)

%估计运动长度 
est_len=Estimate_Length(img,est_ang)


% %解决图像退化问题
est_psf=fspecial('motion',est_len,est_ang);
figure,imshow(est_psf,[])
lucy = deconvlucy(blurred_img,est_psf,50);%deconvlucy
% 
figure
subplot(1,2,1)
imshow((blurred_img));
subplot(1,2,2)
imshow(lucy)
% 
imwrite(lucy,'metal-parts-d20-5.png')
[before_psnr,mes]=Calculate_PSNR(orig_img,blurred_img);
before_psnr
[after_psnr,mes]=Calculate_PSNR(orig_img,lucy);
after_psnr
