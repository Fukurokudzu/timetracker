import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!", this.element)
    setInterval(() => {
      this.element.classList.add("fadeOut");
      setInterval(() => {this.element.remove()}, 500)
    }, 3000)
  }
  
}
