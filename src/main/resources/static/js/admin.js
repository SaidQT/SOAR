document.addEventListener('DOMContentLoaded', function () {
  // Add hovered class to selected list item
  let list = document.querySelectorAll(".navigation li");

  function activeLink() {
    list.forEach((item) => {
      item.classList.remove("hovered");
    });
    this.classList.add("hovered");
  }

  list.forEach((item) => item.addEventListener("mouseover", activeLink));

  // Menu Toggle
  let toggle = document.querySelector(".toggle");
  let navigation = document.querySelector(".navigation");
  let main = document.querySelector(".main");

  if (toggle) {
    toggle.onclick = function () {
      navigation.classList.toggle("active");
      main.classList.toggle("active");
    };
  } else {
    console.error("Toggle element not found");
  }

  let currentPath = window.location.pathname.replace(/\/$/, ""); // Remove trailing slash
  console.log("Current Path:", currentPath);

  list.forEach((item) => {
    let link = item.querySelector('a');
    if (link) {
      let href = link.getAttribute('href').replace(/\/$/, ""); // Remove trailing slash
      console.log("Checking link:", href);
      if (href === currentPath || currentPath.startsWith(href)) {
        console.log("Match found:", href);
        item.classList.add('hovered');
      }
    }
  });
});
