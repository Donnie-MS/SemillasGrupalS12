
class Planta {
  const property anioDeObtencion//Es decir, en qué año la semilla que le dio origen se sacó de su planta "madre";
  var property altura
  method cantHorasQueToleraSol() = 0
  method esFuerte() {
    var resultado = false
    if(self.cantHorasQueToleraSol() > 10) {
      resultado = true
    }
    return resultado
  }
  method daNuevasSemillas() {
    var resultado = false
    if(self.esFuerte()) {
      resultado = true
    }
    return resultado
  }
}
class Menta inherits Planta{
  override method cantHorasQueToleraSol() = 6
  method condicionAlternativa() = altura > 0.4
  override method daNuevasSemillas() = super() or self.condicionAlternativa()
  method espacioQueOcupa() = altura * 3
}
class Soja inherits Planta {
  override method cantHorasQueToleraSol() {
    var tolerancia = 6
    if (altura > 0.5) {
      tolerancia = 7
    }
    else if (altura > 1) {
      tolerancia = 9
    }
    return tolerancia
  }
  method condicionAlternativa() {
    return anioDeObtencion > 2007 and altura > 1
  }
  override method daNuevasSemillas() = super() or self.condicionAlternativa()
  method espacioQueOcupa() = altura / 2
}
class Quinoa inherits Planta {
  var property cantHorasQueToleraSol
  method espacioQueOcupa() = 0.5
  method condicionAlternativa() = anioDeObtencion < 2005
  override method daNuevasSemillas() = super() or self.condicionAlternativa()
}
class SojaTransgenica inherits Soja {
  override method daNuevasSemillas() = false
}

class HierbaBuena inherits Menta {
  override method espacioQueOcupa() = super() * 2
}
