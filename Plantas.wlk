
/*

*/

class Planta {
  const property añoDeObtencion//Es decir, en qué año la semilla que le dio origen se sacó de su planta "madre";
  var property altura
  var metros
  var property cantHorasQueToleraSol
  method esFuerte() {
    var resultado = false
    if(cantHorasQueToleraSol > 10) {
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
  var espacioQueOcupa//espacio ocupa una vez plantada, medido en metros cuadrados.

}
class Menta inherits Planta{
  override method cantHorasQueToleraSol() = 6
  method condicionAlternativa() = altura > 0.4
  override method daNuevasSemillas() {
    return super() and self.condicionAlternativa()
  }
  method espacioQueOcupa() = altura * 3
}
class Soja inherits Planta {
  override method cantHorasQueToleraSol() {
    var tolerancia = 9
    if (altura < 0.5) {
      tolerancia = 6
    }
    else if (altura < 1) {
      tolerancia = 7
    }
    return tolerancia
  }
  method condicionAlternativa() {
    return añoDeObtencion > 2007 and altura > 1
  }
  override method daNuevasSemillas() = super() and self.condicionAlternativa()
  method espacioQueOcupa() = altura / 2
}
class Quinoa inherits Planta {
  method espacioQueOcupa() = 0.5
  method condicionAlternativa() = añoDeObtencion < 2005
  override method daNuevasSemillas() = super() and self.condicionAlternativa()
}
/*
Ejemplos:

una menta de 1 metro, debería dar semillas y ocupar un espacio de 3 metros cuadrados.
una menta de solo 0.3 metros, no debería dar semillas y ocuparía 0.9 metros cuadrados de espacio.

Por ejemplo, si tuviesemos una soja de 0.6 metros y de semilla de 2009, 
la planta tendría una tolerancia al sol de 7 horas, no daría semillas y ocuparía 0.3 metros cuadrados.


Por ejemplo quinoa:

si tenemos una quinoa que tolera 12 horas de sol y su semilla de origen es de 2010,
 se trata de una planta que da semillas.
si tenemos una planta que tolere 9 horas de sol pero cuya semilla de origen es de 2001, 
también da semillas.
*/