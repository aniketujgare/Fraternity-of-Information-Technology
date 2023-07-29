import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fraternity_of_information_technology/src/data/repositories/database_repository.dart';
import 'package:fraternity_of_information_technology/src/domain/models/user_model.dart';

part 'update_account_event.dart';
part 'update_account_state.dart';

class UpdateAccountBloc extends Bloc<UpdateAccountEvent, UpdateAccountState> {
  late final UserModel _userModel;
  final DatabaseRepository dataRepository;
  UpdateAccountBloc({required this.dataRepository})
      : super(UpdateAccountInitial()) {
    on<FetchUserEvent>(_fetchUser);
    // on<AddUserEvent>(_addUser);
    on<UpdateUserEvent>(_updateUser);
    // on<DeleteUserEvent>(_deleteUser);
    on<PickImageEvent>(_pickImage);
  }
  Future<void> _fetchUser(
      FetchUserEvent event, Emitter<UpdateAccountState> emit) async {
    emit(UpdateAccountLoading());

    try {
      _userModel = await dataRepository.getUser();
      emit(FetchUserState(userModel: _userModel));
    } catch (e) {
      emit(UpdateAccountError(error: e.toString()));
    }
  }

  Future<void> _updateUser(
      UpdateUserEvent event, Emitter<UpdateAccountState> emit) async {
    emit(UpdateAccountLoading());
    try {
      _userModel = await dataRepository.updateUser(event.userModel);
      await Future.delayed(const Duration(seconds: 1));

      emit(FetchUserState(userModel: _userModel));
    } catch (e) {
      emit(UpdateAccountError(error: e.toString()));
    }
  }

  Future<void> _pickImage(
      PickImageEvent event, Emitter<UpdateAccountState> emit) async {
    try {
      emit(PickImageLoadingState());
      var url = await dataRepository.pickAndUploadImage();
      if (url == null) {
        emit(FetchUserState(userModel: _userModel));
        return;
      }
      await dataRepository.updateUser(UserModel(profilePic: url));
      emit(ImageUploadedState(imageURL: url));
    } on FirebaseAuthException catch (e) {
      emit(UpdateAccountError(error: e.code));
    } catch (e) {
      emit(UpdateAccountError(error: e.toString()));
    }
  }
}
