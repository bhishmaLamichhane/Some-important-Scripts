function CSV(array) {
    // Use first element to choose the keys and the order
    var keys = Object.keys(array[0]);

    // Build header
    var result = keys.join(",") + "\n";

    // Add the rows
    array.forEach(function(obj){
        keys.forEach(function(k, ix){
            if (ix) result += ",";
            result += obj[k];
        });
        result += "\n";
    });

    return result;
}
var oTable = document.getElementById('tt_table');

//gets rows of table
var rowLength = oTable.rows.length;
var result_array = [];

//loops through rows
for (i = 1; i < rowLength; i++){
   //gets cells of current row
   var result_hash = {};
   var cellVal = oTable.rows[i];
   var oCells = cellVal.cells[0];
   var a = oCells.getElementsByTagName('a');
   var created_at = cellVal.cells[2].innerHTML;
	 var unit = cellVal.cells[5].innerHTML;
	 result_hash[ "access_hash"] =  a[0].innerHTML;
	 result_hash[ "created_at"] = created_at.slice(1,-1);
	 result_hash[ "unit"] = unit.slice(1,-1);
	 result_array.push(result_hash);
}
var csvfile = CSV(result_array);
var encodedUri = encodeURI("data:text/csv;charset=utf-8,"+csvfile);
//window.open(encodedUri,final.csv);   this wasn't done as the output filename couldn't be changed with this method !
var downloadLink = document.createElement("a");
downloadLink.href = encodedUri;
downloadLink.download = "data.csv";

document.body.appendChild(downloadLink);
downloadLink.click();                   //for exporting the csv file
document.body.removeChild(downloadLink);
$("a[rel=next]")[0].click()


// var hashArray = new Array();
// var links=$("td a");
// for(var i=0;i<links.length;i++){
//  var link=links[i].href;
//  if(link.slice(-7)!=="sources")
//    hashArray.push(link.slice(-15,-5));
// }