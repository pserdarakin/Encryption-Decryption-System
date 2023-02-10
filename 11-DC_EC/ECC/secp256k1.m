function [q1,q2] = secp256k1(d,g1,g2)


%Computes the public key, point Q (q1,q2), on secp256k1 elliptic curve from 256-bit
%private key (d) and point G (g1,g2) also on the elliptic curve. The algorithm
%calculates the scalar multiplication dG which generates the public key.
%All inputs are big-endian hexidecimal numbers (256-bit). Point G is
%assumed to be on the curve and no check is done for verification.
%David Hill
%Version 1.0.0
%11-14-2019
import java.math.*
p=BigInteger('115792089237316195423570985008687907853269984665640564039457584007908834671663');%prime
if isempty(g1)
    a=BigInteger('79BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798',16);%default g1
    b=BigInteger('483ADA7726A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8',16);%default g2
else
    a=BigInteger(g1,16);
    b=BigInteger(g2,16);
end
G=[a,b];
d=char(BigInteger(d,16).toString(2));
Q=[];
if str2double(d(end))
    Q=G;
end
for i=length(d)-1:-1:1
    G=AddPoint(G,G,p);%continues to double point G during each loop
    if str2double(d(i))&&~isempty(Q)%if binary bit set, adds the binary scaled point to the existing point
        Q=AddPoint(G,Q,p);
    elseif str2double(d(i))
        Q=G;
    end
end
q1=Q(1).toString(16);%converts to big-endian hexidecimal
q2=Q(2).toString(16);
end

