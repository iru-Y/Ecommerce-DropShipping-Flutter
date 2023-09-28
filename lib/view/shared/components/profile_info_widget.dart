import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trizi/domain/cubit/auth_cubit_cubit.dart';
import 'package:trizi/domain/cubit/user_cubit.dart';
import 'package:trizi/utils/routes.dart';
import 'package:trizi/view/shared/components/on_error_widget.dart';

class ProfileInfoWidget extends StatefulWidget {
  const ProfileInfoWidget({Key? key}) : super(key: key);

  @override
  State<ProfileInfoWidget> createState() => _ProfileInfoWidgetState();
}

class _ProfileInfoWidgetState extends State<ProfileInfoWidget> {
  late final UserCubit userCubit;
  late final AuthCubit authCubit;
  @override
  void initState() {
    super.initState();
    userCubit = BlocProvider.of<UserCubit>(context);
    authCubit = BlocProvider.of<AuthCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BlocBuilder<UserCubit, UserState>(
            bloc: userCubit,
            builder: (context, state) {
              if (state is UserCubitLoading) {
                return const CircularProgressIndicator();
              }
              if (state is UserCubitInitial) {
                final user = state.user;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Expanded(child: SizedBox()),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.blue,
                        ),
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            state.user == null
                                ? GestureDetector(
                                    onTap: () => Navigator.of(context)
                                        .pushNamed(AppRoute.REGISTER),
                                    child: Image.asset(
                                      'assets/icons/add_new_profile_icon.png',
                                      scale: 11,
                                      color: Colors.white,
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: 25,
                                    backgroundImage: NetworkImage(
                                      user?.profileImage ?? "",
                                      scale: 2,
                                    ),
                                  ),
                            Expanded(
                              child: Text(
                                (user?.name ?? 'Cadastre-se') +
                                    (' ') +
                                    (user?.lastName ?? ''),
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
              if (state is UserCubitError) {
                return OnErrorWidget(
                  btnText: 'Erro',
                  title: "erro no widget",
                  content: 'content',
                  onConfirmBtnTap: () {
                    context.read<UserCubit>().resetForm();
                    Navigator.of(context).pop();
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
