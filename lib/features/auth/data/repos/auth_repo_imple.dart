import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:uber_clone/core/errors/app_failure.dart';
import 'package:uber_clone/core/errors/connection_failure.dart';
import 'package:uber_clone/core/errors/failure.dart';
import 'package:uber_clone/core/errors/firebase_auth_failure.dart';
import 'package:uber_clone/core/errors/firebase_firestore_failure.dart';
import 'package:uber_clone/core/services/check_connectivity_service.dart';
import 'package:uber_clone/features/auth/data/data_sources/remote_auth_data_source.dart';
import 'package:uber_clone/features/auth/data/models/user_model.dart';
import 'package:uber_clone/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImple implements AuthRepo {
  final RemoteAuthDataSource remoteAuthDataSource;
  final CheckConnectivityService checkConnectivityService;
  AuthRepoImple({
    required this.remoteAuthDataSource,
    required this.checkConnectivityService,
  });
  @override
  Future<Either<Failure, UserModel>> signIn({
    required String email,
    required String password,
  }) async {
    if (await checkConnectivityService.checkConnectivity()) {
      try {
        final user = await remoteAuthDataSource.signIn(
          email: email,
          password: password,
        );
        return Right(user);
      } on FirebaseAuthException catch (e) {
        return Left(FirebaseAuthFailure(e.message!));
      } on FirebaseException catch (e) {
        return Left(FirebaseFirestoreFailure(e.message!));
      } catch (e) {
        return Left(AppFailure(e.toString()));
      }
    } else {
      return Left(
        ConnectionFailure("No Internet Connection! Please try again"),
      );
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    if (await checkConnectivityService.checkConnectivity()) {
      try {
        final user = await remoteAuthDataSource.signUp(
          email: email,
          password: password,
          name: name,
          phone: phone,
        );
        return Right(user);
      } on FirebaseAuthException catch (e) {
        return Left(FirebaseAuthFailure(e.message!));
      } on FirebaseException catch (e) {
        return Left(FirebaseFirestoreFailure(e.message!));
      } catch (e) {
        return Left(AppFailure(e.toString()));
      }
    } else {
      return Left(
        ConnectionFailure("No Internet Connection! Please try again"),
      );
    }
  }
}
