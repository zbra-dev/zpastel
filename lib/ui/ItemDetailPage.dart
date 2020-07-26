import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zpastel/model/Flavor.dart';
import 'package:zpastel/model/Order.dart';
import 'package:zpastel/model/Pastel.dart';
import 'package:zpastel/services/OrderService.dart';
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
  final OrderService _orderService = OrderService();
  Flavor _flavor;
  String _extraInformation = "";
  int _qtdy = 1;

  _ItemDetailPageState(this._flavor) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder().withTitle("Detalhes do item").build(),
      body: SafeArea(
        child: Stack(children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 125),
            physics: ScrollPhysics(),
            child: Column(
              children: <Widget>[
                Stack(children: <Widget>[
                  Container(
                      height: 200,
                      color: AppColors.primaryColor
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(_flavor.flavorImageUrl))),
                ],),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(_flavor.name,
                              maxLines: 1,
                              style: AppTextTheme.of(context).textLarge)),
                      SizedBox(height: 15),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(_flavor.ingredients,
                              style: AppTextTheme.of(context)
                                  .textDefault
                                  .copyWith(
                                      color: AppColors.secondaryTextColor))),
                      SizedBox(height: 15),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(_flavor.valueInReal,
                              maxLines: 1,
                              style: AppTextTheme.of(context).textDefault)),
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
                          labelStyle: new TextStyle(
                              decorationStyle: TextDecorationStyle.solid),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
                  Flexible(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.separatorColor),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: IconButton(
                              iconSize: 25,
                              color: AppColors.primaryColor,
                              disabledColor: AppColors.disabledColor,
                              onPressed: _qtdy <= 1
                                  ? null
                                  : () => setState(() => _qtdy--),
                              icon: Icon(Icons.remove),
                            ),
                          ),
                          SizedBox(width: 5),
                          Text("$_qtdy",
                              style: AppTextTheme.of(context).textLarge),
                          SizedBox(width: 5),
                          Flexible(
                            child: IconButton(
                              iconSize: 25,
                              color: AppColors.primaryColor,
                              disabledColor: AppColors.disabledColor,
                              onPressed: () => setState(() => _qtdy++),
                              icon: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    flex: 2,
                    child: FlatButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                      color: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10)),
                      onPressed: () {
                        var pastel = Pastel(flavor: _flavor, qtdy: _qtdy);
                        var order = Order();
                        order.items.add(pastel);
                        _orderService.doOrder(order);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Enviar",
                              style: AppTextTheme.of(context)
                                  .textLarge
                                  .copyWith(
                                      color: AppColors.negativeTextColor)),
                          Text("R\$ ${(_qtdy * _flavor.value).toStringAsFixed(2)}",
                              style: AppTextTheme.of(context)
                                  .textLarge
                                  .copyWith(
                                      color: AppColors.negativeTextColor)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
