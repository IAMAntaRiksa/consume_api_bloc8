part of 'list_post_bloc.dart';

abstract class ListPostState extends Equatable {
  const ListPostState();

  @override
  List<Object> get props => [];
}

class ListPostInitial extends ListPostState {}

class ListPostLoading extends ListPostState {}

class ListPostLoadingSuccess extends ListPostState {
  final List<Post>? posts;

  const ListPostLoadingSuccess({
    required this.posts,
  });

  @override
  List<Object> get props => [posts ?? []];
}

class ListPostLoadingError extends ListPostState {
  final String message;

  const ListPostLoadingError({
    required this.message,
  });
}

class ListPostLoadingEmpaty extends ListPostState {}
