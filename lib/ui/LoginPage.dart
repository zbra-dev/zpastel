import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zpastel/ui/mediators/NavigatorMediator.dart';
import 'package:zpastel/ui/styles/AppTextTheme.dart';
import 'package:zpastel/ui/styles/app-colors.dart';
import 'package:zpastel/ui/helpers/BuildContextExtension.dart';

import 'helpers/ButtonFactory.dart';
import 'images/ImageFactory.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final NavigationMediator _navigationMediator = NavigationMediator();

  @override
  void initState() {
    super.initState();
  }

  Future _doSignInWithSlack() async {
    // TODO: Implement this
    _navigationMediator.openHome(context);
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
                    Image(
                      image: ImageFactory.pastelBasket(),
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      width: context.widthSize(80),
                      height: context.heightSize(20),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: context.heightSize(
                          context.isPortraitOrientation() ? 45 : 75),
                      padding: EdgeInsets.only(
                          top: context.heightSize(
                              context.isPortraitOrientation() ? 8 : 4),
                          right: context.widthSize(
                              context.isPortraitOrientation() ? 10 : 4),
                          left: context.widthSize(
                              context.isPortraitOrientation() ? 10 : 4)),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(15),
                          topRight: const Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Olá, bem vindo!",
                            textAlign: TextAlign.center,
                            style: AppTextTheme.of(context).textLargeBold.copyWith(fontSize: 24),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "Selecione como deseja entrar",
                            textAlign: TextAlign.center,
                            style: AppTextTheme.of(context)
                                .textSmall
                                .copyWith(color: AppColors.secondaryTextColor),
                          ),
                          SizedBox(height: context.heightSize(5)),
                          Expanded(
                            child: Column(
                                mainAxisAlignment:
                                    context.isPortraitOrientation()
                                        ? MainAxisAlignment.start
                                        : MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: context.widthSize(85),
                                    height: 56,
                                    child: RaisedButton(
                                      child: Text(
                                        "Entrar com Slack",
                                        textAlign: TextAlign.center,
                                        style: AppTextTheme.of(context)
                                            .textDefaultBold
                                            .copyWith(
                                                fontSize: 16,
                                                color: AppColors.red),
                                      ),
                                      color: AppColors.white,
                                      elevation:
                                          ButtonFactory.defaultElevation(),
                                      shape: ButtonFactory.defaultBorderShape(),
                                      onPressed: () async {
//                                        await _doSignInWithGoogle();
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                  SizedBox(
                                    width: context.widthSize(85),
                                    height: 56,
                                    child: FlatButton(
                                      child: Text(
                                        "Entrar com E-mail",
                                        textAlign: TextAlign.center,
                                        style: AppTextTheme.of(context)
                                            .textDefaultBold
                                            .copyWith(
                                                fontSize: 16,
                                                color: AppColors.gray4),
                                      ),
                                      onPressed: () async {
                                        await _doSignInWithSlack();
                                      },
                                    ),
                                  )
                                ]),
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
