import 'package:dro_health_app/models/drug_model.dart';
import 'package:dro_health_app/screens/detail_screen.dart';
import 'package:dro_health_app/utils/color.dart';
import 'package:dro_health_app/viewmodels/cartViewmodels.dart';
import 'package:dro_health_app/widgets/buttom_app_bar.dart';
import 'package:dro_health_app/widgets/modal_buttom_sheet.dart';
import 'package:dro_health_app/widgets/search_bar.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<String> _searchQueryNotifier;
  Cart _cart;
  @override
  void initState() {
    _searchQueryNotifier = ValueNotifier<String>('');
    _cart = Provider.of<Cart>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cart.cartItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: ButtomAppBar(
          onTap: () {
            modalBottomSheet(context);
          },
          cartTotal: "${_cart.cartItems.length}",
        ),
        elevation: 0,
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "${drugList.length.toString()} item/s",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Consumer<Cart>(
        builder: (context, vm , child){
          return ValueListenableBuilder(
              valueListenable: _searchQueryNotifier,
              builder: (context,  _query, _){
                List<Drug> drugs = _getdrugByQuery(
                  vm.drug,
                  searchQuery: _query,
                );
                return SingleChildScrollView(
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 10),
                    child: Column(
                      children: [
                        SearchBar(
                            title: "Search",
                            onQueryChanged: (String query) {
                              _searchQueryNotifier.value = query;
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: drugs.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 15),
                            itemBuilder: (context, index) {
                              final drug = drugs[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                          drug: drug,
                                        )),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: DroColor.Grey.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset:
                                        Offset(2, 2), // changes position of shadow
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                            child: Image.asset(
                                              "${drug.image}",
                                              height: 83,
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          drug.name,
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          drug.tablet,
                                          style: TextStyle(
                                              color: DroColor.Grey,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            PricePill(
                                                price: "₦ ${drug.price.toString()}"),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                );
              }
          );
        },
      )
    );
  }
}

List<Drug>  _getdrugByQuery (List<Drug> drug, {String searchQuery}) {
  if (searchQuery == null || searchQuery.isEmpty) {
    return drug;
  }
  searchQuery = searchQuery.toLowerCase();
  return drug.where((drug) {
    return drug.name.toLowerCase().contains(searchQuery);
  }).toList();
}

class PricePill extends StatelessWidget {
  final String price;

  PricePill({this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: DroColor.Grey, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
        child: Text(
          price,
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
      ),
    );
  }
}
