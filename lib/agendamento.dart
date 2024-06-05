import 'package:agendamento/controller/calendario_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class AgendamentoPage extends GetView<CalendarController> {
  const AgendamentoPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Agendar Horário',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(100, 242, 223, 232),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog(context);
        },
        tooltip: 'Novo Agendamento',
        backgroundColor: Color.fromARGB(100, 242, 223, 232),
        child: const Icon(
          Icons.calendar_today,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: _buildCalendar(),
      ),
    );
  }

  Widget _buildCalendar() {
    return GetBuilder<CalendarController>(
        id: 'calendario',
        builder: (context) {
          return Column(
            children: [
              Container(
                child: TableCalendar(
                  firstDay: controller.primeiroDia,
                  lastDay: controller.ultimoDia,
                  focusedDay: controller.diaAtual,
                  selectedDayPredicate: (day) {
                    return isSameDay(day, controller.diaAtual);
                  },
                  onDaySelected: (dayInicio, dayFim) async {
                    controller.getProgramacaoDia(dayInicio);
                  },
                  locale: controller.locale,
                  calendarFormat: controller.calendarFormat,
                  onFormatChanged: (day) => controller.onFormatChanged(day),
                  headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextFormatter: (day, locale) =>
                          DateFormat('MMMM yyyy', locale)
                              .format(day)
                              .capitalize!),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(10),
                child: _buildAgenda(controller.diaAtual),
              )
            ],
          );
        });
  }

  Widget _buildAgenda(DateTime data) {
    return GetBuilder<CalendarController>(
      id: 'agenda',
      builder: (context) {
        return controller.agenda.isEmpty
            ? Container(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  Text('Oba tudo livre'),
                ]),
              )
            : Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                        child: Text(data.day.toString()),
                      ),
                    ),
                    SizedBox(
                        height:
                            10), // Adiciona um espaço entre o CircleAvatar e o ListView
                    // Envolva o ListView em um Expanded ou forneça uma altura fixa
                    Container(
                      height: 500, //mudar tamanho
                      // Define uma altura fixa para o ListView
                      child: ListView.builder(
                        itemCount: controller.agenda.length,
                        itemBuilder: (BuildContext context, int index) {
                          final event = controller.agenda[index];

                          return Card(
                            color: Colors.white,
                            elevation: 5,
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${event.horario.horaInicial} - ${event.horario.horaFinal}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          event.nome,
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.edit_calendar)),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            )),
                                      ],
                                    )
                                  ],
                                )),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }

  void _showAddDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              'Novo Agendamento',
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 10),
                // height: 500,
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nome',
                        hintText: 'Digite o nome do agendamento...',
                        focusedBorder: FocusedBorder(),
                        enabledBorder: EnableBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Horário',
                        hintText: 'ex: 08:00',
                        focusedBorder: FocusedBorder(),
                        enabledBorder: EnableBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Data',
                        hintText: 'ex: 20/03/2024',
                        focusedBorder: FocusedBorder(),
                        enabledBorder: EnableBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'Descrição',
                        hintText: 'Digite a descrição...',
                        focusedBorder: FocusedBorder(),
                        enabledBorder: EnableBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancelar',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implementar a lógica para salvar o agendamento
                  Navigator.of(context).pop();
                },
                child:
                    Text('Salvar Agendamento', style: TextStyle(fontSize: 17)),
              ),
            ],
          );
        });
  }
}

OutlineInputBorder FocusedBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  );
}

OutlineInputBorder EnableBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  );
}
