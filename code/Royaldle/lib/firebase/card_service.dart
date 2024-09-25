import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:DTO/cards.dart' as dto_cards;
import 'package:DTO/trys.dart' as dto_trys;
import 'package:flutter/foundation.dart';

class CardService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<dto_cards.Cards?> getCardStream(String cardId) {
    return _firestore
        .collection('cards')
        .withConverter<dto_cards.Cards>(
      fromFirestore: (snapshot, _) =>
          dto_cards.Cards.fromjson(snapshot.data()!),
      toFirestore: (card, _) => card.toJson(),
    )
        .doc(cardId)
        .snapshots()
        .map((snapshot) => snapshot.data());
  }

  Future<dto_cards.Cards?> getCardOnce(String cardId) async {
    try {
      final snapshot = await _firestore
          .collection('cards')
          .withConverter<dto_cards.Cards>(
        fromFirestore: (snapshot, _) =>
            dto_cards.Cards.fromjson(snapshot.data()!),
        toFirestore: (card, _) => card.toJson(),
      )
          .doc(cardId)
          .get();

      return snapshot.data();
    } catch (e) {
      if (kDebugMode) {
        print("Erreur lors de la récupération de la carte : $e");
      }
      return null;
    }
  }


  Future<List<dto_cards.Cards>> getAllCards() async {
    try {
      final querySnapshot = await _firestore
          .collection('cards')
          .withConverter<dto_cards.Cards>(
        fromFirestore: (snapshot, _) =>
            dto_cards.Cards.fromjson(snapshot.data()!),
        toFirestore: (card, _) => card.toJson(),
      ).get();

      final cardsList = querySnapshot.docs
          .map((doc) => doc.data())
          .toList();

      return cardsList;
    } catch (e) {
      if (kDebugMode) {
        print("Erreur lors de la récupération des cartes : $e");
      }
      return [];
    }
  }

  Future<void> addTry(int amount, String cardName) async {
    dto_trys.Trys newTry = dto_trys.Trys(
      amount: amount,
      cardName: cardName,
      hours: DateTime.now(),
    );

    CollectionReference trysCollection = FirebaseFirestore.instance.collection(
        'trys');

    try {
      await trysCollection.add(newTry.toJson());
    } catch (e) {
      if (kDebugMode) {
        print("Erreur lors de l'ajout d'un trys : $e");
      }
    }
  }
}
