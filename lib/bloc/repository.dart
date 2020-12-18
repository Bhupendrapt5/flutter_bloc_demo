import 'package:bloc_music_flutter/model/album.dart';
import 'package:bloc_music_flutter/model/lyrics.dart';
import 'package:bloc_music_flutter/bloc/service.dart';

class AlubmRepository {
  AlbumServices appApiProvider = AlbumServices();

  Future<List<Track>> fetchAlbumbs() => appApiProvider.getTrackList();

  Future<Lyrics> fetchLyric({String trackId}) =>
      appApiProvider.getLyricById(trackId: trackId);
}
