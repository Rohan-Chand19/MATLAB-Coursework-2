% find voltage in thermistor to find a value of temperature using the
% coefficients
% Temp Coefficient = 10mV/°c or 19.5mV/°c for now go with 10mV/°c
clear a;
clear Voltage;
a = arduino;
duration = 1:60;
Temp_Coef = 10e-3;
V_0deg = 0.5;
for k = duration
    pause(0.01)
Voltage(k) = readVoltage(a,"A1");
end
Temp = (Voltage-V_0deg)/Temp_Coef;

min_Temp = min(Temp);
max_Temp = max(Temp);
Avg_Temp = mean(Temp);

plot(duration,Temp)
axis([0 max(duration) 0 70])
xlabel('time [s]')
ylabel('Temperature [°C]')

% clear Voltage 
%%
Location = input(['Please Input Location Name: '],'s');
Date = datetime("today");

D = sprintf('Data logging initiated - %s',Date);
disp(D)

L = sprintf('Location - %s\n', Location);
disp(L)


for i = [0:6:60]
    minute = i/6;
    Min = sprintf('Minute         %1.0f', minute);
    disp(Min)

    u = i;
    if u<= 0
        u = u+1;
    end
    T = sprintf('Temperature    %4.2f°C\n',Temp(u));
    disp(T)

end


q = sprintf('The minimum temperature recorded was %4.2f°C', min_Temp);
disp(q)
p = sprintf('The maximum temperature recorded was %4.2f°C', max_Temp);
disp(p)
r = sprintf('The average temperature recorded was %4.2f°C', Avg_Temp);
disp(r)


%%
OpenFile = fopen('capsule_temperature.txt',"w");
fprintf(OpenFile,'%s\n',D);
fprintf(OpenFile,'%s\n',L);
for i = [0:6:60]
    minute = i/6;
    Min = fprintf(OpenFile,'Minute         %1.0f\n', minute);
    disp(Min)

    u = i;
    if u<= 0
        u = u+1;
    end
    T = fprintf(OpenFile,'Temperature    %4.2f°C\n\n',Temp(u));
    disp(T)

end

fprintf(OpenFile,'The minimum temperature recorded was %4.2f°C \n', min_Temp);
fprintf(OpenFile,'The maximum temperature recorded was %4.2f°C \n', max_Temp);
fprintf(OpenFile,'The average temperature recorded was %4.2f°C \n', Avg_Temp);


fclose(OpenFile);

edit("capsule_temperature.txt");


