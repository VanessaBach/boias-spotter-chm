const foldData = () => {

  document.getElementById('search-btn').addEventListener('click', (event) => {
    document.getElementById('fold-current-data').classList.add('inactive-fold');
  });
};

export { foldData };


