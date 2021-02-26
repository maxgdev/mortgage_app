// Mortgage App
// Based on Paul Dichone tutorial on Packt Publising
import 'dart:math';

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
                        " ${ ( _housePrice > 0 && _interestRate > 0.0) ? "\$${calculateMonthlyPayment(_housePrice, _interestRate, _lengthOfLoan)}" : ""}",
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
                    onChanged: (String inputHousePrice) {
                        try {
                          _housePrice = double.parse(inputHousePrice);

                        }catch (exception) {
                           _housePrice = 0.0;
                        }

                      },
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

    //Monthly Payment Formula
  /*
   n = number of payments
   c = monthly interest rate

   int n = 12 * years;
   double c = rate / 12.0 / 100.0;
   double payment = loan * c * Math.pow(1 + c, n) /
                    (Math.pow(1 + c, n) - 1);
   */
   calculateMonthlyPayment(double housePrice, double interest, int loanLength ) {
     int n = 12 * loanLength;
     double c = interest / 12.0 / 100.0;
     double monthlyPayment = 0.0;

     if (housePrice < 0 || housePrice.toString().isEmpty || housePrice == null) {
        //no go!
      // _homePrice = 0.0;
     }else {
       monthlyPayment = housePrice * c * pow(1 + c, n) / (pow(1 + c, n) - 1);
     }


     return monthlyPayment.toStringAsFixed(2);
  }
}
