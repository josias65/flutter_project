import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = [
      _DashboardItem(
        "Clients",
        Icons.people_alt_outlined,
        const Color(0xFF2196F3),
        AppRoutes.clients,
      ),
      _DashboardItem(
        "Devis",
        Icons.description_outlined,
        const Color(0xFF009688),
        AppRoutes.devis,
      ),
      _DashboardItem(
        "Stocks",
        Icons.inventory_2_outlined,
        const Color(0xFFFF9800),
        AppRoutes.stock,
      ),
      _DashboardItem(
        "Relances",
        Icons.access_time_outlined,
        const Color(0xFFE91E63),
        AppRoutes.relances,
      ),
      _DashboardItem(
        "Recouvrements",
        Icons.history_toggle_off_outlined,
        const Color(0xFF9C27B0),
        AppRoutes.recouvrements,
      ),
      _DashboardItem(
        "Appels d’offres",
        Icons.assignment_outlined,
        const Color(0xFF4CAF50),
        AppRoutes.appelsOffres,
      ),
      _DashboardItem(
        "Profil",
        Icons.person_outline,
        const Color(0xFF3F51B5),
        AppRoutes.profil,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text("Tableau de Bord"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 15, 4, 101),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 15, 4, 101)),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            _buildDrawerItem(
              Icons.dashboard,
              'Tableau de Bord',
              context,
              AppRoutes.dashboard,
            ),
            _buildDrawerItem(
              Icons.people,
              'Clients',
              context,
              AppRoutes.clients,
            ),
            _buildDrawerItem(
              Icons.description,
              'Devis',
              context,
              AppRoutes.devis,
            ),
            _buildDrawerItem(
              Icons.inventory,
              'Stocks',
              context,
              AppRoutes.stock,
            ),
            _buildDrawerItem(
              Icons.assignment,
              'Appels d’offres',
              context,
              AppRoutes.appelsOffres,
            ),
            _buildDrawerItem(Icons.person, 'Profil', context, AppRoutes.profil),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Déconnexion'),
              onTap: () {
                // TODO: Ajoute ici ta logique de déconnexion
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
          children: cards.map((item) => _buildCard(context, item)).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF6A5AE0),
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {
          // TODO: Implémente la navigation si nécessaire
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Stats'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Paramètres',
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    IconData icon,
    String title,
    BuildContext context,
    String route,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () => Navigator.pushNamed(context, route),
    );
  }

  Widget _buildCard(BuildContext context, _DashboardItem item) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, item.route),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: item.color.withOpacity(0.1),
              child: Icon(item.icon, color: item.color, size: 26),
            ),
            const SizedBox(height: 16),
            Text(
              item.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardItem {
  final String title;
  final IconData icon;
  final Color color;
  final String route;

  _DashboardItem(this.title, this.icon, this.color, this.route);
}
