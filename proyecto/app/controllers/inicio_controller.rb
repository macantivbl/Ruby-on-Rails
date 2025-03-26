class InicioController < ApplicationController

  def index
    mensaje="<h1> Hellow From Rails </h1>"
    mensaje+="<h2> Hellow From Rails </h1>"
    mensaje+="<h3> Hellow From Rails </h1>"
    mensaje+="<h4> Hellow From Rails </h1>"

    render html: mensaje.html_safe
  end

  def consumirApiReservamos()
    @meteoroLat = 38.509794
    @meteoroLat = -107.894242
    base_url = 'https://search.reservamos.mx/api/v2/places?q=mon'
    @Lugares= ObtenerEstados(base_url)
    @temperatura =ObtenerTemperatura(@meteoroLat,@meteoroLong)
  end

  def ObtenerEstados(base_url)
    response=HTTParty.get(base_url)
    return response.success? ? response : []
  end
  
  def ObtenerTemperatura(meteoroLat, meteoroLong)
      base_url = "https://api.openweathermap.org/data/2.5/weather?lat=#{meteoroLat}&lon=#{meteoroLong}&appid=d50bae20e57497c69b5dc377930ca2ba"
      
      response = HTTParty.get(base_url)
      
      if response.success?
          tempe = response.parsed_response["main"]["temp"] # Extrae solo la minima
      else
          tempe = nil
          puts "Error al obtener la temperatura: #{response.code} - #{response.message}"
      end
      return tempe
  end
  
end
