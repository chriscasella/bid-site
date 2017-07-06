$("body").on("click",".boxheader",function(){
   $(".box").hide();
    $(".boxfooter").hide();
   $(this).parent().find(".box").slideToggle();
   $(this).parent().find(".boxfooter").slideToggle();
});
