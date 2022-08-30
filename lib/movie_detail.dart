import 'package:flutter/material.dart';
import 'package:movie_catalog/model/movies.dart';

class MovieDetail extends StatelessWidget {
  final Movies movie;

  const MovieDetail({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return WebPageDetail(movie: movie);
        } else {
          return MobilePageDetail(movie: movie);
        }
      },
    );
  }
}

class MobilePageDetail extends StatelessWidget {
  final Movies movie;

  const MobilePageDetail({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Detail'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.network(
                movie.poster,
                fit: BoxFit.fill
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFFE87A00),
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.access_time,
                            color: Color(0xFFE87A00),
                          ),
                        ),
                        Text(
                          movie.runtime,
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.calendar_today,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          movie.released,
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          movie.imdbRating,
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
                child: Text(
                  'Genre : ${movie.genre}',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 16,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
                child: Text(
                  'Language : ${movie.language}',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
                child: Text(
                  'Director : ${movie.director}',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
                child: Text(
                  'Writer : ${movie.writer}',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
                child: Text(
                  'Actors : ${movie.actors}',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
                child: Text(
                  'Awards : ${movie.awards}',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
                child: Text(
                  'Plot : ${movie.plot}',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: movie.images.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: FavoriteButton(),
        backgroundColor: Colors.white,
        onPressed: () {},
      ),
    );
  }
}

class WebPageDetail extends StatefulWidget {
  final Movies movie;

  const WebPageDetail({Key? key, required this.movie}) : super(key: key);

  @override
  State<WebPageDetail> createState() => _WebPageDetailState();
}

class _WebPageDetailState extends State<WebPageDetail> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Detail'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 64,
            ),
            child: Center(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              ClipRRect(
                                child: Image.network(widget.movie.poster),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              const SizedBox(height: 16),
                              Scrollbar(
                            controller: _scrollController,
                            child: Container(
                              height: 150,
                              padding: const EdgeInsets.only(bottom: 16),
                              child: ListView(
                                controller: _scrollController,
                                scrollDirection: Axis.horizontal,
                                children: widget.movie.images.map((url) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(url),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 32),
                        Expanded(
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text(
                                    widget.movie.title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 30,
                                      color: Color(0xFFE87A00),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(vertical: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(right: 5),
                                              child: Icon(
                                                Icons.access_time,
                                                color: Colors.red,
                                              ),
                                            ),
                                            Text(
                                              widget.movie.runtime,
                                              style: TextStyle(
                                                fontFamily: 'Quicksand',
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(right: 5),
                                              child: Icon(
                                                Icons.calendar_today,
                                                color: Colors.blue,
                                              ),
                                            ),
                                            Text(
                                              widget.movie.released,
                                              style: TextStyle(
                                                fontFamily: 'Quicksand',
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(right: 5),
                                              child: Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                            ),
                                            Text(
                                              widget.movie.imdbRating,
                                              style: TextStyle(
                                                fontFamily: 'Quicksand',
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
                                    child: Text(
                                      'Genre : ${widget.movie.genre}',
                                      style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontSize: 16,
                                        color: Colors.brown,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
                                    child: Text(
                                      'Language : ${widget.movie.language}',
                                      style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
                                    child: Text(
                                      'Director : ${widget.movie.director}',
                                      style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
                                    child: Text(
                                      'Writer : ${widget.movie.writer}',
                                      style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
                                    child: Text(
                                      'Actors : ${widget.movie.actors}',
                                      style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
                                    child: Text(
                                      'Awards : ${widget.movie.awards}',
                                      style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellow,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
                                    child: Text(
                                      'Plot : ${widget.movie.plot}',
                                      style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: FavoriteButton(),
        backgroundColor: Colors.white,
        onPressed: () {},
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Color(0xFFE87A00),
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}