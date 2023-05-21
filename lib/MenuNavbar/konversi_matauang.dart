import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class KonversiMataUang extends StatefulWidget {
  @override
  _KonversiMataUangState createState() => _KonversiMataUangState();
}

class _KonversiMataUangState extends State<KonversiMataUang> {
  double amount = 0.0;
  String selectedCurrency = 'IDR';
  List<String> currencies = ['USD', 'EUR', 'IDR' ,'GBP','JPY'];
  Map<String, double> exchangeRates = {
    'USD': 0.0000714, // Kurs pertukaran IDR ke USD
    'EUR': 0.0000607, // Kurs pertukaran IDR ke EUR
    'IDR': 1.0, // Kurs pertukaran IDR ke IDR (1 IDR = 1 IDR)
    'GBP': 0.0000512, // Kurs pertukaran IDR ke GBP
    'JPY': 0.00714, // Kurs pertukaran IDR ke JPY
  };

  double convertCurrency(
      double amount, String fromCurrency, String toCurrency) {
    if (fromCurrency == 'USD') {
      return amount * exchangeRates[toCurrency]!;
    } else if (toCurrency == 'USD') {
      return amount / exchangeRates[fromCurrency]!;
    } else {
      double usdAmount = amount / exchangeRates[fromCurrency]!;
      return usdAmount * exchangeRates[toCurrency]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Currency Converter',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  amount = double.parse(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: selectedCurrency,
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value!;
                });
              },
              items:
                  currencies.map<DropdownMenuItem<String>>((String currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Converted Amount: ${convertCurrency(amount, 'USD', selectedCurrency)}',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
