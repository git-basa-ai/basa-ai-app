import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Model representing a class in the school.
class SchoolClass {
  final String id;
  final String name;
  final String grade;
  final String? teacherId;
  final String? teacherName;

  const SchoolClass({
    required this.id,
    required this.name,
    required this.grade,
    this.teacherId,
    this.teacherName,
  });

  SchoolClass copyWith({
    String? teacherId,
    String? teacherName,
  }) {
    return SchoolClass(
      id: id,
      name: name,
      grade: grade,
      teacherId: teacherId ?? this.teacherId,
      teacherName: teacherName ?? this.teacherName,
    );
  }
}

/// Model representing a teacher.
class Teacher {
  final String id;
  final String name;

  const Teacher({
    required this.id,
    required this.name,
  });
}

/// Mock data for teachers.
final _mockTeachers = [
  const Teacher(id: 't1', name: 'Gng. Santos'),
  const Teacher(id: 't2', name: 'G. Reyes'),
  const Teacher(id: 't3', name: 'Gng. Cruz'),
  const Teacher(id: 't4', name: 'Bb. Lopez'),
];

/// Mock data for classes.
final _mockClasses = [
  const SchoolClass(id: 'c1', name: 'Sampaguita', grade: 'Grade 1', teacherId: 't1', teacherName: 'Gng. Santos'),
  const SchoolClass(id: 'c2', name: 'Rosal', grade: 'Grade 1', teacherId: 't1', teacherName: 'Gng. Santos'),
  const SchoolClass(id: 'c3', name: 'Dahlia', grade: 'Grade 2', teacherId: 't2', teacherName: 'G. Reyes'),
  const SchoolClass(id: 'c4', name: 'Jasmin', grade: 'Grade 2'),
  const SchoolClass(id: 'c5', name: 'Orchid', grade: 'Grade 1', teacherId: 't3', teacherName: 'Gng. Cruz'),
];

/// Provider for the list of teachers.
final teacherProvider = Provider<List<Teacher>>((ref) {
  return _mockTeachers;
});

/// StateNotifier to manage class assignments.
class ClassAssignmentNotifier extends StateNotifier<List<SchoolClass>> {
  ClassAssignmentNotifier() : super(_mockClasses);

  void assignTeacher(String classId, Teacher teacher) {
    state = [
      for (final c in state)
        if (c.id == classId)
          c.copyWith(teacherId: teacher.id, teacherName: teacher.name)
        else
          c,
    ];
  }

  void createClass(String grade, String name) {
    final newClass = SchoolClass(
      id: 'c${state.length + 1}',
      name: name,
      grade: grade,
    );
    state = [...state, newClass];
  }
}

/// Provider for the class list state.
final classProvider = StateNotifierProvider<ClassAssignmentNotifier, List<SchoolClass>>((ref) {
  return ClassAssignmentNotifier();
});

/// Controller provider for class actions (as requested).
final classControllerProvider = Provider((ref) => ref.read(classProvider.notifier));
