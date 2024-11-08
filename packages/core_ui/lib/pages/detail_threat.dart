import 'package:flutter/material.dart';

class DetailThreat extends StatelessWidget {
  const DetailThreat({super.key, required this.threatId});
  final String threatId;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("threat id => $threatId"),
    );
  }
}
