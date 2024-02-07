import "../css/prism-vsc-dark-plus.css";
import "../css/bulma.css";
import "../css/animate.css";
// We import the CSS which is extracted to its own file by esbuild.
// Remove this line if you add a your own CSS build pipeline (e.g postcss).
import "../css/app.css";

window.Prism = window.Prism || {};
window.Prism.manual = true;

// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "../vendor/some-package.js"
//
// Alternatively, you can `npm install some-package --prefix assets` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import topbar from "../vendor/topbar"
import Prism from "../vendor/prism.js";
import "../vendor/font-awesome.js";
import Hooks from "./_hooks"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}, hooks: Hooks})

// Uncomment when we start using mermaid
// import mermaid from "../vendor/mermaid"
// mermaid.initialize({startOnLoad: false});

// Don't load the topbar for catalogue examples/praygrounds
if (!window.frameElement) {
  topbar.config({barColors: {0: "hsl(0, 0%, 86%)"}})
  window.addEventListener("phx:page-loading-start", info => topbar.show())
  window.addEventListener("phx:page-loading-stop", info => topbar.hide())
}

Hooks["Highlight"] = {
  mounted() {
    Prism.highlightElement(this.el)

    // Call it again to fix misplaced selected lines on page reload
    Prism.highlightElement(this.el)
  }
}

// Uncomment when we start using mermaid
// Hooks["Mermaid"] = {
//   mounted() {
//     mermaid.init(undefined, `#${this.el.id}`);
//   }
// }

Hooks["SectionHeading"] = {
  mounted() {
    const template = document.createElement("div")
    template.innerHTML = `<a href="#${this.el.id}" class="hover-link">
      <span class="icon-link" aria-hidden="true">
        <svg viewBox="0 0 16 16" version="1.1" width="20" height="20" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg>
      </span>
    </a>`
    this.el.insertBefore(template.firstChild, this.el.firstChild)
  }
}

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket
