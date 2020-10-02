import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_that/models/report.dart';
import 'package:whats_that/screens/home/report_tile.dart';

class ReportList extends StatefulWidget {
  @override
  _ReportListState createState() => _ReportListState();
}

class _ReportListState extends State<ReportList> {
  @override
  Widget build(BuildContext context) {
    final reports = Provider.of<List<Report>>(context);

    return ListView.builder(
      itemCount: reports != null ? reports.length : 0,
      itemBuilder: (context, index) {
        return ReportTile(report: reports[index]);
      },
    );
  }
}
