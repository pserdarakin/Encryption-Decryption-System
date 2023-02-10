function cipher = cipher
tic;
%Encryption
M= input('String: ','s');
n= input('count: ');
N = n - 95 * fix(n/95);
num = M+n;
for i = 1:length(num) 
    if  num(i) + N < 32                 
        num2(i) = 126 - (31- num(i) - N);
    else if num(i) + N > 126             
        num2(i) = 32 + (num(i) + N -127);
    else 
        num2(i) = num(i) + N ;         
    end
end
coded = char(num2);
disp(['Encrypted message:',char(coded)]);
end

%Decryption
N = n - 95 * fix(n/95);
num = M-n;
for i = 1:length(num) 
    if  num(i) + N < 32                 
        num2(i) = 126 - (31- num(i) - N);
    else if num(i) + N > 126             
        num2(i) = 32 + (num(i) + N -127);
    else 
        num2(i) = num(i) + N ;         
    end
end
coded = char(num2);
disp(['Decrypted message:',char(coded)]);
toc;
end