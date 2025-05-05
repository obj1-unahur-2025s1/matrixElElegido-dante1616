object neo  {
  var energia = 100

  method esElElegido() {
    return true
  }
  method salta() {
    energia = energia + 0.5
  }
  method vitalidad() {
    return energia * 0.1
  }
}



object morfeo {
  var vitalidad  = 8
  var estaDescansado = true

  method eslElegido() {
    return false
  }

    method morfeoSalta() {
      estaDescansado = not estaDescansado
      vitalidad = (vitalidad - 1).max(0) 
    }

}

object trinity {
  method vitalidad() {
    return 0
  }

    method esElElegido() {
      return false
    }

    method saltar() {
      
    }

}

object nave {
  const pasajeros = #{neo, morfeo, trinity}

  method cuantosPasajerosHay() {
    return pasajeros.size()
  } 

  method pasajeroConMasVitalidad() {
   return  pasajeros.max({p => p.vitalidad()})
  }
  method pasajeroDeMenorVitalidad() {
    return pasajeros.min({p => p.vitalidad()})
  }

  method estaEquilibrada() {
    return self.pasajeroConMasVitalidad().vitalidad() < self.pasajeroDeMenorVitalidad().vitalidad()
  }

    method eslElegido(){
        return pasajeros.any({p => p.eslElegido()})
    }
      
    method chocar() {
      pasajeros.forEach({p => p.salta()})
      pasajeros.clear()
    }

    method acelerarNave() {
      pasajeros.filter({p => not p.esElElegido()}).forEach({p => p.salta()})
     pasajeros.remove(neo)
    }


    }

  


