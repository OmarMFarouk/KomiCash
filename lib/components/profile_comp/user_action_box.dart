import 'package:flutter/material.dart';
import '../../blocs/user_bloc/user_cubit.dart';
import '../../src/app_color.dart';
import '../../src/app_size.dart';

class UserActionsBox extends StatelessWidget {
  const UserActionsBox({
    super.key,
    required this.cubit,
  });
  final UserCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      width: AppSize.width(context),
      height: AppSize.height(context) * 0.22,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: AppColor.blueP, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Change Password',
              style:
                  // ignore: prefer_const_constructors
                  TextStyle(
                      letterSpacing: 1,
                      fontSize: 12,
                      fontStyle: FontStyle.italic)),
          Row(
            children: [
              Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  width: AppSize.width(context) * 0.6,
                  height: AppSize.height(context) * 0.03,
                  decoration: BoxDecoration(
                      color: AppColor.blueS,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    obscuringCharacter: '@',
                    controller: cubit.newPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: 'new password',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(8)),
                    style:
                        // ignore: prefer_const_constructors
                        TextStyle(letterSpacing: 1, fontSize: 12),
                  )),
              InkWell(
                onTap: () => showModalBottomSheet(
                    showDragHandle: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15))),
                    backgroundColor: AppColor.blueP,
                    builder: (context) => Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 30),
                                  width: AppSize.width(context) * 0.6,
                                  height: AppSize.height(context) * 0.03,
                                  decoration: BoxDecoration(
                                      color: AppColor.blueS,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextField(
                                    obscureText: true,
                                    controller: cubit.passwordController,
                                    decoration: const InputDecoration(
                                        hintText: 'current password',
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(8)),
                                    style:
                                        // ignore: prefer_const_constructors
                                        TextStyle(
                                            letterSpacing: 1, fontSize: 12),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    cubit.resetPassword();
                                  },
                                  child: const Text(
                                    'SEND',
                                    style: TextStyle(
                                      color: AppColor.background,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                    context: context),
                child: const Text('Send'),
              )
            ],
          ),
          const Text('Change email',
              style:
                  // ignore: prefer_const_constructors
                  TextStyle(
                      letterSpacing: 1,
                      fontSize: 12,
                      fontStyle: FontStyle.italic)),
          Row(
            children: [
              Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  width: AppSize.width(context) * 0.6,
                  height: AppSize.height(context) * 0.03,
                  decoration: BoxDecoration(
                      color: AppColor.blueS,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: cubit.emailController,
                    decoration: const InputDecoration(
                        hintText: 'new email',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(8)),
                    style:
                        // ignore: prefer_const_constructors
                        TextStyle(letterSpacing: 1, fontSize: 12),
                  )),
              InkWell(
                onTap: () => showModalBottomSheet(
                    showDragHandle: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15))),
                    backgroundColor: AppColor.blueP,
                    builder: (context) => Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 30),
                                  width: AppSize.width(context) * 0.6,
                                  height: AppSize.height(context) * 0.03,
                                  decoration: BoxDecoration(
                                      color: AppColor.blueS,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextField(
                                    obscureText: true,
                                    controller: cubit.passwordController,
                                    decoration: const InputDecoration(
                                        hintText: 'current password',
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(8)),
                                    style:
                                        // ignore: prefer_const_constructors
                                        TextStyle(
                                            letterSpacing: 1, fontSize: 12),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    cubit.changeEmail();
                                  },
                                  child: const Text(
                                    'SEND',
                                    style: TextStyle(
                                      color: AppColor.background,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                    context: context),
                child: const Text('Send'),
              )
            ],
          ),
          const Text('DELETE ACCOUNT',
              style:
                  // ignore: prefer_const_constructors
                  TextStyle(
                      letterSpacing: 1,
                      fontSize: 12,
                      fontStyle: FontStyle.italic)),
          InkWell(
            onTap: () => showModalBottomSheet(
                showDragHandle: true,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15))),
                backgroundColor: AppColor.blueP,
                builder: (context) => Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 30),
                              width: AppSize.width(context) * 0.6,
                              height: AppSize.height(context) * 0.03,
                              decoration: BoxDecoration(
                                  color: AppColor.blueS,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextField(
                                obscureText: true,
                                controller: cubit.passwordController,
                                decoration: const InputDecoration(
                                    hintText: 'current password',
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(8)),
                                style:
                                    // ignore: prefer_const_constructors
                                    TextStyle(letterSpacing: 1, fontSize: 12),
                              )),
                          TextButton(
                              onPressed: () {
                                cubit.deleteAccount();
                              },
                              child: const Text(
                                'SEND',
                                style: TextStyle(
                                  color: AppColor.background,
                                ),
                              ))
                        ],
                      ),
                    ),
                context: context),
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                width: AppSize.width(context),
                height: AppSize.height(context) * 0.03,
                decoration: BoxDecoration(
                    border: const Border(
                        bottom: BorderSide(color: AppColor.redP, width: 3)),
                    color: AppColor.blueS,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  'delete',
                  style:
                      // ignore: prefer_const_constructors
                      TextStyle(letterSpacing: 1, fontSize: 12),
                )),
          ),
        ],
      ),
    );
  }
}
