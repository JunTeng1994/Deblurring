function deblurred_img=Deblurring(orig_img)




%�����˶��Ƕ�
est_ang=Estimate_Angle(orig_img);

%�����˶�����
est_len=Estimate_Length(orig_img,est_ang);

% %���ͼ���˻�����
est_psf=fspecial('motion',est_len,est_ang);
deblurred_img = deconvlucy(orig_img,est_psf,50);%deconvlucy

