import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zpastel/ui/helpers/AppBarBuilder.dart';
import 'package:zpastel/ui/helpers/BuildContextExtension.dart';
import 'package:zpastel/ui/styles/AppTextTheme.dart';
import 'package:zpastel/ui/styles/app-colors.dart';

import 'images/ImageFactory.dart';

class SentOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder().withClose().build(),
      backgroundColor: AppColors.red,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: Container(
                  height: 125,
                  child: Column(
                    children: <Widget>[
                      Text("Obrigado", style: AppTextTheme(context).textLargeBold.copyWith(fontSize: 50, fontStyle: FontStyle.italic, color: AppColors.white)),
                      SizedBox(height: 20),
                      Text("Seu pedido foi enviado", style: AppTextTheme(context).textLargeBold.copyWith(color: AppColors.white))
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image(
                image: ImageFactory.pastelBasket(),
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
                width: context.widthSize(80),
                height: context.heightSize(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
