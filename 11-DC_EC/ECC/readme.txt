
Program executes scalar multiplication on a provided point, G (input) and a provided 256-bit 
randomly generated private-key, d (input). The program defaults to the secp256k1 base point. 
Inputs should be in big-endian hexidecimal. Program has only been tested on a few points using 
a variety of private-keys. User generates the user's public-key by Q=dG and provides it to
 another user. The other user provides their public-key (q) which generates the shared-key, 
 S=dq by running the algorithm again. The shared-key (S) is used to encrypt and decrypt messages
  shared between the two users using an algorithm such as AES (Advanced_Encryption_Standard). 
  This program was not designed for high speed but executes rather quickly none the less. 
  The program does not run a check to verify the input point is on 
  the elliptic curve (y^2=Y=x^3+7).

Cite As
David Hill (2022). secp256k1 Elliptic Curve Shared-Key Generation GUI (https://www.mathworks.com/matlabcentral/fileexchange/73364-secp256k1-elliptic-curve-shared-key-generation-gui), MATLAB Central File Exchange. Retrieved July 9, 2022.







https://uk.mathworks.com/matlabcentral/fileexchange/73364-secp256k1-elliptic-curve-shared-key-generation-gui


