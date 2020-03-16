//<!--

var message="Accion desabilitada"; // Your no right click message here
var closeWin="0"; // Do you want to close window after message (1 for yes 0 for no)

// JavaScript by Dave Lauderdale
// Published at: www.digi-dl.com

function IE(e) 
{
     if (navigator.appName == "Microsoft Internet Explorer" && (event.button == "2" || event.button == "3"))
     {
          alert(message); if(closeWin == "1") self.close();
          return false;
     }
}
function NS(e) 
{
     if (document.layers || (document.getElementById && !document.all))
     {
          if (e.which == "2" || e.which == "3")
          {
               alert(message); if(closeWin == "1") self.close();
               return false;
          }
     }
}
document.onmousedown=IE;document.onmouseup=NS;document.oncontextmenu=new Function("return false");

//-->
