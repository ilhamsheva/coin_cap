import 'dart:convert';
import 'package:coin_cap/models/coins.dart';
import 'package:coin_cap/pages/details_page.dart';
import 'package:coin_cap/services/http_services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../custom/custom_dropdown.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Varieble for device size
  late double _deviceHeight, _deviceWidth;
  // Variable from HttpServices
  late HttpServices _http;

  // var for coin name
  String? _selectedCoinId = "bitcoin"; // Default coin
  String _selectedCoinName = "Bitcoin";

  // Init function to take data from API
  @override
  void initState() {
    super.initState();
    _http = GetIt.instance.get<HttpServices>();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _dropdownMenu(),
            Expanded(child: _dataWidgets(_selectedCoinId!)),
          ],
        ),
      ),
    );
  }

  Widget _dropdownMenu() {
    return CustomDropdown(
      values: Coins.topCoins.map((coin) => coin.name).toList(),
      selectedValue: _selectedCoinName,
      onChanged: (value) {
        setState(() {
          _selectedCoinName = value!;
          final coin = Coins.topCoins.firstWhere((coin) => coin.name == value);
          _selectedCoinId = coin.id;
        });
      },
    );
  }

  Widget _currentPriceIDR(num price) {
    return Text(
      "Rp ${price.toStringAsFixed(2)}",
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _changePercent(num change) {
    return Text(
      "${change.toStringAsFixed(2)}%",
      style: TextStyle(
        color: change >= 0 ? Colors.green : Colors.red,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _imageCoin(String url) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.1),
      height: _deviceHeight * 0.15,
      width: _deviceWidth * 0.15,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(url)),
      ),
    );
  }

  Widget _descriptionCoin(String description) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: _deviceHeight * 0.05),
      padding: EdgeInsets.symmetric(
        vertical: _deviceHeight * 0.01,
        horizontal: _deviceWidth * 0.01,
      ),
      width: _deviceWidth * 0.90,
      height: _deviceHeight * 0.52,
      color: Color.fromRGBO(6, 75, 94, 1),
      child: Text(description, style: TextStyle(color: Colors.white)),
    );
  }

  // Widget for fetch data from API
  Widget _dataWidgets(String coinId) {
    return FutureBuilder(
      future: _http.get("/coins/$_selectedCoinId"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map data = jsonDecode(snapshot.data.toString());
          num priceIDR = data["market_data"]["current_price"]["idr"];
          num change24h = data["market_data"]["price_change_percentage_24h"];
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                child: _imageCoin(data["image"]["large"]),
                onDoubleTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailPage(exchangeRate: data["market_data"]["current_price"]);
                  }));
                },
              ),
              _currentPriceIDR(priceIDR),
              _changePercent(change24h),
              Expanded(
                child: SingleChildScrollView(
                  child: _descriptionCoin(data["description"]["en"]),
                ),
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
