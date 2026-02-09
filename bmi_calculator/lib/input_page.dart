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

enum Gender {
  male,
  female
}


class _InputPageState extends State<InputPage> {
  Gender? selectedGender;


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
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male ? customCardColor : customInactiveColor, 
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
                    colour: selectedGender == Gender.female ? customCardColor : customInactiveColor,
                    cardChild: ButtonIcon(icon: FontAwesomeIcons.venus, text: "FEMALE"),
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
