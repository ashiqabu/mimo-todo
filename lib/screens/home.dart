import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/core/constant.dart';
import 'package:todo_list/screens/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List todos = List.empty();
  String title = "";
  String description = "";

  @override
  void initState() {
    super.initState();
    
    loadTodos();
  }

  
  void loadTodos() {
    FirebaseFirestore.instance
        .collection('myTodos')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        todos = querySnapshot.docs;
      });
    });
  }

 
  void createTodo() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('myTodos').doc(title);
    Map<String, String> todoList = {
      "todoTitle": title,
      "todoDescription": description,
    };
    documentReference.set(todoList).whenComplete(() {
      loadTodos();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Successfully Stored'),
          duration: Duration(seconds: 1),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 15),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
                  },
                  child: const CircleAvatar(
                    radius: 22,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40, left: 80),
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40, left: 110),
                child: Icon(
                  Icons.search,
                  size: 27,
                ),
              ),
            ],
          ),
          kHeight(40),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              width: double.infinity,
              height: 130,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 30, left: 10),
                child: Row(
                  children: [
                    const CircleAvatar(),
                    kWidth(10),
                    Column(
                      children: [
                        kHeight(10),
                        Text(
                          '"The memories is a shield and life helper"',
                          style: GoogleFonts.aBeeZee(fontSize: 12),
                        ),
                        kHeight(10),
                        Padding(
                          padding: const EdgeInsets.only(right: 150),
                          child: Text(
                            'Tamim AI-Barghouti',
                            style: GoogleFonts.abel(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('myTodos')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(child: Text('no Data'));
                    } else if (snapshot.hasData || snapshot.data != null) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 1.2,
                        ),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          QueryDocumentSnapshot<Object?>? documentSnapshot =
                              snapshot.data!.docs[index];

                          return Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.0,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                documentSnapshot['todoTitle'],
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.red,
                        ),
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  title: const Text("Add Todo"),
                  content: SizedBox(
                    width: 400,
                    height: 100,
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (String value) {
                            title = value;
                          },
                        ),
                        TextField(
                          onChanged: (String value) {
                            description = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          setState(() {
                            createTodo();
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text("Add"))
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
