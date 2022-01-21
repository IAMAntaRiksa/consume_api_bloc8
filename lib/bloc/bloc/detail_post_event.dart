part of 'detail_post_bloc.dart';

abstract class DetailPostEvent extends Equatable {
  const DetailPostEvent();

  @override
  List<Object> get props => [];
}

class DetailPost extends DetailPostEvent {
  final int id;
  const DetailPost({
    required this.id,
  });
}
