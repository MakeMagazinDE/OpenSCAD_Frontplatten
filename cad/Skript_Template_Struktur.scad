//OpenSCAD-Skript
//Moduldefinition mit Parametern (Beispiel Kabelschelle)
module modname (
//Parameter
dia1=10, dia2=3, hght=11.8, dia3=8.1
)
//Beginn Modul
{
difference(){   //difference 1
union(){        //union 1
difference(){   //difference 2
union(){        //union 2
    // (union 2) Alles vor nächster } zusammenfügen
//Body
translate([-dia1/2-dia3/2,0,0])
cylinder(d=dia1,h=hght,$fn=32);
translate([dia1/2+dia3/2,0,0])
cylinder(d=dia1,h=hght,$fn=32);
translate([-dia1/2-dia3/2,-dia1/2,0])
cube([dia3+dia1,dia1,hght]);
}//union 2 end
    // (difference 2) Alles vor nächster } abziehen
translate([-dia1/2-4,0,0.1])
cylinder(d=dia2,h=2*hght,$fn=32);
translate([dia1/2+4,0,0.1])
cylinder(d=dia2,h=2*hght,$fn=32);
translate([-dia3/2,-dia1/2-0.1,dia3])
cube([dia3,dia1+0.2,hght]);
translate([0,-dia1/2-0.1,dia3])
rotate([-90,0,0])
cylinder(d=dia3,h=hght, $fn=32);
}//difference 2 end
    // (union 1) Alles vor nächster } zusammenfügen
    // ...
}// union 1 end
    //(difference 1) Alles vor nächster } abziehen
    // ...

}//difference 1 end

}//module end

//Hier werden Instanzen des Moduls aufgerufen
translate([0,0,0]) modname();