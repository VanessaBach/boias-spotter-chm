const toogleTab = () => {

  const clickButton1 = document.getElementById("antartica");
  const clickButton2 = document.getElementById("abrolhos");

  const antartica = document.getElementById("antartica-content");
  const abrolhos = document.getElementById("abrolhos-content");

  if (clickButton1) {
    clickButton1.addEventListener('click', (event) => {
      event.currentTarget.classList.add('active');
      clickButton2.classList.remove('active');

      antartica.classList.remove('inactive-tab')
      abrolhos.classList.add('inactive-tab')
    });

    clickButton2.addEventListener('click', (event) => {
      event.currentTarget.classList.add('active');
      clickButton1.classList.remove('active');

      abrolhos.classList.remove('inactive-tab')
      antartica.classList.add('inactive-tab')
    });
  }
};

export { toogleTab };