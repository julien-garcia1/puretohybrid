let togg1 = document.getElementById("togg1");



document.getElementById("d1").style.display = 'none';
let d1 = document.getElementById("d1");
const toggle = () => { togg1.addEventListener("click", () => {
  if(getComputedStyle(d1).display == "block"){
    d1.style.display = "none";
  } else {
    d1.style.display = "block";
  }
})
}

export {toggle}
