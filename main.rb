require 'date'

def num_comparendo(divipo, num)
    n = 20 - (divipo.length + num.length)
    ceros = ""
    (1..n).each{ |i| ceros += "0" }
    divipo + ceros + num
end

def fecha(d)
    d.strftime("%d/%m/%Y") 
end

def hora(d)
    d.strftime("%H%M")
end

dirs = Dir.entries(".")
dirs.delete(".")
dirs.delete("..")
dirs.delete("main.rb")
text = ""
dirs.each_with_index do |dir, index|
    #puts dir.split("_")[1]
    #puts Time.at(dir.split("_")[0].to_i)
    consecutivo = (index + 1).to_s
    divipo = "54498000"
    fecha_hora = Time.at(dir.split("_")[0].to_i)   
    fecha_notificacion = fecha_hora + 111
    descripcion = "CIENAGA - SANTA MARTA FRENTE A ARA KM 62 - CNG-M01"
    placa = dir.split("_")[1].to_s
    
    codigo_clase_vehiculo = "08"
    codigo_servicio_vehiculo = "2"
    codigo_radio_accion = "1" 
    nip_infractor = "900251279"  
    tipo_documento = "4" 
    nombre = "LOGICARIBE SAS"
    divipo_infractor = "99999999"
    numero_lincencia = "00000000000000"
    tipo_licencia = "00"
    codigo_tipo_infractor = "1"
    numero_placa_agente = "12544382"
    reporta_fuga = "N"
    reporta_accidente = "N"
    reporta_inmovilizacion = "N"

    valor_comparendo = "344728"
    valores_extras = "14100"
    codigo_organismo_reporta = "47189000"
    estado_comparendo = "13"
    comparendo_carretera = "N"
    codigo_infraccion = "C9"
    valor_infraccion = "344728"

    comp = consecutivo + "," + num_comparendo(divipo, consecutivo) + "," + fecha(fecha_hora) + "," +
           hora(fecha_hora) + "," + descripcion + "," + divipo + "," + "," + placa + "," + "," +
           codigo_clase_vehiculo + "," + codigo_servicio_vehiculo + "," + codigo_radio_accion + ",," +
           nip_infractor + "," + tipo_documento + "," + nombre + ",,,,,,,,,," + codigo_tipo_infractor + "," +
           ",,,,,,,," + numero_placa_agente + ",," + reporta_fuga + "," + reporta_accidente + "," + reporta_inmovilizacion + ","
           ",,,,,,,," +  valor_comparendo + "," +  valores_extras + "," +  codigo_organismo_reporta + "," + estado_comparendo + "," +
           comparendo_carretera + "," + codigo_infraccion + "," + valor_infraccion + ",S," + fecha(fecha_notificacion) + ","

    comp2 = "1" + "," + "344728" + "," + fecha_notificacion.strftime("%Y%d%m") + "," + comp.sum.to_s
    
    File.open("#{dir}/#{divipo}comp.txt", "w") do |f|
        f << comp + "\n"
        f << comp2
        f.close
    end

    rec = "0" + "," + fecha(fecha_notificacion) +"," + fecha(fecha_notificacion) + "," + divipo + "1"
    rec2 = "0,0," + fecha_notificacion.strftime("%Y%d%m") + "," + rec.sum.to_s

    File.open("#{dir}/#{divipo}rec.txt", "w") do |f|
        f << rec + "\n"
        f << rec2
        f.close
    end

    resol = "0,0," + fecha_notificacion.strftime("%Y%d%m") + ",0"

    File.open("#{dir}/#{divipo}resol.txt", "w") do |f|
        f << resol        
        f.close
    end

end



puts "---end---"