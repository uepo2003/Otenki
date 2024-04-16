
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otenki/components/add_info.dart';
import 'package:otenki/components/button_widget.dart';
import 'package:otenki/config/config.dart';
import 'package:otenki/view_model/provider.dart';

class ResultPage extends ConsumerWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // dataProviderの監視

    final asyncValue = ref.watch(dataProvider);
    // cityNameProviderの監視

    final cityName = ref.watch(cityNameProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('Clima')),
      body: Center(
        child: asyncValue.when(
          loading: () => const CircularProgressIndicator(),
          error: (e, _) => Text(e.toString()),
          data: (data) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: kCityNameContainerStyle,
                child: Text(cityName.state, style: kCityNameTextStyle),
              ),
              const SizedBox(height: 60.0),
              const Column(
                children: [
                  Text('Additional Information', style: kAddInfoTextStyle),
                  SizedBox(height: 20.0),
                  Divider(color: Colors.black54, height: 1.0),
                ],
              ),
              const SizedBox(height: 10.0),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AddInfo(
                          label: '気温', value: '${data.main!.temp.toString()}°'),
                      AddInfo(
                        label: '体感気温',
                        value: '${data.main!.feels_like.toString()}°',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AddInfo(
                        label: '湿度',
                        value: '${data.main!.humidity.toString()}%',
                      ),
                      AddInfo(
                        label: '気圧',
                        value: '${data.main!.pressure.toString()}hPa',
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  ButtonWidget(
                    label: '更新',
                    press: () async {
                      ref.invalidate(dataProvider);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}