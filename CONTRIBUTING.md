# Guia de Contribuicao

Observacao: Somente contribuições que seguem estes requisitos serão aceitos.


# Tipos 

## Reporte de Bugs
Para abrir bugs, certifique-se que não existe nenhum igual  aberto em [Github issues](https://github.com/Flutterando/getapps/issues)
- Descrição detalhada do problema
- Passos para reproduzir o problema
- Versão do código em que encontrou o problema
- Comportamento esperado
- Capturas de tela ou logs, se aplicável
- Informações sobre o ambiente onde ocorreu o problema

## Correcao de problemas 
Para contribuir com correções de problemas:
1. Verifique se o problema já foi reportado em [Github issues](https://github.com/Flutterando/getapps/issues).
2. Selecione um issue que você gostaria de resolver.
3. Comente no issue para solicitando para trabalhar na correção.
4. Siga as instruções na seção "Como Contribuir" abaixo para enviar sua correção.

## Novas funcionalidades
Para solicitar novas funcionalidades, faca uma breve descricao sobre a funcionalidade em [Github issues](https://github.com/Flutterando/getapps/issues)
- Uma descrição clara da funcionalidade desejada
- Aguarde a avaliação do time sobre a implementação da funcionalidade

## Documentacao
Caso queira contribuir com a documentacao ou alguma melhoria:
1. Abra uma (issue)[https://github.com/Flutterando/getapps/issue].
2. Faça as alterações ou adição.
3. Siga as instruções na seção "Como Contribuir" abaixo para enviar suas atualizações.


# Como Contribuir
1. **Fork o repositório**: Clique no botão "Fork" no canto superior direito da página do repositório.
2. **Clone o repositório**: Clone o seu fork localmente usando o comando:
    ```sh
    git clone https://github.com/seu-usuario/seu-fork.git
    ```
3. **Crie uma branch**: Crie uma nova branch para a sua contribuição:
    ```sh
    git checkout -b minha-contribuição
    ```
4. **Faça as alterações**: Faça as alterações necessárias no código.
5. **Commit suas alterações**: Commit suas alterações com uma mensagem descritiva:
    ```sh
    git commit -m "Descrição das minhas alterações"
    ```
6. **Envie para o seu fork**: Envie suas alterações para o seu fork no GitHub:
    ```sh
    git push origin minha-contribuicao
    ```
7. **Abra um Pull Request**: No repositório original, clique no botão "New Pull Request" e selecione a sua branch.
   1. O titulo da pull request deve sempre seguir o padrao do [commit semantico](https://www.conventionalcommits.org/en/v1.0.0/)


## Requisitos 
- Formatar o código de acordo com o arquivo `analysis_options.yaml`.
- Certifique-se de que o código está bem documentado.
- Escreva testes para suas alterações e certifique-se de que todos os testes existentes passam.
