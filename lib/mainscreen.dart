import 'package:calculatorapp/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String userQuestion = "";
  String userAnswer = "";


  List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "*",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "Ans",
    "=",
  ];

  bool isOperator(String X) {
    if (X == "+" || X == "-" || X == "/" || X == "*" || X == "%" || X == "=") {
      return true;
    } else {
      return false;
    }
  }

  void evaluate(){
    String finalQuestion = userQuestion;
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
    userQuestion = "";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(userQuestion,style: TextStyle(color: Colors.white, fontSize: 25),)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      alignment:Alignment.centerRight,
                    child: Text(userAnswer,style: TextStyle(color: Colors.yellow.shade700, fontSize: 25),)),
                )
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    return MyButton(
                        color: isOperator(buttons[index]) ?  Colors.yellow.shade700 : Colors.white10 ,
                        textColor: isOperator(buttons[index]) ?  Colors.black : Colors.white ,
                        buttonText: buttons[index], Tapped: (){
                          if (index == 0){
                            setState(() {
                              userQuestion = "";
                            });
                          }else if(index == 1){
                            setState(() {
                              if(userQuestion.length == 0){
                                userQuestion = "";
                              }else{
                                userQuestion = userQuestion.substring(0,userQuestion.length-1);
                              }
                            });
                          }else if(index == buttons.length-1){
                            setState(() {
                              evaluate();
                            });
                          } else{
                            setState(() {
                              userQuestion += buttons[index];
                              userAnswer ="";
                            });
                          }

                    },);
                  }))
        ],
      ),
    );
  }
}
