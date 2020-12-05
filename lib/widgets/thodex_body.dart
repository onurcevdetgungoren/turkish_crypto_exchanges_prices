import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkish_crypto_exchanges_prices/modelview/thodex_view_model.dart';

class ThodexBody extends StatefulWidget {
  @override
  _ThodexBodyState createState() => _ThodexBodyState();
}

class _ThodexBodyState extends State<ThodexBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ThodexViewModel _thodexViewModel, child) => Column(
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
                child: (_thodexViewModel.state == ThodexState.LoadedState)
                    ? ListView.builder(
                        itemCount: _thodexViewModel.thodex.length,
                        itemBuilder: (context, index) => Card(
                              elevation: 1,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 1 / 12,
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
                                                          _thodexViewModel
                                                              .thodex[index]
                                                              .stock +
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
                                                  _thodexViewModel
                                                      .thodex[index].market
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
                                                      text: "Last: ",
                                                      style:
                                                          DefaultTextStyle.of(
                                                                  context)
                                                              .style,
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: _thodexViewModel
                                                              .thodex[index]
                                                              .last
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
                    : (_thodexViewModel.state == ThodexState.LoadingState)
                        ? veriGeliyor()
                        : (_thodexViewModel.state == ThodexState.ErrorState)
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
