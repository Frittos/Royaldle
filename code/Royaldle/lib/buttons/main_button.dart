import 'package:flutter/material.dart';


class MainButton extends StatelessWidget {
  final String header;
  final String text;
  final Function onTap;

  const MainButton({
    super.key,
    required this.header,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
          width: 280,
          height: 75,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/Blank_Button.png"),
                fit: BoxFit.fill),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(alignment: Alignment.centerLeft, child: Text(
                  header,
                  style: const TextStyle(fontSize: 25),
                ),),

            Text(
              text,
              style: const TextStyle(fontSize: 25),
            )
          ])),
    );
  }
}
