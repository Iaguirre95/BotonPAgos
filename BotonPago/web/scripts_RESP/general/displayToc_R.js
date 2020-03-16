/*------------------------------------------------------------------- 
Author's Statement:
This script is based on ideas of the author.
You may copy, modify and use it for any purpose. The only condition is that if you publish web pages that use this script you point to its author at a suitable place and don't remove this Statement from it.
It's your responsibility to handle possible bugs even if you didn't modify anything. I cannot promise any support.
Dieter Bungers
GMD (www.gmd.de) and infovation (www.infovation.de)
--------------------------------------------------------------------*/
// Checking the client's browser and setting the text sizes of the headings in the ToC depending on the global parameter textSizes set in tocParas and the browser useed:

var isIE = navigator.appName.toLowerCase().indexOf("explorer") > -1;
var mdi = (isIE) ? textSizes[1]:textSizes[3];
var sml = (isIE) ? textSizes[2]:textSizes[4];

// Other global variables:

// oldCurrentNumber is required to keep a hedings ordering string (or number) in case the ToC should change (tocChange > 0) but the content's location should remain unchanged (i.e. noLink == 1). In those cases the heading preceeded by oldCurrentNumber has to remain hilited (otherwise the heading preceeded by currentNumber has to be hilited).
var oldCurrentNumber = "", oldLastVisitNumber = "";

// toDisplay: Array to keep the display status for each heading. It is initialised so only the top level headings are displayed (headings preceeded by a single string without a dot):  
var toDisplay = new Array();
/*for (ir=0; ir<tocTab.length; ir++) {
	toDisplay[ir] = tocTab[ir][0].split(".").length==1;*/
  /*for (ir=0; ir<parent.frames[5].tocTab.length; ir++) {
	toDisplay[ir] = parent.frames[5].tocTab[ir][0].split(".").length==1;	
}*/

var titulo=false;

