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
  int _qtdy = 1;

  _ItemDetailPageState(this._flavor) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder().withTitle("Detalhes do item").withClose().build(),
      body: Stack(children: <Widget>[
        SingleChildScrollView(
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
                TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    _extraInformation = value;
                  },
                  minLines: 3,
                  maxLines: null,
                  autocorrect: true,
                  textAlignVertical: TextAlignVertical.top,
                  style: TextStyle(fontSize: 16),
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
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.gray7,
                  blurRadius: 20.0,
                  offset: Offset(0, -5.0),
                )
              ],
            ),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(border: Border.all(color: AppColors.separatorColor), shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          iconSize: 35,
                          color: AppColors.primaryColor,
                          disabledColor: AppColors.disabledColor,
                          onPressed: _qtdy <= 1 ? null : () => setState(() => _qtdy--),
                          icon: Icon(Icons.remove),
                        ),
                        SizedBox(width: 10),
                        Text("$_qtdy", style: AppTextTheme.of(context).textLarge),
                        SizedBox(width: 10),
                        IconButton(
                          iconSize: 35,
                          color: AppColors.primaryColor,
                          disabledColor: AppColors.disabledColor,
                          onPressed: () => setState(() => _qtdy++),
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    color: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text("Enviar", style: AppTextTheme.of(context).textLarge.copyWith(color: AppColors.negativeTextColor)), Text("R\$ ${_qtdy * _flavor.value}", style: AppTextTheme.of(context).textLarge.copyWith(color: AppColors.negativeTextColor))],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
