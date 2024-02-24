import 'package:counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('AppBar'),
      ),
      body: _ScaffoldBody(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(const CounterEvent.Increment());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 8,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(const CounterEvent.Reset());
            },
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

class _ScaffoldBody extends StatelessWidget {
  const _ScaffoldBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CounterBloc>().state;
    return state.when(
        initial: () => const Center(
              child: FlutterLogo(
                size: 120,
              ),
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        loaded: (counter) => Center(
              child: Text(
                counter.toString(),
              ),
            ));
    // if (state is CounterInitialState) {
    //   return const Center(
    //     child: FlutterLogo(
    //       size: 120,
    //     ),
    //   );
    // } else if (state is CounterLoadingState) {
    //   return const Center(child: CircularProgressIndicator());
    // } else if (state is CounterLoadedState) {
    //   return Center(
    //     child: Text(
    //       state.counter.toString(),
    //     ),
    //   );
    // }
    // return const SizedBox.shrink();
  }
}
