import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map exchangeRate;

  const DetailPage({required this.exchangeRate, super.key});

  @override
  Widget build(BuildContext context) {
    List currencies = exchangeRate.keys.toList();
    List rates = exchangeRate.values.toList();
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: currencies.length,
          itemBuilder: (context, int index) {
            String _currency = rates[index].toString();
            String _rates = currencies[index];
            return ListTile(
              subtitle: Text(
                "$_currency",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              title: Text(
                "$_rates",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
