import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController birthDateController =
      TextEditingController(); // Para poder poner la fecha
  final TextEditingController cityController = TextEditingController();

  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: fullNameController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre Completo',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: birthDateController,
                  decoration: const InputDecoration(
                    labelText: 'Fecha de Nacimiento',
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now());
                    if (pickedDate != null) {
                      String formattedDate =
                          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                      birthDateController.text = formattedDate;
                    }
                  },
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: cityController,
                  decoration: const InputDecoration(
                    labelText: 'Ciudad de Origen',
                    prefixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: const Text('Guardar Información'),
                ),
                const SizedBox(height: 15), //el espacio entre botones
                TextButton(
                  onPressed: () {
                    Navigator.pop(
                        context); // Esto va a regresar al usuario a login
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, // Color del texto
                    backgroundColor:
                        Theme.of(context).primaryColor, // Color de fondo
                  ),
                  child: const Text('Regresar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
