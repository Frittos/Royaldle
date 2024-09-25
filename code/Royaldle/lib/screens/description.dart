import 'package:flutter/material.dart';
import 'package:royaldle/screensControllers/description_controller.dart';
import 'package:royaldle/textFields/main_text_field.dart';

import '../buttons/retry_button.dart';
import '../navigation_bars/our_bottom_navigation_bar.dart';
import '../style/others.dart';
import '../style/spacings.dart';

class Description extends StatefulWidget {
  static const routeName = '/description';

  final DescriptionController? controller;

  const Description({super.key, this.controller});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  late final DescriptionController _controller;

  @override
  void initState() {
    super.initState();
    // Initialisation du contrôleur ici si non fourni par le widget
    _controller = widget.controller ?? DescriptionController();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.getInitialized()) {
      // si la liste est déjà chargée, ne pas rentrer dans le FutureBuilder
      return FutureBuilder(
          future: _controller.generateGame(),
          // Méthode asynchrone pour initialiser les attributs
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // chargement, affiche un écran vide
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/Fond_ecran.png"),
                      fit: BoxFit.fill),
                ),
              );
            } else {
              // une fois la liste chargée, afficher l'écran
              return Description(
                controller: _controller,
              );
            }
          });
    } else {
      return myScreen();
    }
  }

  Widget myScreen() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/Fond_ecran.png"),
                fit: BoxFit.fill),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: kVerticalPaddingL),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/img/Logo_royaldle.png", scale: kScale),
                  // const SizedBox(
                  //   height: kVerticalPadding,
                  // ),
                  LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(kBorderRadius))),
                      width: kWidthDescriptionField,
                      height: kHeightDescriptionField,
                      child: Center(child: LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return SizedBox(
                            width: constraints.maxWidth - kMinusSpacingInBox,
                            child: Text(
                                _controller.displayRandomlyChoseDescription()));
                      })),
                    );
                  }),
                  const SizedBox(
                    height: kVerticalPadding,
                  ),
                  _controller.hasBeenFound()
                      ? (() {
                          _controller.addTrys();
                          return const RetryButton(caller: Description());
                        })()
                      : MainTextField(
                          caller: Description(
                            controller: _controller,
                          ),
                          gController: _controller,
                        ),
                  const SizedBox(
                    height: kVerticalPadding,
                  ),
                  SizedBox(
                    height: kHeightListViewDesc,
                    width: kWidthDescriptionField,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: _controller.getDataNumberOfTry(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(kAllPadding),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    color: _controller.retrieveComparison()),
                                width: kWidthDescriptionField,
                                height: kHeightBoxDesc,
                                child: Center(
                                  child: Text(_controller.displayTextInBox()),
                                ),
                              ));
                        }),
                  )
                  // const SizedBox(..
                  //   height: kVerticalPaddingL,
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const OurBottomNavigationBar(),
    );
  }
}
