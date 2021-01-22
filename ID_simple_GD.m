clear all;
clf;
data= xlsread("Data_1.xlsx");
data(:,1)=data(:,1)-43466+2;
Sun=zeros(52,96);
Mon=zeros(52,96);
Tue=zeros(52,96);
Wed=zeros(52,96);
Thu=zeros(52,96);
Fri=zeros(52,96);
Sat=zeros(52,96);
for i=1:size(data,1)
    if rem(data(i,1),7)==0
        a=fix(data(i,1)/7);
        b=data(i,2)+1;
        Sun(a,b)=data(i,3);
    end
    if rem(data(i,1),7)==1
        a=fix(data(i,1)/7);
        b=data(i,2)+1;
        Mon(a,b)=data(i,3);
    end
    if rem(data(i,1),7)==2
        a=fix(data(i,1)/7)+1;
        b=data(i,2)+1;
        Tue(a,b)=data(i,3);
    end
    if rem(data(i,1),7)==3
        a=fix(data(i,1)/7)+1;
        b=data(i,2)+1;
        Wed(a,b)=data(i,3);
    end
    if rem(data(i,1),7)==4
        a=fix(data(i,1)/7)+1;
        b=data(i,2)+1;
        Thu(a,b)=data(i,3);
    end
    if rem(data(i,1),7)==5
        a=fix(data(i,1)/7)+1;
        b=data(i,2)+1;
        Fri(a,b)=data(i,3);
    end
    if rem(data(i,1),7)==6
        a=fix(data(i,1)/7)+1;
        b=data(i,2)+1;
        Sat(a,b)=data(i,3);
    end
end

Tue(isnan(Tue))=0;

[ii,jj]=find(~Tue);
ii=unique(ii);
Tue(ii,:)=[];

[ii,jj]=find(~Tue);
%plot for monday
x=[1:96]/96*24;
for i=1:size(Tue,1)
    y=Tue(i,:);
    plot(x,y);

    hold on
end
X_data=zeros(52*96,1);


for i=1:52
    X_data(96*(i-1)+1:96*(i),1)=(1:96)';
    Y_data(96*(i-1)+1:96*(i),1)=Tue(i,:);
end
xlabel('Time in a day', 'FontSize', 17,'FontWeight','bold');
ylabel('Traffic count', 'FontSize', 17,'FontWeight','bold');

%% mean and variance of each data point 
mean=mean(Tue,1);
S = std(Tue);
Error_upper=mean+S*5/(52)^0.5;
Error_lower=mean-S*5/(52)^0.5;
plot(x,mean);
plot(x,Error_upper);
plot(x,Error_lower);
