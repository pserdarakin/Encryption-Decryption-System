function main=main
key = input('Enter the Key:',"s");

plainTextInput = input('Enter the message:',"s");

aad= input('Type any additional unencrypted instructions:',"s");

iv= dec2hex(randi([1 1000], 1, 96));

secretKey = dec2hex(key, 256);

[C,T]=GCM_AE(secretKey,iv,plainTextInput,aad);
encrypt = ['Encrypt Message: ', C];
disp(encrypt)

auth_tag = ['Authentication Tag: ', T];
disp(auth_tag)


[P,A] = GCM_AD(secretKey,iv,C,aad,T);
decrypt = ['Decrypt Message: ', P];
disp(decrypt)
end