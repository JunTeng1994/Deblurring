function LEN = Estimate_Length(input_img, angle)
% ���׷�����ģ������

% ��ֵ�˲�ȥ��
input_img = medfilt2(abs(input_img));

% �Ƚ���FFT�任
fft_img = fft2(input_img);

% �����任
log_fft_img = abs(log(1 + abs(fft_img)));

% ���׼���
cep_img = ifft2(log_fft_img);

% ��תͼ���Ա���ģ������
rot_cep_img = imrotate(cep_img, -angle);


% ������ƽ��ֵ
for i=1:size(rot_cep_img, 2)
    avg(i) = 0;
    for j=1:size(rot_cep_img, 1)
        avg(i) = avg(i) + rot_cep_img(j, i);
    end
    avg(i) = avg(i)/size(rot_cep_img, 1);
end
avgr = real(avg);%���ʵ��

% ͨ�����ҵ�һ����ֵȷ��ģ������
index = 0;
for i = 1:round(size(avg,2)),
    if real(avg(i))<0,
        index = i;
        break;
    end
end

%plot(avgr)

% ���������Ϊ���򷵻�����Ϊģ������
if index~=0,
    LEN = index;
else
    % ���������Сֵ��Ϊģ������
    index = 1;
    startval = avgr(index);
    for i = 1 : round(size(avg, 2)/2),
        if startval>avgr(i),
            startval = avgr(i);
            index = i;
        end
    end

    LEN = index;
end
