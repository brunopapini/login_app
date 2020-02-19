class Event {
  final int id;
  final String fechaCreacion;
  final String lugar;
  final String descripcion;
  final String tipo;
  final int usuarioCreador;
  List<int> usarioAAdido;

  Event(this.id,
      this.fechaCreacion,
      this.descripcion,
      this.lugar,
      this.tipo,
      this.usarioAAdido,
      this.usuarioCreador);

}
