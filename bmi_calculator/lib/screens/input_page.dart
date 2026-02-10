import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_botton.dart';
import 'package:bmi_calculator/components/button_icon.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/round_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}


enum Gender {
  male,
  female
}


class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  int height = 180;
  int weight = 60;
  int age = 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male ? kcustomCardColor : kcustomInactiveColor, 
                    cardChild: ButtonIcon(icon: FontAwesomeIcons.mars, text: "MALE"), 
                  ),
                ),
                
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female ? kcustomCardColor : kcustomInactiveColor,
                    cardChild: ButtonIcon(icon: FontAwesomeIcons.venus, text: "FEMALE"),
                  ),
                ),
                
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kcustomInactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: klabelTextStyle              
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: klabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFFEB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      overlayColor: Color(0x29EB1555),
                      thumbColor: Color(0xFFEB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(), // Converte o int 'height' para double
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          // O segredo está aqui: arredondar o valor e atualizar o estado
                          height = newValue.round(); 
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ),


          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kcustomInactiveColor, 
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: klabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: () {
                              setState(() {
                                weight--;
                              });
                            }),
                            SizedBox(width: 10.0),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: () {
                              setState(() {
                                weight++;
                              });
                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
  
                
                Expanded(
                  child: ReusableCard(
                    colour: kcustomInactiveColor, 
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: klabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: () {
                              setState(() {
                                age--;
                              });
                            }),
                            SizedBox(width: 10.0),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: () {
                              setState(() {
                                age++;
                              });
                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
          ),
          BottomButton(buttonTitle: 'CALCULATE', onTap: () {
            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
              )
            )
          );
          }),
        ],
      )
      
    );
  }
}
