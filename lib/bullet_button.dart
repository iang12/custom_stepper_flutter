import 'package:flutter/material.dart';

class BulletButon extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  const BulletButon({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        decoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
