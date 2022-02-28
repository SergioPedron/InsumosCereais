function GetValueSelect(select) {
    var option = select.options[select.selectedIndex]; 
    return option.value; 
}
function GetTextSelect(select) {
    var option = select.options[select.selectedIndex]; 
    return option.text;
}