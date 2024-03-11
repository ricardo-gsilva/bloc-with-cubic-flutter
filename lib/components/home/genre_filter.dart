import 'package:bilheteria_panucci/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

class GenreFilter extends StatefulWidget {
  final HomeCubit homeCubit;
  const GenreFilter({Key? key, required this.homeCubit}) : super(key: key);

  @override
  State<GenreFilter> createState() => _GenreFilterState();
}

class _GenreFilterState extends State<GenreFilter> {
  
  static final List<String> listGenres = [
    'Todos',
    'Ação',
    'Comédia',
    'Drama',
    'Romance',
    'Documentário',
    'Suspense',
    'Terror',
    'Ficção Científica'
  ];

  String dropdownValue = listGenres.first;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Gênero: ', style: Theme.of(context).textTheme.displaySmall),
          DropdownButton<String>(
            value: dropdownValue,
            items: listGenres.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              if (value != null) {
                if(value != "Todos"){
                  widget.homeCubit.getMoviesGenre(value);
                } else {
                  widget.homeCubit.getMovies();
                }
                setState(() {
                  dropdownValue = value;                  
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
