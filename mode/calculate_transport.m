systems = ["1001", "1101", "1111", "10n01", "11n01", "11n11"];
Ts = [375, 394, 369, 338, 367, 361]/3.16e5;

Bs=zeros(1296,1296,length(systems));

for id=1:length(systems)
    system = systems(id);
    transport;
    Bs(:,:,id)=B;
end

for id=1:length(systems)
    display((1/(n^2)^2)*sum(sum(exp(-Bs(:,:,id)/(300/3.16e5)))));
end

surf(X,Y, exp(-reshape(Bs(1,:,id),[n,n])/(1000/3.16e5)))

close all;