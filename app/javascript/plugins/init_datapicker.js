import datepicker from 'js-datepicker'

const initPicker = () => {
  const picker = datepicker(".date-picker-date")

	const start = datepicker('.search-start', { id: 1 })
	const end = datepicker('.search-end', { id: 1 })

	start.getRange()
	end.getRange()
};


export { initPicker };
