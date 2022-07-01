import 'package:evolution_fitness/widgets/all_widgets.dart';
import 'package:evolution_fitness/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/shimmer_widget.dart';

class Diary extends StatefulWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  bool _isLoading = false;
  ZoomPanBehavior? _zoomPanBehavior;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });

    _zoomPanBehavior = ZoomPanBehavior(
        // Enables pinch zooming
        zoomMode: ZoomMode.x,
        enablePanning: true,
        enablePinching: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<CaloriesBurntData> caloriesBurnt = [
      CaloriesBurntData(DateTime(2015, 10, 24, 11, 10), 104),
      CaloriesBurntData(DateTime(2015, 10, 24, 11, 30), 87),
      CaloriesBurntData(DateTime(2015, 10, 24, 12, 10), 40),
      CaloriesBurntData(DateTime(2015, 10, 24, 13, 10), 61),
      CaloriesBurntData(DateTime(2015, 10, 24, 15, 10), 35),
    ];

    final List<CaloriesIntakeData> caloriesIntake = [
      CaloriesIntakeData(DateTime(2015, 10, 24, 11, 10), 10),
      CaloriesIntakeData(DateTime(2015, 10, 24, 11, 30), 21),
      CaloriesIntakeData(DateTime(2015, 10, 24, 12, 10), 45),
      CaloriesIntakeData(DateTime(2015, 10, 24, 13, 10), 25),
      CaloriesIntakeData(DateTime(2015, 10, 24, 15, 10), 61),
    ];

    final List<TotalSteps> stepsData = [
      TotalSteps(DateTime(2015, 10, 24, 11, 10), 1000),
      TotalSteps(DateTime(2015, 10, 24, 11, 30), 800),
      TotalSteps(DateTime(2015, 10, 24, 12, 10), 400),
      TotalSteps(DateTime(2015, 10, 24, 13, 10), 600),
      TotalSteps(DateTime(2015, 10, 24, 15, 10), 50),
      TotalSteps(DateTime(2015, 10, 24, 18, 10), 100),
      TotalSteps(DateTime(2015, 10, 24, 19, 10), 1200),
      TotalSteps(DateTime(2015, 10, 24, 22, 10), 300),
    ];

    return Scaffold(
      drawer: const MyDrawer(),
      appBar: myAppBar(context, 'Diary'),
      // backgroundColor: Theme.of(context).canvasColor,
      body: _isLoading
          ? ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return buildChatsShimmer();
              }).pOnly(top: 16, left: 16, right: 16)
          : SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    // color: Colors.white,
                    child: Center(child: const PickDate().p16()),
                  ).cornerRadius(5).h(100),
                  caloriesBurntFun(context, caloriesBurnt)
                      .cornerRadius(5)
                      .pSymmetric(v: 8),
                  caloriesIntakeFun(context, caloriesIntake)
                      .cornerRadius(5)
                      .pSymmetric(v: 8),
                  steps(context, stepsData).cornerRadius(5).pSymmetric(v: 8),
                ],
              ).p16(),
            ),
    );
  }

  Card caloriesBurntFun(
      BuildContext context, List<CaloriesBurntData> caloriesBurnt) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/fire.png',
                // filterQuality: FilterQuality.low,
              ).wh(20, 20).pSymmetric(h: 8),
              'Total Calories Burnt'.text.bodyText1(context).make(),
              const Spacer(),
              '610'.text.xl2.bold.orange500.make(),
              ' Cal'.text.headline6(context).make(),
            ],
          ),
          SfCartesianChart(
              legend: Legend(
                  isVisible: true,
                  iconWidth: 20,
                  isResponsive: true,
                  position: LegendPosition.top,
                  overflowMode: LegendItemOverflowMode.wrap),
              zoomPanBehavior: _zoomPanBehavior,
              primaryXAxis: DateTimeAxis(
                  crossesAt: 0,
                  intervalType: DateTimeIntervalType.hours,
                  interval: 2),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries>[
                // Renders line chart
                LineSeries<CaloriesBurntData, DateTime>(
                    color: Colors.deepOrange,
                    name: 'Calories Burnt',
                    dataSource: caloriesBurnt,
                    markerSettings: const MarkerSettings(isVisible: true),
                    xValueMapper: (CaloriesBurntData sales, _) => sales.hour,
                    yValueMapper: (CaloriesBurntData sales, _) => sales.sales)
              ]).h(250),
        ],
      ).p8(),
    );
  }

  Card caloriesIntakeFun(
      BuildContext context, List<CaloriesIntakeData> caloriesIntake) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/chicken.png',
                filterQuality: FilterQuality.low,
              ).wh(20, 20).pSymmetric(h: 8),
              'Total Calories Intake'.text.bodyText1(context).make(),
              const Spacer(),
              '1240'.text.xl2.bold.green500.make(),
              ' Cal'.text.headline6(context).make(),
            ],
          ),
          SfCartesianChart(
              legend: Legend(
                  isVisible: true,
                  iconWidth: 20,
                  isResponsive: true,
                  position: LegendPosition.top,
                  overflowMode: LegendItemOverflowMode.wrap),
              zoomPanBehavior: _zoomPanBehavior,
              primaryXAxis: DateTimeAxis(
                  crossesAt: 0,
                  intervalType: DateTimeIntervalType.hours,
                  interval: 2),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries>[
                // Renders line chart
                LineSeries<CaloriesIntakeData, DateTime>(
                    color: Colors.green,
                    name: 'Calories Inktake',
                    dataSource: caloriesIntake,
                    markerSettings: const MarkerSettings(isVisible: true),
                    xValueMapper: (CaloriesIntakeData sales, _) => sales.hour,
                    yValueMapper: (CaloriesIntakeData sales, _) => sales.sales)
              ]).h(250),
        ],
      ).p8(),
    );
  }

  Card steps(BuildContext context, List<TotalSteps> stepsData) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/shoe.png',
                filterQuality: FilterQuality.low,
              ).wh(20, 20).pSymmetric(h: 8),
              'Total Steps'.text.bodyText1(context).make(),
              const Spacer(),
              '4050'.text.xl2.bold.blue500.make(),
              ' Steps'.text.headline6(context).make(),
            ],
          ),
          SfCartesianChart(
              legend: Legend(
                  isVisible: true,
                  iconWidth: 20,
                  isResponsive: true,
                  position: LegendPosition.top,
                  overflowMode: LegendItemOverflowMode.wrap),
              zoomPanBehavior: _zoomPanBehavior,
              primaryXAxis: DateTimeAxis(
                  crossesAt: 0,
                  intervalType: DateTimeIntervalType.hours,
                  interval: 2),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries>[
                // Renders line chart
                LineSeries<TotalSteps, DateTime>(
                    color: Colors.blue,
                    name: 'Steps',
                    dataSource: stepsData,
                    markerSettings: const MarkerSettings(isVisible: true),
                    xValueMapper: (TotalSteps sales, _) => sales.hour,
                    yValueMapper: (TotalSteps sales, _) => sales.sales),
              ]).h(250),
        ],
      ).p8(),
    );
  }

  Widget buildChatsShimmer() {
    // final screenHeight = (MediaQuery.of(context).size.height / 100);
    final screenWidth = (MediaQuery.of(context).size.width / 100);
    return Container(
      color: Colors.white,
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidget.rectangular(
            height: 5,
            width: screenWidth * 80,
          ),
          const ShimmerWidget.rectangular(
            height: 5,
          ),
          ShimmerWidget.rectangular(
            height: 5,
            width: screenWidth * 50,
          )
        ],
      ).p4(),
    ).pOnly(bottom: 4);
  }
}

class CaloriesBurntData {
  CaloriesBurntData(this.hour, this.sales);
  final DateTime hour;
  final double sales;
}

class CaloriesIntakeData {
  CaloriesIntakeData(this.hour, this.sales);
  final DateTime hour;
  final double sales;
}

class TotalSteps {
  TotalSteps(this.hour, this.sales);
  final DateTime hour;
  final double sales;
}
