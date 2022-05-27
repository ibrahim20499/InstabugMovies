import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../../model/moviesModel.dart';

class HomePageHelper with ChangeNotifier {


  Widget buildedMovies(BuildContext context, textBody , posterCard){
    return Expanded(
        child: Container(
          margin: const EdgeInsets.all(4.0),
          height: MediaQuery.of(context).size.height * 0.19,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.162,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFF1a1c20),
                            Color(0xFF222222),
                          ]),
                      borderRadius: BorderRadius.circular(8)),
                  child: textBody,
                ),
              ),
              posterCard,
            ],
          ),
        ));
  }
  Widget posterCard(BuildContext context, Movies movies) {
    return Positioned(
      left: 16,
      top: 0,
      height: MediaQuery.of(context).size.height * 0.19,
      width: MediaQuery.of(context).size.height * 0.16,
      child: InkWell(
        child: Hero(
          tag: "https://image.tmdb.org/t/p/original${movies.id}",
          child: Container(
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
                color: Color(0xFF333333),
                borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: (movies.poster_path != null)
                    ? FadeInImage.assetNetwork(
                        image:
                            "https://image.tmdb.org/t/p/original${movies.poster_path}",
                        width: 145,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: 'assets/loading.gif',
                      )
                    : Container()),
          ),
        ),
      ),
    );
  }

  Widget bodyText(BuildContext context, Movies movies) {
    return Row(children: <Widget>[
      SizedBox(
        width: MediaQuery.of(context).size.height * 0.162 + 16,
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                movies.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.04),
              ),
              const SizedBox(
                height: 3,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: ReadMoreText(
                    "${movies.overview}",
                    trimLines: 4,
                    textAlign: TextAlign.justify,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: " Show More.. ",
                    trimExpandedText: " Show Less.. ",
                    moreStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff314059),
                    ),
                    lessStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff314059),
                    ),
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w200,
                        fontFamily: "Poppins-Semibold",
                        fontSize: MediaQuery.of(context).size.width * 0.033),
                  ),
                ),
              ),
              Text(
                "${movies.release_date}",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
            ],
          ),
        ),
      ),
    ]);
  }

  Widget loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 32.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
