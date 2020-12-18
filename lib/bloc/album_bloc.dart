import 'package:bloc_music_flutter/model/album.dart';
import 'package:bloc_music_flutter/bloc/repository.dart';
import 'package:rxdart/rxdart.dart';

class TrackBloc {
  final AlubmRepository _alubmRepository = AlubmRepository();

  final _albumFetcher = PublishSubject<List<Track>>();
  Stream<List<Track>> get albums => _albumFetcher.stream;

  fetchTrackList() async {
    List<Track> albumResponse = await _alubmRepository.fetchAlbumbs();
    _albumFetcher.sink.add(albumResponse);
  }

  dispose() {
    _albumFetcher.close();
  }
}

final trackBloc = TrackBloc();
