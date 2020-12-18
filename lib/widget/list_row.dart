import 'package:bloc_music_flutter/model/album.dart';
import 'package:bloc_music_flutter/widget/info_text.dart';
import 'package:bloc_music_flutter/widget/label_text.dart';
import 'package:flutter/material.dart';

class ListRow extends StatelessWidget {
  //
  final Track track;
  ListRow({this.track});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.music_note_rounded,
          size: 30,
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LableText(
                text: track.trackName,
                size: 16,
              ),
              SizedBox(
                height: 10,
              ),
              InfoText(
                text: track.albumName,
                size: 14,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 1,
          child: InfoText(
            text: track.artistName,
            size: 16,
          ),
        ),
      ],
    );
  }
}
