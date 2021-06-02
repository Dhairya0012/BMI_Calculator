import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed}) : super();

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onPressed();
      },
      child: Icon(
        icon,
        color: Color(0xFFFFFFFF),
      ),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      fillColor: Color(0xFF4C4F5E),
      elevation: 6,
    );
  }
}
