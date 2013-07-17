// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require tables
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.bootstrap
//= require bootstrap
//= require_tree .

jQuery ->
  $('.articulos').dataTable
  	"oLanguage": { "sProcessing": "Procesando...","sLengthMenu":"Mostrar _MENU_ registros","sZeroRecords":"No se encontraron resultados","sEmptyTable":"Ningún dato disponible en esta tabla", "sInfo":"Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros","sInfoEmpty":"Mostrando registros del 0 al 0 de un total de 0 registros","sInfoFiltered":"(filtrado de un total de _MAX_ registros)","sInfoPostFix":"","sSearch":"Buscar:","sUrl":"","sInfoThousands":",","sLoadingRecords":"Cargando...","oPaginate": {"sFirst":"Primero","sLast":"Último","sNext":"Siguiente","sPrevious":"Anterior"},"oAria": {"sSortAscending":  ": Activar para ordenar la columna de manera ascendente","sSortDescending": ": Activar para ordenar la columna de manera descendente"} },"sDom": "<'row-fluid'<'span6'f>r>t<'row-fluid'<'span12'p>>", "sPaginationType":"bootstrap"

