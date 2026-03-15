function y = temp_prediction2(a,oldtemp,oldtime)
% This function is for task 3. It measures the temperature from the thermal resistor and the rate of change of
% temperature and displays it to the screen. It also lights up lEDs
% depending on what the value of the rate of change of temperature is, by 
% use of the arduino.It takes the initial readings of temp and time and then finds the change in
% both from previous values.

Temp_Coef = 10e-3;
V_0deg = 0.5;
newtime = toc;
newVolt = readVoltage(a,"A1"); % measures a new value of volatge 
newtemp = (newVolt-V_0deg)/Temp_Coef; % calculates temp from this voltage value

dT_dt = (oldtemp-newtemp)/(oldtime-newtime); % Calculates rate of change of temperature with respect to time 
dT_dmin = dT_dt*60;
y= dT_dmin;
EstimTemp = (dT_dmin*5)+newtemp; % finds what the temperature will be in 5 minutes if this value of rate of change of temperature stays constant 


fprintf('The current Temperature is %3.1f°C\n',newtemp); % prints temp
fprintf('The rate of change of Temperature is %3.1f°C per second\n',dT_dt); % prints change in temp per second
fprintf('The rate of change of Temperature is %3.1f°C per minute\n',dT_dmin); % prints change in temp per minute 
fprintf('At this rate, in 5 minutes the cabin temperature will be %3.1f°C\n\n', EstimTemp); % prints what the temp will be in 5 minutes time

oldtime = newtime; % sets the value of time to the old value which is used to find change in time 
oldtemp = newtemp; % sets the value of temp to old which allows us to find change in temp
end


