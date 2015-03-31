# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

function Question(){

};

Question.updateContent = function(e){
  e.preventDefault();

  var $form = $(this)
  var href = $form.attr("action");
  
  $.ajax(href, {
    "method": "PATCH",
    "data": $form.serialize(),
    "success": function(response){
      var newLabelValue = $("input.edit", $form).val();
      var $li = $form.parents("li:first");
      $("label", $li).html(newLabelValue)
      hideEditInPlace($li);
    }
  })
}

Question.updateStatus = function(e){
  var $checkbox = $(this)
  var $form = $(this).parents("form:first")
  var href = $form.attr("action")

  $.ajax(href, {
    "method": "PATCH",
    "data": $form.serialize(),
    "success": function(response){
      $checkbox.parents("li:first").toggleClass("completed");

    }
  })
}

Question.create = function(e){
  e.preventDefault();

  var $form = $(this);
  var href = $form.attr("action");

  $.ajax(href, {
    "data": $form.serialize(),
    "method": "POST",
    "success": function(response){
 
      $(".new-todo", $form).val("");

      $("ul#todo-list").prepend(response);
    }
  }) 
};

Question.edit = function(e){
  e.preventDefault();
  var $li = $(this).parents("li:first");
  $li.addClass("editing");
  $("input.edit", $li).focus();
}

function hideEditInPlace($li){
  $li.removeClass("editing");
}

Question.stopEdit = function(e){
  e.preventDefault();
  var $li = $(this).parents("li:first");
  hideEditInPlace($li);

  $("form.update", $li).trigger("submit")
}

$(function(){
  $("form#new_question").on("submit", Question.create)
  // Event Delegation
  $("ul.list").on("change","input:checkbox", Question.updateStatus)

  // $("ul.lists").on("click", "button.destroy", deleteList);  

  $("ul.list").on("submit", "form.update", Question.updateContent)

  $("ul.list").on("dblclick", "li label", Question.edit)
  $("ul.list").on("blur", "li input.edit", Question.stopEdit)
});