import 'package:app_atractivos/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

class EmergenciasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Números de emergencia'),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Color(0xff57BC90),
      drawer: MenuWidget(),
      body: Container(
        child: Text('emergencias'),
      ),
    );
  }
}
