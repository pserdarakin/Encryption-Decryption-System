To starting menu please open the Menu_System.m file
It is include;
1) Classic cipher: Put string and wanted shift number and you will get encrypted message and decrypted message which is showed as sequently with time reveal.
2) One-way pad: Type plaintext and key as its shown gaps and as an output encrypted cipher text will be shown. Further details can be found in reference [1].
3) Bit-wise XOR Cipher(text): Put string and key as it's shown gaps and as an output key binary, encrypted text, decrypted text and elapsed time will be showed up. 
4) Bit-wise XOR Cipher(binary): It can be use for image encryption and decryption. Source can be found at the below.
5) DES Block Cipher(text): Put string, after parity check secret key will be showed up.
6) DES Block Cipher(binary): It can be use for voice encryption and decryption. Source can be found at the below.
7) Bit-wise Stream Cipher
8) Hash Password
9) Keyed Hash:
key: input secret key in char, message: input message in char, method: hash method, either: 'SHA-1', 'SHA-256', 'SHA-384', 'SHA-512'
10) Authenticated Encrypt (GCM): 
Example:
key='44a74c1a57da2bf6d6838956cdca13f1b67cc6ad87d459bff544784083868171';
iv='4392367e62ef9aa706e3e801';
plainTextInput='I like to swim!';
aad= 'additional unencrypted instructions';
[C,T]=GCM_AE(key,iv,plainTextInput,aad)
C =
    '6deb6e66165c0f8d85369aa4da0c1d'
T =
    '1ec4fb95081845d94bca1c4d'
    
[P,A]=GCM_AD(key,iv,C,aad,T)
P =
    'I like to swim!'
A =
  logical
   1

11) Metrics\Stats function menu option
12) RSA
13) DH Key Generator
14) EC Key Generator
15) Exit


Resources:
1) OTP taken from https://uk.mathworks.com/matlabcentral/fileexchange/36450-one-time-pad
Version 1.0.0.0 (1.26 KB) by Mayukh

2) For menu system Matlab library have been used and also it was submitted in week 12. https://uk.mathworks.com/help/matlab/ref/menu.html

3) RC4 kareem ahmed (2022). RC4 (https://www.mathworks.com/matlabcentral/fileexchange/67242-rc4), 
MATLAB Central File Exchange. Retrieved July 10, 2022.

4) GCM David Hill (2022). Galois Counter Mode (GCM) Block Cipher using AES (https://www.mathworks.com/matlabcentral/fileexchange/102850-galois-counter-mode-gcm-block-cipher-using-aes), MATLAB Central File Exchange. Retrieved July 5, 2022.

5) RSA Cite As
Shaun Gomez (2022). Implementation of RSA Algorithm (https://www.mathworks.com/matlabcentral/fileexchange/38439-implementation-of-rsa-algorithm), MATLAB Central File Exchange. Retrieved July 7, 2022.

6) https://www.youtube.com/watch?v=C90IRZ5nlbo

7) BitwiseXORbinary taken from mathworks Cite as:
https://uk.mathworks.com/matlabcentral/answers/417583-i-have-to-do-bitxor-on-image-pixel-wise?s_tid=srchtitle

8) DES voice encryption (binary) Cite as: https://uk.mathworks.com/matlabcentral/fileexchange/68475-audio-encryption-and-decryption-using-des?s_tid=srchtitle

Also, licences can be found each folder.
