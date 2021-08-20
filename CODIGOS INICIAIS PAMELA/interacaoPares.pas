program interacaoPares.pas;
var 
    I : Integer;
begin
    for I:= 1 to 10 do
    begin
        if I MOD 2 = 0 then
          Writeln(I);
    end;
end.