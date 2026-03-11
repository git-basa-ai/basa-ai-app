import 'package:freezed_annotation/freezed_annotation.dart';

part 'dictionary_entry.freezed.dart';
part 'dictionary_entry.g.dart';

/// Domain entity representing a picture dictionary word entry.
@freezed
class DictionaryEntry with _$DictionaryEntry {
  const factory DictionaryEntry({
    required String id,
    required String word,
    required String letter,
    required String category,
    required String phoneme,
    String? imageUrl,
    String? audioUrl,
  }) = _DictionaryEntry;

  factory DictionaryEntry.fromJson(Map<String, dynamic> json) =>
      _$DictionaryEntryFromJson(json);
}
