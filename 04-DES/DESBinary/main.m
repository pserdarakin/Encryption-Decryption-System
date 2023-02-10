clc
clear all
close all

inp=input('PLS ENTER TO START RECODING : ')

objt=audiorecorder

recordblocking(objt,10)

play(objt)

aa=getaudiodata(objt);

figure,plot(aa)
title('audio speech recorded')


N =length(aa)
r =aa;
for i = 1:N                    
    if r(i) >= -0.1
        r(i) = 1;
    else
        r(i) = 0;
    end
end

figure,plot(r)
title('digital signal')


key1 = char(inputdlg('encrypt key')); 
key2 = char(inputdlg('decrypt key')); 

if key1==key2
    out=1;
else
    out=aa(1:length(aa)).*aa;
end

[r_encrypt,r_length] = DES_Encrypt(r,key1); 
r_decrypt = DES_Decrypt(r_encrypt,key2,r_length); 

count = 100;                       
R = zeros(1,length(r)*count);
R_encrypt = zeros(1,length(r_encrypt)*count);
R_decrypt = zeros(1,length(r_decrypt)*count);
for i = 1:length(r)*count           
    R(i) = r(((i-1)-mod((i-1),count))/count+1);
end
for i = 1:length(r_encrypt)*count   
    R_encrypt(i) = r_encrypt(((i-1)-mod((i-1),count))/count+1);
end
for i = 1:length(r_decrypt)*count   
    R_decrypt(i) = r_decrypt(((i-1)-mod((i-1),count))/count+1);
end
figure
plot(0:1/count:length(r)-1/count,R,'b','LineWidth',2)
% axis([0,500,-1,2])
title('digital')
grid on

figure,
plot(0:1/count:length(r_encrypt)-1/count,R_encrypt,'b','LineWidth',2)
% axis([0,50,-1,2])
title('encrypted')

figure
plot(0:1/count:length(r_decrypt)-1/count,R_decrypt,'b','LineWidth',2)
% axis([0,50,-1,2])
title('decrypted')
grid on

figure
plot(aa.*out,'b','LineWidth',2)
% axis([0,500,-1,2])
title('recovered speeech')
grid on

