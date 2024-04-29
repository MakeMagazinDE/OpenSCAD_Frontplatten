//OpenSCAD-Skript

//Moduldefinition mit Parametern für Frontplattensystem im 19mm-Raster
module PotiKnopf (
//Parameter
diami=6.45,   //Wellendurchmesser Poti
diama=20,    //Außendurchmesser Knopf
diams=2.5,   //Klemmschraubendurchmesser 
hght=12,     //Höhe Knopf
hghti=10,  //Höhe Indikator
wdthi=1      //Breite Indikator
)
//Beginn Modul
{
difference(){   //difference 1
union(){        //union 1
difference(){   //difference 2
union(){        //union 2
    //alles, was vor der nächsten geschweiften Klammer steht, wird zusammengefügt (union 2)
//Körper des Frontplattensegments
cylinder(d=diama,h=hght-1.3,$fn=128);
translate([0,0,hght-1.3]) cylinder(d1=diama,d2=diama-2,h=1.3,$fn=128);
 
//Indikator
translate([-wdthi/2,0,0]) cube([wdthi,diama/2-0.1,hghti]);

}               //union 2 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird davon abgezogen (difference 2)
//Anschrägung Indikator
translate([-wdthi,diama/2,hght-1]) rotate([40,0,0]) cube([2*wdthi,5,5]);
//Bohrung Klemmschraube M3
rotate([90,0,0]) translate([0,hght/2,0]) cylinder(d=diams,h=15,$fn=32);
//Bohrung Achse
translate([0,0,-0.05]) cylinder(d=diami,h=hght-3,$fn=16);
translate([0,0,hght-3-0.1]) cylinder(d1=diami,d2=0,h=2,$fn=16);
}  //difference 2 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird dazu hinzugefügt (union 1)

}               //union 1 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird davon wieder abgezogen (difference 1)

}               //difference 1 end

}  //module end

//Hier werden Instanzen des Moduls aufgerufen
translate([0,0,0]) PotiKnopf();

