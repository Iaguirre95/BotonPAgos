function writeClock() 
       {
          var d=new Date();
          var dia="";
          dia += (d.getDate()<10?"0":"")+d.getDate();
          var mes=""; 
          mes += (eval("d.getMonth()+1")<10?"0":"")+eval("d.getMonth()+1");
          var anio="";
          anio = d.getFullYear();
          var t=""; 
          t+=d.getHours()+":"; 
          t+=(d.getMinutes()<10?"0":"")+d.getMinutes()+":"; 
          t+=(d.getSeconds()<10?"0":"")+d.getSeconds(); 
          if (document.layers) 
          {
             var doc=document.layers.clock.document; 
             doc.open(); 
             doc.write(dia+"-"+mes+"-"+anio+"&nbsp;&nbsp;"+t); 
             doc.close(); 
         } 
         else if (document.getElementById) 
         {
           var obj=document.getElementById("clock"); 
           obj.innerHTML=dia+"-"+mes+"-"+anio+"&nbsp;&nbsp;"+t; 
         } 
         else if (document.all) 
         {
           var obj=document.all.clock; 
           obj.innerHTML=dia+"-"+mes+"-"+anio+"&nbsp;&nbsp;"+t; 
         } 
         setTimeout("writeClock()",200); 
      } 