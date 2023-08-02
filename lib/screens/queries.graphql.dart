const String timesheetsQuery = r'''
  query Timesheets($pageIndex: Int!, $pageSize: Int!, $filter: TimesheetFilter) {
    timesheets(pageIndex: $pageIndex, pageSize: $pageSize, filter: $filter) {
      data {
        id
        month
        status
        totalTime
      }
    }
  }
''';
