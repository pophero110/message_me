console.log("loaded");
$(document).on("turbolinks:load", () => {
  $(".ui.dropdown").dropdown();

  $(".message .close").on("click", function () {
    $(this).closest(".message").transition("fade");
  });
});
