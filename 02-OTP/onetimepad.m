function onetimepad = onetimepad;
tic;
a=input('String:','s');
k=input('Key:','s');

m=length(a);
n=length(k);

j=0;
for i=1:m

    if a(i)==32


        t(i)=32;

    else if a(i)=='.'
        t(i)='.';
    else
        t(i)=k(j+1);
        j=mod((j+1),n);
        end
    end
end
z='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
for i=1:m
    if a(i)==32
        o(i)=32;
        
    else if a(i)=='.'
    o(i)='.';
    else
        p(i)=double(a(i))-65;
        s(i)=double(t(i))-65;
        l(i)=s(i)+p(i);

        if l(i)>25
            q(i)= mod(l(i),26);
            o(i)=z(q(i)+1);
        else
            o(i)=z(l(i)+1);
        end
    end
    end
toc;
end
disp('The plain text was...')
a
disp('The key text was...')
k
disp('The encrypted cipher text be...')
o


