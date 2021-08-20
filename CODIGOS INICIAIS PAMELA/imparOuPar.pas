program imparOuPar; 

var 
  I : integer;

begin

  Writeln('==== PROGRAMA: PAR OU IMPAR ==== ');
  Writeln('Insira um valor inteiro ');
  Readln(I);

  if I MOD 2 = 0 then
    Writeln('O numero digitado eh par')
  else 
    Writeln('O numero digitado eh impar')
    
end.