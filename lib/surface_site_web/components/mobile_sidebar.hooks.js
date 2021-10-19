let MobileSidebar = {
  mounted() {
    const sidebar = this.el;
    const content = sidebar.querySelector(".sidebar-content")
    const background = sidebar.querySelector(".sidebar-background")
    const links = sidebar.querySelectorAll(".sidebar-content .menu-list a")

    links.forEach(link => {
      link.addEventListener('click', function cb(event) {
        document.querySelector("body").classList.remove("mobile-sidebar-open");
      });
    });
    background.addEventListener("touchmove", function(event) {event.preventDefault()})

    window.openMobileSidebar = () => {
      const content = sidebar.querySelector(".sidebar-content")
      const background = sidebar.querySelector(".sidebar-background")

      background.style.display = 'block';
      content.classList.remove("slideOutLeft");
      content.classList.add("slideInLeft");
      content.style.display = 'block';
      document.querySelector("body").classList.add("mobile-sidebar-open");
    }

    window.closeMobileSidebar = () => {

      background.style.display = 'none';
      content.classList.remove("slideInLeft");
      content.classList.add("slideOutLeft");
      document.querySelector("body").classList.remove("mobile-sidebar-open");
    }
  }
};

export {MobileSidebar};