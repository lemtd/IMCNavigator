import 'package:flutter/material.dart';
import 'package:forms_class/ui/Result.dart';

class IMCCalculator extends StatefulWidget {
  const IMCCalculator({super.key});

  @override
  _IMCCalculatorState createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<IMCCalculator> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  void _resetInfos() {
    _formKey.currentState?.reset();
    weightController.clear();
    heightController.clear();
  }

  void _sumIMC() {
    String image = "";
    String text = "";

    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);
    double imc = weight / (height * height);

    if (imc < 18.6) {
      text = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
      image = "images/thin.png";
    } else if (imc >= 18.6 && imc < 24.9) {
      text = "Peso ideal (${imc.toStringAsPrecision(4)})";
      image = "images/shape.png";
    } else if (imc >= 24.9 && imc < 29.9) {
      text = "Levemente acima do peso (${imc.toStringAsPrecision(4)})";
      image = "images/fat.png";
    } else if (imc >= 29.9 && imc < 34.9) {
      text = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      image = "images/fat.png";
    } else if (imc >= 34.9 && imc < 39.9) {
      text = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      image = "images/fat.png";
    } else if (imc >= 40) {
      text = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
      image = "images/fat.png";
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) => Result(image, text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("IMC Calculator"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: _resetInfos, icon: const Icon(Icons.refresh))
          ]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const Icon(
                Icons.person,
                size: 120,
                color: Colors.green,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Weight (kg)",
                  labelStyle: TextStyle(color: Colors.green, fontSize: 25),
                ),
                controller: weightController,
                style: const TextStyle(color: Colors.green, fontSize: 25),
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insert your weight";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Height (cm)",
                  labelStyle: TextStyle(color: Colors.green, fontSize: 25),
                ),
                controller: heightController,
                style: const TextStyle(color: Colors.green, fontSize: 25),
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insert your height";
                  } else {
                    return null;
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: ButtonTheme(
                  height: 50,
                  highlightColor: Colors.amber,
                  child: ElevatedButton(
                    onPressed: _sumIMC,
                    child: const Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}