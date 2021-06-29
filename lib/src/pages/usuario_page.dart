import 'package:app_atractivos/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

class UsuarioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuario'),
      ),
      drawer: MenuWidget(),
      body: Container(),
    );
  }
}
