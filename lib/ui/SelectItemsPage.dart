import 'package:flutter/material.dart';
import 'package:zpastel/model/Flavor.dart';
import 'package:zpastel/model/Order.dart';
import 'package:zpastel/services/OrderService.dart';
import 'package:zpastel/ui/helpers/AppBarBuilder.dart';
import 'package:zpastel/ui/mediators/NavigatorMediator.dart';
import 'package:zpastel/ui/styles/AppTextTheme.dart';
import 'package:zpastel/ui/styles/app-colors.dart';

class SelectItemPage extends StatefulWidget {
  @override
  _SelectItemPageState createState() => _SelectItemPageState();
}

class _SelectItemPageState extends State<SelectItemPage> {
  final OrderService _orderService = OrderService();
  final NavigationMediator _navigationMediator = NavigationMediator();

  List<Flavor> flavors = [];
  Order _currentOrder;

  _SelectItemPageState(){
    _currentOrder = Order();
  }

  @override
  void initState() {
    super.initState();
    _loadFlavors();
  }

  void _loadFlavors() async {
    try {
      var flavors = await _orderService.findAll();
      setState(() {
        this.flavors = flavors;
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder().withMenu().withSearch().build(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100.0,
              child: Container(
                decoration: BoxDecoration(color: AppColors.primaryColor),
                child: Padding(
                  padding: const EdgeInsets.only(left: 33.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Align(alignment: Alignment.centerLeft, child: Text("Bem vindo ao", style: AppTextTheme.of(context).textLargerBold.copyWith(color: AppColors.negativeTextColor))),
                      Align(alignment: Alignment.centerLeft, child: Text("ZPastel", style: AppTextTheme.of(context).textLargerBold.copyWith(color: AppColors.negativeTextColor))),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Text("Encomende seu pastel com o", style: AppTextTheme.of(context).textDefault.copyWith(color: AppColors.secondaryNegativeTextColor)),
                            SizedBox(width: 3),
                            Text("Fernandes", style: AppTextTheme.of(context).textDefaultBold.copyWith(color: AppColors.secondaryNegativeTextColor)),
                            SizedBox(width: 3),
                            Text("abaixo", style: AppTextTheme.of(context).textDefault.copyWith(color: AppColors.secondaryNegativeTextColor)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            buildExpandedGridView(context),
          ],
        ),
      ),
    );
  }

  Expanded buildExpandedGridView(BuildContext context) {
    return Expanded(
      child: Visibility(
        visible: _hasFlavors(),
        child: GridView.count(
          crossAxisCount: 1,
          shrinkWrap: true,
          childAspectRatio: 3,
          physics: ScrollPhysics(),
          mainAxisSpacing: 1,
          scrollDirection: Axis.vertical,
          children: List.generate(flavors.length, (index) {
            return GestureDetector(
              onTap: () => _navigationMediator.openItemDetail(context, flavors[index], _currentOrder),
              child: Container(
                decoration: BoxDecoration(border: Border(top: BorderSide(color: AppColors.separatorColor, width: 2))),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Column(children: <Widget>[
                          Align(alignment: Alignment.centerLeft, child: Text(flavors[index].name, maxLines: 1, style: AppTextTheme.of(context).textDefault)),
                          SizedBox(height: 5),
                          Align(alignment: Alignment.centerLeft, child: Text(flavors[index].ingredients, maxLines: 2, style: AppTextTheme.of(context).textDefault.copyWith(color: AppColors.secondaryTextColor))),
                          SizedBox(height: 15),
                          Align(alignment: Alignment.centerLeft, child: Text(flavors[index].valueInReal, style: AppTextTheme.of(context).textDefault)),
                        ]),
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: EdgeInsets.all(1),
                            child: Align(
                              widthFactor: .8,
                              heightFactor: .9,
                              child: Image.network(
                                flavors[index].flavorImageUrl,
//                                width: 150,
//                                height: 150,
                              ),
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  bool _hasFlavors() => flavors != null && flavors.isNotEmpty;
}
