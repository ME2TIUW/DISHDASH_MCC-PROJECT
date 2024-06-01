import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mcc_lab_23dec23/components/profile_textbox.dart';

class ProfileScreen extends StatefulWidget {
  final User? currentUser;
  const ProfileScreen({Key? key, required this.currentUser}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User? currentUser;

  final userCollection = FirebaseFirestore.instance.collection('Users');

  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF316B48),
        title: Text(
          "Edit $field",
          style: const TextStyle(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: "Enter new $field",
              hintStyle: const TextStyle(color: Colors.white)),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(newValue),
          )
        ],
      ),
    );

    //firestore update
    if (newValue.trim().isNotEmpty) {
      await userCollection.doc(currentUser!.email).update({field: newValue});
    }
  }

  @override
  void initState() {
    super.initState();
    currentUser = widget.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile"),
        backgroundColor: const Color(0xFF316B48),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(currentUser!.email)
            .snapshots(),
        builder: (context, snapshot) {
          //get the data
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),

                // Profile picture
                const Icon(
                  Icons.person,
                  size: 75,
                  color: Color(0xFF316B48),
                ),

                const SizedBox(
                  height: 10,
                ),

                // Email
                Text(
                  currentUser!.email ?? '',
                  style:
                      const TextStyle(color: Color(0xFF316B48), fontSize: 24),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(
                  height: 35,
                ),

                // Details
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
                  child: Text(
                    'My Details',
                    style: TextStyle(color: Colors.grey[600], fontSize: 22),
                  ),
                ),

                //username
                ProfileTextbox(
                    text: userData['username'],
                    sectionName: 'Username',
                    onPressed: () => editField('username')),

                ProfileTextbox(
                    text: userData['age'],
                    sectionName: 'Age',
                    onPressed: () => editField('age')),
                ProfileTextbox(
                    text: userData['favorite food'],
                    sectionName: 'Favorite food',
                    onPressed: () => editField('favorite food')),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error${snapshot.error}'),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
