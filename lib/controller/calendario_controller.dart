import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class Horario {
  final String horaInicial;
  final String horaFinal;

  Horario({
    required this.horaInicial,
    required this.horaFinal,
  });
}

class AgendaEvent {
  final int id;
  final String nome;
  final String descricao;
  final Horario horario;

  AgendaEvent({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.horario,
  });
}

class CalendarController extends GetxController {
  late DateTime primeiroDia;
  late DateTime ultimoDia;
  late DateTime diaAtual;

  List<AgendaEvent> agenda = [];

  CalendarFormat calendarFormat = CalendarFormat.month;

  String locale = 'pt-BR';

  @override
  void onInit() {
    super.onInit();
    primeiroDia = DateTime.utc(2023, 1, 1);
    ultimoDia = DateTime.utc(2030, 12, 31);
    diaAtual = DateTime.now();

    getProgramacaoDia(diaAtual);
  }

  Future<void> getProgramacaoDia(DateTime data) async {
    // Seta o valor de dia
    diaAtual = data;

    // Busca os dados na agenda
    getAgenda(data);

    // Refrash UI
    update(['calendario', 'agenda']); // Seção das páginas que escolher
  }

  // Vai vir de um banco de dados e mostrar na tela
  void getAgenda(DateTime data) {
    agenda.clear(); // Limpa a agenda

    if (data.day == 27) {
      agenda = [
        AgendaEvent(
          id: 1,
          nome: 'Academia',
          descricao: 'Treino de musculação',
          horario: Horario(
            horaInicial: '09:30',
            horaFinal: '10:30',
          ),
        ),
        AgendaEvent(
          id: 2,
          nome: 'Academia',
          descricao: 'Treino de cardio',
          horario: Horario(
            horaInicial: '10:30',
            horaFinal: '11:30',
          ),
        ),
        AgendaEvent(
          id: 3,
          nome: 'Academia',
          descricao: 'Aula de spinning',
          horario: Horario(
            horaInicial: '12:30',
            horaFinal: '13:30',
          ),
        ),
      ];
    } else if (data.day == 28) {
      agenda = [
        AgendaEvent(
          id: 4,
          nome: 'Treino',
          descricao: 'Treino funcional',
          horario: Horario(
            horaInicial: '09:30',
            horaFinal: '10:30',
          ),
        ),
        AgendaEvent(
          id: 5,
          nome: 'Academia',
          descricao: 'Treino de musculação',
          horario: Horario(
            horaInicial: '10:30',
            horaFinal: '11:30',
          ),
        ),
        AgendaEvent(
          id: 6,
          nome: 'Academia',
          descricao: 'Aula de yoga',
          horario: Horario(
            horaInicial: '12:30',
            horaFinal: '13:30',
          ),
        ),
      ];
    }
  }

  void onFormatChanged(CalendarFormat format) {
    calendarFormat = format;

    update(['calendario']);
  }
}
