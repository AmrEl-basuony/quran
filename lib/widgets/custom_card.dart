import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard(
      {required this.top1stText,
      required this.top2ndText,
      required this.top3rdText,
      required this.bottom1stText,
      required this.bottom2ndText,
      required this.bottom3rdText});

  final String top1stText,
      top2ndText,
      top3rdText,
      bottom1stText,
      bottom2ndText,
      bottom3rdText;

  final topStyle = const TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        onTap: () {},
        child: Card(
          color: Colors.lime.shade700,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    top1stText,
                    style: topStyle,
                  ),
                  Text(
                    top2ndText,
                    style: topStyle,
                  ),
                  Text(
                    top3rdText,
                    style: topStyle,
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  color: Colors.yellow,
                  thickness: 2,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(bottom1stText),
                  Text(bottom2ndText),
                  Text(bottom3rdText),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
