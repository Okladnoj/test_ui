import 'package:flutter/material.dart';

class RemoveButton extends StatelessWidget {
  final void Function()? onTap;
  const RemoveButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          color: const Color(0xFFFF6E6E),
          alignment: Alignment.center,
          child: Row(
            children: const [
              Expanded(
                child: Text(
                  'Remove Top',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
