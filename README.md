Conversor de Moedas
Este é um aplicativo de conversão de moedas, desenvolvido em Flutter, que permite aos usuários converter valores entre diferentes moedas utilizando taxas de câmbio em tempo real. O app é ideal para quem precisa de uma ferramenta simples e prática para realizar conversões rápidas durante o dia a dia.

Funcionalidades
Conversão de moedas: Permite converter valores entre várias moedas (USD, BRL, EUR, etc.).
Interface simples e intuitiva: A interface é fácil de usar, com telas de input e exibição de resultados claros.
Cadastro de conversões realizadas: O app mantém um histórico de conversões, permitindo ao usuário visualizar transações anteriores.
API de Taxas de Câmbio: O app usa uma API de câmbio para obter taxas em tempo real e garantir a precisão das conversões.
Suporte para múltiplas moedas: A cada nova conversão, o usuário pode escolher a moeda de origem e a moeda de destino.
Tecnologias Utilizadas
Flutter: Framework de desenvolvimento para criar interfaces de usuário nativas para Android e iOS.
Dart: Linguagem de programação usada no desenvolvimento do Flutter.
JSON-Server: API fake utilizada para armazenar e recuperar as conversões realizadas.
HTTP: Para comunicação com a API e troca de dados entre o front-end e o back-end.
Instalação
Para rodar o projeto localmente, siga os passos abaixo:

Clone o repositório:

bash
Copiar código
git clone https://github.com/gustavoarnoni/app-conversor-de-moedas.git
Navegue até o diretório do projeto:

bash
Copiar código
cd conversor_de_moedas
Instale as dependências:

Se você já tem o Flutter instalado, basta rodar:

bash
Copiar código
flutter pub get
Execute o aplicativo:

Para rodar no seu emulador ou dispositivo físico, use o comando:

bash
Copiar código
flutter run
API local (JSON-Server):

O aplicativo depende de uma API de câmbio. Para rodar a API localmente, instale o json-server e inicie o servidor:

bash
Copiar código
npm install -g json-server
json-server --watch db.json --port 3000
Configuração da API:

As informações da API estão configuradas no arquivo api_service.dart.
A URL padrão para a API é http://localhost:3000/conversoes.
