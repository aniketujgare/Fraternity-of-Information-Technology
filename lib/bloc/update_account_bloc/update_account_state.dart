part of 'update_account_bloc.dart';

abstract class UpdateAccountState extends Equatable {
  final List<String> branhItems = const [
    'IT',
    'Computer',
    'Chemical',
    'Civil',
    'Electrical',
    'EXTC',
    'Mechanical',
  ];
  final List<String> yearItems = const [
    'First Year',
    'Second Year',
    'Third Year',
    'Final Year',
  ];
  const UpdateAccountState();

  @override
  List<Object> get props => [branhItems, yearItems];
}

class UpdateAccountInitial extends UpdateAccountState {}
