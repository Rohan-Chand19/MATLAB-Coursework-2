clear a;
clear Voltage;
a = arduino;

Temp_Coef = 10e-3;
V_0deg = 0.5;
t = 1;

tic;
oldtime = toc;
oldvolt = readVoltage(a,"A1");
oldtemp = (oldvolt-V_0deg)/Temp_Coef;


while true 
    y = temp_prediction(a,oldtemp,oldtime);

if y>4
    writeDigitalPin(a,"D7",0)
    writeDigitalPin(a,"D10",0)
    writeDigitalPin(a,"D13",1)
    pause(t) 
end


if y<-4
    writeDigitalPin(a,"D7",0)
    writeDigitalPin(a,"D13",0)
    writeDigitalPin(a,"D10",1)
    pause(t)
end


if y<4 && y>-4 % use 0.4 and -0.4 for better results
    writeDigitalPin(a,"D10",0)
    writeDigitalPin(a,"D13",0)
    writeDigitalPin(a,"D7",1)
    pause(t)
end
end
