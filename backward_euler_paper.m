clc;
clear all;
clear vars;

%Explicit Euler Method:
y0_e=0; %initial value of the function
t0_e=0; %starting limit
tfinal_e=25; %ending limit
h_e=0.25 ; %step size
y_e= y0_e; % setting the function value to the initial value
F=@(t,y_e) 50*(cos(t)-y_e); %defining the function
yout_e = y_e; %setting the output value
tvec = t0_e : h_e : tfinal_e-h_e; %plot vector for X axis
for t = t0_e : h_e : tfinal_e-h_e %for loop for solving the equation
         s = F(t,y_e); %finding the slope
         y_e = y_e + h_e*s; %obtaining new y
         yout_e = [yout_e; y_e]; % adding with the output       
end
%plot of explicit euler function:
plot(tvec,yout_e(1:end-1));
xlim([0 1])
ylim([0 1])
hold on

%implicit euler:
t0=0.0;
t_stop=1.0;
t_span=[ t0,t_stop];
y0=0.0;
n=25;
dt=(t_stop-t0)/n;
t1(1)=t0;
y1(1)=y0;
y(1)=y0;
tvec=t0:dt:t_stop;
for i=1:n
t1( i +1)=t1(i)+dt;
y1(i+1)=(y1(i)+dt*50.0*cos(t1(i+1)))/(1.0+50.0*dt);
end
plot(tvec,y1)
hold on

%analytical function plot:
fplot(@(t) 50*((sin(t)+50*cos(t)-50*exp(-50*t))/2501),[0 1],'b');
hold off