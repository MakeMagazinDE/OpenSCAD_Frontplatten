//OpenSCAD-Skript

//Moduldefinition mit Parametern
module rahmen (
//Parameter
dsh2=1.8,hght=1.4,dist=44,leno=48.6,wdth=37,
lngthi=39.7,hghti=4.5,retr=0.5,disti=37.7,
//Schneidschrauben 2mmx6mm
skd2=3.6,       //Schraubenkopfdurchmesser 2mm-Schraube
skh2=1.3,       //Schraubenkopfhöhe 2mm-Schraube
dsh2=1.8,       //Schaftdurchmesser 2mm-Schraube
dvst2=4.4,      //Verstärkung für 2mm-Schraube
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
//Innenrahmen
translate([60-lngthi/2,-lngthi/2,0]) cube([lngthi,lngthi,hghti]);
}               //union 2 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird davon abgezogen (difference 2)
//Ausschnitt
translate([-wdth/2,-wdth/2,-0.1]) cube([wdth,wdth,3*hght]);
//Bohrungen Schrauben
translate([-dist/2,-dist/2,-0.1])  cylinder(d=dsh2,h=10,$fn=16);
translate([-dist/2,+dist/2,-0.1])  cylinder(d=dsh2,h=10,$fn=16);
translate([-dist/2,0,-0.1])  cylinder(d=dsh2,h=10,$fn=16);
translate([0,+dist/2,-0.1])  cylinder(d=dsh2,h=10,$fn=16);
translate([+dist/2,-dist/2,-0.1])  cylinder(d=dsh2,h=10,$fn=16);
translate([+dist/2,+dist/2,-0.1])  cylinder(d=dsh2,h=10,$fn=16);
translate([+dist/2,0,-0.1])  cylinder(d=dsh2,h=10,$fn=16);
translate([0,-dist/2,-0.1])  cylinder(d=dsh2,h=10,$fn=16);
//Bohrungen Schraubenköpfe
translate([-dist/2,-dist/2,0.6])  cylinder(d=skd2,h=10,$fn=16);
translate([-dist/2,+dist/2,0.6])  cylinder(d=skd2,h=10,$fn=16);
translate([-dist/2,0,0.6])  cylinder(d=skd2,h=10,$fn=16);
translate([0,+dist/2,0.6])  cylinder(d=skd2,h=10,$fn=16);
translate([+dist/2,-dist/2,0.6])  cylinder(d=skd2,h=10,$fn=16);
translate([+dist/2,+dist/2,0.6])  cylinder(d=skd2,h=10,$fn=16);
translate([+dist/2,0,0.6])  cylinder(d=skd2,h=10,$fn=16);
translate([0,-dist/2,0.6])  cylinder(d=skd2,h=10,$fn=16);

//Ausschnitte Innenrahmen
translate([60-lngthi/2+retr/2,-lngthi/2+retr/2,hghti-retr]) cube([lngthi-retr,lngthi-retr,2*hghti]);
translate([60-lngthi/2+2*retr,-lngthi/2+2*retr,-0.1]) cube([lngthi-4*retr,lngthi-4*retr,2*hghti]);
}  //difference 2 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird dazu hinzugefügt (union 1)


}               //union 1 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird davon wieder abgezogen (difference 1)

}               //difference 1 end

}  //module end


//Hier werden Instanzen des Moduls aufgerufen
translate([0,0,0]) rahmen();

