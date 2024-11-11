import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-preview"
export default class extends Controller {
  static targets = ["canvas", "source", "preview", "avatar"];

  show() {
    const reader = new FileReader();

    this.previewTarget.removeAttribute("hidden");
    this.avatarTarget.setAttribute("hidden", "");

    reader.onload = function() {
      // this.canvasTarget.removeAttribute("hidden");

      this.canvasTarget.src = reader.result;
    }.bind(this)

    reader.readAsDataURL(this.sourceTarget.files[0]);
  }
}
