// JavaScript Document
//Recupera la posición del punto decimal en una cifra
var posicion;  
var valorDesenmascarado;
var valorRedondeado;
var indicadorMil = ",";
var indicadorDecimal = ".";
var bandera = true;

function posicionDecimal(valor)
{
  posicion = valor.toString().indexOf("."); 	
  return true; 
}


//Función que ingresa un valor (float) y devuelve el formato a dos digitos decimales y el valor retornado
//es un float
function formato(valorAFormatear)
{
   posicionDecimal(valorAFormatear);
   
   if (posicion != -1)
   {
      indiceFinalDesp = posicion+3;
      valor = valorAFormatear.toString().substr(0,indiceFinalDesp);
      return Number(valor);
   }
   else
   {
      return Number(valorAFormatear);
   }
   
}


//Función que ingresa un valor tipo string ej 2,520.33 y lo envia como 2520.33 para que pueda ser utilizado
//como elemento javascript. El valor retornado es float.
//A la ocurrencia de un error retorna un valor -1000000
function desenmascararFormato(valorADesenmascarar)
{
  arreglo = valorADesenmascarar.split(indicadorMil);
  valorRetorno = "";
  
  if (arreglo.length != 1) //cuando la cantidad posee formato
  {
    //verifica si el formato es correcto
    verificadorFormato(arreglo);
    
    //una vez obtenida el resultado de la verificacion se retorna la cantidad
    if (bandera == true)
    {
      for (i=0; i<arreglo.length; i++)
      {
       valorRetorno = valorRetorno + arreglo[i];
      }	
    }
    else
    {
      valorRetorno = -1000000;	
    }
    bandera = true;
  
    return Number(valorRetorno);
  }
  else
  {
    return Number(valorADesenmascarar);
  }  
}


//Verificación de la correcta obtención o ingreso del formato
function verificadorFormato(valorARevisar)
{
  if (valorARevisar[0].length > 3 )
  {
    alert("Formato mal definido o recuperado de manera errónea. Caracter ',' es utilizado como separador de cantidad de miles");	 
    bandera = false;
  }
  
  //se verifican los demás arreglos
  for (i=1; i<arreglo.length; i++)
  {
    subArreglo = arreglo[i].split(indicadorDecimal);
    
    if (subArreglo.length <= 1)
    {
      if(arreglo[i].length > 3)
      {
      	alert("Formato de cantidad mal definido");
      	bandera = false;
      } 
    }
    else
    {
      //indica que se encuentra en la porción del número decimal
      if (subArreglo.length > 2)
      {
        alert("Formato mal definido o recuperado de manera errónea. Cantidad decimal definida erróneamente");
        bandera = false;
      }
      else
      {
        if(subArreglo[0].length > 3)
        {
           alert("Cantidad mal definida antes del decimal");
           bandera = false;
        }	 
     }//fin de else
    }//fin de else  
  }//fin del for
}//fin de la funcion



//Debido a problema en javascript en la consideraciones de operaciones con punto flotante se ha implementado
//esta función de redondeo pero con solo "DOS DIGITOS" decimales...
//El valor a ingresar puede estar en formato 1,500.25 o 1500.25 (String)
function redondeo (valorARedondear) 
{
    valorARedondear = desenmascararFormato(valorARedondear);
    valorARedondear = Math.round(valorARedondear * 100) / 100;
    valorARedondear = (valorARedondear + 0.001) + '';
    return Number(valorARedondear.substring(0, valorARedondear.indexOf('.') + 3));
}