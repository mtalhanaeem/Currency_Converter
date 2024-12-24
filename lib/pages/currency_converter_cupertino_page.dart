import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {

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
    ///BorderStyle of an Input field
    /*final border = OutlineInputBorder(
        borderSide: const BorderSide(
            color: Colors.black,
            width: 2.0,
            style: BorderStyle.solid,
            strokeAlign: BorderSide.strokeAlignOutside),
        borderRadius: BorderRadius.circular(10)
      *//*borderRadius: BorderRadius.all(Radius.circular(30))*//*
    );*/

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey3,
      ///I use the appBar of same color. You can change color.
      ///OR Comment it, as you like
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey3,
        middle: Text(
          "Currency Converter",
          style: TextStyle(
            color: CupertinoColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      child: Center(

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
              CupertinoTextField(
                controller: textEditingController,
                onSubmitted: (value){

                },
                style: const TextStyle(
                  color: CupertinoColors.black,
                ),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                  color: CupertinoColors.white,
                ),

                placeholder: "Please enter the amount in USD",
                prefix: const Icon(CupertinoIcons.money_dollar),

               /* InputDecoration(
                  hintText: "Please enter the amount in AED",
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                  *//*contentPadding:*//*
                ),*/

                textInputAction: TextInputAction.done,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                /*inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+.?[0-9]*'))
                ],*/
              ),

              const SizedBox(height: 10,),

              ///buttons
              ///raised
              ///appears like a text
              CupertinoButton(
                onPressed: () {
                  convert();
                },
                color: CupertinoColors.black,

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
                /*style: ElevatedButton.styleFrom(
                  elevation: 15.0,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),*/
                child: const Text(
                  "Convert",
                  style: TextStyle(
                    color: CupertinoColors.white,
                  ),
                ),
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
