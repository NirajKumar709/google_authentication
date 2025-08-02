import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_authentication/api_calling/api_call.dart';

import 'data_model.dart';

class GetType extends StatefulWidget {
  const GetType({super.key});

  @override
  State<GetType> createState() => _GetTypeState();
}

class _GetTypeState extends State<GetType> {
  late Future<List<User>> userData;

  @override
  void initState() {
    userData = ApiService().fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Get Type Api"), centerTitle: true),
      body: FutureBuilder<List<User>>(
        future: userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                User user = snapshot.data![index];
                return ListTile(
                  title: Text(user.title),
                  subtitle: Text(user.body),
                );
              },
            );
          } else {
            return Center(child: Text('No users found.'));
          }
        },
      ),
    );
  }
}
