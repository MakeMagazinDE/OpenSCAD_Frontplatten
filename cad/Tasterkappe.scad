//OpenSCAD-Skript

//Moduldefinition mit Parametern
module rahmen (
//Parameter
rim=2,hght=6,leno=5.7,ctl=3.1,ctw=2.1
)
//Beginn Modul
{
difference(){   //difference 1
union(){        //union 1
difference(){   //difference 2
union(){        //union 2
    //alles, was vor der nächsten geschweiften Klammer steht, wird zusammengefügt (union 2)

//Rahmenkörper
translate([-leno/2,-leno/2,0]) cube([leno,leno,hght]);
translate([-leno/2+0.2,-leno/2+0.2,hght]) cube([leno-0.4,leno-0.4,0.3]);
//Rand
translate([-leno/2-rim/2,-leno/2-rim/2,0]) cube([leno+rim,leno+rim,1.2]);
}               //union 2 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird davon abgezogen (difference 2)
//Ausschnitt
translate([-ctl/2,-ctw/2,-0.1]) cube([ctl,ctw,3.5]);
//Führung
translate([leno/2,-1,-0.1]) cube([2,2,hght]);
rotate([0,0,180]) translate([leno/2,-1,-0.1]) cube([2,2,hght]);
}  //difference 2 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird dazu hinzugefügt (union 1)


}               //union 1 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird davon wieder abgezogen (difference 1)

}               //difference 1 end

}  //module end


//Hier werden Instanzen des Moduls aufgerufen
translate([0,0,0]) rahmen();

