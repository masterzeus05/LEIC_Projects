function toggleVisible(id) {
    element = document.getElementById(id)
    if (!element.style.opacity) {
        element.style.opacity = "1"
    }
    newOpacity = (element.style.opacity === "1")? "0" : "1"
    element.style.opacity = newOpacity
}