import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="timer"
export default class extends Controller {
  connect () {
    function formatTime (seconds) {
      const minutes = Math.floor(seconds / 60)
      const secondsLeft = seconds % 60

      function padTo2Digits (num) {
        return num.toString().padStart(2, '0')
      }

      return padTo2Digits(minutes) + ':' + padTo2Digits(secondsLeft)
    }

    const text = this.element.innerHTML
    let seconds = (this.data.get('current-ts') - this.data.get('start-at') + 1)

    setInterval(() => {
      this.element.innerHTML = text + '+ ' + formatTime(seconds++)
    }, 1000)
  }
}
