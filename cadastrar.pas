Program cadastrar;
uses crt;
var i,option:integer;

//=============================================//
//==============|   BORDAS   |=================//
//=============================================//

	procedure bordas;
		begin
			textcolor(4);
			gotoxy(4,2);writeLn('||==============================================||');
			for i:= 2 to 21 do
				begin
					gotoxy(4,i+1);writeLn('||                      ||                      ||');
				end;
			gotoxy(4,22);writeLn('||==============================================||');
			gotoxy(4,18);writeLn('||==============================================||');
			
			{ESCREVER INFORMAÇÕES NA BORDAS}
			textcolor(2);
			gotoxy(8,4);writeLn('1 - COD:   ');
			gotoxy(8,6);writeLn('2 - NOME:  ');
			gotoxy(8,8);writeLn('3 - IDADE: ');
			gotoxy(8,10);writeLn('4 - SEXO: ');
			gotoxy(8,12);writeLn('5 - DATA NASC.: ');
			gotoxy(8,14);writeLn('6 - ESTADO CIVIL: ');
			gotoxy(8,16);writeLn('7 - CPF: ');
			gotoxy(8,20);writeLn('0 - Sair');
			gotoxy(32,20);writeLn('9 - Salvar');
		end;
		
//=============================================//
//=============| SALVAR - SAVE |===============//
//=============================================//
	
	procedure salvar(cod:integer; nome:string; idade:integer; sexo:char; dnasc:integer; estdc:string; cpf:integer);
		var
			Myfile:text;
			nome_arq:string;
		begin		
    	//Assign
			Assign(Myfile, nome+'.txt'); {Concatena com a variavel cod e salva com o nome dela}
    	Rewrite(MyFile);
    		//Escrever
    	  writeLn(Myfile,' ',cod,' ',nome,' ',idade,' ',sexo,' ',dnasc,' ',estdc,' ',cpf);
    	
    	close(Myfile);

		end;

//=============================================//
//===============| CADASTRAR |=================//
//=============================================//
	procedure cadastrar;
		var
			opc,cod,dnasc,cpf,idade:integer;
			nome,estdc:string;
			sexo:char;
		Begin
			repeat
			repeat
				bordas(); {CHAMAR PROCEDURE BORDAS}	
					  			
				{PRINTAR MENSAGENS}
				textcolor(2);
				begin gotoxy(32,4);writeLn(cod); end;
				begin gotoxy(32,6);writeLn(nome); end;
				begin gotoxy(32,8);writeLn(idade); end;
				begin gotoxy(32,10);writeLn(sexo); end;
				begin gotoxy(32,12);writeLn(dnasc); end;
				begin gotoxy(32,14);writeLn(estdc); end;
				begin gotoxy(32,16);writeLn(cpf); end;				
				gotoxy(4,24);write('Escolha uma opção: ');readLn(opc);
			  
				case opc of
					1:begin gotoxy(32,4); read(cod); end;
				  2:begin gotoxy(32,6); read(nome);end;
				  3:begin gotoxy(32,8); read(idade);end;
				  4:begin gotoxy(32,10); read(sexo);end;
				  5:begin gotoxy(32,12); read(dnasc);end;
				  6:begin gotoxy(32,14); read(estdc);end;
				  7:begin gotoxy(32,16); read(cpf);end;
				  9:begin salvar(cod,nome,idade,sexo,dnasc,estdc,cpf); textcolor(4); gotoxy(4,26);writeLn('Salvo Com Sucesso!') end;
				  0:begin end;
				end;
											 
			until(opc = 0);
			until (opc < 9);
		  clrscr;
		  
		end;

//=============================================//
//===============| VEREFICAR |=================//
//=============================================//

	Procedure vereficar;
		var
		opc,cod,dnasc,cpf,idade:integer;
		nome,estdc:string;
		sexo:char;
		
		begin
			clrscr;
			bordas();
			gotoxy(4,24);write('Digite o  Cod. da pessoa a ser buscada: ');read(cod);
			begin gotoxy(32,4); writeLn(cod); end;
			begin gotoxy(32,6); writeLn(nome);end;
			begin gotoxy(32,8); writeLn(idade);end;
			begin gotoxy(32,10); writeLn(sexo);end;
			begin gotoxy(32,12); writeLn(dnasc);end;
			begin gotoxy(32,14); writeLn(estdc);end;
			begin gotoxy(32,16); writeLn(cpf);end;			
			
		end;
		
//=============================================//
//================| ALTERAR |==================//
//=============================================//

  Procedure alterar;
		var
		cod: integer;
		
		begin
			clrscr;
			bordas();
			textcolor(2);
			gotoxy(4,24);write('Digite o  Cod. da pessoa a ser buscada: ');read(cod);
			
		end;
		
//=============================================//
//================| EXCLUIR |==================//
//=============================================//
	
  Procedure excluir;
		var
		cod: integer;
		
		begin
			clrscr;
			bordas();
			textcolor(2);
			gotoxy(4,24);write('Digite o  Cod. da pessoa a ser buscada: ');read(cod);
			
		end;
			
//=============================================//
//============| BEGIN - INICIO |===============//
//=============================================//  

Begin
	repeat
		repeat
			clrscr; {LIMPAR PARA EVITAR QUE RETORNE PARTES DE OUTRA PROCEDURE}
			//CONSTRUIR BORDAS
			textcolor(4);
			gotoxy(4,2);writeLn('||==============================================||');
			
			for i:= 2 to 13 do
				begin
					gotoxy(4,i+1);writeLn('||                                              ||');
				end;
			gotoxy(4,14);writeLn('||==============================================||');
					
				{NOME}
				textcolor(2);
				gotoxy(8,4);writeLn('1 - CADASTRAR');
				gotoxy(8,6);writeLn('2 - VEREFICAR');
				gotoxy(8,8);writeLn('3 - ALTERAR');
				gotoxy(8,10);writeLn('4 - EXCLUIR');
				gotoxy(8,12);writeLn('0 - SAIR');
				gotoxy(4,16);write('Escolha uma opção: ');readLn(option);
				
				case option of
					1: cadastrar;
					2: vereficar;
					3: alterar;
					4: excluir;
					0: exit;
				end;
		until (option = 0); {Sempre que sair da estrutura case, ele retorna ate que a opção seja 0}
	until((option < 0) and (option > 4)); {Caso a opção seja diferente das possiveis ele pede para que o usuario digite novamente a opção}
	
//=============================================//
//===============| END - FIM |=================//
//=============================================//    
End.