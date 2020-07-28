import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zpastel/services/AuthenticationService.dart';
import 'package:zpastel/ui/helpers/BuildContextExtension.dart';
import 'package:zpastel/ui/mediators/NavigatorMediator.dart';
import 'package:zpastel/ui/styles/AppTextTheme.dart';
import 'package:zpastel/ui/styles/app-colors.dart';

import 'helpers/ButtonFactory.dart';
import 'images/ImageFactory.dart';

class ManualSignInPage extends StatefulWidget {
  @override
  _ManualSignInPageState createState() => _ManualSignInPageState();
}

class _ManualSignInPageState extends State<ManualSignInPage> {
  final NavigationMediator _navigationMediator = NavigationMediator();
  final AuthenticationService _authService = AuthenticationService();

  String _email = '';
  String _password = '';

  @override
  void initState() {
    super.initState();
  }

  _doManualSignIn() async {
    var user = await _authService.signIn(_email, _password);
    if (user != null) {
      print("[LoginPage] user autenticated in google: ${user.id}");
      _navigationMediator.openHome(context);
    }
  }

  void _createAccount() {
    _navigationMediator.openCreateUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          Center(
            child: Container(
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
                      height: context.heightSize(25),
                    ),
                    SizedBox(height: 20),
                    Container(
                      alignment: Alignment.center,
                      height: context.heightSize(context.isPortraitOrientation() ? 55 : 75),
                      padding: EdgeInsets.only(
                        top: context.heightSize(context.isPortraitOrientation() ? 5 : 4),
                        right: context.widthSize(context.isPortraitOrientation() ? 10 : 4),
                        left: context.widthSize(context.isPortraitOrientation() ? 10 : 4),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(topLeft: const Radius.circular(15), topRight: const Radius.circular(15)),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () => _navigationMediator.close(context),
                                alignment: Alignment.topLeft,
                              ),
                              Column(
                                children: <Widget>[
                                  Text("Entrar com e-mail", style: AppTextTheme.of(context).textLarger),
                                  SizedBox(height: 5.0),
                                  Text("Digite seu email e senha para entrar", style: AppTextTheme.of(context).textSmall),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 30.0),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Usuário',
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
                          SizedBox(height: 30),
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
                              child: Text("Entrar", style: AppTextTheme.of(context).textDefaultBold.copyWith(color: AppColors.negativeTextColor)),
                              color: AppColors.primaryColor,
                              elevation: ButtonFactory.defaultElevation(),
                              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                              shape: ButtonFactory.defaultBorderShape(),
                              onPressed: () => _doManualSignIn(),
                            ),
                          ),
                          SizedBox(height: 20),
                          FlatButton(
                            child: Text("Criar conta", style: AppTextTheme.of(context).textDefaultBold.copyWith(color: AppColors.secondaryTextColor)),
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            shape: ButtonFactory.borderlessShape(),
                            onPressed: () => _createAccount(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
