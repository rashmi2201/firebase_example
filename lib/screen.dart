import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class ScreenPage extends StatefulWidget {
  const ScreenPage({super.key});

  @override
  State<ScreenPage> createState() => _MyWidgetState();
}

final TextEditingController username = TextEditingController();
final TextEditingController password = TextEditingController();
final TextEditingController qualification = TextEditingController();
final TextEditingController hobbies = TextEditingController();

class _MyWidgetState extends State<ScreenPage> {
  //function
  Future<void> submitData() async {
    try {
      // Reference to the Firestore collection
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      print('s1');
      // add
      await users.add({
        'username': username.text,
        'password': password.text,
        'qualification': qualification.text,
        'hobbies': hobbies.text,
      });
      print('s2');

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Data submitted successfully')));
      //clear
      username.clear();
      password.clear();
      qualification.clear();
      hobbies.clear();
    } catch (e) {
      print('object');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
          child: Text(
            'Firebase Example',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: username,
              decoration: InputDecoration(
                labelText: 'UserName',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: password,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: qualification,
              decoration: InputDecoration(
                labelText: 'Qualification',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: hobbies,
              decoration: InputDecoration(
                labelText: 'Hobbies',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // CollectionReference users =
                //     FirebaseFirestore.instance.collection('users');
                // print('s1');
                // // add
                // users.add({
                //   'username': username.text,
                //   'password': password.text,
                //   'qualification': qualification.text,
                //   'hobbies': hobbies.text,
                // });
                submitData();
              },
              label: Text('Submit'),
              icon: Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}
