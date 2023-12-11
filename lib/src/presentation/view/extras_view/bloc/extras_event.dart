part of 'extras_bloc.dart';

@freezed
class ExtrasEvent with _$ExtrasEvent {
  const factory ExtrasEvent.load() = LoadExtras;
}
