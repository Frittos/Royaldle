import 'package:royaldle/screensControllers/shared_controller.dart';
import 'package:flutter/material.dart';
import 'package:DTO/cards.dart' as dto_cards;
import 'generic_controller.dart';

class ClassiqueController extends SharedController implements GenericController{
  //game variables
  List<dto_cards.Cards> _selectedCardsList = [];
  List<List<bool>> _comparisonResults = [];


  //display variables
  int _cardIndex = 0;
  int _listIndex = 0;

  int _cardColorIndex = 0;
  int _listColorIndex = 0;

  ClassiqueController();

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
  bool hasBeenFound()
  {
    return getDataNumberOfTry() > 0 ? _comparisonResults[_comparisonResults.length-1][0] : false;
  }

  List<bool> compare(dto_cards.Cards main, dto_cards.Cards other)
  {
    List<bool> comparisonResults = [];
    comparisonResults.add(main.name == other.name);
    comparisonResults.add(main.elixir == other.elixir);
    comparisonResults.add(main.rarity == other.rarity);
    comparisonResults.add(main.arena == other.arena);
    comparisonResults.add(main.type == other.type);

    return comparisonResults;
  }

  @override
  void preparingAutoCompleteList(List<String> _cardOptions)
  {
    for(int i = 0; i < getCardsList().length; i++)
    {
      _cardOptions.add(getCardsList()[i].name);
    }
  }

  //display methods
  String displayTextInBox() {
    String returnText = "";
    if(_listIndex == getDataNumberOfTry()){
      _listIndex = 0;
    }
    switch (_cardIndex) {
      case 0:
        {
          returnText = _selectedCardsList[_listIndex].name;
        }
      case 1:
        {
          returnText = _selectedCardsList[_listIndex].elixir.toString() + " d'elixir";
        }
      case 2:
        {
          returnText = _selectedCardsList[_listIndex].rarity;
        }
      case 3:
        {
          returnText = "Arene " + _selectedCardsList[_listIndex].arena.toString();
        }
      case 4:
        {
          returnText = _selectedCardsList[_listIndex].type;
        }
    }
    if (_cardIndex == 4) {
      _cardIndex = 0;
      _listIndex++;
    } else {
      _cardIndex++;
    }
    return returnText;
  }

  MaterialColor retrieveComparison()
  {
    if(_listColorIndex == getDataNumberOfTry()){
      _listColorIndex = 0;
    }
    MaterialColor tempColor = _comparisonResults[_listColorIndex][_cardColorIndex] ? Colors.green : Colors.red;
    if (_cardColorIndex == 4) {
      _cardColorIndex = 0;
      _listColorIndex++;
    } else {
      _cardColorIndex++;
    }
    return tempColor;
  }
}


