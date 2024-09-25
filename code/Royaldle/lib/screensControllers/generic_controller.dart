interface class GenericController
{
  int dataTreatment(String cardName)
  {
    throw Exception("Function not override");
  }

  void preparingAutoCompleteList(List<String> _cardOptions)
  {
    throw Exception("Function not override");
  }

  bool hasBeenFound()
  {
    throw Exception("Function not override");
  }
}