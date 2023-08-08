import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetDatabaseNdn extends StatelessWidget {
  final String dokumenDatabase;

  GetDatabaseNdn({required this.dokumenDatabase});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> mydata =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('${mydata['kode unikku']}');
        }
        return Text('Tunggu');
      },
    );
  }
}
