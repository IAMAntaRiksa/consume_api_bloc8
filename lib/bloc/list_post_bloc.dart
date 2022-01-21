import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_coding/model/post.dart';
import 'package:test_coding/repository/api_post_client_response.dart';

part 'list_post_event.dart';
part 'list_post_state.dart';

class ListPostBloc extends Bloc<ListPostEvent, ListPostState> {
  final ApiClientResponse apiClientResponse = ApiClientResponse();
  ListPostBloc() : super(ListPostInitial()) {
    on<FetchListPost>(onListPost);
  }

  FutureOr<void> onListPost(
      FetchListPost event, Emitter<ListPostState> emit) async {
    emit(ListPostLoading());
    try {
      List<Post>? posts = await apiClientResponse.fetchPosts();

      if (posts?.isNotEmpty ?? true) {
        emit(ListPostLoadingSuccess(posts: posts));
      } else {
        emit(ListPostLoadingEmpaty());
      }
    } catch (e) {
      emit(const ListPostLoadingError(message: 'Gagal Ambil Data'));
    }
  }
}
