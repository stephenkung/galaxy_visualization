clc;
clear;
format long
Um=0.3;
Uk=0;
Uv=0.7;         %基本参数赋值
z=csvread('shixi_gliming.csv',0,6,'G1..G44103');%导入红移z
for i=1:44103
DC(i)=quad('integrand',0,z(i),0.00001);   %计算积分
    DM(i)=DC(i);      %因为k=0
 DL(i)=(1+z(i))*DM(i);            %计算光度距离
end
dered_r=csvread('shixi_gliming.csv',0,4,'E1..E44103');   %导入视星等r
for i=1:44103
    if z(i)<0.1
        p0=-0.194858;
        p1=0.912570;
    else
        p0=-0.242659;
        p1=1.38731;
    end
     M(i)=dered_r(i)-5*log10(DL(i))-25-(p0+p1*z(i))-1.62*(z(i)-0.1);%计算绝对星等M
end
 csvwrite('M',M);
dered_g=csvread('shixi_gliming.csv',0,3,'D1..D44103');   %导入视星等g
col=dered_g-dered_r;
figure(1);
plot(z,M,'r.','MarkerSize',5);
legend('绝对星等对红移');xlabel('红移z');ylabel('绝对星等M');   %绝对星等对红移
figure(2);
plot(M,col,'r.','MarkerSize',5);axis([-25 -10 -2 4]);
legend('颜色对绝对星等');xlabel('绝对星等M');ylabel('颜色c');   %颜色对星等
pause;
i=1;n=1;p=1;q=1;s=1;u=1;v=1;l=1;
ra=csvread('shixi_gliming.csv',0,1,'B1..B44103');   %导入经度
for k=1:44103
        if M(k)>-24&M(k)<=-23
            ra1(i)=ra(k);z1(i)=z(k);col1(i)=col(k);M1(i)=M(k);
            i=i+1;
        end
end
        figure(3);
   theta1=ra1*3.14159/180;
    rho1=z1;
    polar(theta1,rho1,'r.');title('-24<M<=-23');
pause;             %画第三张图
for k=1:44103        
        if M(k)>-23&M(k)<=-22
            ra2(l)=ra(k);z2(l)=z(k);col2(l)=col(k);M2(l)=M(k);
            l=l+1;
        end
end
figure(4);
   theta2=ra2*3.14159/180;
    rho2=z2;
    polar(theta2,rho2,'m.');title('-23<M<=-22');
pause;        %画第四张图
for k=1:44103  
        if M(k)>-22&M(k)<=-21
            ra3(n)=ra(k);z3(n)=z(k);col3(n)=col(k);M3(n)=M(k);
            n=n+1;
        end
end
figure(5);
   theta3=ra3*3.14159/180;
    rho3=z3;
    polar(theta3,rho3,'y.');title('-22<M<=-21');
pause;            %画第五张图
for k=1:44103  
        if M(k)>-21&M(k)<=-20
            ra4(p)=ra(k);z4(p)=z(k);col4(p)=col(k);M4(p)=M(k);
            p=p+1;
        end
end
figure(6);
   theta4=ra4*3.14159/180;
    rho4=z4;
    polar(theta4,rho4,'g.');title('-21<M<=-20');
pause;           %画第六张图
for k=1:44103 
         if M(k)>-20&M(k)<=-19
            ra5(q)=ra(k);z5(q)=z(k);col5(q)=col(k);M5(q)=M(k);
            q=q+1;
         end
end
figure(7);
   theta5=ra5*3.14159/180;
    rho5=z5;
    polar(theta5,rho5,'c.');title('-20<M<=-19');
pause;         %画第七张图
for k=1:44103 
        if M(k)>-19&M(k)<=-18
            ra6(s)=ra(k);z6(s)=z(k);col6(s)=col(k);M6(s)=M(k);
            s=s+1;
        end
end
figure(8);
   theta6=ra6*3.14159/180;
    rho6=z6;
    polar(theta6,rho6,'b.');title('-19<M<=-18');
pause;           %画第八张图
for k=1:44103 
        if M(k)>-18&M(k)<=-17
            ra7(u)=ra(k);z7(u)=z(k);col7(u)=col(k);M7(u)=M(k);
            u=u+1;
        end
end
figure(9);
   theta7=ra7*3.14159/180;
    rho7=z7;
    polar(theta7,rho7,'k.');title('-18<M<=-17');
pause;           %画第九张图
for k=1:44103 
        if M(k)>-17&M(k)<=-16
            ra8(v)=ra(k);z8(v)=z(k);col8(v)=col(k);M8(v)=M(k);
            v=v+1;   
    end
end
figure(10);
   theta8=ra8*3.14159/180;
    rho8=z8;
    polar(theta8,rho8,'r.');title('-17<M<=-16');
  pause;            %画第十张图
