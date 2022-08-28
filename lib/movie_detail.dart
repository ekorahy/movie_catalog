import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_catalog/model/movies.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('testing'),
    );
  }
}

class MobilePageDetail extends StatelessWidget {
  final Movies movie;

  const MobilePageDetail({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}