import 'dart:convert';
import 'dart:developer';

import 'package:ejemplo5/src/const/api_constanst.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Consulta extends StatefulWidget {
  final String token;
  const Consulta({super.key, required this.token});

  @override
  State<Consulta> createState() => _ConsultaState();
}

class _ConsultaState extends State<Consulta> {
  final String urlMetodo = 'Customer/GetAllCustomer';
  List<dynamic> customer = [];

  @override
  void initState() {
    super.initState();
    getCustomers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
      ),
      body: customer.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: customer.length,
              itemBuilder: (context, index) {
                final cust = customer[index];
                return ListTile(
                  title: Text(cust['dni'] ?? '-'),
                  subtitle: Text(cust['nombres'] ?? '-'),
                );
              }),
    );
  }

  Future<void> getCustomers() async {
    try {
      final headers = {
        "accept": "*/*",
        "Authorization": "Bearer ${widget.token}",
      };
      final url = Uri.parse('${ApiConstanst.baseUrlAPI}${urlMetodo}');
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        setState(() {
          customer = jsonDecode(response.body);
        });
      } else {
        print("Error:${response.statusCode}");
      }
    } catch (e) {
      log('Error: $e');
    }
  }
}
