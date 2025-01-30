class Business {
  final String razaoSocial;
  final String cnpj;
  final String email;

  Business({
    required this.razaoSocial,
    required this.cnpj,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'razaoSocial': razaoSocial,
      'cnpj': cnpj,
      'email': email,
    };
  }
}