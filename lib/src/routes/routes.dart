import 'package:ejemplo5/src/menu/menu.dart';
import 'package:ejemplo5/src/pages/clima.dart';
import 'package:ejemplo5/src/pages/consulta.dart';
import 'package:ejemplo5/src/pages/prestamo.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const MenuPage(),
    'consultas': (BuildContext context) => const Consulta(),
    'prestamos': (BuildContext context) => const Prestamos(),
    'ahorros': (BuildContext context) => const Consulta(),
    'solicitudes': (BuildContext context) => const Consulta(),
    'clima': (BuildContext context) => const ClimaPage(),
  };
}
