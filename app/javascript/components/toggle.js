
const toggle = () => {
  let togg1 = document.getElementById("togg1");
  let d1 = document.getElementById("d1");

  if (togg1 == null)
    return

  togg1.addEventListener("click", () => {
  console.log(d1)
  if(d1.style.display === "block"){
    d1.style.display = "none";
  } else {
    d1.style.display = "block";
  }
})
}

export {toggle}
