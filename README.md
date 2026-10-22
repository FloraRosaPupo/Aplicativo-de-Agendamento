# Agenda

Visualização de uma agenda diária em calendário.

## Stack e organização
Flutter/Dart, GetX e table_calendar. O controlador usa eventos de demonstração nos dias 27 e 28. Esta versão não implementa persistência MySQL nem um CRUD completo de eventos.

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
