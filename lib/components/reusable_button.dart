
import 'package:flutter/material.dart';

class reuseable_button extends StatelessWidget {
   reuseable_button({
    Key? key, required this.ButtonText,
    required this.onTap,
  }) : super(key: key);
  final String ButtonText;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 1.3,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            ButtonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            
            ),
            ),
        ),
      ),
    );
  }
}
