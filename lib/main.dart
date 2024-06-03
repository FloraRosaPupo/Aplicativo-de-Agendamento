import 'package:agendamento/painel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agendar Horário',
      theme: ThemeData(
        primarySwatch: Colors.purple, // Cor principal em tom de roxo
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline6: TextStyle(fontSize: 20, color: Colors.purple),
          bodyText2: TextStyle(fontSize: 15, color: Colors.black87),
        ),
      ),
      supportedLocales: [
        const Locale('pt', 'BR'), // Português do Brasil
        const Locale('en',
            'US'), // Inglês dos EUA (opcional, caso queira suporte a mais de um idioma)
      ],
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
