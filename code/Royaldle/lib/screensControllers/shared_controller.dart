import '../firebase/card_service.dart';
import 'package:DTO/cards.dart' as dto_cards;
import 'dart:math';

abstract class SharedController {
  //////VARIABLES
  //loading cards variables
  final CardService _cardService = CardService();
  List<dto_cards.Cards> _cardsList = [];
  bool _initialized = false;
  bool _adds = true;


  //starting game variable
  int _randomCardIndex = -1;

  //game variables
  int _dataNumberOfTry = 0;

  //////METHODS

  //getters-setters
  List<dto_cards.Cards> getCardsList()
  {
    return _cardsList;
  }

  bool getInitialized()
  {
    return _initialized;
  }

  int getRandomCardIndex()
  {
    return _randomCardIndex;
  }

  int getDataNumberOfTry()
  {
    return _dataNumberOfTry;
  }

  void incrementDataNumberOfTry()
  {
    _dataNumberOfTry++;
  }

  //loading cards methods
  Future<void> generateGame() async
  {
    print("fetchCards.................................................................................................");
    await fetchAllCards();
    startNewGame();
    _initialized = true;
  }

  Future<void> fetchAllCards() async {
    // _isLoading = true;
    final cards = await _cardService.getAllCards();
    _cardsList = cards;
    // _isLoading = false;
  }

  //starting game methods
  void startNewGame() {
    if (_randomCardIndex == -1)
    {
      selectRandomCardIndex();
    }
  }

  void selectRandomCardIndex()
  {
    Random randomObj = Random();
    _randomCardIndex = randomObj.nextInt(_cardsList.length);
    print('randomCardIndex : $_randomCardIndex');
    print('randomCardName : ' + _cardsList[_randomCardIndex].name);
  }

  //game execution methods
  int getIndex(String researchedCardName, List<dto_cards.Cards> playingCardsList)
  {
    for (int i = 0; i < playingCardsList.length; i++)
    {
      if(playingCardsList[i].name == researchedCardName)
      {
        return i;
      }
    }
    return -1;
  }

  //end execution method
  void addTrys(){
    if(_adds) {
      _cardService.addTry(getDataNumberOfTry(), getCardsList()[getRandomCardIndex()].name);
      _adds = false;
    }
  }
}