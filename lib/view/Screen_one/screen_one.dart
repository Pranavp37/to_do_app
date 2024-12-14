import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/controller/to_do_controller.dart';
import 'package:to_do_app/view/Screen_one/card/card.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final Stream<QuerySnapshot> _courseStream =
      FirebaseFirestore.instance.collection('tasks').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Tasks'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        onNewData(context);
      }),
      body: StreamBuilder<QuerySnapshot>(
        stream: _courseStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No data found'));
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return TaskCard(
                title: data["title"] ?? "Untitled Task",
                isChecked: data["status"] ?? false,
                onCheckboxChanged: (bool? value) {
                  FirebaseFirestore.instance
                      .collection('tasks')
                      .doc(document.id)
                      .update({'status': value});
                },
                onEdit: () => onupdateData(context, document.id, data),
                onDelete: () {
                  FirebaseFirestore.instance
                      .collection('tasks')
                      .doc(document.id)
                      .delete();
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

onNewData(context) {
  final TextEditingController titlecontroller = TextEditingController();

  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: titlecontroller,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          titlecontroller.clear();
                          Navigator.pop(context);
                        },
                        child: Text("cancel")),
                    ElevatedButton(
                        onPressed: () {
                          context.read<ToDoController>().addData(
                                name: titlecontroller.text,
                              );
                               Navigator.pop(context);

                        },
                        child: Text("Save")),
                  ],
                )
              ],
            ),
          ),
        );
      });
}

//on update

onupdateData(context, String id, Map<String, dynamic> data) {
  final TextEditingController titleController =
      TextEditingController(text: data["title"]);

  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: titleController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          titleController.clear();

                          onNewData(context);
                        },
                        child: Text("cancel")),
                    ElevatedButton(
                        onPressed: () {
                          context.read<ToDoController>().updateData(
                              name: titleController.text, docId: id);
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("Data added updated Successfully")));
                        },
                        child: Text("Save")),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
