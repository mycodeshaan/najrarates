import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  const CryptoCard(
      {this.value, this.selectedCurrency, this.cryptoCurrency, this.ngn});

  final double value;
  final String selectedCurrency;
  final String cryptoCurrency;
  final double ngn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.indigoAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 BTC = ₦ ${value * ngn}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
