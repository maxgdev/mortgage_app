// Mortgage App
// Based on Paul Dichone tutorial on Packt Publising
import 'package:flutter/material.dart';

class MortgageApp extends StatefulWidget {
  @override
  _MortgageAppState createState() => _MortgageAppState();
}

class _MortgageAppState extends State<MortgageApp> {
  double  _interestRate = 0.0;
  double  _housePrice = 0.0;
  int     _lengthOfLoan = 0;
  

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
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "Length of Loan (years)",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (_lengthOfLoan > 0) {
                            _lengthOfLoan -= 5;
                          } else {
                            // do nothing 
                          }
                        });
                      },
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
                    Container(
                      alignment: Alignment.center,
                      width: 35,
                      child: Text("$_lengthOfLoan", style: Theme.of(context).textTheme.headline5)),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (_lengthOfLoan < 40) {
                            _lengthOfLoan += 5;
                          } else {
                            // do nothing as less than 41yrs
                          }
                        });
                      },
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
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Interest: ",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Text("${_interestRate.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.headline5),
              ],
            ),
            Column(
              children: [
                Slider(
                  min: 0.0,
                  max: 20.0,
                  divisions: 400,
                  // activeColor: Theme.of(context).hoverColor,
                  // inactiveColor: Colors.grey,
                  value: _interestRate,
                  onChanged: (double intValue) => {
                    setState(() {
                      _interestRate = intValue;
                    })
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
