import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:test_coding/model/post.dart';
import 'package:test_coding/repository/api_post_client_response.dart';
part 'detail_post_event.dart';
part 'detail_post_state.dart';

class DetailPostBloc extends Bloc<DetailPostEvent, DetailPostState> {
  final ApiClientResponse apiClientResponse = ApiClientResponse();
  DetailPostBloc() : super(DetailPostInitial()) {
    on<DetailPost>(onDetailPost);
  }

  FutureOr<void> onDetailPost(
      DetailPost event, Emitter<DetailPostState> emit) async {
    emit(DetailPostLoading());
    try {
      Post? detailPost = await apiClientResponse.postDetail(id: event.id);
      if (detailPost != null) {
        emit(DetailPostSuccess(posts: detailPost));
      } else {
        DetailPostEmpatyState();
      }
    } catch (e) {
      emit(const DetailPostError(message: 'Gagal ambil data'));
    }
  }
}
