VCWASM

Volunteer Computing with WebAssembly

Protótipo de Sistema Distribuidor de Tarefas para plataformas de computação voluntária.

Principais Funcionalidades:

• Submissão de aplicações em C/C++ compiladas para WebAssembly
• Arquivos relacionados a dados que deverão ser processados
• Mecanismo simples para consulta e validação de resultados

Desenvolvido utilizando o Ruby on Rails e as aplicações que são submetidas ao mesmo para serem executadas devem estar compiladas em WebAssembly.

Para gerar os binários em WebAssembly, pode se utilizar o Emscripten para compilar códigos nas linguagens de programação C e C++.

Existe um modelo de aplicação no diretório templates/

Utilizamos o PostgreSQL na versão 9.3.18 para a persistência de resultados das instâncias que são executadas.