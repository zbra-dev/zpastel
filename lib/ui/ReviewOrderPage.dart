import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zpastel/model/Order.dart';
import 'package:zpastel/services/OrderService.dart';
import 'package:zpastel/ui/helpers/AppBarBuilder.dart';
import 'package:zpastel/ui/helpers/BuildContextExtension.dart';
import 'package:zpastel/ui/styles/AppTextTheme.dart';
import 'package:zpastel/ui/styles/app-colors.dart';

import 'mediators/NavigatorMediator.dart';

class ReviewOrderPage extends StatefulWidget {
  Order currentOrder;

  @override
  _ReviewOrderPageState createState() => _ReviewOrderPageState(currentOrder);

  ReviewOrderPage({Key key, @required this.currentOrder}) : super(key: key);
}

class _ReviewOrderPageState extends State<ReviewOrderPage> {
  final OrderService _orderService = OrderService();
  final NavigationMediator _navigationMediator = NavigationMediator();

  Order _order;
  var _fernandesTax = 0.0;
  var _subTotal = 0.0;

  _ReviewOrderPageState(this._order) : super();

  @override
  void initState() {
    super.initState();
    _subTotal = _sumItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder().build(),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 75),
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(height: 200, color: AppColors.primaryColor),
                        Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: context.widthSize(50),
                                  child: Text("Hora de revisar seu pedido", style: AppTextTheme.of(context).textLargerBold.copyWith(fontSize: 25, color: AppColors.white)),
                                ),
                                SizedBox(height: 20),
                                SizedBox(height: 20),
                                GridView.count(
                                  shrinkWrap: true,
                                  childAspectRatio: 2.8,
                                  mainAxisSpacing: 5,
                                  crossAxisCount: 1,
                                  children: List.generate(_order.items.length, (index) {
                                    return buildFlavorTotal(context, index);
                                  }),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  decoration: BoxDecoration(border: Border(top: BorderSide(color: AppColors.gray7, width: 1, style: BorderStyle.solid), bottom: BorderSide(color: AppColors.gray7, width: 1, style: BorderStyle.solid))),
                                  child: Center(
                                    child: FlatButton(
                                      onPressed: () => _navigationMediator.popToRootPage(context),
                                      child: (Text("Adicione mais items", style: AppTextTheme.of(context).textDefault.copyWith(color: AppColors.primaryColor))),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                    SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                      child: Column(children: <Widget>[
                        Container(
                          height: 85,
                          decoration: BoxDecoration(color: AppColors.gray8, borderRadius: BorderRadius.all(Radius.circular(5))),
                          child: Padding(
                              padding: EdgeInsets.all(25),
                              child: Text(
                                "Assim que você fizer o pedido, o Fernandes vai receber tudo no Email.",
                                style: AppTextTheme.of(context).textDefault.copyWith(fontSize: 15),
                                textAlign: TextAlign.justify,
                              )),
                        ),
                        SizedBox(height: 35),
                        Row(
                          children: <Widget>[
                            Expanded(child: Text("Subtotal")),
                            Expanded(child: Align(alignment: Alignment.centerRight, child: Text("R\$ ${_subTotal.toStringAsFixed(2)}"))),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Expanded(child: Text("Taxa do Fernandes")),
                            Expanded(child: Align(alignment: Alignment.centerRight, child: Text("R\$ ${_fernandesTax.toStringAsFixed(2)}"))),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: <Widget>[Expanded(child: Text("Total", style: AppTextTheme.of(context).textLargeBold)), Expanded(child: Align(alignment: Alignment.centerRight, child: Text("R\$ ${(_subTotal + _fernandesTax).toStringAsFixed(2)}", style: AppTextTheme.of(context).textLargeBold)))],
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 50,
                  width: context.widthSize(100),
                  child: RaisedButton(
                    color: AppColors.red,
                    onPressed: () async {
                      await _orderService.doOrder(new Order.fromJson(_order.toJson()));
                      _order.items.clear();
                      _order.id = null;
                      _navigationMediator.popToRootPage(context);
                    },
                    child: Text("Vai Fernandes", style: AppTextTheme.of(context).textDefaultBold.copyWith(fontSize: 16, color: AppColors.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _sumItems() {
    var sum = 0.0;
    _order.items.forEach((item) => sum += (item.qtdy * item.flavor.value));
    return sum;
  }

  Widget buildFlavorTotal(BuildContext context, int index) {
    final item = _order.items[index];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.all(Radius.circular(16)), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.16), blurRadius: 6, offset: Offset(0, 3))]),
//      width: context.widthSize(100),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${item.qtdy}x ${item.flavor.name}",
                    style: AppTextTheme.of(context).textDefaultBold.copyWith(fontSize: 17),
                  ),
                ),
                SizedBox(height: 10),
                //TODO: Fix me
                Align(alignment: Alignment.centerLeft, child: Text("Obs:", style: AppTextTheme.of(context).textDefault.copyWith(fontSize: 13, color: AppColors.secondaryTextColor)))
              ],
            ),
          ),
          SizedBox(width: 10),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "R\$ ${item.flavor.value.toStringAsFixed(2)}",
                    style: AppTextTheme.of(context).textDefault.copyWith(fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  IconButton(
                    onPressed: () {
                      _order.items.removeAt(index);
                      if (_order.items.isEmpty) {
                        _navigationMediator.popToRootPage(context);
                      } else {
                        setState(() {});
                      }
                    },
                    icon: Icon(
                      Icons.delete,
                      color: AppColors.red,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
