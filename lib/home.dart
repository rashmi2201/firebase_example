import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddDataToFirebase extends StatefulWidget {
  const AddDataToFirebase({super.key});

  @override
  State<AddDataToFirebase> createState() => _MyWidgetState();
}

final TextEditingController customername = TextEditingController();
final TextEditingController customerage = TextEditingController();
final TextEditingController customerphonenumber = TextEditingController();
final TextEditingController moviename = TextEditingController();
final TextEditingController movietiming = TextEditingController();
final TextEditingController movieticket = TextEditingController();

class _MyWidgetState extends State<AddDataToFirebase> {
  Future<void> showTicket() async {
    try {
      CollectionReference users = FirebaseFirestore.instance.collection('demo');
      await users.add({
        'customername': customername.text,
        'customerage': customerage.text,
        'customerphonenumber': customerphonenumber.text,
        'moviename': moviename.text,
        'movietiming': movietiming.text,
        'movieticket': movieticket.text,
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Enjoy your Movie')));
    } catch (e) {
      print('s1');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 223, 101, 142),
        title: Center(
          child: Text(
            'Book My Show',
            style: TextStyle(fontSize: 35, color: Colors.black),
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 600,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Image.asset(
                    'assets/bookticket.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Column(
                  children: [
                    TextField(
                      controller: customername,
                      decoration: InputDecoration(
                        labelText: 'UserName',
                        labelStyle:
                            TextStyle(fontSize: 24, color: Colors.black),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: customerage,
                      decoration: InputDecoration(
                        labelText: 'Age',
                        labelStyle:
                            TextStyle(fontSize: 24, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: customerphonenumber,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle:
                            TextStyle(fontSize: 24, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: moviename,
                      decoration: InputDecoration(
                        labelText: 'Movie Name',
                        labelStyle:
                            TextStyle(fontSize: 24, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: movietiming,
                      decoration: InputDecoration(
                        labelText: 'Movie Timing',
                        labelStyle:
                            TextStyle(fontSize: 24, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: movieticket,
                      decoration: InputDecoration(
                        labelText: 'Tickets',
                        labelStyle:
                            TextStyle(fontSize: 24, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        showTicket();
                      },
                      child: Text('Submit'),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        textStyle: TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
