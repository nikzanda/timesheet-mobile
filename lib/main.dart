import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

String fetchMeQueryString = """
  query Me {
    me {
      id
      email
      displayName
    }
  }
""";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink('http://192.168.1.4:4001/graphql');

    final AuthLink authLink = AuthLink(
      getToken: () => 'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFkbWluQGFkbWluLmNvbSIsImlhdCI6MTY5MDgyNTUzNSwiZXhwIjoxNjk2MDA5NTM1LCJzdWIiOiI2NDZiYTVhZDA1MWQ5MDU5OGE2MjMwNGMifQ.Dr2ReWAgjKQTRvqAX8tq25EqBsu9WSI6OGQIdfZl4eXVt7BusFab07dXjgwvLYUTlZYVo3cjyoLGWSlHCRBh0VJhaPsNSAbVGMZcIbWNqL9Xx-gx6UqguVHc3N819d4Cyi-k5EXgw-HQdPL2ngCZcwxzKjs50zIUu09efduazn7fx5_gUi9L03qqU4MR7ZTGLOmj0O9igW8Bbq13QUBOO9JR2tZ2iAO2t1PWyUOOxL0S69eqHhMddFEZkSbPycPsH8y7lAGcrUgizZEnxky0fls6rWxzgYLAyXC2qQj4BPj4cArBr2KJFOB3jYx02EcVpr34fB9E3PeLPn3Ei3LZF9lDbtgYOJoqRkWULdsE8ihNRjpamUVVOWCgo534rLBiSdCYR_tnp8Nw1iI9wYePHVUKTRzLBdx5p0-RzxTQvm4JxLIQvU4_dZNtiIAuD-aidvGi1NJGF-g_Uv32u4wcIa-FL8gaYE_Nrnx2OnkWMVj1GFzsotJ-ImX37ScgWIP2K-SluMDdxFw35F4Tho3oOdqJA359bSGYc7Kf7ZAYHqVDD7DE8UpFKR6E3gjBLae012kS4jDmOWj3PYwtcsqpr0J4KrSnb9ZhKad_42DurmmfQOsyT32hBd0pEQzIrsx00Ucrk9wMI_MwFl4bIe0-GSuB-ORoqvcoyFWDmtxMu3w'
    );

    final Link link = authLink.concat(httpLink);

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(),
        link: link,
      )
    );

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GraphQL Example'),
      ),
      body: Query(
        options: QueryOptions(document: gql(fetchMeQueryString)),
        builder: (result, { fetchMore, refetch }) {
          // final fetchMeResult = useQuery(
          //   QueryOptions(
          //     document: gql(fetchMeQueryString)
          //   ),
          // );

          // final result = fetchMeResult.result;

          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return const Text('Loading');
          }

          return Text(result.data!['me'].toString());
        }
      ),
    );
  }
}
