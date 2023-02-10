key_type = input('Enter key Generator Type:',"s");
plaintext = input('Enter Plain text:',"s");

if(key_type=='1')
    key = randi(1000);
else
    key = 'key for cyber';
end

display(key);


Z = uint8(PRGA(KSA(key), size(plaintext,2)));

P = uint8(char(plaintext));

res = bitxor(Z, P);

%printing result in hex and unicode
res_in_hex = mat2str(dec2hex(res,2));
cipher = char(res)


Z = uint8(PRGA(KSA(key), size(cipher,2)));

P = uint8(char(cipher));

res = bitxor(Z, P);

%printing result in hex and unicode
res_in_hex = mat2str(dec2hex(res,2));
cipher = char(res)


