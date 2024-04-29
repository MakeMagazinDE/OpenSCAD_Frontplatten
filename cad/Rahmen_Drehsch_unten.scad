//OpenSCAD-Skript

//Moduldefinition mit Parametern
module rahmen (
//Platte
leno=25,        //Länge u. Breite Platte
hght=2,         //Dicke der Platte
blthgh=6.5,     //Höhe der Baugruppe
dsh=5,          //Durchmesser der Träger
//Schrauben zur Front
FSdst=10.6,     //Schraubenabstand Frontschrauben
dsh1=2.2,       //Schaftdurchmesser
dsh2=1.8,       //Bohrung f. selbstschneidende Schrauben
//Drehschalter
RSWdia=9.5,     //Schaftdurchmesser Drehschalter
RSWdist=9.4,    //Mittenabstand Pin
RSWpin=3.5      //Durchmesser Pin)
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
//Halterungen Schrauben
translate([-leno/2,-leno/2,0])  cylinder(d=dsh,h=blthgh,$fn=16);
translate([-leno/2,+leno/2,0])  cylinder(d=dsh,h=blthgh,$fn=16);
translate([+leno/2,-leno/2,0])  cylinder(d=dsh,h=blthgh,$fn=16);
translate([+leno/2,+leno/2,0])  cylinder(d=dsh,h=blthgh,$fn=16);
   
}               //union 2 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird davon abgezogen (difference 2)
//Mittenbohrung Welle
translate([0,0,-0.1]) cylinder(d=RSWdia,h=20,$fn=16);
//Schraubenlöcher Front
translate([-FSdst/2,-FSdst/2,-0.1])  cylinder(d=dsh2,h=blthgh,$fn=16);
translate([-FSdst/2,+FSdst/2,-0.1])  cylinder(d=dsh2,h=blthgh,$fn=16);
translate([+FSdst/2,-FSdst/2,-0.1])  cylinder(d=dsh2,h=blthgh,$fn=16);
translate([+FSdst/2,+FSdst/2,-0.1])  cylinder(d=dsh2,h=blthgh,$fn=16);
//Bohrungen Schrauben
translate([-leno/2,-leno/2,-0.1])  cylinder(d=dsh2,h=2*blthgh,$fn=16);
translate([-leno/2,+leno/2,-0.1])  cylinder(d=dsh2,h=2*blthgh,$fn=16);
translate([+leno/2,-leno/2,-0.1])  cylinder(d=dsh2,h=2*blthgh,$fn=16);
translate([+leno/2,+leno/2,-0.1])  cylinder(d=dsh2,h=2*blthgh,$fn=16);

}  //difference 2 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird dazu hinzugefügt (union 1)


}               //union 1 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird davon wieder abgezogen (difference 1)

}               //difference 1 end

}  //module end

//.......................................................

module platte (
//Parameter
//Platte
leno=25,        //Länge u. Breite Platte
hght=2,         //Dicke der Platte
blthgh=6.5,     //Höhe der Baugruppe
dsh=6,          //Durchmesser der Träger
//Schrauben zur Front
dist=11,        //Schraubenabstand Frontschrauben
dsh1=2.2,       //Schaftdurchmesser
dsh2=1.8,       //Bohrung f. selbstschneidende Schrauben
//Drehschalter
RSWdia=9.5,     //Schaftdurchmesser Drehschalter
RSWdist=9.4,    //Mittenabstand Pin
RSWpin=3.5      //Durchmesser Pin)
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
//Halterungen Schrauben
translate([-leno/2,-leno/2,0])  cylinder(d=dsh,h=hght,$fn=16);
translate([-leno/2,+leno/2,0])  cylinder(d=dsh,h=hght,$fn=16);
translate([+leno/2,-leno/2,0])  cylinder(d=dsh,h=hght,$fn=16);
translate([+leno/2,+leno/2,0])  cylinder(d=dsh,h=hght,$fn=16);
   
}               //union 2 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird davon abgezogen (difference 2)
//Mittenbohrung Welle
translate([0,0,-0.1]) cylinder(d=RSWdia,h=20,$fn=16);
//Fixierung Schalter
translate([0,-RSWdist,-0.1])  cylinder(d=RSWpin,h=blthgh,$fn=16);

//Bohrungen Schrauben
translate([-leno/2,-leno/2,-0.1])  cylinder(d=dsh1,h=2*blthgh,$fn=16);
translate([-leno/2,+leno/2,-0.1])  cylinder(d=dsh1,h=2*blthgh,$fn=16);
translate([+leno/2,-leno/2,-0.1])  cylinder(d=dsh1,h=2*blthgh,$fn=16);
translate([+leno/2,+leno/2,-0.1])  cylinder(d=dsh1,h=2*blthgh,$fn=16);

}  //difference 2 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird dazu hinzugefügt (union 1)


}               //union 1 end
    //alles, was vor der nächsten geschweiften Klammer steht, wird davon wieder abgezogen (difference 1)

}               //difference 1 end

}  //module end


//Hier werden Instanzen des Moduls aufgerufen
translate([-17,0,0]) rahmen();
translate([17,0,0]) platte();

