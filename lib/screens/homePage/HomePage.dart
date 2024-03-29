import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/moviesModel.dart';
import '../../provider/moviesProvider.dart';
import 'homepageHelpers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  int page = 0;
  int startedPage = 1;
  List<Movies> movies = [];

  fetchAllMovies() async {
    final data = Provider.of<FetchData>(context, listen: false);
    final _movies = await data.getData(++page);
    setState(() {
      movies.addAll(_movies);
    });
  }

  @override
  void initState() {
    final data = Provider.of<FetchData>(context, listen: false);
    fetchAllMovies();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        data.getData(startedPage);
        fetchAllMovies();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    const Color blueGray = Color(0xff314059);
    return Scaffold(
      backgroundColor: blueGray,
      appBar: AppBar(
        backgroundColor: blueGray,
        title: const Text('Movies',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
      ),
      body: movies.isNotEmpty
          ? ListView.builder(
              controller: _scrollController,
              itemCount: movies.length + 1,
              itemBuilder: (context, index) {
                final textBody =
                    Provider.of<HomePageHelper>(context, listen: false);
                final posterCard =
                    Provider.of<HomePageHelper>(context, listen: false);
                if (index < movies.length) {
                  return Provider.of<HomePageHelper>(context, listen: false)
                      .buildedMovies(
                          context,
                          textBody.bodyText(context, movies[index]),
                          posterCard.posterCard(context, movies[index]));
                } else {
                  return Provider.of<HomePageHelper>(context, listen: false)
                      .loadingIndicator();
                }
              })
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
