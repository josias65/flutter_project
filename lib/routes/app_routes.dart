class AppRoutes {
  static const dashboard = '/dashboard';

  // Clients
  static const clients = '/clients';
  static const addClient = '/add-client';
  static const clientDetail = '/client-detail';
  static String getClientDetail(String id) => '$clientDetail/$id';

  // Devis
  static const devis = '/devis';
  static const devisDetail = '/devis/detail'; // ✅ chemin mis à jour
  static const createDevis = '/devis-create';
  static String getDevisDetail(String id) => '$devisDetail/$id';

  // Stock
  static const stock = '/stock';
  static const stockDetail = '/stock-detail';
  static const stockEdit = '/stock-edit';
  static const addStock = '/add-stock';
  static String getStockDetail(String id) => '$stockDetail/$id';
  static String getStockEdit(String id) => '$stockEdit/$id';

  // Appels d’Offres
  static const appelsOffres = '/appels-offres';
  static const detailAppelOffre = '/appel-detail';
  static const addAppelOffre = '/appel-create';
  static String getAppelOffreDetail(String id) => '$detailAppelOffre/$id';

  // Relances / Recouvrements
  static const relances = '/relances';
  static const recouvrements = '/recouvrements';

  // Profil
  static const profil = '/profil';

  // Marché
  static const marcheList = '/marche';
  static const marcheDetail = '/marche-detail';
  static const marcheSoumission = '/marche-soumission';
  static const marcheHistorique = '/marche-historique';
  static String getMarcheDetail(String id) => '$marcheDetail/$id';
  static String getMarcheSoumission(String id) => '$marcheSoumission/$id';
}
