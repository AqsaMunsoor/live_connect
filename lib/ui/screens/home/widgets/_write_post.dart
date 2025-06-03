part of '../home.dart';

class WritePost extends StatefulWidget {
  const WritePost({super.key});

  @override
  State<WritePost> createState() => _WritePostState();
}

class _WritePostState extends State<WritePost> {
  final TextEditingController _postTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _postTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profile = AuthCubit.c(context).state.profile;
    final profilePic = profile?.profilePic;

    return Container(
      padding: Space.p.horizontal.t16 + Space.p.vertical.t24,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.neutral100,
                  backgroundImage:
                      (profilePic != null && profilePic.isNotEmpty)
                          ? NetworkImage(profilePic)
                          : null,
                  child:
                      (profilePic != null && profilePic.isNotEmpty)
                          ? null
                          : Icon(Icons.person, color: AppColors.neutral500),
                ),
                Space.x.t12,

                Flexible(
                  child: TextFormField(
                    controller: _postTextController,
                    decoration: InputDecoration(
                      hintText: 'What\'s on your mind?',
                      hintStyle: AppText.bodyRegular + AppColors.neutral300,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.white400),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.white400),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.white400),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.white400),
                      ),

                      contentPadding:
                          Space.p.horizontal.t12 + Space.p.vertical.t12,
                    ),
                    maxLines: 3,
                    minLines: 1,
                    textInputAction: TextInputAction.newline,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Post cannot be empty';
                      }
                      if (value.length > 280) {
                        return 'Post cannot exceed 280 characters';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),

            Space.y.t16,
            BlocConsumer<PostCubit, PostState>(
              // Listen to PostCubit for success/error
              listener: (context, state) {
                if (state is PostCreateSuccess) {
                  UiFlash.success(
                    context,
                    "Post submitted!",
                  ); // Assuming UiFlash exists
                  _postTextController.clear();
                  FocusScope.of(context).unfocus();
                  // Re-fetch posts to update the list
                  context.read<PostCubit>().fetchAll();
                } else if (state is PostCreateFailed) {
                  print('Post creation failed: ${state.create.message}');
                  UiFlash.error(
                    context,
                    "Failed to post: ${state.create.message}",
                  ); // Assuming UiFlash exists
                }
              },
              builder: (context, state) {
                return TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primary900,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: Space.p.horizontal.t24 + Space.p.vertical.t08,
                  ),
                  onPressed:
                      state is PostCreateLoading
                          ? null
                          : () {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState?.validate() ?? false) {
                              final postContent =
                                  _postTextController.text.trim();
                              PostCubit.c(
                                context,
                              ).createPost(content: postContent);
                            }
                          },
                  child:
                      state is PostCreateLoading
                          ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                          : Text(
                            'Post',
                            style: AppText.labelMedium.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
