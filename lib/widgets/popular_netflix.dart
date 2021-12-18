import 'package:flutter/material.dart';
import 'package:netflix/model/model.dart';
import 'package:netflix/pages/movies_details.dart';

class HomePopular extends StatefulWidget {
  const HomePopular({Key? key}) : super(key: key);

  @override
  _HomePopularState createState() => _HomePopularState();
}

class _HomePopularState extends State<HomePopular> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        moviesList(),
      ],
    );
  }

  moviesList() {
    return SizedBox(
      height: 200,
      child: FutureBuilder(
          future: getUpComing(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List popular = snapshot.data as List;
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popular.length-1,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MoviesDetails(movie: popular[index+1],))),
                      child: SizedBox(
                        width: 145,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Container(
                                height: 170,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(6)),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500' +
                                          popular[index+1]['poster_path'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
            return Container();
          }),
    );
  }
}
