import 'package:flutter/material.dart';
import 'package:royaldle/screensControllers/generic_controller.dart';
import '../style/spacings.dart';

class MainTextField extends StatefulWidget {
  final StatefulWidget caller;
  final GenericController gController;

  const MainTextField(
      {super.key, required this.caller, required this.gController});

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  //var _cardName;
  final _cardController = TextEditingController();

  final List<String> _cardOptions = [];

  @override
  void initState() {
    super.initState();
    widget.gController.preparingAutoCompleteList(_cardOptions);
  }

  @override
  void dispose() {
    _cardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Container(
          constraints: const BoxConstraints(maxWidth: kMaxWidthTextField),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/img/TextField.png"),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Autocomplete<String>(
              fieldViewBuilder: (BuildContext context,
                  TextEditingController textEditingController,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted) {
                return TextField(
                  controller: textEditingController,
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    hintText: "Tape le nom d'une carte", // Le placeholder
                  ),
                );
              },
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  const Iterable<String>.empty();
                }
                return _cardOptions.where((String option) {
                  //allow cards to be written with lowercase or uppercase (both) my modifying option
                  _cardController.text = textEditingValue.text;
                  return option.contains(textEditingValue.text);
                });
              },
              onSelected: (String selection) {
                debugPrint('You just selected $selection');
              },
            ),
          )),
      myTextFormFieldButton(context),
    ]));
  }

  ElevatedButton myTextFormFieldButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            widget.gController.dataTreatment(_cardController.text);
            return widget.caller;
          }),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        foregroundColor: Colors.black,
      ),
      child: const Icon(Icons.arrow_forward),
    );
  }
}
