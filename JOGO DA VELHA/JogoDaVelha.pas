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
                        else if (board[i][j] = 'O') then cont2 += 1;

                    end;
            end;
        end;

    if (cont1 = 3) then ganhouDiagonalPrincipal := true
    else if (cont2 = 3) then ganhouDiagonalPrincipal := true;

end;

// verifica se ganhou pela diagonal secundária
function ganhouDiagonalSecundaria(var board : matriz) : boolean;

var cont1 : integer = 0;
var cont2 : integer = 0;

begin
    ganhouDiagonalSecundaria := false;
    for i := 1 to 3 do
        begin
            if (board[i][3-i+1] = 'X') then cont1 += 1

            else if (board[i][3-i+1] = 'O') then cont2 += 1;

        end;

    if (cont1 = 3) then ganhouDiagonalSecundaria := true
    else if (cont2 = 3) then ganhouDiagonalSecundaria := true;

end;

// chama as duas funções de verificação de vitória
function ganhou() : boolean;
begin
    ganhou := false;

    for i := 1 to 3 do
        begin

            if(board[i][1] = board[i][2]) and (board[i][2] = board[i][3]) and (board[i][1] <> '-') then ganhou := true;
            for j := 1 to 3 do
                begin
                    if(board[1][j] = board[2][j]) and (board[2][j] = board[3][j]) and (board[1][j] <> '-') then ganhou := true;
                end;

        end;

    if (ganhouDiagonalPrincipal(board) = true) then ganhou := true;
    if (ganhouDiagonalSecundaria(board) = true) then ganhou := true;

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

    if (ganhou = true) then
    begin
        Writeln('');
        Writeln('');
        Writeln('*  *   *   * *   * *   * *   * *   * *   * *   * *   * *   * * ');
        Writeln('* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *');
        writeln(' ** *** **** PARABENS!! VOCE GANHOU: JOGADOR ', (jogador MOD 2) + 1, '!!!!!! **** *** **');
        Writeln('*  *   *   * *   * *   * *   * *   * *   * *   * *   * *   * * ');
        Writeln('* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *');
        Writeln('');
    end
       
    else 
        begin
            Writeln('');
            Writeln('');
            Writeln('################################################################');
            Writeln('________________________________________________________________');
            writeln('                  ## NINGUEM GANHOU O JOGO! ##                  ');
            Writeln('________________________________________________________________');
            Writeln('################################################################');
            Writeln('');
        end;
        

end.