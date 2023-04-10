import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="flash"
/* global bootstrap */
export default class extends Controller {
  connect () {
    const toastLiveExample = document.getElementById('liveToast')
    const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample)
    toastBootstrap.show()
    setInterval(() => {
      this.element.classList.add('fade-out')
      setInterval(() => { this.element.remove() }, 500)
    }, 5000)
  }
}
