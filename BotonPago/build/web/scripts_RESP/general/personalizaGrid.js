/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


    function f_selectRow(p_row){
        var l_tabla = p_row.parentElement.parentElement;
        var x = document.querySelectorAll("#"+l_tabla.id+" .tr_select");
        var i;
        for (i = 0; i < x.length; i++) {
            x[i].className  = "tr_style";
        }
        p_row.className  = "tr_select";
    }
    
    function f_rowChange(p_table,p_length,p_row_index,p_col_index){ 
        var l_tabla = document.getElementById(p_table);
        var index = parseInt(p_row_index);
        var length = parseInt(p_length);
        if(event.keyCode == "40"){
            index = index -1;
            if(index >= 0 ){
                object_row = document.getElementById(l_tabla.id+"_row_"+index);
                object_col = document.getElementById(l_tabla.id+"_row_"+index+"_col_"+p_col_index);
                object_row.click();
                if(object_col){
                    object_col.focus();
                }
            } 
        }else if(event.keyCode == "38"){
            index = index +1;
            if(index < length){
                object_row = document.getElementById(l_tabla.id+"_row_"+index);
                object_col = document.getElementById(l_tabla.id+"_row_"+index+"_col_"+p_col_index);
                object_row.click();
                if(object_col){
                    object_col.focus();
                }
            }
        }else if(event.keyCode == "9"){

        } else{
            event.returnValue = false;
        } 
    }