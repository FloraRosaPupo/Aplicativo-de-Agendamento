# Agenda — Protótipo Flutter

## Descrição

Protótipo Flutter de agenda que permite selecionar datas e visualizar horários demonstrativos. Os dados são locais: não há backend de reservas ou integração MySQL implementados.

## Stack e bibliotecas

Flutter/Dart, GetX, intl e table_calendar.

Dependências e versões declaradas: [pubspec.yaml](pubspec.yaml).

## Funcionalidades

- Seleção de data.
- Lista de horários demonstrativos.
- Atualização de agenda na tela.

## Licença

Não há uma licença de distribuição definida para este repositório. Nenhuma licença MIT, Apache ou equivalente é concedida por este README. As atribuições e os direitos dos materiais de terceiros permanecem preservados.

## Validação e limites

Troca de data e atualização da lista. Não há backend de agendamento ou MySQL implementado.

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

## Organização e manutenção

Aplicação pequena com uma funcionalidade. Mantida separação entre tela e calendário/controller; não foi criada árvore de pastas sem conteúdo. Dados de dias fixos são explicitamente demonstração.

Veja [a revisão de desenvolvimento](docs/REVISAO.md) para decisões, testes e limites, e [o guia de contribuição](CONTRIBUTING.md) para o fluxo de manutenção.
