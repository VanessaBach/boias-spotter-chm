const foldData = () => {

  const clickSearch = document.getElementById('search-btn') 

  const fold = document.getElementById('fold-current-data') => {
    clickSearch.addEventListener('click', (event) => {
      if (@end_date.present? || @start.date.present?) {
        event.currentTarget.classList.add('unfold');
      } else {
      clickSearch.classList.remove('unfold');
      };
    });
  };
};

export { foldData };