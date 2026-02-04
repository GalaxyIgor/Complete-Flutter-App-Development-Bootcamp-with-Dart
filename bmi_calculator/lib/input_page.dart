import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final Color customCardColor = Color(0xFF1D1E33);
  final Color customButtonColor = Color(0xFFEB1555);
  final double customButtonHeight = 80.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          ReusableCard(colour: customCardColor),
          Expanded(
            child: Row(
              children: [
                ReusableCard(colour: customCardColor),
                ReusableCard(colour: customCardColor),
              ],
            ),
          ),
          ReusableCard(colour: customCardColor),
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

class ReusableCard extends StatelessWidget {
  final Color colour;
  
  const ReusableCard({
    required this.colour,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
