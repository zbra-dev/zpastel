import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zpastel/model/Flavor.dart';
import 'package:zpastel/ui/helpers/AppBarBuilder.dart';
import 'package:zpastel/ui/styles/AppTextTheme.dart';
import 'package:zpastel/ui/styles/app-colors.dart';

class ItemDetailPage extends StatefulWidget {
  Flavor flavor;

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState(flavor);

  ItemDetailPage({Key key, @required this.flavor}) : super(key: key);
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  Flavor _flavor;
  String _extraInformation = "";

  _ItemDetailPageState(this._flavor) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder().withTitle("Detalhes do item").withClose().build(),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: <Widget>[
              Align(alignment: Alignment.topLeft, child: Text(_flavor.name, maxLines: 1, style: AppTextTheme.of(context).textLarge)),
              SizedBox(height: 15),
              Align(alignment: Alignment.topLeft, child: Text(_flavor.ingredients, style: AppTextTheme.of(context).textDefault.copyWith(color: AppColors.secondaryTextColor))),
              SizedBox(height: 15),
              Align(alignment: Alignment.topLeft, child: Text(_flavor.valueInReal, maxLines: 1, style: AppTextTheme.of(context).textDefault)),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  _extraInformation = value;
                },
                maxLines: null,
                style: TextStyle(fontSize: 16),
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'Adicione um comentário';
                  }
                  return null;
                },
                decoration: new InputDecoration(
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(fontSize: 16),
                  labelText: 'Alguma observação?',
                  labelStyle: new TextStyle(decorationStyle: TextDecorationStyle.solid),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
