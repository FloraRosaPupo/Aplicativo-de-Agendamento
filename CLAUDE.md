# Agenda (protótipo Flutter)

Seleção de datas e visualização de horários demonstrativos. Os dados são **locais**: não há backend de reservas nem MySQL implementado. O SQL em `database/` é só modelagem.

## Arquitetura
```
lib/main.dart ──> lib/agendamento.dart (tela: table_calendar + lista de horários)
                        └── GetX ──> lib/controller/calendario_controller.dart (data selecionada, horários, estado reativo)
database/*.sql  modelagem futura (não conectada)
```
- Estado com **GetX** (`Obx`/`GetxController`). A tela só observa o controller.
- `intl` formata datas em pt-BR.

## Comandos (PowerShell)
```powershell
flutter pub get
flutter analyze --no-fatal-infos --no-fatal-warnings
flutter test
flutter run -d chrome
```

## CI e deploy
- `ci.yml` roda pub get, analyze e test.
- Não há deploy.

## Regras
- Lógica de horários e datas no controller, com teste unitário. Nada de regra dentro do `build`.
- Não descreva integração com backend ou MySQL que não existe. Se for implementar, crie `data/` com repository e documente.
- Para crescer, migre para `lib/features/agenda/{data,domain,presentation}`, como nos outros repositórios.
