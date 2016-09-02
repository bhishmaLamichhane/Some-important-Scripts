Object.extend = function(destination, source) {
    for (var property in source) {
        if (source.hasOwnProperty(property)) {
            destination[property] = source[property];
        }
    }
    return destination;
};


var arr1　= { robert: "bobby", john: "jack" };
var arr2 = { elizabeth: "liz", jennifer: "jen" };

var shortnames = Object.extend(arr1,arr2); => {robert: "bobby", john: "jack", elizabeth: "liz", jennifer: "jen"}