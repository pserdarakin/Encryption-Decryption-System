
key = input('Enter the Key:',"s");
message = input('Enter the message:',"s");
val = input('Enter the SHA method type:',"s");
method_input=str2num( val );

if(method_input=='')
    disp ('Please Enter the correct SHA Method');
    return
elseif(method_input==1)
    method='SHA-1';
elseif(method_input==256)
    method='SHA-256';
elseif(method_input==384)
    method='SHA-384';
elseif(method_input==512)
    method='SHA-512';
else
    disp ('Please enter the correct SHA method');
    return

end
encrypt=HMAC(key,message,method);
disp(encrypt)
