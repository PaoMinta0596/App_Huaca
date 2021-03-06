import 'package:app_atractivos/src/bloc/login_bloc.dart';
import 'package:app_atractivos/src/bloc/provider.dart';
import 'package:app_atractivos/src/providers/usuario_provider.dart';
import 'package:app_atractivos/src/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usuarioProvider = new UsuarioProvider();

  bool cubrir = true;
  IconData icono = Icons.lock_outline;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _crearFondo(context),
        _loginForm(context),
        SafeArea(
          child: Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.only(right: 10),
            child: ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, 'emergencias'),
              icon: Icon(Icons.policy),
              label: Text('Emergencias'),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(10),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xff015249)),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Widget _loginForm(BuildContext context) {
    final bloc = ProviderUs.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Card(
            elevation: 20,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            clipBehavior: Clip.antiAlias,
            child: Container(
              width: size.width * 0.85,
              margin: EdgeInsets.symmetric(vertical: 30.0),
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: <Widget>[
                  Text('Ingresar',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 30.0),
                  _crearEmail(bloc),
                  SizedBox(height: 30.0),
                  _crearPassword(bloc),
                  SizedBox(height: 50.0),
                  _crearBoton(bloc)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, 'registro'),
            child: Text(
              'Crear una cuenta nueva',
              style: TextStyle(fontSize: 17),
            ),
          )
        ],
      ),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(Icons.alternate_email, color: Color(0xff015249)),
                hintText: 'ejemplo@correo.com',
                labelText: 'Correo electr??nico',
                // counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: cubrir,
            decoration: InputDecoration(
                suffixIcon: GestureDetector(
                    child: Icon(icono),
                    onTap: () {
                      setState(() {
                        cubrir = !cubrir;
                        if (icono == Icons.lock_outline) {
                          icono = Icons.lock_open;
                        } else {
                          icono = Icons.lock_outline;
                        }
                      });
                    }),
                icon: Icon(Icons.lock_outline, color: Color(0xff015249)),
                labelText: 'Contrase??a',
                // counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _crearBoton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(10),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xff57BC90)),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text('Ingresar'),
            ),
            onPressed: snapshot.hasData ? () => _login(bloc, context) : null);
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context) async {
    Map info = await usuarioProvider.login(bloc.email, bloc.password);

    if (info['ok']) {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      mostrarAlerta(
          context, 'El usuario o contrase??a ingresados son incorrectos');
    }
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoSuperior = Container(
      // child: Image.asset(
      //   'assets/portada.jpg',
      //   height: size.height * 0.4,
      //   width: double.infinity,
      // ),
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[Color(0xff015249), Color(0xff57BC90)])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.2)),
    );

    return Stack(
      children: <Widget>[
        fondoSuperior,
        Positioned(top: -30.0, left: 60.0, child: circulo),
        Positioned(top: -40.0, right: -30.0, child: circulo),
        Positioned(top: 150.0, right: 0.0, child: circulo),
        Positioned(top: 190.0, left: 80.0, child: circulo),
        Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/VIAJEROS.png',
                height: 160,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
