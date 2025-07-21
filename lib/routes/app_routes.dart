class AppRoutes {
  static const dashboard = '/dashboard';

  static const clients = '/clients';
  static const addClient = '/add-client';
  static const clientDetail = '/client-detail';

  static const devis = '/devis';
  static const devisDetail = '/devis-detail';
  static const createDevis = '/devis-create';

  static const stock = '/stock';
  static const relances = '/relances';
  static const recouvrements = '/recouvrements';

  static const appelsOffres = '/appels-offres';
  static const detailAppelOffre = '/appel-detail';
  static const addAppelOffre = '/appel-create';

  static const profil = '/profil';

  static String getDevisDetail(String id) {
    return '$devisDetail/$id';
  }

  static String getClientDetail(String id) {
    return '$clientDetail/$id';
  }

  static String getAppelOffreDetail(String id) {
    return '$detailAppelOffre/$id';
  }

  static String addClientScreen(String id) {
    return addClient;
  }
}
