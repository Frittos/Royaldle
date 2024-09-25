import 'package:flutter/material.dart';
import 'package:royaldle/navigation_bars/our_bottom_navigation_bar.dart';
import 'package:royaldle/screensControllers/classique_controller.dart';
import 'package:royaldle/textFields/main_text_field.dart';

import '../buttons/retry_button.dart';
import '../style/others.dart';
import '../style/spacings.dart';

class Classique extends StatefulWidget {
  static const routeName = '/classique';

  final ClassiqueController? controller;

  const Classique({super.key, this.controller});

  @override
  State<Classique> createState() => _ClassiqueState();
}

class _ClassiqueState extends State<Classique> {
  final ScrollController _mainScrollController = ScrollController();
  final List<ScrollController> _scrollControllers = [];

  late final ClassiqueController _controller;

  bool _isSyncing = false;

  @override
  void initState() {
    super.initState();
    // Initialisation du contrôleur ici si non fourni par le widget
    _controller = widget.controller ?? ClassiqueController();
    for (int i = 0; i < _controller.getDataNumberOfTry(); i++) {
      final ScrollController itemScrollController = ScrollController();
      _scrollControllers.add(itemScrollController);
      itemScrollController.addListener(() {
        _syncScroll(i);
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _scrollControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _syncScroll(int sourceIndex) {
    if (_isSyncing) return;

    _isSyncing = true;
    final sourceController = _scrollControllers[sourceIndex];
    final offset = sourceController.offset;

    for (var i = 0; i < _scrollControllers.length; i++) {
      if (i != sourceIndex) {
        _scrollControllers[i].jumpTo(offset);
      }
    }

    _isSyncing = false;
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
              return Classique(
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
              image: AssetImage("assets/img/Fond_ecran.png"), fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: kVerticalPaddingL),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/img/Logo_royaldle.png", scale: kScale),
                const SizedBox(
                  height: kVerticalPadding,
                ),
                _controller.hasBeenFound()
                    ? (() {
                        _controller.addTrys();
                        return const RetryButton(caller: Classique());
                      })()
                    : MainTextField(
                        caller: Classique(
                          controller: _controller,
                        ),
                        gController: _controller,
                      ),
                const SizedBox(
                  height: kVerticalPadding,
                ),
                Expanded(
                  child: SizedBox(
                    height: kHeightListView,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: _controller.getDataNumberOfTry(),
                        itemBuilder: (context, index) {
                          final int verticalIndex = index;
                          return Padding(
                              padding: const EdgeInsets.all(kAllPadding),
                              child: SizedBox(
                                height: kHeightListView,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    controller: _scrollControllers.length >
                                            verticalIndex
                                        ? _scrollControllers[verticalIndex]
                                        : _mainScrollController,
                                    shrinkWrap: true,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.all(kAllPadding),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
                                              color: _controller
                                                  .retrieveComparison()),
                                          width: kWidthListView,
                                          child: Center(
                                              child: Text(_controller
                                                  .displayTextInBox())),
                                        ),
                                      );
                                    }),
                              ));
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
      bottomNavigationBar: const OurBottomNavigationBar(),
    );
  }
}
