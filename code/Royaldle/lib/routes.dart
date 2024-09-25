import 'package:flutter/cupertino.dart';
import 'package:royaldle/screens/classique.dart';
import 'package:royaldle/screens/description.dart';
import 'package:royaldle/screens/emoji.dart';


Map<String, WidgetBuilder> routes = {
  //Welcome.routeName : (context) => const Welcome(),
  //ConnectivityChecker.routeName : (context) => const ConnectivityChecker(),
  Classique.routeName : (context) => const Classique(),
  Description.routeName :(context) =>  const Description(),
  Emoji.routeName :(context) =>  const Emoji(),
};