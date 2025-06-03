part of 'cubit.dart';

// nested-states

@immutable
class PostState extends Equatable {
  // root-state
  final PostCreateState create;
  final PostDeleteState delete;
  final FetchPostByUidState fetchPostByUid;
  final PostUpdateState update;
  final FetchPostByIdState fetchPostById;

  final FetchAllState fetchAll;
  final List<Post>? posts;
  final String? uid;

  const PostState({
    // root-state-constr
    required this.create,
    required this.delete,
    required this.fetchPostByUid,
    required this.update,
    required this.fetchPostById,

    required this.fetchAll,

    this.posts,
    this.uid,
  });

  @override
  List<Object?> get props => [
    // root-state-props
    create,
    delete,
    fetchPostByUid,
    fetchPostById,

    update,

    posts,
    uid,
    fetchAll,
  ];

  PostState copyWith({
    // root-cw
    PostCreateState? create,
    PostDeleteState? delete,
    FetchPostByUidState? fetchPostByUid,
    PostUpdateState? update,
    FetchPostByIdState? fetchPostById,

    FetchAllState? fetchAll,

    List<Post>? posts,
    String? uid,
  }) {
    return PostState(
      // root-cw-ins
      create: create ?? this.create,
      delete: delete ?? this.delete,
      fetchPostByUid: fetchPostByUid ?? this.fetchPostByUid,
      update: update ?? this.update,
      posts: posts ?? this.posts,

      fetchPostById: fetchPostById ?? this.fetchPostById,
      fetchAll: fetchAll ?? this.fetchAll,
      uid: uid ?? this.uid,
    );
  }
}

@immutable
class PostStateDefault extends PostState {
  const PostStateDefault()
    : super(
        // root-state-init
        create: const PostCreateState(),
        delete: const PostDeleteState(),
        fetchPostByUid: const FetchPostByUidState(),
        update: const PostUpdateState(),
        fetchPostById: const FetchPostByIdState(),

        fetchAll: const FetchAllState(),
      );
}
