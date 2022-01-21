part of 'detail_post_bloc.dart';

abstract class DetailPostState extends Equatable {
  const DetailPostState();

  @override
  List<Object> get props => [];
}

////  Post Detail
class DetailPostInitial extends DetailPostState {}

class DetailPostLoading extends DetailPostState {}

class DetailPostSuccess extends DetailPostState {
  final Post posts;
  const DetailPostSuccess({
    required this.posts,
  });
  @override
  List<Object> get props => [posts];
}

class DetailPostError extends DetailPostState {
  final String message;
  const DetailPostError({
    required this.message,
  });
}

class DetailPostEmpatyState extends DetailPostState {}
