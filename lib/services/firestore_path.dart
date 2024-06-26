/*
This class defines all the possible read/write locations from the FirebaseFirestore database.
In future, any new path can be added here.
This class work together with FirestoreService and FirestoreDatabase.
 */

class FirestorePath {
  static String recipe(String uid, String recipeId) =>
      'users/$uid/recipes/$recipeId';
  static String recipes(String uid) => 'users/$uid/recipes';
}
