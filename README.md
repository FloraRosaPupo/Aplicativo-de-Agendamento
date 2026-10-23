# Agenda

Visualização de uma agenda diária em calendário.

## Stack e organização
Flutter/Dart, GetX, intl e table_calendar.

Aplicação pequena com uma funcionalidade. Mantida separação entre tela e calendário/controller; não foi criada árvore de pastas sem conteúdo. Dados de dias fixos são explicitamente demonstração.

## Executar
Use a versão de Flutter registrada em `.github/workflows/ci.yml`.
```sh
git clone https://github.com/FloraRosaPupo/Aplicativo-de-Agendamento.git
cd Aplicativo-de-Agendamento
flutter pub get
flutter run
```

## Verificações
```sh
flutter analyze --no-fatal-infos --no-fatal-warnings
flutter test
```
A CI verifica erros de análise e os testes. Avisos e sugestões continuam visíveis no relatório do analisador. Testes locais não substituem a validação no dispositivo e dos serviços externos.

## Contribuir
Abra uma branch por alteração, descreva o comportamento esperado e inclua testes para regras ou regressões. Mantenha credenciais e arquivos gerados fora do Git.

## Licença
Não há licença de distribuição definida neste repositório.


## Funcionalidades

- Seleção de data.
- lista de horários demonstrativos.
- atualização de agenda na tela.


## Organização e manutenção

Aplicação pequena com uma funcionalidade. Mantida separação entre tela e calendário/controller; não foi criada árvore de pastas sem conteúdo. Dados de dias fixos são explicitamente demonstração.

Veja [a revisão de desenvolvimento](docs/REVISAO.md) para decisões, testes e limites, e [o guia de contribuição](CONTRIBUTING.md) para o fluxo de manutenção.
