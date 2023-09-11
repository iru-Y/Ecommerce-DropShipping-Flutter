import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trizi/domain/cubit/user_cubit.dart';
import 'package:trizi/view/shared/components/on_error_widget.dart';

class ProfileInfoWidget extends StatefulWidget {
  const ProfileInfoWidget({Key? key}) : super(key: key);

  @override
  State<ProfileInfoWidget> createState() => _ProfileInfoWidgetState();
}

class _ProfileInfoWidgetState extends State<ProfileInfoWidget> {
  late final UserCubit userCubit;

  @override
  void initState() {
    userCubit = BlocProvider.of<UserCubit>(context);
    userCubit.getByLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<UserCubit, UserState>(
            bloc: userCubit,
            builder: (context, state) {
              if (state is UserCubitLoading) {
                return const CircularProgressIndicator();
              }
              if (state is UserCubitLoaded) {
                final user = state.user;
                return SizedBox(
                    width: 100,
                    height: 100,
                    child: Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                             CircleAvatar(
                               radius: 25,
                               backgroundImage: NetworkImage(
                                   '${user?.profileImage}', scale: 2),
                             ),
                            Text('${user?.login}')
                          ],
                        )));
              }
              if (state is UserCubitError) {
                return OnErrorWidget(
                    btnText: 'Erro',
                    title: "erro no widget",
                    content: 'content',
                    onConfirmBtnTap: () => Navigator.of(context).pop());
              }
              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
