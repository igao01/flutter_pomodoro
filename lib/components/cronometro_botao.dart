import 'package:flutter/material.dart';

class CronometroBotao extends StatelessWidget {
  final String texto;
  final IconData icone;
  final void Function()? onPressed;

  const CronometroBotao({
    Key? key,
    required this.texto,
    required this.icone,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        children: [
          Icon(
            icone,
            size: 28,
          ),
          const SizedBox(width: 10),
          Text(
            texto,
            style: const TextStyle(fontSize: 22),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      ),
      onPressed: onPressed,
    );
  }
}
