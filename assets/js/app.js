import "../css/app.scss";

import "phoenix_html"
import {Socket} from "phoenix"
import LiveSocket from "phoenix_live_view"
import topbar from "topbar"
import Prism from './prism.js';
import './font-awesome.js';

topbar.config({barColors: {0: "hsl(0, 0%, 86%)"}})
window.addEventListener("phx:page-loading-start", info => topbar.show())
window.addEventListener("phx:page-loading-stop", info => topbar.hide())

let Hooks = {}
Hooks["Highlight"] = {
  mounted() {
    Prism.highlightElement(document.getElementById(this.el.id))
  }
}

Hooks["MobileSidebar"] = {
  mounted() {
    const links = this.el.querySelectorAll(".sidebar-content .menu-list a")
    links.forEach(link => {
      link.addEventListener('click', function cb(event) {
        document.querySelector("body").classList.remove("mobile-sidebar-open");
      });
    });
    const background = this.el.querySelector(".sidebar-background")
    background.addEventListener("touchmove", function(event) {event.preventDefault()})
  }
}

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
let liveSocket = new LiveSocket("/live", Socket, {hooks: Hooks, params: {_csrf_token: csrfToken}})
liveSocket.connect()
// window.liveSocket = liveSocket

// Mobile Sidebar

window.openMobileSidebar = () => {
  const sidebar = document.querySelector('.mobile-sidebar');
  const content = sidebar.querySelector(".sidebar-content")
  const background = sidebar.querySelector(".sidebar-background")

  background.style.display = 'block';
  content.classList.remove("slideOutLeft");
  content.classList.add("slideInLeft");
  content.style.display = 'block';
  document.querySelector("body").classList.add("mobile-sidebar-open");
}

window.closeMobileSidebar = () => {
  const sidebar = document.querySelector('.mobile-sidebar');
  const content = sidebar.querySelector(".sidebar-content")
  const background = sidebar.querySelector(".sidebar-background")

  background.style.display = 'none';
  content.classList.remove("slideInLeft");
  content.classList.add("slideOutLeft");
  document.querySelector("body").classList.remove("mobile-sidebar-open");
}
