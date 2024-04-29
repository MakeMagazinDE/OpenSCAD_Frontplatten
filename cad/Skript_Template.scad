//OpenSCAD-Skript

//Moduldefinition mit Parametern für Frontplattensystem im 19mm-Raster
module modname (
//Parameter
param1=1,        
param2=42,
)
//Beginn Modul
{
difference(){   //difference 1
union(){        //union 1
difference(){   //difference 2
union(){        //union 2
    //alles, was vor der nächsten geschweiften Klammer steht, wird zusammengefügt (union 2)


}               //union 2 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird davon abgezogen (difference 2)


/*
translate([xwert*segment/2,ywert*segment/2-3,-0.1])  cylinder(d=LEDdia, h=10, $fn=32);
*/


}  //difference 2 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird dazu hinzugefügt (union 1)


}               //union 1 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird davon wieder abgezogen (difference 1)

}               //difference 1 end

}  //module end

//Hier werden Instanzen des Moduls aufgerufen
translate([0,0,0]) modname();

