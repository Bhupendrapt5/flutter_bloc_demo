import 'package:bloc_music_flutter/bloc/repository.dart';
import 'package:bloc_music_flutter/model/lyrics.dart';
import 'package:rxdart/rxdart.dart';

class LyricBloc {
  final AlubmRepository _alubmRepository = AlubmRepository();

  final _lyricsFetcher = PublishSubject<Lyrics>();
  Stream<Lyrics> get lyric => _lyricsFetcher.stream;

  fetchLyric(String trackID) async {
    Lyrics lyricResponse = await _alubmRepository.fetchLyric(trackId: trackID);
    _lyricsFetcher.sink.add(lyricResponse);
  }

  dispose() {
    _lyricsFetcher.close();
  }
}

final lyricBloc = LyricBloc();
