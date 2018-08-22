function ang=Rotation_Detect(input_img)

detect_bar=100;
nrow=size(input_img,1);
ncol=size(input_img,2);
cx=round((ncol+1)/2);
cy=round((nrow+1)/2);

energy=0;
angle=0;
for i=-90:0.5:90-0.5
    x=[-detect_bar:detect_bar]*cos(i*pi/180)+cx;
    y=[-detect_bar:detect_bar]*sin(i*pi/180)+cy;
    v=interp2(input_img,x,y);

%          plot(x,y);
%     pause;
    if sum(v(:))>energy;
        energy=sum(v(:));
        angle=i;
    end
end
ang=angle;



    
        