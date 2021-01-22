clear all;
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
%%%%
Mon(isnan(Mon))=0;
[ii,jj]=find(~Mon);
ii=unique(ii);
Mon(ii,:)=[];
%%
Wed(isnan(Wed))=0;
[ii,jj]=find(~Wed);
ii=unique(ii);
Wed(ii,:)=[];
%%
Thu(isnan(Thu))=0;
[ii,jj]=find(~Thu);
ii=unique(ii);
Thu(ii,:)=[];
%%
Fri(isnan(Fri))=0;
[ii,jj]=find(~Fri);
ii=unique(ii);
Fri(ii,:)=[];
%%
Sat(isnan(Sat))=0;
[ii,jj]=find(~Sat);
ii=unique(ii);
Sat(ii,:)=[];
%%
Sun(isnan(Sun))=0;
[ii,jj]=find(~Sun);
ii=unique(ii);
Sun(ii,:)=[];