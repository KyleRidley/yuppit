$(document).ready(function() {
  $(document.body).on("click", ".ui-widget-overlay", function() {
    $.each($(".ui-dialog"), function() {
      var $dialog;
      $dialog = $(this).children(".ui-dialog-content");
      if ($dialog.dialog("option", "modal")) {
        $dialog.dialog("close");
      }
    });
  });
});

