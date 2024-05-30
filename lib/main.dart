import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 8, 119, 192)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Formulario de Captura de datos'),
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
  bool _isCheckedTra = false;
  bool _isCheckedTraa = false;
  String _sexo = "";
  bool onOff = false;
  double _valorSlider = 2.5;
  final TextEditingController controllerFecha = TextEditingController(text: '');
  final TextEditingController controllerHora = TextEditingController(text: '');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
          padding: const EdgeInsets.all(10),
        children: <Widget>[
          Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //const Expanded(
              // child: Image(
              //image:NetworkImage(""),
              //),
              //),
          
              const Text(
                'Formulario de Captura de datos',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
          
              const Text('Nombre'),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Name'),
              ),
              Row(
                children: [
                  
                  Checkbox(
                    value: _isCheckedTra,
                    onChanged: (bool? value) {
                      setState(() {
                        _isCheckedTra = value!;
                      });
                    },
                  ),
                  const Text('Trabaja'),
                ],
              ),
          
              Row(
                children: [
                  Checkbox(
                    value: _isCheckedTraa,
                    onChanged: (bool? value) {
                      setState(() {
                        _isCheckedTraa = value!;
                      });
                    },
                  ),
                  const Text('Estudia'),
                ],
              ),
          
              Row(
                children: [
                  Radio(
                      value: 'Femenino',
                      groupValue: _sexo,
                      onChanged: (String? value) {
                        setState(() {
                          _sexo = value!;
                        });
                      }),
                  const Text('Femenino'),
                ],
              ),
          
              Row(
                children: [
                  Radio(
                      value: 'Masculino',
                      groupValue: _sexo,
                      onChanged: (String? value) {
                        setState(() {
                          _sexo = value!;
                        });
                      }),
                  const Text('Masculino'),
                ],
              ),
          
              Row(
                children: [
                  const Text("Activar notificación"),
                  Switch(
                    value: onOff,
                    activeColor: Colors.blue,
                    onChanged: (bool value) {
                      setState(() {
                        onOff = value;
                      });
                    },
                  ),
                ],
              ),
              const Center(
                child: Text("Seleccione Precio Estimado"),
              ),
          
              //BARRA DE PRECIO
              Center(
                child: Slider(
                  thumbColor: Colors.yellow,
                  value: _valorSlider,
                  max: 100,
                  divisions: 5,
                  label: _valorSlider.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _valorSlider = value;
                    });
                  },
                ),
              ),
          // CAJA DE TEXTO DE LA FECHA
              TextField(
                  controller: controllerFecha,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      labelText: 'Introduzca la Fecha'),
                  readOnly: true,
                  onTap: () async {
                    // ignore: unnecessary_null_comparison
                    if (controllerFecha != null) {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(DateTime.now().year - 100),
                              lastDate: DateTime(DateTime.now().year + 1))
                          .then(
                        (value) {
                          setState(() {
                            controllerFecha.text =
                                '${value!.day.toString()}/${value.month.toString()}/${value.year.toString()}';
                          });
                        },
                      );
                    } else {
                      // ignore: avoid_print
                      print('Date is not is selected');
                    }
                  }),
          
          //BOTTON DE LA FECHA
              ElevatedButton(
                onPressed: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(DateTime.now().year - 100),
                          lastDate: DateTime(DateTime.now().year + 1))
                      .then(
                    (value) {
                      controllerFecha.text =
                          '${value!.day.toString()}/${value.month.toString()}/${value.year.toString()}';
                    },
                  );
                },
                child: const Text(
                  'Fecha',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          
          // CAJA DE TEXTO DE LA HORA
              TextField(
                controller: controllerHora,
                decoration: const InputDecoration(
                    icon: Icon(Icons.hourglass_bottom),
                    labelText: 'Introduzca la Hora'),
              ),
          
              //BOTTON DE LA HORA
              ElevatedButton(
                onPressed: () {
                  showTimePicker(context: context, initialTime: TimeOfDay.now())
                      .then(
                    (value) {
                      controllerHora.text = value!.format(context);
                    },
                  );
                },
                child: const Text(
                  'Hora',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          ),
        ],
      
      ),
   
    );
  }
}


