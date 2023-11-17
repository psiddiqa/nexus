
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nedusoft/core/service_locator/service_locator.dart';
import 'package:nedusoft/core/services/needed_utils.dart';
import 'package:nedusoft/core/widget/common_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:nedusoft/Utils/Colors.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isToggle = false;
  final _neededVariables = locator<NeededVariables>();



  @override
  Widget build(BuildContext context) {
    final val = _neededVariables.sharedPreferences.getBool("biometric");

    return Scaffold(
        backgroundColor: WhiteColor,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
          ),
          child: InkWell(
            onTap: () async {
              await launchUrl(Uri.parse("https://nedusoft.com/"));
            },
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                    text: "Powered by ",
                    style: TextStyle(color: secondryColor),
                  ),
                  TextSpan(
                    text: "NEDUSOFT",
                    style: TextStyle(decoration: TextDecoration.underline, color: secondryColor, fontFamily: "Gilroy Bold", fontWeight: FontWeight.bold),
                  ),
                ])),
          ),
        ),
        appBar: PreferredSize(preferredSize: Size(MediaQuery.sizeOf(context).width, 60), child: CommonAppBar("Settings")),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Biometric",
                    style: TextStyle(fontSize: 18, color: secondryColor, fontFamily: "Gilroy Medium"),
                  ),
                  CupertinoSwitch(
                      activeColor: primaryColor,
                      thumbColor: Colors.white,
                      trackColor: const Color(0xFFE0E0E0),
                      value: val ?? isToggle,
                      onChanged: (value) async {
                        setState(() {
                          isToggle = !isToggle;
                        });
                        // if (isToggle) {
                        await _neededVariables.sharedPreferences.setBool("biometric", isToggle);
                        // }
                      })
                ],
              ),
            ),
            Divider(
              thickness: 1.5,
            ),
            // AspectRatio(
            //   aspectRatio: 1.6,
            //   child: _BarChart(),
            // ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 16.0),
            //   child: _calendarCarouselNoHeader,
            // ), //
          ]),
        ));
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart();

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        // groupsSpace: 12,
        gridData: const FlGridData(show: false),
        // alignment: BarChartAlignment.spaceAround,
        maxY: 50,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              TextStyle(color: secondryColor, fontWeight: FontWeight.bold, fontSize: 15),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: secondryColor,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Classes';
        break;
      case 1:
        text = 'Attended';
        break;
      case 2:
        text = 'Leave';
        break;
      case 3:
        text = 'Absent';
        break;
      case 4:
        text = 'Per %';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: 45,
              width: 30,
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade700,
                  Colors.blue.shade300,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
                toY: 35,
                gradient: LinearGradient(
                  colors: [secondryColor, primaryColor],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                width: 30,
                borderRadius: BorderRadius.circular(8))
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
                toY: 20,
                gradient: LinearGradient(
                  colors: [
                    Colors.orange.shade700,
                    Colors.orange.shade300,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                width: 30,
                borderRadius: BorderRadius.circular(8))
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
                toY: 40,
                gradient: LinearGradient(
                  colors: [
                    Colors.red.shade700,
                    Colors.red.shade300,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                width: 30,
                borderRadius: BorderRadius.circular(8))
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
                toY: 30,
                gradient: LinearGradient(
                  colors: const [
                    Color(0xFF8787FA),
                    Color(0xFF9BA0F0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                width: 30,
                borderRadius: BorderRadius.circular(8))
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}
