clc;clear;
while 1
    choice = menu("Options for Crypted Files",'Classic cipher','One-way pad','Bit-wise XOR cipher(text)','Bit-wise XOR cipher(binary)','DES block cipher(text)','DES block cipher(binary)','Bit-wise stream cipher','Hash password','Keyed Hash','Authenticated Encrypt (GCM) ','Metrics\Stats function menu option','RSA','DH key generator','EC key generator','Exit');
    
    switch choice
        case 1
            addpath('01-Cipher/')
            cipher()
        case 2
            addpath('02-OTP/')
            onetimepad()
        case 3
            addpath('03-XOR/')
            XOR()
        case 4
            addpath('03-XOR/')
            bitwiseXORBinary()
        case 5
            addpath('04-DES/')
            DES1()
        case 6
            addpath('04-DES/DESBinary/')
            main()
        case 7
            addpath('05-Test Rig/')
            Test_Rig()
        case 8
            addpath('06-Hash/')
            hash()
        case 9
            addpath('07-Keyed_Hash/')
            HMAC()
        case 10
            addpath('08-GCM/')
            main()
        case 11
            addpath('09-Metrics/')
            Metrics()
        case 12
            addpath('10-RSA/')
            rsa()
        case 13
            addpath('11-DC_EC/DiffieHellman/')
            DHKey()
        case 14
            addpath('11-DC_EC/ECC/')
            secp256k1_GUI()
        case 15
            choice = menu("Exit?",'Yes','No')
            
            switch choice
                case 1
            break
            end
        
    end
end