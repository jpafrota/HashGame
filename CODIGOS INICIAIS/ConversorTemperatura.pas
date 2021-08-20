program ConversorTemperatura;

var
    TIN : real;
    TOUT : real;
    OP : integer;
begin



    WriteLn('-=-=-=-=-=- CONVERSOR DE TEMPERATURA -=-=-=-=-=-');

    OP := 1;
    
    while OP <> 0 do
        begin
            WriteLn();
            WriteLn('Digite a temperatura: ');
            ReadLn(TIN);
            WriteLn();
            WriteLn('Escolha opcao desejada:');
            WriteLn('1 - Celsius => Fahrenheint');
            WriteLn('2 - Fahrenheint => Celsius');
            WriteLn('0 - SAIR');
            ReadLn(OP);

            if OP = 1 then
                begin
                    TOUT := ((TIN * 9) / 5) + 32;
                    WriteLn('a temperatura e: ');
                    Write(TOUT:0:2);

                end

            else if OP = 2 then
                begin
                    TOUT := ((TIN - 32) * 5) / 9;
                    WriteLn('a temperatura e: ');
                    Write(TOUT:0:3);
                end

            else if OP <> 0 then
                WriteLn('OPCAO INVALIDA');

        end;
        
end.
