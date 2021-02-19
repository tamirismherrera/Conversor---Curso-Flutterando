import 'package:conversor/app/components/currency_box.dart';
import 'package:conversor/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();
  HomeController homeController;

  @override
  void initState(){
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.only(left: 30, right:30, top: 100, bottom: 20),
          child: SingleChildScrollView(
                      child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png', 
                  width: 150,
                  height: 150,  
                ),
                Text(
                  'Conversor',
                  style: TextStyle(
                    fontSize: 40
                  ),
                ),
                SizedBox(height:50),
                CurrencyBox(
                  selectedItem: homeController.toCurrency,
                  controller: toText,
                  items: homeController.currencies, 
                  onChange: (model) {
                    setState(() {
                      homeController.toCurrency = model;
                    });
                  },
                ),
                SizedBox(height:10),
                CurrencyBox(
                  selectedItem: homeController.fromCurrency,
                  controller: fromText,
                  items: homeController.currencies, 
                  onChange: (model) {
                    setState(() {
                      homeController.fromCurrency = model;
                    });
                  },
                ),
                SizedBox(height:50),
                RaisedButton(
                  color: Colors.green[300],
                  onPressed: () {
                    homeController.convert();
                  },
                  child: Text('Converter'),
                ) 
              ],
            ),
          ),
        ),
      ),
    );
  }
}