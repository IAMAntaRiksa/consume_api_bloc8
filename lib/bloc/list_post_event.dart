part of 'list_post_bloc.dart';

abstract class ListPostEvent extends Equatable {
  const ListPostEvent();

  @override
  List<Object> get props => [];
}

class FetchListPost extends ListPostEvent {}
