function angle = Estimate_Angle(input_img)

% ���׷�����ģ���Ƕ�

% �Ƚ���FFT�任
fft_img = abs(fft2(input_img));
% �����任
log_fft_img=log(1+fft_img);
% log_fft_img=fftshift(log_fft_img);

%���׼���
cep_img=ifft2(log_fft_img);
cep_img=ifftshift(cep_img);
%figure,imshow(exp(abs((cep_img))),[]),title('��ʾ��Ƶ��')

% ��ȡ���ױ�Ե
input_img = (1000*abs(cep_img));
figure,imshow(input_img)

% edge_cep_img= edge((cep_img),'roberts');
% figure, imshow(edge_cep_img,[]);title('��ƽ�̱�Ե');
% L=bwlabeln(edge_cep_img);
% [y,x]=find(L>0);
% P=polyfit(x,y,1);
% angle=-atan(P(1))*180/pi;

angle=-Rotation_Detect(input_img);
% if angle>0 
%     angle=-angle;
% else
%     
% end




