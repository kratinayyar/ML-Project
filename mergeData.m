clear;    
C=[];
anomaly=[];
for i = 61:61
    name=['real_' num2str(i) '.csv'];
    X=importdata(name);
    A=X.data(:,1);
    anomaly=[anomaly;X.data(:,3)];
    B=X.data(:,2);
   
    B=B-mean(B);
    pks=findpeaks(B);
    maxP = mean(pks);
    minP = mean(findpeaks(B*-1));
    factor=((minP)+(maxP))/2;
    B=B/factor;
   % figure(i);
   % plot(A,B);
    C=[C;B];
   
    %
end
maxC=max(C);
anomaly=maxC*anomaly;
Ax=(1:1:length(anomaly))';
%csvwrite('combinedData.csv',[Ax,C,anomaly]);
figure(1);
y=[C,anomaly];
%scatter(Ax,anomaly)
%hold on
plot(Ax,y);
%hold off

figure(2);
y=[abs(fft(C)),anomaly];
plot(Ax,y);



