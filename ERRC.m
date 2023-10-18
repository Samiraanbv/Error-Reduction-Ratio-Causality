close all;
clear all;
clc;

num=300;
for e=1:2
for z=1:270

    
        ccc=zeros(1,300);
        rrr=zeros(1,300);

    for i=1:150
    rrr=normrnd(0,sqrt(0.1),1,num);
    ccc=ccc+rrr;
    end
    
    noise_u=ccc./150;
    

    u(1)=0.3937;
    u(2)=0.3273;

   for i=3:num
    u(i)=0.95*sqrt(2).*u(i-1)-0.9025.*u(i-2)+noise_u(1,i);
   end
   
   if e==2
   u=normrnd(0,sqrt(0.1),1,num);
   end
   
   y(1)=0;
    for i=2:num
    y(i)=-0.5.*u(i-1);
end

   snr(z)=-75+0.5*z;
   sigma_y=sqrt((sum(y.^2)/300)/(10^(snr(z)/10)));
   
   rr=zeros(1,300);
   cc=zeros(1,300);

   
        for i=1:150
            rr=normrnd(0,sqrt(sigma_y),1,num);
            cc=cc+rr;
        end
        
        noise_y=cc./150;
    
    
y=y+noise_y;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a(1,1)=1;
w(:,1)=u;
phi(:,1)=u;
g(1)= (sum(w(:,1).*y'))/(sum(w(:,1).^2));
err2(1)=(g(1)^2)*(sum(w(:,1).^2))/(sum(y'.^2));
N=3;

pesr(1)=(1/(1-(7*1)/(num))^2)*(1-sum(err2));
for i=2:N
    for j=i+1:300
    phi(j,i)=u(j-i);
    end
end

for k=2:N
c=0;
a(k,k)=1;    
for i=1:k-1
        a(i,k)=sum(w(:,i).*phi(:,k))/sum(w(:,i).^2);
        c=c+a(i,k).*w(:,i);
    end
    w(:,k)=phi(:,k)-c;
    g(k)=sum(w(:,k).*y')/sum(w(:,k).^2);
    err2(k)= (g(k)^2)*(sum(w(:,k).^2))/(sum(y'.^2));
pesr(k)=(1/(1-(7*k)/(num))^2)*(1-sum(err2));
end

errc(z)=sum(err2);
 
end
plot(snr,errc)
hold on;
if e==2
p=polyfit(snr,errc,1);
errc2=polyval(p,snr);
plot(snr,errc2)
end
end