import 'package:bmi_calculator/button_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

const Color customCardColor = Color(0xFF1D1E33);
const Color customButtonColor = Color(0xFFEB1555);
const Color customInactiveColor = Color(0xFF111328);
const double customButtonHeight = 80.0;

class _InputPageState extends State<InputPage> {
  Color maleCardColor = customInactiveColor;
  Color femaleCardColor = customInactiveColor;

  // 1 = male, 2 = female
  void updateColor(int selectGender){
    if(selectGender == 1){
      if(maleCardColor == customInactiveColor){
        maleCardColor = customCardColor;
        femaleCardColor = customInactiveColor;
      } else {
        maleCardColor = customInactiveColor;
      }
    } else if(selectGender == 2){
      if(femaleCardColor == customInactiveColor){
        femaleCardColor = customCardColor;
        maleCardColor = customInactiveColor;
      } else {
        femaleCardColor = customInactiveColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => updateColor(1)),
                    child: ReusableCard(
                      colour: maleCardColor, 
                      cardChild: ButtonIcon(icon: FontAwesomeIcons.mars, text: "MALE"), 
                    ),
                  ),
                ),
                
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => updateColor(2)),
                    child: ReusableCard(
                      colour: femaleCardColor, 
                      cardChild: ButtonIcon(icon: FontAwesomeIcons.venus, text: "FEMALE"),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: customInactiveColor
            )
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: customInactiveColor, 
                    cardChild: ButtonIcon(icon: FontAwesomeIcons.mars, text: "MALE"), 
                  ),
                ),
  
                
                Expanded(
                  child: ReusableCard(
                    colour: customInactiveColor, 
                    cardChild: ButtonIcon(icon: FontAwesomeIcons.venus, text: "FEMALE"),
                  ),
                ),
                
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10.0),
            color: customButtonColor,
            width: double.infinity,
            height: customButtonHeight,
            child: Text(
              'CALCULATE',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      )
      
    );
  }
}
