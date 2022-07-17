import 'dart:collection';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

dynamic getSize(double px) {
  return px *
      ((MathUtilities.screenWidth(key.currentState!.overlay!.context)) / 414);
}

dynamic getFontSize(double px) {
  return px *
      (MathUtilities.screenWidth(key.currentState!.overlay!.context) / 414);
}

dynamic getPercentageWidth(double percentage) {
  return MathUtilities.screenWidth(key.currentState!.overlay!.context) *
      percentage /
      100;
}

class MathUtilities {
  static screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static safeAreaTopHeight(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  static safeAreaBottomHeight(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;
}

class CustomStack<T> {
  final _stack = Queue<T>();

  void push(T element) {
    _stack.addLast(element);
  }

  T pop() {
    final T lastElement = _stack.last;
    _stack.removeLast();
    return lastElement;
  }

  void clear() {
    _stack.clear();
  }

  T getLastElement() {
    final T lastElement = _stack.last;
    return lastElement;
  }

  bool get isEmpty => _stack.isEmpty;
}
