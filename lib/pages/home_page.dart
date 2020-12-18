import 'package:bloc_music_flutter/model/album.dart';
import 'package:bloc_music_flutter/bloc/album_bloc.dart';
import 'package:bloc_music_flutter/pages/track_details_page.dart';
import 'package:bloc_music_flutter/widget/list_row.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    trackBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    trackBloc.fetchTrackList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending'),
      ),
      body: StreamBuilder<List<Track>>(
        builder: (context, AsyncSnapshot<List<Track>> snapshot) {
          if (snapshot.hasData) {
            return _list(snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
        stream: trackBloc.albums,
      ),
    );
  }

  Widget _list(List<Track> tracks) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: tracks.length,
        itemBuilder: (_, index) {
          Track track = tracks[index];
          return InkWell(
            child: ListRow(track: track),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrackDetailsPage(track: track),
                )),
          );
        },
      ),
    );
  }
}
