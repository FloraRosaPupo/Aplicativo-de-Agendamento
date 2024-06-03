import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              locale: 'pt_BR', // Definir o local para português do Brasil

              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
                print('Selected: $_selectedDay');
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
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
                  SizedBox(height: 5),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Horário',
                      hintText: 'ex: 08:00',
                      focusedBorder: FocusedBorder(),
                      enabledBorder: EnableBorder(),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Data',
                      hintText: 'ex: 20/03/2024',
                      focusedBorder: FocusedBorder(),
                      enabledBorder: EnableBorder(),
                    ),
                  ),
                  SizedBox(height: 5),
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
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implementar a lógica para salvar o agendamento
                  Navigator.of(context).pop();
                },
                child: Text('Salvar Agendamento'),
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
      color: Colors.deepPurple,
    ),
  );
}

OutlineInputBorder EnableBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(
      color: Colors.deepPurple,
    ),
  );
}
