%% Task 2 
clear a;
clear Voltage;
a = arduino;

Temp_Coef = 10e-3;
V_0deg = 0.5;
t = 1;

 figure
    hold on
    xlabel('Time [s]')
    ylabel('Temperature [°C]')
    title('Plot of Temperature by Time')

tic;
while true
    Temp = Temp_monitor(a,V_0deg,Temp_Coef)
    if Temp>20
        for k = 1:(t/0.25)
        writeDigitalPin(a,"D13",1)
        writeDigitalPin(a,"D13",0)
        pause(0.25)
        end

    elseif Temp>=19.5 && Temp<=20
        writeDigitalPin(a,"D7",1) 
        pause(t)
        writeDigitalPin(a,"D7",0)

    else   
        for l = 1:(t/0.5)
        writeDigitalPin(a,"D10",1)
        writeDigitalPin(a,"D10",0)
        pause(0.5)
        end
    end
end
