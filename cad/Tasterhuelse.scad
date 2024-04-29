//OpenSCAD-Skript

//Moduldefinition mit Parametern
module rahmen (
//Parameter
rimh=1.5,hght=6,leni=6,leno=13,swl=8.1,swh=4.1,balken=5
)
//Beginn Modul
{
difference(){   //difference 1
union(){        //union 1
difference(){   //difference 2
union(){        //union 2
    //alles, was vor der nächsten geschweiften Klammer steht, wird zusammengefügt (union 2)

//Rahmenkörper
translate([-leno/2+0.15,-leno/2+0.15,0]) cube([leno-0.3,leno-0.3,rimh]);
translate([-leno/2,-leno/2,0.3]) cube([leno,leno,rimh]);
//Hülse
translate([-leno/2+1,-leno/2+1,rimh+0.3]) cube([leno-2,leno-2,swh+swl]);
translate([-balken/2,-leno/2+0.2,rimh+0.3]) cube([balken,(leno-leni)/2-0.8,swh+swl+3]);
rotate([0,0,180]) translate([-balken/2,-leno/2+0.2,rimh+0.3]) cube([balken,(leno-leni)/2-0.8,swh+swl+3]);
}               //union 2 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird davon abgezogen (difference 2)
//Ausschnitt
translate([-leni/2,-leni/2,-0.1]) cube([leni,leni,2*rimh]);
//Ausschnitt Hülse
translate([-leno/2+3,-leno/2+3,rimh+0.3]) cube([leno-6,leno-6,2*rimh]);
//Ausschnitt Schalter
translate([-swl/2,-swl/2,rimh]) cube([swl,swl,20]);
//Befestigung Schalter
rotate([90,0,0]) translate([0,swh+swl+rimh,-20]) cylinder(d=1.8, h=50,$fn=16);
}  //difference 2 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird dazu hinzugefügt (union 1)
//Führung
translate([leni/2,-0.9,rimh]) cube([1.8,1.8,swh]);
rotate([0,0,180]) translate([leni/2,-0.9,rimh]) cube([1.8,1.8,swh]);

}               //union 1 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird davon wieder abgezogen (difference 1)

}               //difference 1 end

}  //module end


//Hier werden Instanzen des Moduls aufgerufen
translate([0,0,0]) rahmen();

