import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { text: String }

  copy() {
    navigator.clipboard.writeText(this.textValue).then(() => {
      this.showToast("복사되었습니다!")
    })
  }

//   showToast(message) {
//     let toast = document.createElement("div")
//     toast.textContent = message
//     toast.className = "toast"
//     document.body.appendChild(toast)
//     setTimeout(() => toast.remove(), 2000)
//   }

  showToast(message) {
    let toast = document.createElement("div");
    toast.textContent = message;
    toast.style.position = "fixed";
    toast.style.bottom = "30px";
    toast.style.left = "50%";
    toast.style.transform = "translateX(-50%)";
    toast.style.backgroundColor = "rgba(0,0,0,0.7)";
    toast.style.color = "#fff";
    toast.style.padding = "10px 20px";
    toast.style.borderRadius = "5px";
    toast.style.zIndex = "1000";
    document.body.appendChild(toast);
    setTimeout(() => {
      toast.remove();
    }, 1000);
  }
}