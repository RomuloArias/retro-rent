document.addEventListener('DOMContentLoaded', () => {
  const menuButton = document.querySelector('#hamburger');
  const sidebar = document.querySelector('#sidebar');

  menuButton.addEventListener('click', () => {
    sidebar.classList.toggle('sidebar-active');
  });
});
