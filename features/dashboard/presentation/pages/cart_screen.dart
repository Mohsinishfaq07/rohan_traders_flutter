import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CartScreenContent();
  }
}
class CartScreenContent extends StatefulWidget {
  const CartScreenContent({Key? key}) : super(key: key);

  @override
  State<CartScreenContent> createState() => _CartScreenContentState();
}

class _CartScreenContentState extends State<CartScreenContent> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

