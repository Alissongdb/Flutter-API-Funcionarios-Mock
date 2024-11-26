# Flutter API funcionarios

Projeto BeTalent de captura de dados dos funcionarios de uma api mockada e apresentadas na tela podendo os funcionarios serem filtrados por nome, cargo e telefone.
-
# Pre-requisitos para rodar o projeto:

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

--

# Como rodar a aplicacao apos os passos acima serem completos:

Antes de executar a aplicacao rode o seguinte comando:

- npx json-server database.json para rodar a api localmente.

--

Arquitetura utilizada: MVC

Packages utilizados:
- json_rest_server: ^3.2.1
- http: ^1.2.2
- intl: ^0.19.0

* json_rest_server para rodar o projeto localmente.
* http para utilizar os comandos do http e buscar os dados da API.
* intl para usar os comandos de format para formatar o telefone e data de admissao.

-


Splash:

![image](https://github.com/user-attachments/assets/fadef26f-1716-4dd5-8c8f-1c07b7d7f160)

Home:

![image](https://github.com/user-attachments/assets/7e648080-e99c-443d-8c09-5f68277c0d01)

ExpansionTile:

![image](https://github.com/user-attachments/assets/cfc36d80-3a26-4826-868b-39fa61c079dd)

Filtragem por nome:

![image](https://github.com/user-attachments/assets/97316386-2c1e-4938-8832-8358fa455c5c)

Filtragem por telefone:

![image](https://github.com/user-attachments/assets/787c2b31-2c17-431e-85c5-cf28318cc339)

Filtragem por cargo:

![image](https://github.com/user-attachments/assets/710ca75e-296b-4ff7-b24c-7c8ff3ebd6ca)








