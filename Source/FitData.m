clear;
Data=importdata('combinedData_labels_backup.csv');
C=Data(:,2);
D=Data(:,3);
X=1:1:length(C);
X1=find(Data(:,4)~=3);
A=Data(:,4);
A(X1)=0;
FindNAnomaly=find(Data(:,4)==3);
Normal=C;
Normal(FindNAnomaly)=[];
Anomaly=C(FindNAnomaly);
anomalyLabels=D(FindNAnomaly);
anomalyLabels=anomalyLabels/max(anomalyLabels);
Anomaly(:,2)=anomalyLabels;

Y=max(C(FindNAnomaly))*A/2;

figure (1)
plot(X,[C,Y])


[h,p] = kstest(Normal)