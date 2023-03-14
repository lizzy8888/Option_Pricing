clear all
S0=5.6; X=5.6; r=0.1;sigma=0.1117;mu=r-0.5*sigma^2;T=0.5;nPath=100;nStep=20;nRuns=100;
h = T/nStep;
for k=1:nRuns
    W=randn(nStep, nPath);
for i=1:nStep-1
    for j=1:nPath
S(1,j)=S0;
S(i+1,j)=S(i,j)*exp(mu*h+sigma*sqrt(h)*W(i,j));
    end
end
for j =1:nPath
    SS(j)=S(nStep,j);
    C(j)=max(SS(j)-X,0);
    c(j)=C(j)*exp(-r*T);
    call_price=mean(c);
end
cp(k)=call_price;
bsmt_call_average=mean(cp);
bsmt_call_deviation=std(cp);
end
display (call_price)
display (bsmt_call_average)
display (bsmt_call_deviation)
figure (1)
subplot (2,2,1)
plot (S)
subplot (2,2,2)
scatter (SS,C)
subplot (2,2,3)
histogram(SS,200)
subplot (2,2,3) 
histogram (SS,200)
subplot(2,2,4)
histogram(cp,10)
        

