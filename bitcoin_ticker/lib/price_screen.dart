import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'network.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String btcValue = "?";
  String ltcValue = "?";
  String ethValue = "?";
  Network network = Network();

  Future getBTC() async {
    var rate = await network.fetchExchangeRate('BTC', selectedCurrency);
    setState(() {
      btcValue = rate.toStringAsFixed(1);
    });
    return rate;
  }

  Future getETH() async {
    var rate = await network.fetchExchangeRate('ETH', selectedCurrency);
    setState(() {
      ethValue = rate.toStringAsFixed(1);
    });

    return rate;
  }

  Future getLTC() async {
    var rate = await network.fetchExchangeRate('LTC', selectedCurrency);
    setState(() {
      ltcValue = rate.toStringAsFixed(1);
    });

    return rate;
  }

  // Widget pickPicker(){
  //   if(Platform.isAndroid){
  //     return getDropDownButton();
  //   }else{
  //     return getCupertinoPicker();
  //   }
  // }

  DropdownButton getDropDownButton() {
    List<DropdownMenuItem<String>> myDropdownItems = [];
    for (String currency in currenciesList) {
      myDropdownItems.add(DropdownMenuItem(
        child: Text(currency),
        value: currency,
      ));
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: myDropdownItems,
      onChanged: (Object? value) {
        setState(() {
          selectedCurrency = value.toString();
        });
      },
    );
  }

  CupertinoPicker getCupertinoPicker() {
    List<Text> myPickerItems = [];
    for (String currency in currenciesList) {
      myPickerItems.add(Text(currency));
    }

    return CupertinoPicker(
        itemExtent: 32,
        onSelectedItemChanged: (int value) {
          setState(() {
            selectedCurrency = currenciesList[value];
          });
        },
        children: myPickerItems);
  }

  @override
  Widget build(BuildContext context) {
    getBTC();
    getETH();
    getLTC();
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = $btcValue $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ETH = $ethValue $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 LTC = $ltcValue $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: Platform.isAndroid
                  ? getDropDownButton()
                  : getCupertinoPicker()),
        ],
      ),
    );
  }
}
