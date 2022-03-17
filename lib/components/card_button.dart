import 'package:flutter/material.dart';

import '../models/count_model.dart';

class CardButton extends StatelessWidget {
  const CardButton({
    Key? key,
    required this.countModel,
    required this.onTap,
  }) : super(key: key);

  final void Function()? onTap;
  final CountModel countModel;

  @override
  Widget build(BuildContext context) {
    final isEmpty = countModel.value == 0;
    final horizontalPadding = MediaQuery.of(context).size.width / 5;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          color: countModel.colorElement,
          child: Row(
            children: [
              Expanded(
                  child: Text(
                isEmpty ? 'Empty' : '~[${countModel.value}]~',
                textAlign: TextAlign.center,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
