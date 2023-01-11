import 'package:bmi_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';

class ResultsPage extends StatelessWidget {
  final String? bmiResult;
  final String? resultText;
  final String? interpretation;

  ResultsPage({this.bmiResult, this.interpretation, this.resultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: kInactiveCardColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.center,
            child: Center(
              child: Text(
                'Your Result',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
              ),
            ),
          )),
          Expanded(
            flex: 5,
            child: ReusableCard(
              shade: kCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText!.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult!,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation!,
                    style: kBodyTextStyle,
                  )
                ],
              ),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                  child: Text(
                'Re - Calculate',
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              )),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10),
              height: kBottomContainerHeight,
            ),
          ),
        ],
      ),
    );
  }
}
