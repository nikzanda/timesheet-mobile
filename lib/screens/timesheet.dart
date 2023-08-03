import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'queries.graphql.dart' as constants;

class TimesheetList extends StatelessWidget {
  const TimesheetList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timesheet'),
      ),
      body: TimesheetTable(key: key),
    );
  }
}

// class TimesheetTable extends HookWidget {
//   const TimesheetTable({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final result = useQuery(
//       options: QueryOptions(
//         document: gql(constants.timesheetsQuery)
//       ),
//     );

//     if (result.hasException) {
//       return Text(result.exception.toString());
//     }

//     if (result.isLoading) {
//       return const CircularProgressIndicator();
//     }

//     final timesheets = result.data['data']['timesheets'];

//     return ListView.builder(
//       itemCount: timesheets.length,
//       itemBuilder: (context, index) {
//         final timesheet = timesheets[index];

//         return ListTile(
//           title: Text(timesheet['month']),
//         );
//       }
//     );
//   }
// }

class TimesheetTable extends StatelessWidget {
  const TimesheetTable({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    return Query(
        options:
            QueryOptions(document: gql(constants.timesheetsQuery), variables: {
          'pageIndex': 0,
          'pageSize': 12,
          'filter': {'year': now.year.toString()}
        }),
        builder: (result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return const CircularProgressIndicator();
          }

          // return Text(result.data.toString());

          final timesheets = result.data!['timesheets']['data'];

          return DataTable(
              columns: const <DataColumn>[
                DataColumn(label: Text('Mese')),
                DataColumn(label: Text('Monte ore')),
                DataColumn(label: Text('Stato')),
              ],
              rows: timesheets
                  .map<DataRow>((timesheet) => DataRow(cells: <DataCell>[
                        DataCell(Text(timesheet['month'])),
                        DataCell(Text(timesheet['totalTime'].toString())),
                        DataCell(Text(timesheet['status'])),
                      ]))
                  .toList());
        });
  }
}
