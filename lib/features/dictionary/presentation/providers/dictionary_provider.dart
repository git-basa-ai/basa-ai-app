import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/dictionary_entry.dart';

/// Mock dictionary data with Filipino CVC words.
final _mockEntries = <DictionaryEntry>[
  const DictionaryEntry(
      id: 'd-1', word: 'aso', letter: 'A', category: 'animals', phoneme: 'Aa'),
  const DictionaryEntry(
      id: 'd-2',
      word: 'aklat',
      letter: 'A',
      category: 'objects',
      phoneme: 'Aa'),
  const DictionaryEntry(
      id: 'd-3', word: 'ate', letter: 'A', category: 'people', phoneme: 'Aa'),
  const DictionaryEntry(
      id: 'd-4', word: 'bata', letter: 'B', category: 'people', phoneme: 'Bb'),
  const DictionaryEntry(
      id: 'd-5', word: 'baso', letter: 'B', category: 'objects', phoneme: 'Bb'),
  const DictionaryEntry(
      id: 'd-6', word: 'bola', letter: 'B', category: 'objects', phoneme: 'Bb'),
  const DictionaryEntry(
      id: 'd-7', word: 'daga', letter: 'D', category: 'animals', phoneme: 'Dd'),
  const DictionaryEntry(
      id: 'd-8',
      word: 'damit',
      letter: 'D',
      category: 'objects',
      phoneme: 'Dd'),
  const DictionaryEntry(
      id: 'd-9', word: 'ibon', letter: 'I', category: 'animals', phoneme: 'Ii'),
  const DictionaryEntry(
      id: 'd-10',
      word: 'isda',
      letter: 'I',
      category: 'animals',
      phoneme: 'Ii'),
  const DictionaryEntry(
      id: 'd-11', word: 'kamay', letter: 'K', category: 'body', phoneme: 'Kk'),
  const DictionaryEntry(
      id: 'd-12', word: 'keso', letter: 'K', category: 'food', phoneme: 'Kk'),
  const DictionaryEntry(
      id: 'd-13', word: 'ulo', letter: 'U', category: 'body', phoneme: 'Uu'),
  const DictionaryEntry(
      id: 'd-14', word: 'ulan', letter: 'U', category: 'nature', phoneme: 'Uu'),
  const DictionaryEntry(
      id: 'd-15', word: 'oso', letter: 'O', category: 'animals', phoneme: 'Oo'),
  const DictionaryEntry(
      id: 'd-16',
      word: 'oras',
      letter: 'O',
      category: 'objects',
      phoneme: 'Oo'),
  const DictionaryEntry(
      id: 'd-17',
      word: 'eroplano',
      letter: 'E',
      category: 'objects',
      phoneme: 'Ee'),
  const DictionaryEntry(
      id: 'd-18',
      word: 'elefante',
      letter: 'E',
      category: 'animals',
      phoneme: 'Ee'),
];

/// Provides the full dictionary word list.
///
/// Phase 3 stub — will be replaced with Hive-backed provider in Phase 4.
final dictionaryProvider = Provider<List<DictionaryEntry>>((ref) {
  return _mockEntries;
});

/// Provides distinct available letter filters sorted alphabetically.
final dictionaryLettersProvider = Provider<List<String>>((ref) {
  final entries = ref.watch(dictionaryProvider);
  final letters = entries.map((e) => e.letter).toSet().toList()..sort();
  return letters;
});

/// Provides filtered dictionary entries by letter.
final filteredDictionaryProvider =
    Provider.family<List<DictionaryEntry>, String?>((ref, letter) {
  final entries = ref.watch(dictionaryProvider);
  if (letter == null || letter.isEmpty) return entries;
  return entries.where((e) => e.letter == letter).toList();
});
