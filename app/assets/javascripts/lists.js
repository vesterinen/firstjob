# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
function createList(e){
  e.preventDefault();
  var $form = $(this);

  var url = $form.attr("action");

  $.post(url, $form.serialize() , function(listLI){
    $(".new-todo", $form).val("");

    $("ul").prepend(listLI);
  });
};

function removeList($li){
  
}

function deleteList(e){
  e.preventDefault();
  var $li = $(this).parents("li");

  var href = $("form", $li).attr("action");

  $.ajax(href, {
    "method": "DELETE",
    "success": function(){

      $li.slideUp(function(){
        $(this).remove();
      });
    }
  })
}

$(function(){
  $("form#new_list").on("submit", createList);  

  $("ul.lists").on("click", "button.destroy", deleteList);
});
