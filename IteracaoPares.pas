program IteracaoPares;

var
    A : integer;

begin

    WriteLn();

    for A := 1 to 10 do
        begin
            if A MOD 2 = 0 then 
                begin
                    Write(A);
                    Write(' ');
                end;
        end;
        
end.
