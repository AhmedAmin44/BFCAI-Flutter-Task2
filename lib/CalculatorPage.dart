import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _formKey = GlobalKey<FormState>();
  String? _firstNumber;
  String? _secondNumber;
  String _result = '';

  void _calculate(String operation) {
    if (_formKey.currentState!.validate()) {
      // Save the form's state to update the fields
      _formKey.currentState!.save();
      double firstNumber = double.parse(_firstNumber!);
      double secondNumber = double.parse(_secondNumber!);

      if (operation == 'add') {
        setState(() {
          _result = (firstNumber + secondNumber).toString();
        });
      } else if (operation == 'sub') {
        setState(() {
          _result = (firstNumber - secondNumber).toString();
        });
      }
    }
  }

  // Custom button using Container
  Widget _buildCustomButton(String text, VoidCallback onPressed, {Color backgroundColor = Colors.blue}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Calculator Page'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 45,left: 15,right: 15),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'First Number',
                    labelStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a number';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _firstNumber = value;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Second Number',
                    labelStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a number';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _secondNumber = value;
                  },
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCustomButton('Add', () => _calculate('add')),
                    _buildCustomButton('Subtract', () => _calculate('sub')),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  'Result: $_result',
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
