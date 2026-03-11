import 'package:freezed_annotation/freezed_annotation.dart';

part 'struggle_word.freezed.dart';
part 'struggle_word.g.dart';

/// Domain entity representing a word the learner struggles with.
@freezed
class StruggleWord with _$StruggleWord {
  const factory StruggleWord({
    required String id,
    required String word,
    required String phoneme,
    required int failCount,
  }) = _StruggleWord;

  factory StruggleWord.fromJson(Map<String, dynamic> json) =>
      _$StruggleWordFromJson(json);
}
