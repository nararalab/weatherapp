import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';

enum TempUnit {
  celsius,
  fahrenheit,
}

class TempSettingsState extends Equatable {
  final TempUnit tempUnit;
  const TempSettingsState({this.tempUnit = TempUnit.celsius});

  factory TempSettingsState.initial() {
    return const TempSettingsState();
  }

  @override
  List<Object> get props => [tempUnit];

  @override
  String toString() => 'TempSettingsState(tempUnit: $tempUnit)';

  TempSettingsState copyWith({
    TempUnit? tempUnit,
  }) {
    return TempSettingsState(
      tempUnit: tempUnit ?? this.tempUnit,
    );
  }
}

class TempSettingsProvider extends StateNotifier<TempSettingsState> {
  TempSettingsProvider() : super(TempSettingsState.initial());

  void toggleTempUnit() {
    state = state.copyWith(
        tempUnit: state.tempUnit == TempUnit.celsius
            ? TempUnit.fahrenheit
            : TempUnit.celsius);

    print('[디버깅] temp unit: $state');
  }
}
