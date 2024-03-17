import 'package:flutter/material.dart';

// *************   Professor class **********
class Professor {
  final String name;
  final String department;

  Professor(this.name, this.department);
}

// **************   Course class ***********
class Course {
  final String name;
  final String department;

  Course(this.name, this.department);
}

// **************** Student class **********
class Student {
  final String name;

  Student(this.name);
}

//**************  Department class *********
class Department {
  final String name;
  final List<Professor> professors;
  final List<Course> courses;
  final List<Student> students;

  Department(this.name, {this.professors = const [], this.courses = const [], this.students = const []});
}

// *************************  Clent  ***********************
class UniversityStructureApp extends StatelessWidget {
  const UniversityStructureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'University Structure',
      home: UniversityStructurePage(),
    );
  }
}

class UniversityStructurePage extends StatelessWidget {
  const UniversityStructurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: const Text('University Structure'),
      ),
      body: ListView(
        children: <Widget>[
          _buildDepartment(
            'Computer Science',
            professors: [Professor('Dr. Smith', 'Computer Science')],
            courses: [Course('Introduction to Programming', 'Computer Science')],
            students: [Student('Alice')],
          ),
          _buildDepartment(
            'Mathematics',
            professors: [Professor('Dr. Johnson', 'Mathematics')],
            courses: [Course('Calculus', 'Mathematics')],
            students: [Student('Bob')],
          ),
          _buildDepartment(
            'Art Design',
            professors: [Professor('Dr. Chang', 'Art Design')],
            courses: [Course('Drawing', 'Art Design')],
            students: [Student('Peter')],
          ),
        ],
      ),
    );
  }

  Widget _buildDepartment(String name, {List<Professor>? professors, List<Course>? courses, List<Student>? students}) {
    return ExpansionTile(
      collapsedTextColor: Colors.lightBlue,
      backgroundColor: Colors.white54,
      title: Text(' $name'),
      children: [
        if (professors != null) ...professors.map((professor) => _buildProfessorTile(professor)).toList(),
        if (courses != null) ...courses.map((course) => _buildCourseTile(course)).toList(),
        if (students != null) ...students.map((student) => _buildStudentTile(student)).toList(),
      ],
    );
  }

  Widget _buildProfessorTile(Professor professor) {
    return ListTile(
      title: Text('Professor: ${professor.name}'),
      subtitle: Text('Department: ${professor.department}'),
      leading: const Icon(Icons.person),
    );
  }

  Widget _buildCourseTile(Course course) {
    return ListTile(
      title: Text('Course: ${course.name}'),
      subtitle: Text('Department: ${course.department}'),
      leading: const Icon(Icons.book),
    );
  }

  Widget _buildStudentTile(Student student) {
    return ListTile(
      title: Text('Student: ${student.name}'),
      leading: const Icon(Icons.school),
    );
  }
}

void main() {
  runApp(const UniversityStructureApp());
}
