program JogoDaVelha;

// declarando o tipo matriz (semelhando ao typedef do C)
type matriz = array [1..3,1..3] of char;

// inicialização de variáveis
var
    board : matriz;
    i, j : integer;
    linha, coluna : integer;
    pieceCount : integer = 0;
    jogador : integer = 1;
    piece : char;

// preenche valores iniciais no tabuleiro
procedure preencher(var board : matriz);
begin

    for i := 1 to 3 do
    begin
        for j := 1 to 3 do
        begin

            board[i][j] := '-';
                    
        end;
    end;

end;

// exibe o tabuleiro com as peças jogadas até o momento
procedure exibir(var board : matriz);
begin

    for i := 1 to 3 do
    begin
        write('| ');
        for j := 1 to 3 do
        begin
            if(board[i][j] <> '-') then write( board[i][j] )
            else write(' ');
            write(' | ');      
        end;
        writeln();
    end;

end;

// verifica e valida a entrada até que o usuário entre com valores válidos
procedure validarEntrada(tipo : String; var entrada : integer);
begin
    entrada := 0;
    while(entrada < 1) or (entrada > 9) do
    begin
        write('Digite a ', tipo, ': ');
        readln(entrada);
    end;
end;

// insere uma peça no tabuleiro, incrementando a quantidade e mudando de jogador
procedure playPiece(linha : integer; coluna : integer; var jogador : integer; var board : matriz);
begin

    if(jogador = 1) then
    begin
        board[linha][coluna] := 'X';
        jogador := jogador+1;
    end

    else 
    begin
        board[linha][coluna] := 'O';
        jogador := jogador-1;
    end;

    pieceCount := pieceCount + 1;

end;

// verifica se ganhou pela diagonal principal
function ganhouDiagonalPrincipal(var board : matriz) : boolean;

var cont1 : integer = 0;
var cont2 : integer = 0;

begin
    ganhouDiagonalPrincipal := false;
    for i := 1 to 3 do
        begin
        for j := 1 to 3 do
            begin
                if (i = j) then
                    begin

                    if (board[i][j] = 'X') then cont1 += 1
                    else if (board[i][j] = 'O') then cont2 += 2;

                    end;
            end;
        end;

    Writeln('Passou por aqui: ');
    Writeln(cont1);
    Writeln(cont2);

    if (cont1 = 3) then
        ganhouDiagonalPrincipal := true
    else if (cont2 = 3) then
        ganhouDiagonalPrincipal := true;

end;

// chama as duas funções de verificação de vitória
function ganhou() : boolean;
begin
    if(ganhouDiagonalPrincipal = true) then ganhou := true; 
end;

// programa principal (main)
begin
  
    preencher(board);
    
    writeln('-=-=-=-=-=-=- Jogo da Velha -=-=-=-=-=-');
    writeln();


    linha := 1;
    coluna := 1;

    while (pieceCount < 9) and (ganhou = false) do
    begin
        exibir(board);
        writeln();
        ganhouDiagonalPrincipal(board);
        writeln('JOGADOR: ', jogador);
        writeln();
        validarEntrada('linha', linha);
        validarEntrada('coluna', coluna);

        if(board[linha][coluna] <> '-') then 
        begin
            writeln();
            writeln('Posicao ja possui valor. Tente novamente');
        end

        else playPiece(linha, coluna, jogador, board);

        writeln();
        writeln('------------------------');
        writeln();
    end;

    exibir(board);
    writeln();

end.