import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Mock settings state for Phase 3.
class SettingsState {
  final double volume;
  final String language;
  final bool backgroundMusic;
  final bool highContrast;

  const SettingsState({
    this.volume = 0.7,
    this.language = 'English',
    this.backgroundMusic = true,
    this.highContrast = false,
  });

  SettingsState copyWith({
    double? volume,
    String? language,
    bool? backgroundMusic,
    bool? highContrast,
  }) {
    return SettingsState(
      volume: volume ?? this.volume,
      language: language ?? this.language,
      backgroundMusic: backgroundMusic ?? this.backgroundMusic,
      highContrast: highContrast ?? this.highContrast,
    );
  }
}

class MockSettingsNotifier extends StateNotifier<SettingsState> {
  MockSettingsNotifier() : super(const SettingsState());

  void setVolume(double v) => state = state.copyWith(volume: v);
  void setLanguage(String l) => state = state.copyWith(language: l);
  void toggleMusic() =>
      state = state.copyWith(backgroundMusic: !state.backgroundMusic);
  void toggleHighContrast() =>
      state = state.copyWith(highContrast: !state.highContrast);
}

/// Phase 3 stub — will be replaced with Hive-backed SettingsRepository in Phase 4.
final settingsProvider =
    StateNotifierProvider<MockSettingsNotifier, SettingsState>((ref) {
  return MockSettingsNotifier();
});
