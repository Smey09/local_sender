import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  final bool isDarkMode;

  const SettingsState({
    this.isDarkMode = false,
  });

  const SettingsState.initial() : this();

  SettingsState copyWith({
    bool? isDarkMode,
  }) {
    return SettingsState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }

  @override
  List<Object?> get props => [isDarkMode];
}