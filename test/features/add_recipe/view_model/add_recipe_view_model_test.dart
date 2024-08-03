import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_recipe_shot/features/add_recipe/view_model/add_recipe_view_model.dart';

class MockFirebaseStorage extends Mock implements FirebaseStorage {}
class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}
class MockReference extends Mock implements Reference {}
class MockUploadTask extends Mock implements UploadTask {}
class MockDocumentReference extends Mock implements DocumentReference {}
class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

void main() {
  group('AddRecipeViewModel', () {
    late AddRecipeViewModel viewModel;
    late MockFirebaseStorage mockStorage;
    late MockFirebaseFirestore mockFirestore;
    late MockReference mockReference;
    late MockUploadTask mockUploadTask;
    late MockDocumentReference mockDocumentReference;
    late MockDocumentSnapshot mockDocumentSnapshot;

    setUp(() {
      mockStorage = MockFirebaseStorage();
      mockFirestore = MockFirebaseFirestore();
      mockReference = MockReference();
      mockUploadTask = MockUploadTask();
      mockDocumentReference = MockDocumentReference();
      mockDocumentSnapshot = MockDocumentSnapshot();

      viewModel = AddRecipeViewModel();
      viewModel.titleController.text = 'Test Recipe';
      viewModel.descriptionController.text = 'Test Description';
    });

    test('createRecipe with no image', () async {
      when(mockFirestore.collection('recipes')).thenReturn(mockDocumentReference);
      when(mockDocumentReference.add(any)).thenAnswer((_) async => mockDocumentReference);
      when(mockDocumentReference.id).thenReturn('testId');
      when(mockDocumentReference.get()).thenAnswer((_) async => mockDocumentSnapshot);
      when(mockDocumentSnapshot.data()).thenReturn({
        'id': 'testId',
        'title': 'Test Recipe',
        'description': 'Test Description',
      });

      await viewModel.createRecipe(MockBuildContext());

      verify(mockFirestore.collection('recipes')).called(1);
      verify(mockDocumentReference.add(any)).called(1);
      verify(mockDocumentReference.update({'id': 'testId'})).called(1);
      expect(viewModel.recipeResponse.status, Status.COMPLETED);
    });

    test('createRecipe with image', () async {
      viewModel.image = MockXFile();
      when(mockStorage.ref()).thenReturn(mockReference);
      when(mockReference.child(any)).thenReturn(mockReference);
      when(mockReference.putFile(any)).thenReturn(mockUploadTask);
      when(mockUploadTask.snapshot).thenAnswer((_) async => MockTaskSnapshot());
      when(mockFirestore.collection('recipes')).thenReturn(mockDocumentReference);
      when(mockDocumentReference.add(any)).thenAnswer((_) async => mockDocumentReference);
      when(mockDocumentReference.id).thenReturn('testId');
      when(mockDocumentReference.get()).thenAnswer((_) async => mockDocumentSnapshot);
      when(mockDocumentSnapshot.data()).thenReturn({
        'id': 'testId',
        'title': 'Test Recipe',
        'description': 'Test Description',
        'imageUrl': 'test_image_url',
      });

      await viewModel.createRecipe(MockBuildContext());

      verify(mockStorage.ref()).called(1);
      verify(mockReference.putFile(any)).called(1);
      verify(mockFirestore.collection('recipes')).called(1);
      verify(mockDocumentReference.add(any)).called(1);
      verify(mockDocumentReference.update({'id': 'testId'})).called(1);
      expect(viewModel.recipeResponse.status, Status.COMPLETED);
    });

    test('createRecipe with error', () async {
      when(mockFirestore.collection('recipes')).thenThrow(Exception('Test error'));

      await viewModel.createRecipe(MockBuildContext());

      expect(viewModel.recipeResponse.status, Status.ERROR);
      expect(viewModel.recipeResponse.message, 'Exception: Test error');
    });
  });
}

class MockBuildContext extends Mock implements BuildContext {}
class MockXFile extends Mock implements XFile {
  @override
  String get path => 'test_image_path';
}
class MockTaskSnapshot extends Mock implements TaskSnapshot {}
