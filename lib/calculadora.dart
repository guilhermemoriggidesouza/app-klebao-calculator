import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'memory.dart';

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final memory = Memory();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FALA PRINCESA"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildDisplay(),
          _buildKeyboard()
        ],
      ),
    );
  }

  _buildDisplay(){
    return Expanded(
      child: Container(
        color: Colors.black87,
        child: AutoSizeText(
          memory.result,
          maxLines: 1, 
          textAlign: TextAlign.end,
          minFontSize: 20,
          maxFontSize: 80,
          style: TextStyle(fontSize: 80, color: Colors.white),
        ),
      ),
    );
  }

  _buildKeyboard(){
    return Container(
      height: 400,
      color:  Colors.black,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                  _buildKeyboardButton('AC', textColor: Colors.white),
                  _buildKeyboardButton('DEL', textColor: Colors.white),
                  _buildKeyboardButton('%', textColor: Colors.white),
                  _buildKeyboardButton('/', textColor: Colors.white),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                  _buildKeyboardButton('1', textColor: Colors.deepPurpleAccent),
                  _buildKeyboardButton('2', textColor: Colors.deepPurpleAccent),
                  _buildKeyboardButton('3', textColor: Colors.deepPurpleAccent),
                  _buildKeyboardButton('+', textColor: Colors.white),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                  _buildKeyboardButton('4', textColor: Colors.deepPurpleAccent),
                  _buildKeyboardButton('5', textColor: Colors.deepPurpleAccent),
                  _buildKeyboardButton('6', textColor: Colors.deepPurpleAccent),
                  _buildKeyboardButton('-', textColor: Colors.white),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                  _buildKeyboardButton('7', textColor: Colors.deepPurpleAccent),
                  _buildKeyboardButton('8', textColor: Colors.deepPurpleAccent),
                  _buildKeyboardButton('9', textColor: Colors.deepPurpleAccent),
                  _buildKeyboardButton('=', textColor: Colors.white),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                  _buildKeyboardButton('0', flex:2, textColor: Colors.white),
                  _buildKeyboardButton('.', textColor: Colors.white),
                  _buildKeyboardButton('x', textColor: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  _buildKeyboardButton(String label, {int flex = 1, Color textColor = Colors.white}){
    return Expanded(
      flex: flex,
      child: RaisedButton(
        color: Colors.black,
        textColor: textColor,
        child: Text(label, style: TextStyle(fontSize: 24),),
        onPressed: (){
          setState(() {
            memory.applyCommand(label);
          });
        },
      ),  
    );
  }
  
}