// ***************************************
// The function redisplays the ToC and the content 
// ***************************************
function reDisplay(currentNumber,tocChange,noLink,e) {
// Input parameters:
// currentNumber: Hierarchical ordering string (or number) of the heading the user wants to display (we call this heading the "current"). This controls the change of both, the ToC depending on the second parameter tocChange and the content's URL depending on the third parameter noLink. 
// tocChange: Controls how to change the ToC. 0 = No change, 1 = Change with automatic collapsing of expanded headings that are not on the path to the current heading, 2 = Change wthout automatic colapsing (as use for example by Windows Explorer or Mac OS).
// noLink: Controls wether the content's URL shall be changed to the value given by the 3rd element of an tocTab's entry (= 0) or not (= 1).
// e: The event that triggered the function call. If it is set it must be the event object.

// If there is an event that triggered the function call: Checking the control key depending on the browser used. If it is pressed and tocChange is greater than 0 tocChange is set to 2 so the ToC schanges without automatic collapsing: 
	for (ir=0; ir<parent.frames[5].tocTab.length; ir++) 
	{
	  toDisplay[ir] = parent.frames[5].tocTab[ir][0].split(".").length==1;
	}//fin del for  
	
	
	if (e) {
		ctrlKeyDown = (isIE) ? e.ctrlKey : (e.modifiers==2);
		if (tocChange && ctrlKeyDown) tocChange = 2;
	}

//	currentLevel = the level of the current heading:
	var currentNumArray = currentNumber.split(".");
	var currentLevel = currentNumArray.length-1;
       
// currentIndex = Current heading's index in the tocTab array:
// La posición [i][0] indica el elemento y el contenido del arreglo en este caso indica el contenido
// de la posición del menú: esto es 1, 1.1, 1.2..etc
// Current index indica el número del arreglo en el cual se encuetra actualmente en la navegación
        var currentIndex = null;
	for (i=0; i<parent.frames[5].tocTab.length; i++) {
		if (parent.frames[5].tocTab[i][0] == currentNumber) {
			currentIndex = i;
			break;
		}
	}
// If currentNumber was not found in tocTab: No action.
        if (currentIndex == null) return false;
	
	
// currentIsExpanded = Expand/Collaps-state of the current heading:
	if (currentIndex < parent.frames[5].tocTab.length-1) {
		nextLevel = parent.frames[5].tocTab[currentIndex+1][0].split(".").length-1;
		currentIsExpanded = nextLevel > currentLevel && toDisplay[currentIndex+1];
	} 
	else currentIsExpanded = false;

        
// Determining the new URL and target (if given) of the current heading
        theHref = (noLink) ? "" : parent.frames[5].tocTab[currentIndex][2];
	theTarget = parent.frames[5].tocTab[currentIndex][3];

// ***************************************
// 1st loop over the tocTab entries: Determining which heading to display:
// ***************************************
	for (i=1; i<parent.frames[5].tocTab.length; i++) {

// Nothing to do if the tocChange parameter is set to 0. If it is set to 1 or 2...
		if (tocChange) {
			thisNumber = parent.frames[5].tocTab[i][0];
			thisNumArray = thisNumber.split(".");
			thisLevel = thisNumArray.length-1;
// isOnPath = this heading is on the path to the current heading in the ToC hierarchy or a sibling of such a heading:
			isOnPath = true;
			if (thisLevel > 0) {
				for (j=0; j<thisLevel; j++) {
					isOnPath = (j>currentLevel) ? false : isOnPath && (thisNumArray[j] == currentNumArray[j]);
				}
			} 
// By the following, the headings on the path to the current heading and the siblings of such  headings (isOnPath==true, see above) will be displayed anyway. If the tocChange parameter is set to 1 no other heading will be displayed. If it is set to a number greater than 1 the headings that have been displayed before will additionally be displayed again.  
			toDisplay[i] = (tocChange == 1) ? isOnPath : (isOnPath || toDisplay[i]);

// Now let's perform the expand/collaps mechanism: If the heading is a descendant of the current heading it's next display depends on wether the current heading was expanded or collapsed. If it was expanded the descendants have not to be displayed this time, otherwise only the childs has to be displayed but not the grandchildren, great-grandchildren etc.. Remember that currentIsExpanded says wether the current heading was expanded or not. The if-clause is a criteria for being a descendant of the current heading. If it's a descendant and thisLevel == currentLevel+1 it's a child.
			if (thisNumber.indexOf(currentNumber+".")==0 && thisLevel > currentLevel) { 		
				if (currentIsExpanded) toDisplay[i] = false;
				else toDisplay[i] = (thisLevel == currentLevel+1); 
			}
		} 
	} // End of loop over the tocTab

// Initializing the ToC window's document and displaying the title on it's top. The ToC is performed by a HTML table:
	//toc.document.clear();
	//toc.document.write(
	//document.clear();
        //document.write(
        parent.frames[6].document.clear();
        parent.frames[6].document.write(
"<html>\n<head>\n<title>ToC</title>\n"+
"<style>\n"+
"A.small0 {font-family: " + fontLines +  "; font-size:" + sml + "em; color: " + normalColor + "; text-decoration:yes}\n"+
"A.midi0 {font-family: " + fontLines +  "; font-size:" + mdi + "em; font-weight:bold ; color: " + normalColor + "; text-decoration:yes}\n"+
//"A.small1 {font-family: " + fontLines +  "; font-size:" + sml + "em; color: " + currentColor + "; text-decoration:none}\n"+
"A.small1 {font-family: " + fontLines +  "; font-size:" + sml + "em; text-decoration:yes}\n"+
//"A.midi1 {font-family: " + fontLines +  "; font-size:" + mdi + "em; font-weight:bold; color: " + currentColor + "; text-decoration:none}\n"+
"A.midi1 {font-family: " + fontLines +  "; font-size:" + mdi + "em; font-weight:bold ; text-decoration:yes}\n"+
//"A.small2 {font-family: " + fontLines +  "; font-size:" + sml + "em; color: " + lastVisitColor + "; text-decoration:none}\n"+
"A.small2 {font-family: " + fontLines +  "; font-size:" + sml + "em; text-decoration:yes}\n"+
//"A.midi2 {font-family: " + fontLines +  "; font-size:" + mdi + "em; font-weight:bold; color: " + lastVisitColor + "; text-decoration:none}\n"+
"A.midi2 {font-family: " + fontLines +  "; font-size:" + mdi + "em; font-weight:bold ; text-decoration:yes}\n"+
"A.title {font-family: " + fontTitle + "; font-weight:bold; font-size:" + textSizes[0] + "em; color: " + titleColor + "; text-decoration:yes}\n"+
"</style>\n"+
//"<style fprolloverstyle>A:hover {color:" + rollOverColor +"}</style>\n"+
"</head>\n"+
"<body bgcolor=\"" + backColor + "\" background = "+ fondo +" topmargin = 0 leftmargin=5>\n<table border=0 cellspacing=0 cellpadding=0>\n");


// This is for defining the number of columns of the ToC table and the width of the last one. The first cells of each following row shall be empty or contain the heading symbol, the last ones are reserved for displaying the heding's text:
	for (k=0; k<nCols; k++) {
		//toc.document.write("<td height=1></td>");
		//document.write("<td height=1></td>");
		parent.frames[6].document.write("<td height=1></td>");
	}
	//toc.document.write("<td width=240 height=1></td></tr>");
	//document.write("<td width=240 height=1></td></tr>");
	parent.frames[6].document.write("<td width=240 height=1></td></tr>");

	//toc.document.write("</tr>");

// ***************************************
// 2nd loop over the tocTab entries: Displaying the headings:
// ***************************************
	var scrollY=0, addScroll=tocScroll; 
	for (i=1; i<parent.frames[5].tocTab.length; i++) {
		var img=null;
		if (parent.frames[5].tocTab[i][0] == "PROCESOS" || parent.frames[5].tocTab[i][0] == "TRANSACCIONES")
                {
                   titulo = true;	
                }
                
		if (toDisplay[i]) {
			thisNumber = parent.frames[5].tocTab[i][0];
			thisNumArray = thisNumber.split(".");
			thisLevel = thisNumArray.length-1;
			isCurrent = (i == currentIndex);

// Setting the heading's symbol depending on whether this heading is expanded or not or if it is a leaf. It is expanded if the next heading has a greater level than this one AND has to be displayed: 
			if (i < parent.frames[5].tocTab.length-1) {
				nextLevel = parent.frames[5].tocTab[i+1][0].split(".").length-1;
				if (!titulo)
				 img = (thisLevel >= nextLevel) ? hoja : ((toDisplay[i+1]) ? menos : mas);
			} 
			else img = hoja; // The last heading is always a leaf.
				

// If the scoll parameter is set true than increment the scrollY value:
			if (addScroll) scrollY+=((thisLevel<2)?mdi:sml)*25;
			if (isCurrent) addScroll=false;

// thisClass = the style class of this heading
			if (noLink)
				classSuffix = (thisNumber==oldCurrentNumber) ? "1":((thisNumber==oldLastVisitNumber) ? "2":"0");
			else classSuffix = (thisNumber==currentNumber) ? "1":((thisNumber==oldCurrentNumber) ? "2":"0");
			thisClass = ((thisLevel<=mLevel)?"midi":"small") + classSuffix;

// Now writing this ToC line, i.e. a table row...:	
                        //toc.document.writeln("<tr>");
                        //document.writeln("<tr>");
                        parent.frames[6].document.writeln("<tr>");

// ...first some empty cells for the line indent depending on the level of this heading...:
			for (k=1; k<=thisLevel; k++) {
				//toc.document.writeln("<td>&nbsp;</td>");
				//document.writeln("<td>&nbsp;</td>");
				parent.frames[6].document.writeln("<td>&nbsp;</td>");
			}

// ...then the hading symbol and the heading text each with a javaScript link caling just this function reDisplay again: 
           if (img == mas || img == menos)
		   {
		     //toc.document.writeln("<td valign=top><a href=\"javaScript:history.go(0)\" onMouseDown=\"parent.reDisplay('" + thisNumber + "'," + tocBehaviour[0] + "," + tocLinks[0] + ",event)\"><img src=\"" + img + ".gif\" width=13 height=12 border=0></a></td> <td colspan=" + (nCols-thisLevel) + "><a href=\"javaScript:history.go(0)\" onMouseDown=\"parent.reDisplay('" + thisNumber + "'," + tocBehaviour[0] + "," + tocLinks[1] + ",event)\" class=title> " + ((showNumbers)?(thisNumber+" "):"") + tocTab[i][1] + "</font></td></tr>"); 
		     //document.writeln("<td valign=top><a href=\"javaScript:history.go(0)\" onMouseDown=\"window.reDisplay('" + thisNumber + "'," + tocBehaviour[0] + "," + tocLinks[0] + ",event)\"><img src=\"" + img + ".gif\" width=13 height=12 border=0></a></td> <td colspan=" + (nCols-thisLevel) + "><a href=\"javaScript:history.go(0)\" onMouseDown=\"window.reDisplay('" + thisNumber + "'," + tocBehaviour[0] + "," + tocLinks[1] + ",event)\" class=title> " + ((showNumbers)?(thisNumber+" "):"") + parent.frames[5].tocTab[i][1] + "</font></td></tr>"); 
		     parent.frames[6].document.writeln("<td valign=top><a href=\"javaScript:history.go(0)\" onMouseDown=\"parent.frames[5].reDisplay('" + thisNumber + "'," + tocBehaviour[1] + "," + tocLinks[0] + ",event)\"><img src=\"" + img + ".gif\" width=13 height=12 border=0></a></td> <td colspan=" + (nCols-thisLevel) + "><a href=\"javaScript:history.go(0)\" onMouseDown=\"parent.frames[5].reDisplay('" + thisNumber + "'," + tocBehaviour[0] + "," + tocLinks[1] + ",event)\" class=\"link_noStyle\"> " + ((showNumbers)?(thisNumber+" "):"") + parent.frames[5].tocTab[i][1] + "</font></td></tr>"); 
		   }
		   else
		   {
		      //en el caso de ser un título no tiene imágenes
		      if (img == null)
		      {
		      	 parent.frames[6].document.writeln("<td height=5 valign=top></td><td colspan=" + (nCols-thisLevel) + "></td></tr>");
		      	 parent.frames[6].document.writeln("<td valign=top></td><td colspan=" + (nCols-thisLevel) + "><font size=1><b>"+ parent.frames[5].tocTab[i][1] + "</b></font></td></tr>");
		      }
		      else
		      {		      	
		 	 //toc.document.writeln("<td valign=top><a href=\"javaScript:history.go(0)\" onMouseDown=\"parent.reDisplay('" + thisNumber + "'," + tocBehaviour[0] + "," + tocLinks[0] + ",event)\"><img src=\"" + img + ".gif\" width=13 height=12 border=0></a></td> <td colspan=" + (nCols-thisLevel) + "><a href=\"javaScript:history.go(0)\" onMouseDown=\"parent.reDisplay('" + thisNumber + "'," + tocBehaviour[0] + "," + tocLinks[1] + ",event)\" class=" + thisClass + "> " + ((showNumbers)?(thisNumber+" "):"") + tocTab[i][1] + "</a></td></tr>");
		 	 //document.writeln("<td valign=top><a href=\"javaScript:history.go(0)\" onMouseDown=\"window.reDisplay('" + thisNumber + "'," + tocBehaviour[0] + "," + tocLinks[0] + ",event)\"><img src=\"" + img + ".gif\" width=13 height=12 border=0></a></td> <td colspan=" + (nCols-thisLevel) + "><a href=\"javaScript:history.go(0)\" onMouseDown=\"window.reDisplay('" + thisNumber + "'," + tocBehaviour[0] + "," + tocLinks[1] + ",event)\" class=" + thisClass + "> " + ((showNumbers)?(thisNumber+" "):"") + parent.frames[5].tocTab[i][1] + "</a></td></tr>");
		 	 parent.frames[6].document.writeln("<td valign=top><a href=\"javaScript:history.go(0)\" onMouseDown=\"parent.frames[5].reDisplay('" + thisNumber + "'," + tocBehaviour[1] + "," + tocLinks[0] + ",event)\"><img src=\"" + img + ".gif\" width=13 height=12 border=0></a></td> <td colspan=" + (nCols-thisLevel) + "><a href=\"javaScript:history.go(0)\" onMouseDown=\"parent.frames[5].reDisplay('" + thisNumber + "'," + tocBehaviour[0] + "," + tocLinks[1] + ",event)\" class=" + thisClass + "> " + ((showNumbers)?(thisNumber+" "):"") + parent.frames[5].tocTab[i][1] + "</a></td></tr>");
		      }	 
		   }
		}
	titulo=false;
	} // End of loop over the tocTab

// ***************************************
// Closing the ToC document, scrolling its frame window and displaying new content in the content frame or in the top window if required 
// ***************************************

// Updating the global variables oldCurrentNumber and oldLastVisitNumber. See above for its definition
	if (!noLink) { 
		oldLastVisitNumber = oldCurrentNumber;
		oldCurrentNumber = currentNumber;
	}

// Closing the ToC table and the document
	//toc.document.writeln("</table>\n</body></html>");
	//toc.document.close();
	//document.writeln("</table>\n</body></html>");
	//document.close();
	parent.frames[6].document.writeln("</table>\n</body></html>");
	parent.frames[6].document.close();

// Scrolling the ToC if required
	//if (tocScroll) toc.scroll(0,scrollY);
	if (tocScroll) this.scroll(0,scrollY);
	
// Setting the top or content window's location if required
    newRef = "parent.frames[5]."+theHref;
    if (theHref) 
	    if (theTarget=="top") top.location.href = theHref;
		else if (theTarget=="parent") parent.location.href = theHref;
		//else if (theTarget=="blank") open(theHref,"");
		else if (theTarget=="content") content.location.href = theHref;
		//else window.open(theHref, target="_blank","toolbar=no,status=yes,resizable=no"); 
		else eval(newRef);
		
}