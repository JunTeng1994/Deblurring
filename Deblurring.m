function deblurred_img=Deblurring(orig_img)




%估计运动角度
est_ang=Estimate_Angle(orig_img);

%估计运动长度
est_len=Estimate_Length(orig_img,est_ang);

% %解决图像退化问题
est_psf=fspecial('motion',est_len,est_ang);
deblurred_img = deconvlucy(orig_img,est_psf,50);%deconvlucy

