import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});/*{
    debugPrint("constructor");
  }*/

  @override
  State<CurrencyConverterMaterialPage> createState() {
    //debugPrint("createState");
    return _CurrencyConverterMaterialPageState();
  }
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {

  /*@override
  void initState() {
    super.initState();
    debugPrint("initState");
    //if we want to have late type of variable
    //eg: late double result;
  }*/

  final TextEditingController textEditingController = TextEditingController();
  double result = 0;

  void convert(){
    ///debug, release, profile
    setState(() {
      result = double.parse(textEditingController.text) * 3.67;
    });
  }

  @override
  Widget build(BuildContext context) {
    //debugPrint("built in");

    ///BorderStyle of an Input field
    final border = OutlineInputBorder(
        borderSide: const BorderSide(
            color: Colors.black,
            width: 2.0,
            style: BorderStyle.solid,
            strokeAlign: BorderSide.strokeAlignOutside),
        borderRadius: BorderRadius.circular(10)
      /*borderRadius: BorderRadius.all(Radius.circular(30))*/
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      ///I use the appBar of same color. You can change color.
      ///OR Comment it, as you like
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Currency Converter",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(

        child: Padding(
          //padding: const EdgeInsets.symmetric(horizontal: 15.0),
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "AED ${result != 0 ? result.toStringAsFixed(2): result.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),

              ///Padding
              ///Container
              TextField(
                controller: textEditingController,
                onSubmitted: (value){

                },
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: "Please enter the amount in USD",
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                  /*contentPadding:*/
                ),
                textInputAction: TextInputAction.done,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+.?[0-9]*'))
                ],
              ),

              const SizedBox(height: 10,),
              ///buttons
              ///raised
              ///appears like a text
              ElevatedButton(
                onPressed: () {
                  convert();
                },

                ///You can give style with WidgetStatePropertyAll or
                ///You can use "Widget.styleFrom"
                /*style: ButtonStyle(
                  elevation: const WidgetStatePropertyAll(15.0),
                  backgroundColor: const WidgetStatePropertyAll(Colors.black),
                  foregroundColor: const WidgetStatePropertyAll(Colors.white),
                  minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 50)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )*/
                style: ElevatedButton.styleFrom(
                  elevation: 15.0,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Convert"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //use to dispose controllers to save the app/widget from memory leaks
  //it's called when the entire widget is going to discard
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
