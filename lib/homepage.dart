import 'dart:math';

import 'package:flutter/material.dart';
import 'package:poker_app/suits.dart';
import 'cardfront.dart';
import 'cardback.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);

    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getFlippingCard('10', clover()),
                  getFlippingCard('10', diamond()),
                ],
              ),
              Transform.rotate(angle: pi / 2, child: CardBack()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getFlippingCard('10', spade()),
                  getFlippingCard('10', heart()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getFlippingCard(var number, var suit) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.002)
        ..rotateY(pi * _animation.value),
      child: GestureDetector(
        onTap: () {
          if (_animationStatus == AnimationStatus.dismissed) {
            _animationController.forward();
          } else {
            _animationController.reverse();
          }
        },
        child: _animation.value >= 0.5
            ? CardBack()
            : CardTemplate(number: number, suit: suit),
      ),
    );
  }
}
