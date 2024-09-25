import 'package:flutter/material.dart';
import 'package:royaldle/textFields/main_text_field.dart';

import '../navigation_bars/our_bottom_navigation_bar.dart';
import '../screensControllers/classique_controller.dart';
import '../style/others.dart';
import '../style/spacings.dart';

class Emoji extends StatefulWidget {
  static const routeName = '/emoji';

  const Emoji({super.key});

  @override
  State<Emoji> createState() => _EmojiState();
}

class _EmojiState extends State<Emoji> {
  final ClassiqueController controller = ClassiqueController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/Fond_ecran.png"), fit: BoxFit.fill),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: kVerticalPaddingL),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                        "assets/img/Logo_royaldle.png", scale: kScale
                    ),
                    const SizedBox(
                      height: kVerticalPadding,
                    ),
                    MainTextField(caller: Emoji(), gController: controller,),
                    const SizedBox(
                      height: kVerticalPadding,
                    ),
                    const Text("emoji")
                    // const SizedBox(..
                    //   height: kVerticalPaddingL,
                    // )
                  ],
                ),
              ),
            ),
          ),
        ), bottomNavigationBar: const OurBottomNavigationBar(),
    );
  }
}