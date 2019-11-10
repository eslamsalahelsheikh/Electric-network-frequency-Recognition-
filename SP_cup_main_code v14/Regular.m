function [ENF] = Regular(signal)
Mx=max(max(signal(1:25,:)));
signal(find(signal>Mx))=Mx;

Mn=min(min(signal(1:25,:)));
signal(find(signal<Mn))=Mn;

ENF=signal;
plot(ENF)
end