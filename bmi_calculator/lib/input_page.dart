import 'package:bmi_calculator/button_icon.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';

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
                  Slider(
                    value: height.toDouble(), // Converte o int 'height' para double
                    min: 120.0,
                    max: 220.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    thumbColor: Color(0xFFEB1555),
                    onChanged: (double newValue) {
                      setState(() {
                        // O segredo está aqui: arredondar o valor e atualizar o estado
                        height = newValue.round(); 
                      });
                    },
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
                    cardChild: ButtonIcon(icon: FontAwesomeIcons.mars, text: "MALE"), 
                  ),
                ),
  
                
                Expanded(
                  child: ReusableCard(
                    colour: kcustomInactiveColor, 
                    cardChild: ButtonIcon(icon: FontAwesomeIcons.venus, text: "FEMALE"),
                  ),
                ),
                
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10.0),
            color: kcustomButtonColor,
            width: double.infinity,
            height: kcustomButtonHeight,
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
