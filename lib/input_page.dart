import 'results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'calculator.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 16;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
        backgroundColor: kInactiveCardColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  shade: selectedGender == Gender.male
                      ? kCardColor
                      : kInactiveCardColor,
                  cardChild: ReusableColumn(
                    icon: FontAwesomeIcons.mars,
                    gender: 'MALE',
                  ),
                ),
              ),
              Expanded(
                  child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                shade: selectedGender == Gender.female
                    ? kCardColor
                    : kInactiveCardColor,
                cardChild: ReusableColumn(
                  icon: FontAwesomeIcons.venus,
                  gender: 'Female',
                ),
              )),
            ],
          )),
          Expanded(
              child: ReusableCard(
            shade: kCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kGenderTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextSyle,
                    ),
                    Text(
                      'cm',
                      style: kGenderTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                    value: height!.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                    min: 120.0,
                    max: 220.0,
                  ),
                )
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                shade: kCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Weight',
                      style: kGenderTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberTextSyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          backgroundColor: Color(0xFF4C4F5E),
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        FloatingActionButton(
                          backgroundColor: Color(0xFF4C4F5E),
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                          child: Icon(
                            FontAwesomeIcons.minus,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),
              Expanded(
                  child: ReusableCard(
                shade: kCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Age',
                      style: kGenderTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberTextSyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          backgroundColor: Color(0xFF4C4F5E),
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        FloatingActionButton(
                          backgroundColor: Color(0xFF4C4F5E),
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                          child: Icon(
                            FontAwesomeIcons.minus,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),
            ],
          )),
          OutlinedButton(
            onPressed: () {
              Calculator calc = Calculator(height, weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getinterpretation(),
                          )));
            },
            child: Container(
              child: Center(
                  child: Text(
                'Calculate',
                style: TextStyle(fontSize: 40.0, color: Colors.white),
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
