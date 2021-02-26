// Mortgage App
// Based on Paul Dichone tutorial on Packt Publising
import 'package:flutter/material.dart';

class MortgageApp extends StatefulWidget {
  @override
  _MortgageAppState createState() => _MortgageAppState();
}

class _MortgageAppState extends State<MortgageApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mortgage App"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 120,
              child: Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Monthly Payment",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "\$980",
                        style: Theme.of(context).textTheme.headline5,
                      )
                    ],
                  )),
            ),
            // Monthly payment card
            Container(
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: InputDecoration(
                      prefixText: "House Price",
                      prefixIcon: Icon(Icons.home_outlined),
                    ),
                    onChanged: null,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Length of Loan (years)",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () => {},
                      child: Container(
                        width: 30,
                        height: 30,
                        child: Center(
                            child: Text("-",
                                style: TextStyle(color: Colors.white))),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                    Text("25"),
                    InkWell(
                      onTap: () => {},
                      child: Container(
                        width: 30,
                        height: 30,
                        child: Center(
                            child: Text("+",
                                style: TextStyle(color: Colors.white))),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Interest: ",
                    style: Theme.of(context).textTheme.headline5),
                Text("3.5", style: Theme.of(context).textTheme.headline5),
              ],
            ),
            Column(
              children: [
                Slider(
                  min: 0.0,
                  max: 20.0,
                  activeColor: Theme.of(context).hoverColor,
                  inactiveColor: Colors.grey,
                  value: 1.75,
                  onChanged: null,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