figure(11)
 polar(theta1,rho1,'r.');
 hold on
 polar(theta2,rho2,'m.');
 hold on
 polar(theta3,rho3,'y.');
 hold on
 polar(theta4,rho4,'g.');
 hold on
 polar(theta5,rho5,'c.');
 hold on
 polar(theta6,rho6,'b.');
 hold on 
 polar(theta7,rho7,'k.');
 hold on
 polar(theta8,rho8,'w.');title('-24<M<-16');%八张图绘在一起
 pause;
figure(12);
i=size(z1);w=1;t=1;
for j=1:i(1,2)
     if col1(j)>-0.1328*M1(j)-1.991
        theta11(w)=theta1(j);rho11(w)=rho1(j);w=w+1;
     else 
         theta12(t)=theta1(j);rho12(t)=rho1(j);t=t+1;
     end
end
  polar(theta11,rho11,'r.');
 hold on
 polar(theta12,rho12,'b.');
 pause;    %画第一幅图
 figure(13);
 l=size(z2);w=1;t=1;
 for j=1:l(1,2)
     if col2(j)>-0.1328*M2(j)-1.991
         theta21(w)=theta2(j);rho21(w)=rho2(j);w=w+1;
     else 
         theta22(t)=theta2(j);rho22(t)=rho2(j);t=t+1;
     end
 end
  polar(theta21,rho21,'r.');
 hold on
 polar(theta22,rho22,'b.');
 pause;  %画第二幅图
 figure(14);
  n=size(z3);w=1;t=1;
 for j=1:n(1,2)  
     if col3(j)>-0.1328*M3(j)-1.991
         theta31(w)=theta3(j);rho31(w)=rho3(j);w=w+1;
     else 
        theta32(t)=theta3(j);rho32(t)=rho3(j);t=t+1;
     end     
 end
 polar(theta31,rho31,'r.');
 hold on
 polar(theta32,rho32,'b.');
 pause;  %画第三幅图
 figure(15);
p=size(z4);w=1;t=1;
 for j=1:p(1,2)
     if col4(j)>-0.1328*M4(j)-1.991
         theta41(w)=theta4(j);rho41(w)=rho4(j);w=w+1;
     else 
         theta42(t)=theta4(j);rho42(t)=rho4(j);t=t+1;
     end
 end
 polar(theta41,rho41,'r.');
 hold on
 polar(theta42,rho42,'b.');
 pause;  %画第四幅图
 figure(16);
 q=size(z5);w=1;t=1;
 for j=1:q(1,2)
     if col5(j)>-0.1328*M5(j)-1.991
        theta51(w)=theta5(j);rho51(w)=rho5(j);w=w+1; 
     else 
      theta52(t)=theta5(j);rho52(t)=rho5(j);t=t+1;   
     end
 end
 polar(theta51,rho51,'r.');
 hold on
 polar(theta52,rho52,'b.');
 pause;  %画第五幅图
 figure(17);
 s=size(z6);w=1;t=1;
 for j=1:s(1,2)
     if col6(j)>-0.1328*M6(j)-1.991
        theta61(w)=theta6(j);rho61(w)=rho6(j);w=w+1;  
     else 
       theta62(t)=theta6(j);rho62(t)=rho6(j);t=t+1;     
     end
 end
  polar(theta61,rho61,'r.');
 hold on
 polar(theta62,rho62,'b.');
 pause;  %画第六幅图
 figure(18);
  u=size(z7);w=1;t=1;
 for j=1:u(1,2)
     if col7(j)>-0.1328*M7(j)-1.991
         theta71(w)=theta7(j);rho71(w)=rho7(j);w=w+1;  
     else 
       theta72(t)=theta7(j);rho72(t)=rho7(j);t=t+1;     
     end
 end
  polar(theta71,rho71,'r.');
 hold on
 polar(theta72,rho72,'b.');
 pause;  %画第七幅图
 figure(19);
 v=size(z8); w=1;t=1;
 for j=1:v(1,2)
     if col8(j)>-0.1328*M8(j)-1.991
        theta81(w)=theta8(j);rho81(w)=rho8(j);w=w+1;  
     else 
         theta82(t)=theta8(j);rho82(t)=rho8(j);t=t+1; 
     end
 end
  polar(theta81,rho81,'r.');
 hold on
 polar(theta82,rho82,'b.');
 pause;  %画第八幅图
 figure(20);
 w=1;t=1;
 for j=1:44103
     if col(j)>-0.1328*M(j)-1.991
         theta_x(w)=ra(j)*3.14159/180;
         rho_x(w)=z(j);w=w+1;
     else 
         theta_y(t)=ra(j)*3.14159/180;
         rho_y(t)=z(j);t=t+1;
     end
 end
 polar(theta_x,rho_x,'r.');
 hold on
 polar(theta_y,rho_y,'b.');

另附函数文件：integrand.M

function y=integrand(x)
DH=3000/0.71;
Um=0.3;
Uk=0;
Uv=0.7;
y=DH*1./sqrt(Um*(1+x).^3+Uk*(1+x).^2+Uv);