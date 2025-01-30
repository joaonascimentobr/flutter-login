import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/business.dart';

class ApiService {
  static const String apiUrl = 'https://comercios-api-1js7.onrender.com/api/businesses';

  Future<void> registerBusiness(BuildContext context, Business business) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(business.toJson()),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Sucesso
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Cadastrado com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        // Falha
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Falha ao cadastrar!: ${response.statusCode}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}