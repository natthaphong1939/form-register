import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"]

  connect() {
    this.inputTarget.addEventListener('input', this.formatPhoneNumber.bind(this))
  }

  formatPhoneNumber(event) {
    const input = event.target
    let value = input.value.replace(/\D/g, '') // Remove non-numeric characters

    if (value.length > 10) {
      value = value.slice(0, 10)
    }

    // Format the value
    if (value.length > 6) {
      value = value.replace(/(\d{3})(\d{3})(\d{0,4})/, '$1-$2-$3')
    } else if (value.length > 3) {
      value = value.replace(/(\d{3})(\d{0,3})/, '$1-$2')
    }

    input.value = value
  }
}
