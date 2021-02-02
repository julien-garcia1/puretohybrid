const popupFunction = () => {
  const btn = document.getElementById("myBtn");
  const modal = document.getElementById("myModal");
  const overlay = document.getElementById('blackOverlay');

  if (btn) {
    // Open the popup
    btn.addEventListener('click', () => {
      modal.style.display = "block";
      overlay.style.display = 'block';
    });

    // Close the popup when clicking outside of it
    overlay.addEventListener('click', () => {
      modal.style.display = "none";
      overlay.style.display = 'none';
    });

    // Close the popup when clicking on it
    window.addEventListener('click', (event) => {
      if (event.target == modal) {
        modal.style.display = "none";
        overlay.style.display = 'none';
      };
    });
  }
};

export { popupFunction };