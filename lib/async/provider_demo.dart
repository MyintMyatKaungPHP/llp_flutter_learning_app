import 'package:flutter/material.dart';
import 'package:llp_flutter_learning_app/async/ab_provider.dart';
import 'package:provider/provider.dart';

class ProviderDemo extends StatelessWidget {
  const ProviderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ParentWidget();
  }
}


class ParentWidget extends StatelessWidget {
  const ParentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ab_provider = Provider.of<ABProvider>(context,listen: true);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Stage Management'),
            SizedBox(
              width: double.infinity,
              height: 150,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Parent Widget'),
                    Text('A + B = Total'),
                    Text('${ab_provider.a} + ${ab_provider.b} = ${ab_provider.a + ab_provider.b}',style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                ChildWidget_A(),
                ChildWidget_B(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ChildWidget_A extends StatelessWidget {
  const ChildWidget_A({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider object ဖြင့် အသုံးပြုထားပါသည်။
    final ab_provider = Provider.of<ABProvider>(context,listen: true);

    return Expanded(
      child: Card(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 15,),
              Text('Child Widget A - ${ab_provider.a}'),
              OverflowBar(
                children: [
                  IconButton(onPressed: ab_provider.minus_A, icon: Icon(Icons.remove),),
                  IconButton(onPressed: ab_provider.plus_A, icon: Icon(Icons.add)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
class ChildWidget_B extends StatelessWidget {
  const ChildWidget_B({super.key});

  @override
  Widget build(BuildContext context) {
    // Consumer widget အသုံးပြုထားပါသည်။
    return Consumer<ABProvider>(
      builder: (context,ab_provider,_){
        return Expanded(
          child: Card(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  Text('Child Widget B - ${ab_provider.b}'),
                  OverflowBar(
                    children: [
                      IconButton(onPressed: ab_provider.minus_B, icon: Icon(Icons.remove),),
                      IconButton(onPressed: ab_provider.plus_B, icon: Icon(Icons.add)),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

