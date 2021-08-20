program converteTemperatura;

var 
    TC, TF: real;
begin
    Writeln('Digite a temperatura em Celsius: ');
    Readln(TC);
    TF := ((TC * 9) / 5) + 32;
    Writeln('A temperatura em F eh...:', TF:0:2);
end.