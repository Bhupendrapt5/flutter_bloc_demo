List<Track> albumFromJson(List<Map<String, dynamic>> str) =>
    List<Track>.from(str.map((x) => Track.fromJson(x['track'])));

class Track {
  final int trackID;
  final int trackRating;
  final int explicit;
  final String trackName;
  final String artistName;
  final String albumName;

  Track(
      {this.trackID,
      this.trackRating,
      this.trackName,
      this.artistName,
      this.albumName,
      this.explicit});

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      trackID: json['track_id'],
      albumName: json['album_name'],
      artistName: json['artist_name'],
      trackName: json['track_name'],
      trackRating: json['track_rating'],
      explicit: json['explicit'],
    );
  }
}
