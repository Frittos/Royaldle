import 'package:flutter/material.dart';

import '../buttons/main_button.dart';
import '../style/spacings.dart';
import 'classique.dart';
import 'description.dart';

class Welcome extends StatelessWidget {
  static const routeName = '/';

  const Welcome({super.key});

  // !!!!!! changer l'écran d'acceuil en splashscreen et déplacer le menu dans une bottom naviagation bar

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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/img/Logo_royaldle.png",
                  scale: 2,
                ),
                // const SizedBox(..
                //   height: kVerticalPaddingL,
                // ),
                Image.asset("assets/img/texteMainEcran.png"),
                // const SizedBox(
                //   height: kVerticalPaddingL,
                // ),
                MainButton(
                    header: '1',
                    text: 'Classique',
                    onTap: () {
                      Navigator.pushNamed(context, Classique.routeName);
                    }),
                const SizedBox(
                  height: kVerticalPadding,
                ),
                MainButton(
                    header: '2',
                    text: 'Description',
                    onTap: () {
                      Navigator.pushNamed(context, Description.routeName);
                    }),
                const SizedBox(
                  height: kVerticalPadding,
                ),
                MainButton(header: '3', text: 'Emojis', onTap: () {}),
                const SizedBox(
                  height: kVerticalPadding,
                ),
                // MainButton(text: 'Continuer sans compte', onTap: () {
                //   Navigator.pushNamed(context, HomeScreen.routeName);
                // }, isMain: true),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     MainButton(
                //         text: 'Je me connecte', onTap: () {}, isMain: false),
                //     MainButton(
                //         text: 'Créer mon compte',
                //         onTap: () =>
                //             Navigator.pushNamed(context, Register.routeName),
                //         isMain: false),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
