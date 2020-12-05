import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkish_crypto_exchanges_prices/modelview/paribu_view_model.dart';

class ParibuBody extends StatefulWidget {
  @override
  _ParibuBodyState createState() => _ParibuBodyState();
}

class _ParibuBodyState extends State<ParibuBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ParibuViewModel _paribuViewModel, child) => Column(
        children: [
          Card(
            elevation: 1,
            child: Container(
              height: 40,
              //width: 30,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Text("Coin",
                          style: TextStyle(color: Colors.grey.shade400)),
                    ),
                    Expanded(
                      child: Text("Fiyat",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                          )),
                    ),
                    Text("Değişim",
                        style: TextStyle(color: Colors.grey.shade400)),
                    SizedBox(
                      width: 13,
                    ),
                  ]),
            ),
          ),
          Expanded(
            child: Card(
                child: (_paribuViewModel.state == ParibuState.LoadedState)
                    ? ListView.builder(
                        itemCount: _paribuViewModel.paribu.length,
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
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1 /
                                                3,
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
                                                        "assets/${_paribuViewModel.parities[index]}.png")),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: 80,
                                                child: Text(
                                                    _paribuViewModel
                                                        .parities[index]
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 15.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                2 /
                                                3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                  text: "Last: ",
                                                  style: DefaultTextStyle.of(
                                                          context)
                                                      .style,
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: _paribuViewModel
                                                          .paribu[index].last
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ]),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        width: 60,
                                        child: Text(
                                          _paribuViewModel
                                                  .paribu[index].percentChange
                                                  .toString() +
                                              "%",
                                          style: TextStyle(
                                              color: double.parse(
                                                          _paribuViewModel
                                                              .paribu[index]
                                                              .percentChange
                                                              .toString()) <=
                                                      0
                                                  ? Colors.red.shade400
                                                  : Colors.green.shade400,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                    : (_paribuViewModel.state == ParibuState.LoadingState)
                        ? veriGeliyor()
                        : (_paribuViewModel.state == ParibuState.ErrorState)
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
    return Center(child: Text("Verileri Almak için TabBar'a Dokunun"));
  }
}
