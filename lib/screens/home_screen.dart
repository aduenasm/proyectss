import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TURISTEANDOGT'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height:
                48, // Reduciendo la altura del contenedor de la barra de búsqueda
            margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0), // Ajustando márgenes para alinear con las cards
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.green.shade400.withOpacity(0.7),
                  Colors.green.shade600.withOpacity(0.7)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10), // Redondeo de los bordes
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar destino...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.transparent,
              ),
            ),
          ),
          Expanded(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 600),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1 / 1.2,
                children: <Widget>[
                  buildDestinationCard(
                      'Antigua Guatemala',
                      'Descubre la ciudad colonial y su historia.',
                      'assets/antigua.jpg'),
                  buildDestinationCard(
                      'Lago de Atitlán',
                      'Explora los pueblos alrededor del lago.',
                      'assets/atitlan.png'),
                  buildDestinationCard(
                      'Semuc Champey',
                      'Aventúrate en las piscinas naturales.',
                      'assets/semuc.jpg'),
                  buildDestinationCard(
                      'Tikal',
                      'Explora las antiguas ruinas mayas en el corazón de la selva.',
                      'assets/tikal.jpg'),
                  buildDestinationCard(
                      'Rio Dulce',
                      'Navega por el río y explora su rica biodiversidad.',
                      'assets/riodulce.jpg'),
                  buildDestinationCard(
                      'Volcán Pacaya',
                      'Asciende al volcán activo para vistas únicas de lava.',
                      'assets/pacaya.jpg'),
                  buildDestinationCard(
                      'Chichicastenango',
                      'Visita el mercado vibrante lleno de artesanías locales.',
                      'assets/chichi.jpg'),
                  buildDestinationCard(
                      'Cuevas de Actún Kan',
                      'Explora el laberinto de las cuevas subterráneas iluminadas.',
                      'assets/actun.jpg'),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centrando los botones
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Navigator.pushNamed(context, '/settings'),
              tooltip: 'Configuración',
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () => Navigator.pushNamed(context, '/startTrip'),
              tooltip: 'Iniciar un Viaje',
            ),
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () => Navigator.pushNamed(context, '/account'),
              tooltip: 'Perfil',
            ),
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () => Navigator.pop(context),
              tooltip: 'Cerrar Sesión',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDestinationCard(
      String title, String description, String imagePath) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Text(
              description,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
