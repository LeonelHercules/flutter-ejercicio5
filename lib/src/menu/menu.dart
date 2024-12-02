import 'package:ejemplo5/src/const/api_constanst.dart';
import 'package:ejemplo5/src/pages/consulta.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  final String token;
  const MenuPage({super.key, required this.token});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  get token => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Opciones'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  //Navigator.push(context,
                  //    MaterialPageRoute(builder: (context) => operaciones()));
                  Navigator.pushNamed(context, 'clima');
                },
                child: const Text('Clima')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  //Navigator.push(context,
                  //    MaterialPageRoute(builder: (context) => operaciones()));
                  //Navigator.pushNamed(context, 'consultas');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Consulta(token: widget.token)));
                },
                child: const Text('Clientes')),
          ],
        ),
      ),
    );
  }
}
