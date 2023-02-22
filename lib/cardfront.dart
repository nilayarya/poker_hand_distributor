
import 'dart:math';
import 'package:flutter/material.dart';

class CardTemplate extends StatelessWidget {
  final suit;
  final number;

  CardTemplate({this.number, this.suit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(5),
          color: Colors.white,
          height: 150,
          width: 100,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(number,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ],
                ),
                suit,
                Transform.rotate(
                  angle: pi,
                  child: Row(
                    children: [
                      Text(number,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
