import 'package:flutter/material.dart';
class CustomErrorMsg extends StatelessWidget {
  const CustomErrorMsg({super.key, required this.errorMsg});
  final String errorMsg;
  @override
  Widget build(BuildContext context) {
    return Text(errorMsg,style: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),);
  }
}
