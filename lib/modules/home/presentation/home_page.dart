import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:marvel_app/modules/home/presentation/bloc/home_event.dart';
import 'package:marvel_app/modules/home/presentation/bloc/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = Modular.get<HomeBloc>();
  @override
  void initState() {
    bloc.add(HomeEventFetchList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            bloc: bloc,
            builder: (_, state) {
              if (state is HomeStateFailure) {
                return Center(
                  child: Column(
                    children: [
                      Text(
                        state.message,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          bloc.add(HomeEventFetchList());
                        },
                        child: Text(
                          'Buscar Novamente',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              if (state is HomeStateSuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.characters!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Modular.to.pushNamed(
                            '/character_detail',
                            arguments: state.characters![index],
                          );
                        },
                        child: Card(
                          elevation: 6,
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Image.network(
                                        '${state.characters![index].thumbnail!.path}.${state.characters![index].thumbnail!.extension}',
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        '${state.characters![index].name}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          )
        ],
      ),
    );
  }
}
