class Parcela {
    var property ancho
    var property largo
    var property cantHorasRecibidasDeSol
    const plantas = #{}
    method superficie() = ancho * largo
    method cantPlantas() = plantas.size()
    method cantMaxDePlantasQueTolera() {
        var cantMax = (self.superficie() / 3) + largo
        if (ancho > largo) {
            cantMax = self.superficie() / 5
        }
        return cantMax
    }
    method tieneComplicaciones() = plantas.any({planta => planta.cantHorasQueToleraSol() <= cantHorasRecibidasDeSol})
    method plantar(unaPlanta) {
        if (self.cantPlantas() == self.cantMaxDePlantasQueTolera()) {
            throw new Exception(message="no puede plantarse, la parcela alcanzo la cantidad maxima")
        }
        plantas.add(unaPlanta)
    }
}
