const tbody = d3.select("tbody");
const searchBtn = d3.select("#search");
const resetBtn = d3.select("#reset");
// let datetime = d3.select("#datetime").property("value");
// let city = d3.select("#city").property("value");
// let state = d3.select("#state").property("value");
// let country = d3.select("#country").property("value");
// let shape = d3.select("#shape").property("value");
let table = document.getElementById("ufo-table");
let filterData = data;

searchBtn.on("click", handleSearchButtonClick);
resetBtn.on("click", handleResetButtonClick);

function renderTable() {
    if (table.rows.length) {
        for (var i = table.rows.length - 1; i > 0; i--) {
            table.deleteRow(i);
        };
    };

    filterData.forEach((sighting) => {
        var row = tbody.append("tr");
        Object.entries(sighting).forEach(([key, value]) => {
            var cell = row.append("td");
            cell.text(value);
        });
    });
};

function handleSearchButtonClick() {
    d3.event.preventDefault();
    filterData = data;
    let filterDate = d3.select("#datetime").property("value");
    let filterCity = d3.select("#city").property("value");
    let filterState = d3.select("#state").property("value");
    let filterCountry = d3.select("#country").property("value");
    let filterShape = d3.select("#shape").property("value");

    // const filterArray = [filterData, filterCity, filte]

    if (filterDate != '') {
        filterData = filterData.filter((sighting) => sighting.datetime === filterDate);
    };

    if (filterCity != '') {
        filterData = filterData.filter((sighting) => sighting.city === filterCity);
    };

    // let filterState = stateInput.property("value");
    if (filterState != '') {
        filterData = filterData.filter((sighting) => sighting.state === filterState);
    };

    // let filterCountry = countryInput.property("value");
    if (filterCountry != '') {
        filterData = filterData.filter((sighting) => sighting.country === filterCountry);
    };

    // let filterShape = shapeInput.property("value");
    if (filterShape != '') {
        filterData = filterData.filter((sighting) => sighting.shape === filterShape);
    };

    // for (sighting of data) {
    //     Object.entries(filterDict).forEach(([key, value]) => {
    //         if (value) {
    //             if (key === value) {
    //                 filterData.concat(sighting);
    //             };
    //         };
    //     });
    // };

    renderTable();
};

function handleResetButtonClick() {
    filteredData = data;
    $dateInput.value = "";
    $cityInput.value = "";
    $stateInput.value = "";
    $countryInput.value = "";
    $shapeInput.value = "";
    renderTable();
}

renderTable();

//updateFilters
//setFilters
//renderTable