import 'package:flutter/material.dart';
import '../style/spacings.dart';

class RetryButton extends StatefulWidget {
  final StatefulWidget caller;

  const RetryButton({super.key, required this.caller});

  @override
  State<RetryButton> createState() => _RetryButtonState();
}

class _RetryButtonState extends State<RetryButton> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return widget.caller;
          }),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        //backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      child: const Text("Félicitation ! Recommencer ?"),
    );
  }

}