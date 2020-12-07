import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkish_crypto_exchanges_prices/modelview/binance_view_model.dart';

class BinanceBody extends StatefulWidget {
  @override
  _BinanceBodyState createState() => _BinanceBodyState();
}

class _BinanceBodyState extends State<BinanceBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, BinanceViewModel _binanceViewModel, child) => Column(
        children: [
          Card(
            elevation: 1,
            child: Container(
              height: 40,
              //width: 30,
              child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment(-0.6, 0),
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text("Coin",
                              style: TextStyle(color: Colors.grey.shade400)),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment(0.6, 0),
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text("Fiyat",
                              style: TextStyle(
                                color: Colors.grey.shade400,
                              )),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          Expanded(
            child: Card(
                child: (_binanceViewModel.state == BinanceState.LoadedState)
                    ? ListView.builder(
                        itemCount: _binanceViewModel.binance.length,
                        itemBuilder: (context, index) => Card(
                              elevation: 1,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 1 / 13,
                                //width: 30,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: MediaQuery.of(context).size.width *
                                          2 /
                                          4,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Container(
                                              child: CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      "assets/" +
                                                          _binanceViewModel
                                                              .binance[index]
                                                              .symbol
                                                              .substring(0, 3)
                                                              .toString() +
                                                          ".png")),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: 80,
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  _binanceViewModel
                                                      .binance[index].symbol
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 15.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1 /
                                              4,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: RichText(
                                                  text: TextSpan(
                                                      text: "Price: ",
                                                      style:
                                                          DefaultTextStyle.of(
                                                                  context)
                                                              .style,
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text:
                                                              _binanceViewModel
                                                                  .binance[
                                                                      index]
                                                                  .price
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ]),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                    : (_binanceViewModel.state == BinanceState.LoadingState)
                        ? veriGeliyor()
                        : (_binanceViewModel.state == BinanceState.ErrorState)
                            ? hataGeldi()
                            : hata()),
          ),
        ],
      ),
    );
  }

  veriGeliyor() {
    return Center(child: CircularProgressIndicator());
  }

  hataGeldi() {
    return Center(child: Text("hata"));
  }

  hata() {
    return Center(child: Text("hata1"));
  }
}
