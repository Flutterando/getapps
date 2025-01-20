# GetApps ❤️

<div align="center">

[![Desenvolvido por Flutterando](https://img.shields.io/badge/Desenvolvido%20por-Flutterando-blue)](https://flutterando.com.br)
[![Versão do Flutter](https://img.shields.io/badge/Flutter-3.27+-blue)](https://flutter.dev)
[![Licença](https://img.shields.io/badge/Licença-MIT-green)](LICENSE)

</div>

## Visão Geral

GetApps é uma poderosa aplicação Flutter desenvolvida com ❤️ pela comunidade Flutterando. Este projeto demonstra práticas modernas de desenvolvimento Flutter e padrões de arquitetura.

## Funcionalidades

- 📱 Suporte multiplataforma (Android, iOS, Web, Windows, Linux, macOS)
- 🎯 Princípios de Clean Architecture
- 💉 Injeção de Dependência usando `auto_injector`
- 🛣️ Gerenciamento de rotas com `routefly`
- 🔄 Programação assíncrona com `flutter_isolate`
- 🎨 Interface moderna com `uicons` e `gap`
- 🌐 Cliente HTTP usando `dio`
- ✨ Tratamento de resultados com `result_dart`

## Como Começar

### Pré-requisitos

- Flutter SDK ^3.27.1
- Dart SDK ^3.5.3
- Sua IDE favorita (VS Code, Android Studio, etc.)

### Instalação

1. Clone o repositório:
```bash
git clone https://github.com/Flutterando/getapps.git
```

2. Navegue até o diretório do projeto:
```bash
cd getapps
```

3. Instale as dependências:
```bash
flutter pub get
```

4. Execute a aplicação:
```bash
flutter run
```

## Estrutura do Projeto

```
lib/
├── app/            # Camada da aplicação
├── main.dart       # Ponto de entrada
└── routes.g.dart   # Rotas geradas
```

## Dependências

Principais dependências utilizadas neste projeto:

- `asp`: ^2.0.3 - Gerenciamento de estado
- `auto_injector`: ^2.0.5 - Injeção de dependência
- `routefly`: ^2.0.4 - Gerenciamento de rotas
- `uno`: ^1.1.12 - Cliente HTTP
- `result_dart`: ^1.1.1 - Tratamento de resultados
- `flutter_isolate`: ^2.1.0 - Processamento em background

## Desenvolvimento

O projeto segue os princípios da Clean Architecture e está organizado para manter a separação de responsabilidades. As principais decisões arquiteturais incluem:

- Injeção de dependência para melhor testabilidade e manutenibilidade
- Uso de Isolates para computações pesadas
- Padrão Result para melhor tratamento de erros
- Rotas geradas para navegação type-safe

## Testes

Execute os testes usando:
```bash
flutter test
```

## Como Contribuir

1. Faça um fork do repositório
2. Crie sua branch de feature (`git checkout -b feature/recurso-incrivel`)
3. Faça commit das suas alterações (`git commit -m 'Adiciona algum recurso incrível'`)
4. Faça push para a branch (`git push origin feature/recurso-incrivel`)
5. Abra um Pull Request

## Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo LICENSE para detalhes.

## Agradecimentos

- [Comunidade Flutterando](https://flutterando.com.br)
- Todos os contribuidores que participam deste projeto

---

Feito com ❤️ pela [Flutterando](https://flutterando.com.br)
