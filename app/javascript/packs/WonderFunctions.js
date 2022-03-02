/* WebPack obriga disponibilizar as funções para a window para acessar nas views */
window.GetValueSelect = function(select) {
    var option = select.options[select.selectedIndex]; 
    return option.value; 
}
window.GetTextSelect = function(select) {
    var option = select.options[select.selectedIndex]; 
    return option.text;
}
window.ExibeAlerta = function(mensagem) {
    alert(mensagem)
}