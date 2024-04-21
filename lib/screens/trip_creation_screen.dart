import 'package:flutter/material.dart';

class TripCreationScreen extends StatefulWidget {
  const TripCreationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TripCreationScreenState createState() => _TripCreationScreenState();
}

class _TripCreationScreenState extends State<TripCreationScreen> {
  DateTime? startDate;
  DateTime? endDate;
  String? selectedDestination;
  final List<String> destinations = [
    'Antigua Guatemala',
    'Lago de Atitlán',
    'Semuc Champey',
    'Tikal'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planificar Nuevo Viaje'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DropdownButtonFormField<String>(
                value: selectedDestination,
                hint: const Text('Seleccione Destino'),
                onChanged: (newValue) {
                  setState(() {
                    selectedDestination = newValue;
                  });
                },
                items:
                    destinations.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: Text(
                    "Fecha de Inicio: ${startDate?.toString().substring(0, 10) ?? 'No seleccionada'}"),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: startDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null && picked != startDate) {
                    setState(() {
                      startDate = picked;
                    });
                  }
                },
              ),
              ListTile(
                title: Text(
                    "Fecha de Fin: ${endDate?.toString().substring(0, 10) ?? 'No seleccionada'}"),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: endDate ?? (startDate ?? DateTime.now()),
                    firstDate: (startDate ?? DateTime.now()),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null && picked != endDate) {
                    setState(() {
                      endDate = picked;
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Asumiendo que todo está bien
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // para confirmación
                ),
                child: const Text('Guardar Viaje'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, //para cancelación
                ),
                child: const Text('Cancelar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
