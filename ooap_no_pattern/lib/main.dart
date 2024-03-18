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
  final List<Professor> professors;
  final List<Student> students;

  Course(this.name, this.department, {this.professors = const [], this.students = const []});
}

// **************** Student class **********
class Student {
  final String name;

  Student(this.name);
}

//**************  Department class *********
class Department {
  final String name;
  final List<Course> courses;

  Department(this.name, {this.courses = const []});
}

// *************************  Client  ***********************
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
  const UniversityStructurePage({Key? key}) : super(key: key);

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
            courses: [
              Course(
                'Introduction to Programming',
                'Computer Science',
                professors: [Professor('Dr. Smith', 'Computer Science')],
                students: [Student('Alice')],
              ),
              Course(
                'OOAP',
                'Computer Science',
                professors: [Professor('Dr. Wang', 'Computer Science')],
                students: [Student('Chang')],
              ),
            ],
          ),
          _buildDepartment(
            'Mathematics',
            courses: [
              Course(
                'Calculus',
                'Mathematics',
                professors: [Professor('Dr. Johnson', 'Mathematics')],
                students: [Student('Bob')],
              ),
            ],
          ),
          _buildDepartment(
            'Art Design',
            courses: [
              Course(
                'Drawing',
                'Art Design',
                professors: [Professor('Dr. Chang', 'Art Design')],
                students: [Student('Peter')],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDepartment(String name, {List<Course>? courses}) {
    return ExpansionTile(
      collapsedTextColor: Colors.lightBlue,
      backgroundColor: Colors.white54,
      title: Text(' $name'),
      children: courses!.map((course) => _buildCourseTile(course)).toList(),
    );
  }

  Widget _buildCourseTile(Course course) {
    return ExpansionTile(
      collapsedTextColor: Colors.lightBlue,
      backgroundColor: Colors.white70,
      title: Text('Course: ${course.name}'),
      subtitle: Text('Department: ${course.department}'),
      children: [
        ...course.professors.map((professor) => _buildProfessorTile(professor)).toList(),
        ...course.students.map((student) => _buildStudentTile(student)).toList(),
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
