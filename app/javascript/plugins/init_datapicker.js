import datepicker from 'js-datepicker'

const initPicker = () => {

	const start = datepicker('.search-start', { id: 1,
      formatter: (input, date, instance) => {
      const value = date.toLocaleDateString()
      input.value = value // => '1/1/2099'
    }
  });

	const end = datepicker('.search-end', { id: 1 ,
      formatter: (input, date, instance) => {
      const value = date.toLocaleDateString()
      input.value = value // => '1/1/2099'
    }
  });

	start.getRange()
	end.getRange()
};


export { initPicker };
