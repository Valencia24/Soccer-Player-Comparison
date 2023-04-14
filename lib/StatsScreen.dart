import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
//ignore_for_file: prefer_const_constructors

// this class builds the screen state
class StatsChart extends StatefulWidget {
  const StatsChart({super.key});

  @override
  State<StatsChart> createState() => _StatsChartState();
}

// this class uses the fl_chart package to create a bar chart visualization of
// a stats comparison between Ronaldo and Messi.
class _StatsChartState extends State<StatsChart> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Stats Comparison"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          SizedBox(height: 100),
          Center(
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                color: const Color(0xff2c4260),
                child: BarChart(
                  BarChartData(
                    barTouchData: barTouchData,
                    // removes borders from chart
                    borderData: FlBorderData(
                      show: false,
                    ),
                    maxY: 900,
                    backgroundColor: const Color(0xff2c4260),
                    // removes grid lines
                    gridData: FlGridData(
                      show: false,
                    ),
                    // only bottom titles for each group will be shown
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: getTitles,
                          reservedSize: 42,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                    ),
                    // each group contains 2 bars
                    barGroups: [
                      BarChartGroupData(
                        x: 0,
                        barRods: [
                          BarChartRodData(
                            toY: 788,
                            width: 15,
                            color: Colors.lightBlueAccent,
                          ),
                          BarChartRodData(
                              toY: 819,
                              width: 15,
                              color: Colors.redAccent)
                        ],
                        // will show the numbers above both bars
                        showingTooltipIndicators: [0,1],
                        barsSpace: 10,
                      ),
                      BarChartGroupData(
                        x: 1,
                        barRods: [
                          BarChartRodData(
                            toY: 348,
                            width: 15,
                            color: Colors.lightBlueAccent,
                          ),
                          BarChartRodData(
                            toY: 234,
                            width: 15,
                            color: Colors.redAccent,
                          ),
                        ],
                        showingTooltipIndicators: [0,1],
                        barsSpace: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ChartLegend(),
        ],
      ),
    );
  }
}

// this class is used to implement a "Legend" for the chart since it does not
// appear to be built in to the package
class ChartLegend extends StatelessWidget {
  const ChartLegend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const[
        Text("Legend:", style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        )),
        Text("Messi - light blue", style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.lightBlueAccent,
        )),
        Text("Ronaldo - red", style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.redAccent,
        ))
      ],
    );
  }
}

// this customizes how the numbers above each bar look
BarTouchData get barTouchData => BarTouchData(
  enabled: false,
  touchTooltipData: BarTouchTooltipData(
    tooltipBgColor: Colors.transparent,
    tooltipPadding: EdgeInsets.zero,
    tooltipMargin: 4,
    getTooltipItem: (
        BarChartGroupData group,
        int groupIndex,
        BarChartRodData rod,
        int rodIndex,
        ) {
      return BarTooltipItem(
        rod.toY.round().toString(),
        const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );
    },
  ),
);

// this widget creates the bottom tiles below each group of bars
Widget getTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = 'Goals';
      break;
    case 1:
      text = 'Assists';
      break;
    default:
      text = '';
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: Text(text, style: style),
  );
}
