class Usuario{
  int id;
  String nombre;
  String apellido;
  String correo;
  int celular;
  int carnet;

  Usuario({this.id, this.nombre, this.apellido, this.correo, this.celular, this.carnet});

  Map<String, dynamic> toMap(){
    return{
      'nombre':nombre,
      'apellido':apellido,
      'correo':correo,
      'celular':celular,
      'carnet':carnet,
    };
  }
}