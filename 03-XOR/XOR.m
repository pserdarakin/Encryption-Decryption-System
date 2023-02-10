function XOR = XOR
tic;
plaintext = input('String:','s');
key = input('Key:','s');
%reshape for to matrix and dec2bin for the turning binary
binary = reshape(dec2bin(plaintext, 8).'-'0',1,[]);
plaintext = reshape(dec2bin(plaintext,8),1,[])- '0';
key_binary = reshape(dec2bin(key,8),1,[]) - '0';
display(key_binary);
key = reshape(dec2bin(key,8),1,[]) - '0';
% xor and encryption
value = xor(plaintext, key(mod(0:numel(binary)-1,numel(key))+1));
encryption = char(bin2dec(char(reshape(value + '0',[],8))))';
disp(['Encryption: ',char(encryption)]);
ciphertext = reshape(dec2bin(encryption,8),1,[])-'0';
value = xor(ciphertext, key(mod(0:numel(ciphertext)-1, numel(key))+1));
plaintext = char(bin2dec(char(reshape(value + '0',[],8))));
%Decryption
str = char(bin2dec(reshape(char(binary+'0'), 8,'').'))';
disp(['Decryption:',str]);
toc;
end