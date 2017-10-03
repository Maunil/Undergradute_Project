% Linespace Generation

clc;
clear;

t = 0:0.002902494331065/64:7.456507936507936;

T = length(t);

T1 = round(0.10*T);
T2 = round(0.30*T);
T3 = round(0.40*T);
T4 = round(0.20*T);

L1 = linspace(0,1,T1);
L2 = linspace(1,0.7,T2);
L3 = linspace(0.7,0.7,T3);
L4 = linspace(0.7,0,T4);

a = [L1 L2 L3 L4];
A = length(a);

if T > A
    diff = T-A;
    for i = 1:diff
        a = [a, 0];
    end
    
elseif T < A
        diff = A-T;
        for i = 1:diff
            t = [t, 0];
        end        
end

plot(a);