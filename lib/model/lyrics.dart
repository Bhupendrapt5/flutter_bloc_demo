class Lyrics {
  final String lyricBody;
  final int lyricId;

  Lyrics({this.lyricBody, this.lyricId});

  factory Lyrics.fromJson(Map<String, dynamic> lMap) {
    return Lyrics(
      lyricBody: lMap['lyrics_body'],
      lyricId: lMap['lyrics_id'],
    );
  }
}
