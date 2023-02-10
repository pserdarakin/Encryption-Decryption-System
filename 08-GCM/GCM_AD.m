function [messageOut,authTagResult] = GCM_AD(secretKey,iv,outputCipher,aad,authTag)
%
%Algorithm for the Authentiated Decryption Function
%Galois Counter Mode (GCM) Block Cipher uses AES-128,192,256 based in key
%length. Implimentation based on NIST Special Publication 800-38D.
%Inputs: secretKey - hexidecimal (128,192, or 256 bits), iv -
%initialization vector (random 96-bit hexidecimal), outputCipher -
%hexidecimal encrypted Cipher that needs decrypting, aad - additional
%authenticated data (plaintext string), authTag - authentication tag
%(hexidecimal). Outputs: messageOut - decrypted plaintext message,
%authTagResult - logical (true or false, true is tag is validated).
%
%David Hill
%Version 1.0.0
%Date: 1 December 2021
%


H=Cipher(secretKey,zeros(1,128));
t=96;%authentication tag bit-length (fixed for this code)
a=dec2bin(double(aad)',8)';
a=a(:)'-'0';%convert a to binary array
iv=dec2bin(hex2dec(reshape(iv,2,[])'),8)';
iv=iv(:)'-'0';%convert iv to binary array
C=dec2bin(hex2dec(reshape(outputCipher,2,[])'),8)';
C=C(:)'-'0';%convert C to binary array
T=dec2bin(hex2dec(reshape(authTag,2,[])'),8)';
T=T(:)'-'0';%convert T to binary array
J=[iv,zeros(1,31),1];
P=GCTR(secretKey,inc(32,J),C);
u=128*ceil(length(C)/128)-length(C);
v=128*ceil(length(a)/128)-length(a);
S=ghash([a,zeros(1,v),C,zeros(1,u),dec2bin(length(a),64)-'0',dec2bin(length(C),64)-'0'],H);
Tp=GCTR(secretKey,J,S);
Tp=Tp(1:t);
authTagResult=isequal(T,Tp);
P=num2str(P);
P=P(P~=' ');
messageOut=char(bin2dec(reshape(P,8,[])'))';