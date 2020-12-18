import 'package:bloc_music_flutter/bloc/lyrics_bloc.dart';
import 'package:bloc_music_flutter/model/album.dart';
import 'package:bloc_music_flutter/model/lyrics.dart';
import 'package:bloc_music_flutter/widget/info_text.dart';
import 'package:bloc_music_flutter/widget/label_text.dart';
import 'package:bloc_music_flutter/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:bloc_music_flutter/helper/capitalize_extension.dart';

class TrackDetailsPage extends StatefulWidget {
  final Track track;
  const TrackDetailsPage({Key key, @required this.track}) : super(key: key);

  @override
  _TrackDetailsPageState createState() => _TrackDetailsPageState();
}

class _TrackDetailsPageState extends State<TrackDetailsPage> {
  final lyricBloc = LyricBloc();

  @override
  Widget build(BuildContext context) {
    lyricBloc.fetchLyric(widget.track.trackID.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            getDtails(label: 'Name', text: widget.track.trackName),
            getDtails(label: 'Artist', text: widget.track.artistName),
            getDtails(label: 'Album', text: widget.track.albumName),
            getDtails(
                label: 'Explict',
                text: widget.track.explicit.isOdd
                    .toString()
                    .capitalizeFirstLetter),
            getDtails(
                label: 'Rating', text: widget.track.trackRating.toString()),
            StreamBuilder<Lyrics>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return getDtails(
                    label: 'Lyric',
                    text: snapshot.data.lyricBody.replaceAll('\\n', '\n'),
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Loading();
              },
              stream: lyricBloc.lyric,
            )
          ],
        ),
      ),
    );
  }

  Widget getDtails({
    String label,
    String text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LableText(text: label),
        InfoText(
          text: text,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
