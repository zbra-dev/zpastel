import 'package:flutter/material.dart';
import 'package:zpastel/model/Flavor.dart';
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
              height: 110.0,
              child: Container(
                decoration: BoxDecoration(color: AppColors.primaryColor),
                child: Padding(
                  padding: const EdgeInsets.only(left: 33.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Align(alignment: Alignment.centerLeft, child: Text("Bem vindo ao", style: AppTextTheme.of(context).textLargeBold.copyWith(color: AppColors.negativeTextColor))),
                      Align(alignment: Alignment.centerLeft, child: Text("ZPastel", style: AppTextTheme.of(context).textLargeBold.copyWith(color: AppColors.negativeTextColor))),
                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Text("Encomende seu pastel com o", style: AppTextTheme.of(context).textSmallLight.copyWith(color: AppColors.secondaryNegativeTextColor)),
                            SizedBox(width: 3),
                            Text("Fernandes", style: AppTextTheme.of(context).textSmall.copyWith(color: AppColors.secondaryNegativeTextColor)),
                            SizedBox(width: 3),
                            Text("abaixo", style: AppTextTheme.of(context).textSmallLight.copyWith(color: AppColors.secondaryNegativeTextColor)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _hasFlavors(),
              child: Column(
                children: <Widget>[
                  SingleChildScrollView(
                    child: GridView.count(
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,
                      children: List.generate(flavors == null ? 0 : flavors.length, (index) {
                        return GestureDetector(
                          onTap: () => _navigationMediator.openItemDetail(context, flavors[index]),
                          // preview,
                          child: Row(
                            children: <Widget>[
                              Column(children: <Widget>[
                                Align(alignment: Alignment.centerLeft, child: Text(flavors[index].name, style: AppTextTheme.of(context).textDefault)),
                                SizedBox(height: 5),
                                Align(alignment: Alignment.centerLeft, child: Text(flavors[index].ingredients, style: AppTextTheme.of(context).textDefault.copyWith(color: AppColors.secondaryTextColor))),
                                SizedBox(height: 15),
                                Align(alignment: Alignment.centerLeft, child: Text("R\$ ${flavors[index].value} ", style: AppTextTheme.of(context).textDefault)),
                              ]),
                              SizedBox(width: 50, height: 50, child: Image.network(flavors[index].flavorImageUrl)),
                            ],
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _hasFlavors() => this.flavors != null && this.flavors.length > 0;
}
