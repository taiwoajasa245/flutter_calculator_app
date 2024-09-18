import "package:flutter/material.dart";
import 'package:calculator_flutter/utils/constant.dart';
import 'package:calculator_flutter/utils/calculator_brain.dart';
import 'package:calculator_flutter/model/button_model.dart';
import 'package:calculator_flutter/utils/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentInput = '0';
  String result = '';

  void onButtonPressed(String value) {
    setState(() {
      if (value == 'AC') {
        // Clear input and result
        currentInput = '0';
        result = '';
      } else if (value == 'Del') {
        if (value.isNotEmpty) {
          if (currentInput.length == 1) {
            // Clear input and result
            currentInput = '0';
            result = '';
          } else {
            currentInput = currentInput.substring(0, currentInput.length - 1);
          }
        }
      } else if (value == '=') {
        // Perform calculation (add logic here)
        result = calculateResult(currentInput).toString();
      } else {
        // Append value to current input
        if (currentInput == '0' && value != '.') {
          currentInput = value;
        } else {
          currentInput += value;
        }
      }
    });
  }

  String calculateResult(String input) {
    String result = '0';
    if (input.isEmpty) {
      return result;
    } else {
      CalculatorBrain calculatorBrain = CalculatorBrain();
      double calculationResult = calculatorBrain.getCalculation(input);

      // Check if the result is a whole number
      if (calculationResult == calculationResult.toInt()) {
        // If the result is a whole number, convert it to an integer string
        result = calculationResult.toInt().toString();
      } else {
        // Otherwise, keep it as a double string
        result = calculationResult.toString();
      }

      return result;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(kBackgroundColor),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.zoom_in_map_outlined,
            color: Color(kResultColor),
            size: 20,
          ),
          onPressed: () {
            // Action when search icon is pressed
          },
        ),
        title: const Text(
          "Calculator",
          style: TextStyle(color: Color(kResultColor), fontSize: 25),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'About') {
                LaunchUrl().launch('https://github.com/taiwoajasa245');
                print('About pressed');
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'About',
                  child: Text('About'),
                ),
              ];
            },
            icon: const Icon(
              Icons.more_vert,
              color: Color(kResultColor),
              size: 20,
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: const Color(kBackgroundColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(20),
                child: Text(
                  result.isEmpty ? currentInput : result,
                  style:
                      const TextStyle(fontSize: 35, color: Color(kResultColor)),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final buttonData = buttons[index];
                  final buttonText = buttonData['label'];
                  final buttonIcon = buttonData['icon'];
                  final buttonColor =
                      buttonData['color'] ?? const Color(kResultColor);

                  final buttonBgColor = buttonData['bg-color'] ??
                      const Color(kButtonBackgroundColor);

                  return CalculatorButton(
                    text: buttonText,
                    color: buttonColor,
                    bgColor: buttonBgColor,
                    icon: buttonIcon,
                    onTap: () => onButtonPressed(buttonText),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color color;
  final Color bgColor;
  final VoidCallback onTap;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
    required this.color,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16),
          ),
          width: 10.0,
          height: 10.0,
          child: Center(
            child: icon == null
                ? Text(
                    text,
                    style: TextStyle(
                      color: color,
                      fontSize: 30.0,
                    ),
                  )
                : Icon(
                    icon,
                    size: 24,
                    color: const Color(kBtnColor),
                  ),
          ),
        ),
      ),
    );
  }
}
