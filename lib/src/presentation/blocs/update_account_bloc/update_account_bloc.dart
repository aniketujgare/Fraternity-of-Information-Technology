import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/database_repository.dart';
import '../../../domain/models/user_model.dart';

part 'update_account_event.dart';
part 'update_account_state.dart';

class UpdateAccountBloc extends Bloc<UpdateAccountEvent, UpdateAccountState> {
  UserModel? _userModel;
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
      emit(FetchUserState(userModel: _userModel!));
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
      emit(UpdatedSuccesFully());
      emit(FetchUserState(userModel: _userModel!));
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
        emit(UpdateAccountInitial());
        emit(FetchUserState(userModel: _userModel!));
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
