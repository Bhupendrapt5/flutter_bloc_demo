import 'dart:convert';

import 'package:bloc_music_flutter/model/album.dart';
import 'package:bloc_music_flutter/model/lyrics.dart';
import 'package:dio/dio.dart';

abstract class AlbumsRepo {
  Future<List<Track>> getTrackList();
  Future<Track> getTrackById({String trackId});
  Future<Lyrics> getLyricById({String trackId});
}

class AlbumServices implements AlbumsRepo {
  static const _baseUrl = 'https://api.musixmatch.com/ws/1.1';
  static const _API_KEY = 'apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7';
  static const _ALL_TRACKS = '/chart.tracks.get?';

  static const _TRACK = '/track.get?track_id=';
  static const _LYRICS = '/track.lyrics.get?track_id=';

  final _dio = Dio();

  @override
  Future<List<Track>> getTrackList() async {
    Response response = await _dio.get(_baseUrl + _ALL_TRACKS + _API_KEY);
    final jsonResponse = json.decode(response.data);

    List<Track> albums = albumFromJson(List<Map<String, dynamic>>.from(
        jsonResponse['message']['body']['track_list']));
    return albums;
  }

  @override
  Future<Lyrics> getLyricById({String trackId}) async {
    Response response =
        await _dio.get(_baseUrl + _LYRICS + trackId + '&$_API_KEY');
    final jsonResponse = json.decode(response.data);
    Lyrics lyric = Lyrics.fromJson(jsonResponse['message']['body']['lyrics']);
    return lyric;
  }

  @override
  Future<Track> getTrackById({String trackId}) async {
    Response response =
        await _dio.get(_baseUrl + _TRACK + trackId + '&$_API_KEY');
    final jsonResponse = json.decode(response.data);
    Track track = Track.fromJson(jsonResponse['message']['body']['track']);
    return track;
  }
}
