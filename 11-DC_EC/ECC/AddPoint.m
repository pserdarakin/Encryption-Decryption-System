function G=AddPoint(P,Q,p)
%Function adds points P and Q on the elliptic curve to generate the output
%point G (G=P+Q). All inputs are java BigIntegers. p is the prime used for
%sep255k1 elliptic curve (y^2=x^3+7).
import java.math.*
if P(1)==Q(1)
    a=BigInteger('2').multiply(P(2)).modInverse(p);
    m=BigInteger('3').multiply(P(1).pow(2).mod(p)).multiply(a).mod(p);%m=(3xp^2+a)/2yp
else
    a=P(1).subtract(Q(1)).modInverse(p);
    m=P(2).subtract(Q(2)).multiply(a).mod(p);%m=(yp-yq)/(xp-xq)
end
G(1)=m.pow(2).subtract(P(1)).subtract(Q(1)).mod(p);%xg=m^2-xp-xq
G(2)=P(2).add(m.multiply(G(1).subtract(P(1)))).negate().mod(p);%yg=yp+m(xg-xp)
end


