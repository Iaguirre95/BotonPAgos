                            var realizacionClick = 0;
                            var previoClick;
                         function MM_swapImgRestore() { //v3.0
                           var i,x,a=document.MM_sr;
	                       for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++)
	                       if(realizacionClick == 0)
	                       {
	                         x.src=x.oSrc;
	                       }
                         }
                         function MM_preloadImages() { //v3.0
                           var d=document;
                           if(d.images){
	                         if(!d.MM_p) d.MM_p=new Array();
                            var i,j=d.MM_p.length,a=MM_preloadImages.arguments;
	                        for(i=0; i<a.length; i++)
	                        if (a[i].indexOf("#")!=0)
		                    {
		                      d.MM_p[j]=new Image;
		                      d.MM_p[j++].src=a[i];
		                    }
	                      }
                         }
                         function MM_findObj(n, d) { //v4.01
                           var p,i,x;
                           if(!d) d=document;
                           if((p=n.indexOf("?"))>0&&parent.frames.length)
                           {
                             d=parent.frames[n.substring(p+1)].document;
	                         n=n.substring(0,p);
                           }
                           if(!(x=d[n])&&d.all) x=d.all[n];
                           for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
                           for (i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
                           if(!x && d.getElementById) x=d.getElementById(n);    
                           return x;
                         }
                         function MM_swapImage() { //v3.0
                           var i,j=0,x,a=MM_swapImage.arguments;
                           document.MM_sr=new Array;
                           for(i=0;i<(a.length-2);i+=3)
                            if ((x=MM_findObj(a[i]))!=null)
	                        {
	                          document.MM_sr[j++]=x;
	                          if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];
	                        }
	                       if(previoClick)
	                       {
	                         if(x.name == previoClick.name)
	                         {
	                           realizacionClick = 1;
	                         }
	                         else
	                         {
	                           realizacionClick = 0;
	                         }
	                       }
	                       else
	                       {
	                         realizacionClick = 0;
	                       }
                         }// function MM_swapImage
                         function MM_swapImageOnClick() { //v3.0
                         
                           var i,j=0,x,a=MM_swapImageOnClick.arguments;
                           document.MM_sr=new Array;
                           for(i=0;i<(a.length-2);i+=3)
                           if ((x=MM_findObj(a[i]))!=null)
	                       {  
	                         document.MM_sr[j++]=x;
	                         if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];
	                         previoClick = x;
	                       }
	                       realizacionClick = 1;
                              
	                       for(k=0;k<document.images.length;k++)
	                       {
	                         document.MM_sr[k]=document.images[k];
	                       }
	                       for(j=0;j<document.images.length;j++)
	                       {
	                         //alert(previoClick.name +" != "+ document.images[j].name);
                                 if (previoClick.name != document.images[j].name)
	                         {
	                           if(typeof(document.images[j].oSrc) != "undefined")
	                           {
	                             document.images[j].lowsrc = document.MM_sr[j].oSrc
	                             document.images[j].src    = document.MM_sr[j].oSrc
	                           }
	                         }
	                       }
                         }
