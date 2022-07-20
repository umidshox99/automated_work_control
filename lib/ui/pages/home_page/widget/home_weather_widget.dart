import 'package:automated_work_control/data/extensions/widget_padding_extension.dart';
import 'package:automated_work_control/data/localization/locale_keys.dart';
import 'package:automated_work_control/data/model/weather_data.dart';
import 'package:automated_work_control/data/styles/app_colors.dart';
import 'package:automated_work_control/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeWeatherWidget extends StatelessWidget {
  const HomeWeatherWidget({Key? key, required this.weatherData})
      : super(key: key);
  final WeatherData? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: AppColors.WHITE,
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppWidgets.textLocale(
                  text: LocaleKeys.str_today,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                weatherData!=null? AppWidgets.imageNetwork(
                  path: weatherData!.current!.condition!.icon
                      !.replaceFirst("//", "http://"),
                ):Container()
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.text(
                text: DateFormat('EEEE d MMM yyyy', context.locale.languageCode)
                    .format(DateTime.now()),
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
              AppWidgets.text(
                text: "${weatherData?.current?.tempC} °C",
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ],
          ),
        ],
      ).paddingAll(8),
    );
  }
}
