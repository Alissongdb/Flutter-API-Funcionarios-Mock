# Flutter API funcionarios

Projeto BeTalent de captura de dados dos funcionarios de uma api mockada e apresentadas na tela podendo os funcionarios serem filtrados por nome, cargo e telefone.

Pre-requisitos para rodar o projeto:

- Realizar um clone do projeto e ao abrir este projeto, sobre o terminal rode os comandos:

- flutter pub add json_rest_server
- flutter pub add http
- flutter pub add intl

Com isso serao instalados os packages utilizados no projeto, sendo eles:

- json_rest_server: ^3.2.1
- http: ^1.2.2
- intl: ^0.19.0

- Instalar o pacote node para rodar a api mockada atraves do comando (sudo yum install -y nodejs) no MacOS

- Copiar o database.json deste repositorio, para dentro do projeto.
- https://github.com/BeMobile/desafio-mobile => database.json


Como rodar a aplicacao apos os passos acima serem completos:

Antes de executar a aplicacao rode o seguinte comando:

- npx json-server database.json para rodar a api localmente.

---

Packages utilizados:
- json_rest_server: ^3.2.1
- http: ^1.2.2
- intl: ^0.19.0

json_rest_server para rodar o projeto localmente.
http para utilizar os comandos do http e buscar os dados da API.
intl para usar os comandos de format para formatar o telefone e data de admissao.