clc;%Clear command window
disp('Diffie Hellman Key Exchange');
disp('-----------------------------------------');
clear 
close all;%Clear variables in workspace and close figure
%Input value of g and p, and ensure that g and p is prime
prime = 0;
while prime == 0
    g = input('Enter a value for g: ');
    p = input('Enter a Value for p: ');
    pg = isprime(g);
    pp = isprime(p);
    if pg == 0
        disp('g is not prime');
    end
    if pp == 0
        disp('p is not prime');
    end
    prime = pg & pp;
end
disp('---Value For X---');
xa = randi([1 p-1]);%Calculate value of Xa
xb = randi([1 p-1]);%Calculate value of Xb
disp(['Xa is: ' num2str(xa)]);%Convert xa to string and display it
disp(['Xb is: ' num2str(xb)]);%Convert xb to string and display it
disp('---Value For Y---');
%Calculate value of Ya and Yb
ya = power(g,xa);
ya = mod(ya,p);
yb = power(g,xb);
yb = mod(yb,p);
disp(['Ya is : ' num2str(ya)]);%Convert ya to string and display it
disp(['Yb is : ' num2str(yb)]);%Convert yb to string and display it
disp('---The Shared Key---');
%Calculate shared key
ha = power(yb,xa);
ha = mod(ha,p);
hb = power(ya,xb);
hb = mod(hb,p);
disp(['Shared Key A: ' num2str(ha)]);%Convert ha to string and display it
disp(['Shared Key B: ' num2str(hb)]);%Convert bb to string and display it