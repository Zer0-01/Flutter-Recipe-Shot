import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_recipe_shot/models/recipe_model.dart';
import 'package:flutter_recipe_shot/services/firestore_path.dart';
import 'package:flutter_recipe_shot/services/firestore_service.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

/*
This is the main class access/call for any UI widgets that require to perform
any CRUD activities operation in FirebaseFirestore database.
This class work hand-in-hand with FirestoreService and FirestorePath.

Notes:
For cases where you need to have a special method such as bulk update specifically
on a field, then is ok to use custom code and write it here. For example,
setAllTodoComplete is require to change all todos item to have the complete status
changed to true.

 */

class FirestoreDatabase {
  final String uid;
  final _firestoreService = FirestoreService.instance;

  FirestoreDatabase({required this.uid});

  Future<void> setRecipe(RecipeModel recipe) async =>
      await _firestoreService.set(
        path: FirestorePath.recipe(uid, recipe.id),
        data: recipe.toMap(),
      );

  Future<void> deleteRecipe(RecipeModel recipe) async {
    await _firestoreService.deleteData(
        path: FirestorePath.recipe(uid, recipe.id));
  }

  Stream<RecipeModel> recipeStream({required String recipeId}) =>
      _firestoreService.documentStream(
        path: FirestorePath.recipe(uid, recipeId),
        builder: (data, documentId) => RecipeModel.fromMap(data, documentId),
      );

  Stream<List<RecipeModel>> recipesStream() =>
      _firestoreService.collectionStream(
        path: FirestorePath.recipes(uid),
        builder: (data, documentId) => RecipeModel.fromMap(data, documentId),
      );

  Future<void> setAllRecipeComplete() async {
    final batchUpdate = FirebaseFirestore.instance.batch();

    final querySnapshot = await FirebaseFirestore.instance
        .collection(FirestorePath.recipes(uid))
        .get();

    for (DocumentSnapshot ds in querySnapshot.docs) {
      batchUpdate.update(ds.reference, {'complete': true});
    }
    await batchUpdate.commit();
  }

  Future<void> deleteAllRecipeWithComplete() async {
    final batchDelete = FirebaseFirestore.instance.batch();

    final querySnapshot = await FirebaseFirestore.instance
        .collection(FirestorePath.recipes(uid))
        .where('complete', isEqualTo: true)
        .get();

    for (DocumentSnapshot ds in querySnapshot.docs) {
      batchDelete.delete(ds.reference);
    }
    await batchDelete.commit();
  }
}
