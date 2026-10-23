import 'package:flutter_test/flutter_test.dart';
import 'package:agendamento/controller/calendario_controller.dart';
void main() {
  test('troca de dia remove os eventos anteriores', () {
    final controller=CalendarController();
    controller.getAgenda(DateTime(2026,10,27));
    expect(controller.agenda.length,3);
    controller.getAgenda(DateTime(2026,10,1));
    expect(controller.agenda,isEmpty);
  });
  test('dia 28 carrega seus próprios eventos', () {
    final controller=CalendarController();
    controller.getAgenda(DateTime(2026,10,28));
    expect(controller.agenda.map((e)=>e.id),[4,5,6]);
  });
}
