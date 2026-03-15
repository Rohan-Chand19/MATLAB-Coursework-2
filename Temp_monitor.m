function Temp = Temp_monitor(a,V_0deg,Temp_Coef)
% % This function checks the temperature of thermistor every second and
% displays a graph of Temperature by Time. It also uses an arduino to
% control lEDs depending on what the temperature is at the specific moment.
% It does this by using loops to convert the voltage recorded into a
% temperature and reading a value of the time and then plotting a point. It
% also checks what the temperature is and then outputs a value of 1 to the
% arduino which then causes a specific LED to light up. 
Voltage = readVoltage(a,"A1");
Time = toc; % measures time from beginning of loop
Temp = (Voltage-V_0deg)/Temp_Coef; % calulates temperature from voltage value
plot(Time, Temp,'-o')  % plots value of temp and time on graph 
drawnow
end

