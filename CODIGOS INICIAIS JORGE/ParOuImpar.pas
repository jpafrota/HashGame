program ParOuImpar;

var

    A : integer;

begin
  
    ReadLn(A);

    if A MOD 2 = 0 then
        WriteLn('Par')
    else
        begin
            WriteLn('Veja, nem tudo eh perfeito.');
            WriteLn('Impar');
        end;

end.