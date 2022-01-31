import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25.0),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 15,
          offset: Offset(0, 5),
        )
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        decoration: boxDecoration,
        child: child,
      ),
    );
  }
}
