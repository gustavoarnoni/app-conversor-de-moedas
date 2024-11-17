<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Conversor de Moedas</title>
</head>
<body>

    <h1>Conversor de Moedas</h1>

    <p>Este é um aplicativo de conversão de moedas, desenvolvido em Flutter, que permite aos usuários converter valores entre diferentes moedas utilizando taxas de câmbio em tempo real. O app é ideal para quem precisa de uma ferramenta simples e prática para realizar conversões rápidas durante o dia a dia.</p>

    <h2>Funcionalidades</h2>
    <ul>
        <li><strong>Conversão de moedas</strong>: Permite converter valores entre várias moedas (USD, BRL, EUR, etc.).</li>
        <li><strong>Interface simples e intuitiva</strong>: A interface é fácil de usar, com telas de input e exibição de resultados claros.</li>
        <li><strong>Cadastro de conversões realizadas</strong>: O app mantém um histórico de conversões, permitindo ao usuário visualizar transações anteriores.</li>
        <li><strong>API de Taxas de Câmbio</strong>: O app usa uma API de câmbio para obter taxas em tempo real e garantir a precisão das conversões.</li>
        <li><strong>Suporte para múltiplas moedas</strong>: A cada nova conversão, o usuário pode escolher a moeda de origem e a moeda de destino.</li>
    </ul>

    <h2>Tecnologias Utilizadas</h2>
    <ul>
        <li><strong>Flutter</strong>: Framework de desenvolvimento para criar interfaces de usuário nativas para Android e iOS.</li>
        <li><strong>Dart</strong>: Linguagem de programação usada no desenvolvimento do Flutter.</li>
        <li><strong>JSON-Server</strong>: API fake utilizada para armazenar e recuperar as conversões realizadas.</li>
        <li><strong>HTTP</strong>: Para comunicação com a API e troca de dados entre o front-end e o back-end.</li>
    </ul>

    <h2>Instalação</h2>
    <p>Para rodar o projeto localmente, siga os passos abaixo:</p>
    <ol>
        <li><strong>Clone o repositório:</strong>
            <pre><code>git clone https://github.com/gustavoarnoni/app-conversor-de-moedas.git</code></pre>
        </li>
        <li><strong>Navegue até o diretório do projeto:</strong>
            <pre><code>cd conversor_de_moedas</code></pre>
        </li>
        <li><strong>Instale as dependências:</strong>
            <pre><code>flutter pub get</code></pre>
        </li>
        <li><strong>Execute o aplicativo:</strong>
            <pre><code>flutter run</code></pre>
        </li>
        <li><strong>API local (JSON-Server):</strong> O aplicativo depende de uma API de câmbio. Para rodar a API localmente, instale o <strong>json-server</strong> e inicie o servidor:
            <pre><code>npm install -g json-server</code></pre>
            <pre><code>json-server --watch db.json --port 3000</code></pre>
        </li>
        <li><strong>Configuração da API:</strong> As informações da API estão configuradas no arquivo <code>api_service.dart</code>. A URL padrão para a API é <code>http://localhost:3000/conversoes</code>.</li>
    </ol>

    <h2>Contribuindo</h2>
    <p>Se você deseja contribuir com melhorias, correções de bugs ou novas funcionalidades, fique à vontade para abrir um <strong>pull request</strong>. Caso tenha alguma dúvida ou sugestão, abra uma <strong>issue</strong> e discutiremos as possíveis soluções.</p>

    <h2>Licença</h2>
    <p>Este projeto está licenciado sob a <a href="LICENSE">MIT License</a>.</p>

</body>
</html>
