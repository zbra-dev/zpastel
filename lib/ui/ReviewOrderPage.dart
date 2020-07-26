import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zpastel/model/Order.dart';
import 'package:zpastel/services/OrderService.dart';
import 'package:zpastel/ui/helpers/AppBarBuilder.dart';
import 'package:zpastel/ui/helpers/BuildContextExtension.dart';
import 'package:zpastel/ui/styles/AppTextTheme.dart';
import 'package:zpastel/ui/styles/app-colors.dart';

class ReviewOrderPage extends StatefulWidget {
  Order order;

  @override
  _ReviewOrderPageState createState() => _ReviewOrderPageState(order);

  ReviewOrderPage({Key key, @required this.order}) : super(key: key);
}

class _ReviewOrderPageState extends State<ReviewOrderPage> {
  final OrderService _orderService = OrderService();
  Order _order;

  _ReviewOrderPageState(this._order) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder().build(),
      body: SafeArea(
        child: Stack(children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 125),
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
                              child: Text("Hora de revisar seu pedido",
                                  style: AppTextTheme.of(context)
                                      .textLargerBold
                                      .copyWith(
                                          fontSize: 25,
                                          color: AppColors.white)),
                            ),
                            SizedBox(height: 20),
                            Container(color: AppColors.white, height: 135)
                          ],
                        )),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                child: Container(
                  width: context.widthSize(100),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: RaisedButton(
                      color: AppColors.red,
                      child: Text("Vai Fernandes", style: AppTextTheme.of(context)
                          .textDefaultBold
                          .copyWith(
                          fontSize: 16,
                          color: AppColors.white)),
                    ),
                  ),
                )),
          )
        ]),
      ),
    );
  }
}
