import 'package:flutter/material.dart';
import 'package:netflix/model/model.dart';

class Emoji extends StatefulWidget {
  const Emoji({Key? key}) : super(key: key);

  @override
  _EmojiState createState() => _EmojiState();
}

class _EmojiState extends State<Emoji> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: FutureBuilder(
            future: getPopular(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List emoji = snapshot.data as List;
                return PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: emoji.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.top -
                                // kToolbarHeight -
                                kBottomNavigationBarHeight,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    'http://image.tmdb.org/t/p/w500' +
                                        emoji[index]['poster_path'],
                                  ),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              icons(Icons.emoji_emotions_rounded, "11k"),
                              icons(Icons.add, "My List"),
                              icons(Icons.share, "Share"),
                              icons(Icons.play_arrow, "Play"),
                            ],
                          )
                        ],
                      );
                    });
              }
              return Container();
            }),
      ),
    );
  }

  Column icons(IconData icons, String title) {
    return Column(
      children: [
        Icon(
          icons,
          color: Colors.white,
        ),
        Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 22,
        )
      ],
    );
  }
}
