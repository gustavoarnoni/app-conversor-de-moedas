import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(
        child: Text(
          'Bem-vindo ao Conversor de Moedas!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}