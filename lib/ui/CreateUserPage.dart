import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zpastel/services/AuthenticationService.dart';
import 'package:zpastel/ui/helpers/BuildContextExtension.dart';
import 'package:zpastel/ui/mediators/NavigatorMediator.dart';
import 'package:zpastel/ui/styles/AppTextTheme.dart';
import 'package:zpastel/ui/styles/app-colors.dart';

import 'helpers/ButtonFactory.dart';
import 'images/ImageFactory.dart';

class CreateUserPage extends StatefulWidget {
  @override
  _CreateUserPageState createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  final NavigationMediator _navigationMediator = NavigationMediator();
  final AuthenticationService _authService = AuthenticationService();

  String _email = '';
  String _password = '';
  String _name = '';

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
  }

  _doCreateUser() async {
    final FormState state = _formKey.currentState;
    if (state.validate()) {
      state.save();

      var user = await _authService.createUser(_email, _password, _name);
      if (user != null) {
        print("[LoginPage] user created manually: ${user.id}");
        _navigationMediator.openHome(context);
      }
    }
  }

  void _createAccount() {
    _navigationMediator.openCreateUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: AppColors.primaryColor),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Image(
                image: ImageFactory.logo(),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
                height: context.heightSize(20),
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                height: context.heightSize(context.isPortraitOrientation() ? 60 : 75),
                padding: EdgeInsets.only(
                  top: context.heightSize(context.isPortraitOrientation() ? 5 : 4),
                  right: context.widthSize(context.isPortraitOrientation() ? 10 : 4),
                  left: context.widthSize(context.isPortraitOrientation() ? 10 : 4),
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(topLeft: const Radius.circular(15), topRight: const Radius.circular(15)),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () => _navigationMediator.close(context),
                            alignment: Alignment.topLeft,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              children: <Widget>[
                                Text("Cadastre-se", style: AppTextTheme.of(context).textLarger),
                                SizedBox(height: 5.0),
                                Text("Digite seu email e senha", style: AppTextTheme.of(context).textSmall),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                          labelStyle: TextStyle(color: Color.fromRGBO(90, 90, 90, 1)),
                          suffixIcon: Icon(Icons.person_outline, color: Color.fromRGBO(90, 90, 90, 1)),
                          border: OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(90, 90, 90, 1))),
                          focusColor: Color.fromRGBO(90, 90, 90, 1),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Informe o nome';
                          }
                          return null;
                        },
                        onChanged: (val) => setState(() => _name = val),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'E-mail',
                          labelStyle: TextStyle(color: Color.fromRGBO(90, 90, 90, 1)),
                          suffixIcon: Icon(Icons.person_outline, color: Color.fromRGBO(90, 90, 90, 1)),
                          border: OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(90, 90, 90, 1))),
                          focusColor: Color.fromRGBO(90, 90, 90, 1),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Informe o usuário';
                          }
                          return null;
                        },
                        onChanged: (val) => setState(() => _email = val),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(90, 90, 90, 1))),
                          labelText: 'Senha',
                          labelStyle: TextStyle(color: Color.fromRGBO(90, 90, 90, 1)),
                          suffixIcon: const Icon(Icons.remove_red_eye, color: Color.fromRGBO(90, 90, 90, 1)),
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Informe sua senha';
                          }
                          return null;
                        },
                        onChanged: (value) => setState(() => _password = value),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          child: Text("Criar conta", style: AppTextTheme.of(context).textDefaultBold.copyWith(color: AppColors.negativeTextColor)),
                          color: AppColors.primaryColor,
                          elevation: ButtonFactory.defaultElevation(),
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          shape: ButtonFactory.defaultBorderShape(),
                          onPressed: () => _doCreateUser(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
