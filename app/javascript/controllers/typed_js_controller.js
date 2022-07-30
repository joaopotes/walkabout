import { Controller } from "@hotwired/stimulus";
import Typed from "typed.js";

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Host your own tours", "Know the city from its locals", "You're going places"],
      typeSpeed: 80,
      loop: true,
      loopCount: Infinity,
      showCursor: false
    });
  }
}
