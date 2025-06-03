part of '../home.dart';

class _AddCommentListener extends StatelessWidget {
  const _AddCommentListener();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    return BlocListener<CommentCubit, CommentState>(
      listenWhen: AddCommentState.match,
      listener: (context, state) {
        if (state.addComment is AddCommentFailed) {
          final message = state.addComment.message!.split(": ").last;
          UiFlash.error(context, message);
        } else if (state.addComment is AddCommentSuccess) {
          screenState.commentTextController.clear();

          PostCubit.c(context).fetchAll();
          UiFlash.success(context, "Comment added!");
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
