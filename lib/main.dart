import 'package:agendamento/agendamento.dart';
import 'package:agendamento/controller/calendario_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting('pt-BR');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Agendar Horário',
      theme: ThemeData(
        primarySwatch: Colors.purple, // Cor principal em tom de roxo
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 20, color: Colors.purple),
          bodyMedium: TextStyle(fontSize: 15, color: Colors.black87),
        ),
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(CalendarController());
      }),
      debugShowCheckedModeBanner: false,
      home: AgendamentoPage(),
    );
  }
}
