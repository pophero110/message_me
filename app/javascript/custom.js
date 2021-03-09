console.log("loaded");
$(document).on("turbolinks:load", () => {
  $(".ui.dropdown").dropdown();
});
