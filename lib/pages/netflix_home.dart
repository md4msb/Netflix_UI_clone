import 'package:flutter/material.dart';
import 'package:netflix/model/model.dart';
import 'package:netflix/widgets/popular_netflix.dart';
import 'package:netflix/widgets/top_ten.dart';
import 'package:netflix/widgets/trending.dart';

class NetflixHome extends StatefulWidget {
  const NetflixHome({ Key? key }) : super(key: key);

  @override
  _NetflixHomeState createState() => _NetflixHomeState();
}

class _NetflixHomeState extends State<NetflixHome> {
  @override
  Widget build(BuildContext context) {
    return 
       ListView.builder(
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (_, index) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  // excludeHeaderSemantics: true,
                  // snap: true,
                  // floating: true,
                  // pinned: false,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: AppBar(
                      backgroundColor: Colors.transparent,
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset(
                          'asstes/images/netflix_PNG15.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      actions: [
                        const Icon(
                          Icons.search,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'asstes/images/avatar.png',
                            height: 10,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverAppBar(
                  floating: false,
                  pinned: true,
                  snap: false,
                  backgroundColor: Colors.transparent,
                  title: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "TV Shows",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        const Text(
                          "Movies",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        InkWell(
                          onTap: () async {
                            return showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return Scaffold(
                                  backgroundColor: Colors.transparent,
                                  body: Container(
                                    color: Colors.transparent,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: categories.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SizedBox(
                                              height: 50,
                                            ),
                                            categories[index] == "Home"
                                                ? Text(
                                                    categories[index],
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                : Text(
                                                    categories[index],
                                                    style: const TextStyle(
                                                        color: Colors.white70,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                  floatingActionButton: FloatingActionButton(
                                    backgroundColor: Colors.white,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.black,
                                    ),
                                  ),
                                  floatingActionButtonLocation:
                                      FloatingActionButtonLocation.centerFloat,
                                );
                              },
                            );
                          },
                          child: Row(
                            children: const [
                              Text(
                                "Categories",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          FutureBuilder(
                            future: getPopular(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List popularMovies = snapshot.data as List;
                                return SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                    width: double.infinity,
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    foregroundDecoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.black,
                                          Colors.transparent,
                                          Colors.transparent,
                                          Colors.black
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        stops: [0, 0.0, 0, 15],
                                      ),
                                    ),
                                    child: Image.network(
                                      'http://image.tmdb.org/t/p/w500' +
                                          popularMovies[12]['poster_path'],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                );
                              }
                              return Container();
                            },
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 250,
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'asstes/images/netflix_PNG15.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                      const Text(
                                        'SERIES',
                                        style: TextStyle(
                                            color: Colors.white70,
                                            letterSpacing: 2.8,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  FutureBuilder(
                                    future: getPopular(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        List popularMovies =
                                            snapshot.data as List;
                                        return Text(
                                          popularMovies[12]['title'],
                                          style: const TextStyle(
                                            fontFamily: "Georgia",
                                            color: Colors.white,
                                            fontSize: 40,
                                            fontWeight: FontWeight.w900,
                                          ),
                                          textAlign: TextAlign.center,
                                        );
                                      }
                                      return Container();
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Triller  ',
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12),
                                      ),
                                      Icon(
                                        Icons.circle,
                                        color: Colors.orange,
                                        size: 5,
                                      ),
                                      Text(
                                        '  Exciting  ',
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12),
                                      ),
                                      Icon(
                                        Icons.circle,
                                        color: Colors.orange,
                                        size: 5,
                                      ),
                                      Text(
                                        '  Action ',
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: const [
                                      Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'My List',
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.play_arrow,
                                          color: Colors.black,
                                        ),
                                        Text(
                                          'Play',
                                          style: TextStyle(color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: const [
                                      Icon(
                                        Icons.info,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Info',
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Popular on Netflix',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const HomePopular(),
                      const Text(
                          'Trending Now',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                        const TrendingNow(),
                         const Text(
                          'Top Ten',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                        const TopTen(),

                        SizedBox(height: 100,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    
    );
  }
}