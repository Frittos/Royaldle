import 'package:royaldle/screensControllers/generic_controller.dart';
import 'package:royaldle/screensControllers/shared_controller.dart';
import 'package:DTO/cards.dart' as dto_cards;
import 'package:flutter/material.dart';

class DescriptionController extends SharedController implements GenericController {
  //game variables
  List<dto_cards.Cards> _selectedCardsList = [];
  List<bool> _comparisonResults = [];

  //display variable
  int _listIndex = 0;

  int _listColorIndex = 0;

  DescriptionController();

  //game methods
  @override
  int dataTreatment(String cardName)
  {
    // startNewGame();
    _listIndex = 0;
    _listColorIndex = 0;

    int index = -1;
    //check if the selected card exist in the cards list and retrieve its index in the cards set if so
    if((index = (getIndex(cardName, getCardsList()))) != -1)
    {
      //add a copy of the selected card into the selected cards list (used to memorized the selected cards during a game)
      _selectedCardsList.add(getCardsList()[index]);

      //memorize the complete comparison (for each parameters) of the selected card with the randomly chosen card
      _comparisonResults.add(compare(getCardsList()[index], getCardsList()[getRandomCardIndex()]));

      incrementDataNumberOfTry();
      return 1;
    }
    return -1;
  }

  @override
  void preparingAutoCompleteList(List<String> _cardOptions)
  {
    for(int i = 0; i < getCardsList().length; i++)
    {
      _cardOptions.add(getCardsList()[i].name);
    }
  }

  @override
  bool hasBeenFound()
  {
    return getDataNumberOfTry() > 0 ? _comparisonResults[_comparisonResults.length-1] : false;
  }

  bool compare(dto_cards.Cards main, dto_cards.Cards other)
  {
    return main.description == other.description;
  }

  //display methods
  String displayRandomlyChoseDescription()
  {
    return getCardsList()[getRandomCardIndex()].description;
  }

  String displayTextInBox()
  {
    String returnText = "";
    if(_listIndex == getDataNumberOfTry()){
      _listIndex = 0;
    }
    returnText = _selectedCardsList[_listIndex].name;
    _listIndex++;
    return returnText;
  }

  MaterialColor retrieveComparison()
  {
    if(_listColorIndex == getDataNumberOfTry()){
      _listColorIndex = 0;
    }
    MaterialColor tempColor = _comparisonResults[_listColorIndex] ? Colors.green : Colors.red;
    _listColorIndex++;
    return tempColor;
  }
}

