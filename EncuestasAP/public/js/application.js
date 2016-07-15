
$(document).ready(function(){

  var num_pregunta = 1;
  var num_respuesta = 1;

  $("#pregunta").on("submit", function(event){
    event.preventDefault();
    //alert("lala");
    var pregunta = $(this).serialize();
    //console.log(pregunta);

    // Logica del formulario de pregunta
    $.post( "/question/new", pregunta, function(data){

      $("#pregunta").remove();
      $("#container_questions").append("<div id='pregunta" + num_pregunta +"'></div>")
      $("#pregunta" + num_pregunta).append(data);
      num_pregunta += 1;

      //Logica de formulario de respuestas
      $("#respuestas").on("submit", function(event){
        event.preventDefault();
        var respuesta = $(this).serialize();

        $.post("/option/new", respuesta, function(data){
          //$("#respuestas").remove();
          $("#opciones_container").append(data + "<br>");
          $("#input_quest").val("");  


          $("#termina_op").one("click", function(event){
            //console.log($("#respuestas"))
            alert("lala");
            $("#respuestas").remove();
          });

        });//post respuesta

      });

    });

  });

});

 


/*

$(document).ready(function() {


  var num_pregunta = 1;
  var form_respuestas = 1;

  $("#agrega_question").on("submit", function(event){
    event.preventDefault();

    //Forma 1 accediendo directamemte en el valor del input

    // EL input tiene un id para poder tomar su valor directamente
    //var pregunta = $("#la");
    //console.log(typeof(pregunta))
    //console.log(pregunta.val());

    //Forma 2 por medio de serialize el cual se manda en formato de string los datos del formulario a post para cacharlo con params

    var pregunta = $(this).serialize();
    //console.log(pregunta);

    $.post( "/question/new", pregunta, function( data ) {
      //Ejemplo
      //console.log(data)
      //$("#agrega_question").remove()
      $("#agrega_question").hide();
      $("#container_questions").append("<div id='pregunta" + num_pregunta + "'></div><br><br>");
      $("#pregunta" + num_pregunta).append(data);
      num_pregunta += 1;
      $("#pregunta" + num_pregunta + "").attr("id", "hola" + form_respuestas)
      num_pregunta += 1;

      $("#respuestas").on("submit", function(event){
        event.preventDefault();
        //alert("lala");
        var info = $(this).serialize();
        //console.log(info);

        $.post("/option/new", info, function(data){
          //console.log(data)
          $("#opciones_container").append("- " + data + "<br>");

          $("#ter-opciones").click(function(){
            $("#ter-opciones").hide()
            $("#respuestas").hide()
            $("#agrega_question").show();
            $("#input_quest").val("");
          });

        });

      });

    });

  });

});

*/

