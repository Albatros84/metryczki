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
//= require_self
//= require jquery
//= require jquery_ujs
//= require ckeditor-jquery
//= require ckeditor/ckeditor
//= require_tree .

$(document).ready(function(){
  	  $("tr.autor td").hide(); 
      $("a.pokaz_autora").click(function(){
      $("tr.autor td").toggle('fast','linear');
     });
    });
    
$(document).ready(function(){
  	  $("td.admin").hide(); 
      $("a.pokaz_historie").click(function(){
      $("td.admin").toggle('fast','swing');
     });
    });
$(document).ready(function(){
  	  $("td.trener").hide(); 
      $("a.pokaz_historie").click(function(){
      $("td.trener").toggle('fast','swing');
     });
    });
$(document).ready(function(){
  	  $("td.biuro").hide(); 
      $("a.pokaz_historie").click(function(){
      $("td.biuro").toggle('fast','swing');
     });
    });    
$(document).ready(function(){
  	  $("td.sprzedaż").hide(); 
      $("a.pokaz_historie").click(function(){
      $("td.sprzedaż").toggle('fast','swing');
     });
    });        
    
    

$(document).ready(function(){
  $("#p1").mouseleave(function(){
    alert("Bye! You now leave p1!");
  });
});

 $(document).ready(function(){
 	  /*$("div.metr").hide();*/
      $("h3#metr").click(function(){
      $("div.metr").toggle('fast','swing');
     });
    });
 
  $(document).ready(function(){
  	  $("div.org").hide();
      $("h3#org").click(function(){
      $("div.org").toggle('fast','swing');
     });
    });
    
    $(document).ready(function(){
      $("div.mer").hide();
      $("h3#mer").click(function(){
      $("div.mer").toggle('fast','swing');
     });
    });
        
	  $(document).ready(function(){
      $("div.zespol").hide();
      $("h3#zespol").click(function(){
      $("div.zespol").toggle('fast','swing');
     });
    });
    
 $(document).ready(function(){
      $("div.przedPro").hide();
      $("h3#przedPro").click(function(){
      $("div.przedPro").toggle('fast','swing');
     });
    });

    $(document).ready(function(){
      $("div.poSpotkaniu").hide();
      $("h3#poSpotkaniu").click(function(){
      $("div.poSpotkaniu").toggle('fast','swing');
     });
    });