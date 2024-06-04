import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarController extends GetxController {
  late DateTime primeiroDia;
  late DateTime ultimoDia;
  late DateTime diaAtual;

  List<String> agenda = [];

  CalendarFormat calendarFormat = CalendarFormat.month;

  String locale = 'pt-BR';

  void onInit() async {
    primeiroDia = DateTime.utc(2023, 1, 1);
    ultimoDia = DateTime.utc(2030, 12, 31);
    diaAtual = DateTime.now();

    getProgramacaoDia(diaAtual);
    super.onInit();
  }

  Future getProgramacaoDia(data) async {
    //seta o valor de dia
    diaAtual = data;

    //busca os dados na agenda
    getAgenda(data);

    //refrash ui
    update(['calendario', 'agenda']); //seção das paginas q escolher
  }

  //Vai vir de um banco de dados e mostrar na tela
  void getAgenda(DateTime data) {
    agenda.clear(); //limpo a agenda

    if (data.day == 27) {
      agenda = [
        '09:30:Academia',
        '10:30:Academia',
        '12:30:Academia',
      ];
    } else if (data.day == 28) {
      agenda = [
        '09:30:Treino',
        '10:30:Academia',
        '12:30:Academia',
      ];
    }
  }

  void onFormatChanged(format) {
    calendarFormat = format;

    update(['calendario']);
  }
}
