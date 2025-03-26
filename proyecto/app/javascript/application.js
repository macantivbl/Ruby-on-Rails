// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


$(document).on('turbo:load', function(e){
    seleccionarEstado();
});

function seleccionarEstado(){
    let x = ""

    $("#sEstadoSeleccionado").change(function(){
        x= ($('option:selected', $(this)).text());
        console.log(x);
      });

    
    
}