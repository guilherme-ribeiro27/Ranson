import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Novo paciente'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool litiaseBiliar = false;
  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController leucocitosController = TextEditingController();
  TextEditingController glicemiaController = TextEditingController();
  TextEditingController astController = TextEditingController();
  TextEditingController ldhController = TextEditingController();
  int pontuacao = 0;
  String pontuacaoString = '';
  double mortalidade = 0;
  String mortalidadeString = '';
  @override
  void initState(){
    super.initState();
  }
  void handleSubmit(){
    if(litiaseBiliar){
      if(idadeController.text == '70'){
        pontuacao += 1;
      }
    }else{

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Novo Paciente',
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: nomeController,
                      decoration: const InputDecoration(
                        labelText: 'Nome'
                      )
                    ),
                    TextFormField(
                      controller: idadeController,
                      decoration: const InputDecoration(
                        labelText: 'Idade:'
                      )
                    ),
                    Row(
                      children: [
                        Checkbox(value: litiaseBiliar, onChanged: (value){setState(() {
                          litiaseBiliar = value!;
                        });},),
                        const Text('Litíase biliar?'),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(flex: 1,child: Text('Leucócitos:'),),
                        Expanded(flex: 3,child: TextFormField(controller: leucocitosController,), ),
                        const Expanded(flex: 1,child: Text('cél./mm3', textAlign: TextAlign.center),)
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(flex: 1,child: Text('Glicemia:',),),
                        Expanded(flex: 3,child: TextFormField(controller: glicemiaController,), ),
                        const Expanded(flex: 1,child: Text('mmol/L', textAlign: TextAlign.center),)
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(flex: 1,child: Text('AST/TGO',),),
                        Expanded(flex: 3,child: TextFormField(controller: astController,), ),
                        const Expanded(flex: 1,child: Text('UI/L', textAlign: TextAlign.center),)
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(flex: 1,child: Text('LDH',),),
                        Expanded(flex: 3,child: TextFormField(controller: ldhController,), ),
                        const Expanded(flex: 1,child: Text('UI/L', textAlign: TextAlign.center),)
                      ],
                    ),
                    const SizedBox(height: 20,),
                    ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity,40)),child: const Text('ADICIONAR PACIENTE'),)
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  const Text('Pontuação:'),
                  const SizedBox(width: 10,),
                  Text('$pontuacaoString')
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  const Text('Mortalidade:'),
                  const SizedBox(width: 10,),
                  Text('$mortalidadeString')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
