import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uber_clone/core/exceptions/app_exeption.dart';
import 'package:uber_clone/core/exceptions/firebase_auth_exceptions.dart';
import 'package:uber_clone/core/exceptions/firebase_firestore_exceptions.dart';
import 'package:uber_clone/features/auth/data/models/user_model.dart';

abstract class RemoteAuthDataSource {
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  });
  Future<UserModel> signIn({required String email, required String password});

  Future<void> signOut();
}

class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  RemoteAuthDataSourceImpl({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });
  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        final ref = await firebaseFirestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();
        return UserModel.fromMap(ref.data()!);
      }
      throw const UserNotFoundException();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionMapper.map(e);
    } on FirebaseException catch (e) {
      throw FirebaseFirestoreExceptionMapper.map(e);
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        await firebaseFirestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(
              UserModel(
                email: email,
                name: name,
                phone: phone,
                uid: userCredential.user!.uid,
                blockStatus: "no",
              ).toMap(),
            );
        return UserModel(
          email: email,
          name: name,
          phone: phone,
          uid: userCredential.user!.uid,
          blockStatus: "no",
        );
      }
      log("Something went wrong");
      throw const AppException("Something went wrong");
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      throw FirebaseAuthExceptionMapper.map(e);
    } on FirebaseException catch (e) {
      log(e.message.toString());
      throw FirebaseFirestoreExceptionMapper.map(e);
    } catch (e) {
      log(e.toString());
      throw AppException(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      throw FirebaseAuthExceptionMapper.map(e);
    } catch (e) {
      log(e.toString());
      throw AppException(e.toString());
    }
  }
}
