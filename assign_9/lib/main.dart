import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int result = 0;
  late TextEditingController amount, rate;

  var amountError, rateError;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amount = TextEditingController();
    rate = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
                child: Text(
                  "Currency Calculator Application",
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                child: TextField(
                  controller: amount,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    errorText: amountError,
                    label: Text('Enter DOLOR Amount!'),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo),
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: TextField(
                  controller: rate,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      errorText: rateError,
                      label: Text('Enter The Rate'),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo),
                          borderRadius: BorderRadius.all(Radius.circular(0)))),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      if (amount.text.length < 1) {
                        amountError = 'Amount should not be Empty!';
                      } else if (rate.text.length < 1) {
                        amountError = null;
                        rateError = 'Rate should not be Empty!';
                      } else {
                        amountError = null;
                        rateError = null;
                        result = int.parse(amount.text) * int.parse(rate.text);
                      }
                    });
                  },
                  child: Text(
                    'Calculate',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text("Result = $result",
                      style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),
        ),
      ),
    );
  }
}
