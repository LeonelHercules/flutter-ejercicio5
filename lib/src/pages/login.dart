import 'dart:convert';
import 'dart:developer';

import 'package:ejemplo5/src/const/api_constanst.dart';
import 'package:ejemplo5/src/menu/menu.dart';
import 'package:ejemplo5/src/models/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController usuarioController = TextEditingController();
  TextEditingController claveController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inision de sesion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usuarioController,
              decoration: const InputDecoration(labelText: "Usuario"),
            ),
            TextField(
              controller: claveController,
              decoration: const InputDecoration(labelText: "Contraseña"),
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                //Navigator.push(context,
                //    MaterialPageRoute(builder: (context) => operaciones()));
                //Navigator.pushNamed(context, 'menu');
                login(context);
              },
              child: const Text('Iniciar Sesion'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> login(BuildContext context) async {
    try {
      final Map<String, String> body = {
        "userId": usuarioController.text,
        "password": claveController.text,
      };
      final headers = {
        "accept": "*/*",
        "Content-Type": "application/json",
      };
      final url = Uri.parse('${ApiConstanst.baseUrlAPI}Security/login');
      final response =
          await http.post(url, headers: headers, body: jsonEncode(body));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        //final String token = responseData['accessToken'];
        //print(responseData);
        final login = Login.fromJson(responseData);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MenuPage(token: login.accessToken)));
        //Navigator.pushNamed(context, 'menu');
        // Navegar a la pantalla de menu
      } else {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Error"),
                  content: Text("Datos de acceso incorrectos"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Aceptar"),
                    )
                  ],
                ));
      }
    } catch (e) {
      print("Error:$e");
      log('Error: $e');
    }
  }
}
