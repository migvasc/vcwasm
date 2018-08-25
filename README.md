# VCWASM

# Volunteer Computing with WebAssembly

## Protótipo de Sistema Distribuidor de Tarefas para plataformas de computação voluntária.

## Principais Funcionalidades:

� Submiss�o de aplica��es em C/C++ compiladas para WebAssembly

� Arquivos relacionados a dados que dever�o ser processados

� Mecanismo simples para consulta e valida��o de resultados

Desenvolvido utilizando o Ruby on Rails e as aplica��es que s�o submetidas ao mesmo para serem executadas devem estar compiladas em WebAssembly.

Para gerar os bin�rios em WebAssembly, pode se utilizar o Emscripten para compilar c�digos nas linguagens de programa��o C e C++.

Existe um modelo de aplica��o no diret�rio templates/

Utilizamos o PostgreSQL na vers�o 9.3.18 para a persist�ncia de resultados das inst�ncias que são executadas.

Info sobre WebAssembly:
https://webassembly.org/