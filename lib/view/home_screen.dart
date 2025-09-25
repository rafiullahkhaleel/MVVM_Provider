import 'package:flutter/material.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/view_model/movies_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MoviesViewModel _moviesViewModel = MoviesViewModel();
  @override
  void initState() {
    // TODO: implement initState
    _moviesViewModel.fetchMoviesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Data')),
      body: ChangeNotifierProvider(
        create: (_) => MoviesViewModel(),
        child: Consumer<MoviesViewModel>(
          builder: (context, provider, child) {
            switch (provider.moviesList.status) {
              case Status.loading:
                return Center(child: CircularProgressIndicator());
              case Status.error:
                Center(child: Text(provider.moviesList.message.toString()));
              case Status.completed:
                return ListView.builder(
                  itemCount: provider.moviesList.data!.movies!.length,
                  itemBuilder: (context, index) {
                    final data = provider.moviesList.data!.movies![index];
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          data.poster.toString(),
                          errorBuilder: (context, error, stack) {
                            return Icon(Icons.error, color: Colors.red);
                          },
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(data.title ?? ''),
                        subtitle: Text(data.year ?? ''),
                      ),
                    );
                  },
                );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
