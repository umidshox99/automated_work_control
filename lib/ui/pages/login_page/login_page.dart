import 'package:automated_work_control/data/bloc/login_bloc/login_bloc.dart';
import 'package:automated_work_control/data/extensions/widget_padding_extension.dart';
import 'package:automated_work_control/data/localization/locale_keys.dart';
import 'package:automated_work_control/data/styles/app_colors.dart';
import 'package:automated_work_control/data/utils/app_image_utils.dart';
import 'package:automated_work_control/ui/widgets/app_button.dart';
import 'package:automated_work_control/ui/widgets/app_text_field.dart';
import 'package:automated_work_control/ui/widgets/app_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = "/loginPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.MAIN,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.MAIN,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size(
            1.sw,
            20,
          ),
          child: Center(
            child: AppWidgets.textLocale(
              text: LocaleKeys.str_welcome_to_asakabank,
              color: AppColors.WHITE,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Column(
              children: [
                AppTextField(
                  textInputType: TextInputType.number,
                  prefixIcon: AppWidgets.text(
                    text: "+998",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.WHITE,
                  ).paddingOnly(
                    left: 14.w,
                    bottom: 11,
                    top: 14.h,
                    right: 4.h,
                  ),
                  enabled: !context.read<LoginBloc>().state.isLoading,
                  labelText: LocaleKeys.str_phone_number,
                  onChanged: (String value) {
                    context.read<LoginBloc>().add(LoginChanged(value));
                  },
                ).paddingOnly(bottom: 24.h),
                AppTextField(
                  enabled: !context.read<LoginBloc>().state.isLoading,
                  isPassword: true,
                  labelText: LocaleKeys.str_password,
                  onChanged: (String value) {
                    context.read<LoginBloc>().add(LoginPasswordChanged(value));
                  },
                ).paddingOnly(bottom: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppWidgets.textLocale(
                      text: LocaleKeys.str_forgot_password,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.WHITE,
                    ),
                    AppButton(
                      padding: 0,
                      child: context.read<LoginBloc>().state.isLoading
                          ? AppWidgets.progressIndicator().paddingOnly(
                              right: 10,
                            )
                          : Container(),
                      onPressed: context
                              .read<LoginBloc>()
                              .state
                              .isLoginBtnActive
                          ? () {
                              context.read<LoginBloc>().add(LoginSignedIn());
                            }
                          : null,
                      primaryColor: AppColors.WHITE,
                      textColor: AppColors.MAIN,
                      text: LocaleKeys.str_login,
                      width: 0.3.sw,
                    )
                  ],
                ).paddingOnly(top: 24),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppWidgets.imageSvg(
                              height: 260,
                              width: 260,
                              path: AppImageUtils.IC_LOGIN_ILLUSTRATION,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        onTap: () {
                          // NavigatorService.to.pushReplacementNamed(AppPage.routeName);
                        },
                        child: DottedBorder(
                          strokeWidth: 1,
                          dashPattern: [10, 8],
                          color: AppColors.WHITE,
                          borderType: BorderType.RRect,
                          radius: Radius.circular(12.r),
                          child: Container(
                            width: 1.sw,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AppWidgets.textLocale(
                                  text: LocaleKeys.str_create_account,
                                  fontSize: 14,
                                  color: AppColors.WHITE,
                                ).paddingOnly(left: 8.w, bottom: 14, top: 14),
                              ],
                            ).paddingSymmetric(horizontal: 16.w),
                          ),
                        ),
                      ).paddingOnly(bottom: 10.h),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ).paddingSymmetric(
        horizontal: 16,
        vertical: 24,
      ),
    );
  }
}
