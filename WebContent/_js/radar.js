var list = new Array;// [ "1", "1", "1", "1", "1", "1", "1", "1", "1" ];
var listTexte = [ "Accueil", "Locaux", "Materiel", "Objectif", "Doc", "Groupe",
 "Progression", "Conaissance", "Animation", "Blabla", "FloVal","Adeline","Nicolas" ];



var echelleNote = 5;

var coteNb = listTexte.length;

var canevas = document.getElementById("zone");
var contexte = canevas.getContext("2d");

// initialize with defaults
//$("#input-id").rating();
// with plugin options
//$("#input-id").rating(['min'=>1, 'max'=>10, 'step'=>2, 'size'=>'lg']);
$(document).ready(function() {

	
	for (var j = 0; j < listTexte.length; j += 1) {

		list.slice("1");
	}

	RemplirText();
	Formulaire();

});

var longueur = 100;
var X0 = canevas.width / 2;
var Y0 = canevas.height / 2;

ToutTracer();

function RemplirText() {
	var str = " ";
	var str2 = " ";
	for (var i = 0; i < listTexte.length; i += 1) {
		if(i<listTexte.length/2){
		str +='<label for="' + listTexte[i] + '" > '+listTexte[i] +'<label/>';
		str+='<input id="'+ listTexte[i] +'" type="number" class="rating" min=0 max=echelleNote step=1 data-size="xs" data-rtl="false">';
		}else{
			str2 +='<label for="' + listTexte[i] + '" > '+listTexte[i] +'<label/>';
			str2+='<input id="'+ listTexte[i] +'" type="number" class="rating" min=0 max=echelleNote step=1 data-size="xs" data-rtl="false">';
			
		}
		
		//		str += '<select class="FloTest" id='
//				+ listTexte[i] + '></select> <br />';
	}

	$("#everything").html(str);
	$("#everything2").html(str2);
	$(".rating").rating('refresh');

};

$(".changeWatch").change(function() {
	for (var i = 0; i < listTexte.length; i += 1) {
		list[i] = $('#' + listTexte[i] + '').val();
	}
	ToutTracer();
});

function Formulaire() {
	var strLi = '	';

	for (var i = 1; i < echelleNote + 1; i += 1) {
		strLi += '<option value=" ' + i + ' ">' + i + '</option>';
	}

	for (var i = 0; i < listTexte.length; i += 1) {
		$('#' + listTexte[i] + ' ').html(strLi);
	}
};

function ToutTracer() {
	contexte.clearRect(0, 0, canevas.width, canevas.height);
	contexte.strokeStyle = "#D15600";

	contexte.beginPath();

	Axis();
	Graduation();
	Notes();

	contexte.fillStyle = "#FFFFE0";
	contexte.fill();
	contexte.stroke();
};

function Axis() {
	var Xtemp;
	var Ytemp;
	var str1 = '';

	for (var i = 0; i <= coteNb; i += 1) {
		Xtemp = longueur * Math.cos(i * 2 * Math.PI / coteNb);
		Ytemp = longueur * Math.sin(i * 2 * Math.PI / coteNb);
		contexte.lineTo(X0 + Xtemp, Y0 + Ytemp);
		contexte.moveTo(X0, Y0);

		contexte.fillStyle = 'blue';
		if (i < coteNb) {
			str1 = listTexte[i];
			if (   (i * 2 / coteNb)>=0.5 && (i * 2 / coteNb)<=1.5  ) {
				contexte.fillText(str1, X0 + Xtemp * 1.2 - (str1.length*4), Y0 + Ytemp * 1.2);
			} else {
				contexte.fillText(str1, X0 + Xtemp * 1.2, Y0 + Ytemp * 1.2);
			}
		}
	}

};

function Notes() {

	contexte.moveTo(X0 + longueur * (list[0] / echelleNote)
			* Math.cos(0 * 2 * Math.PI / coteNb), Y0 + longueur
			* (list[0] / echelleNote) * Math.sin(0 * 2 * Math.PI / coteNb));

	for (var i = 1; i < list.length; i += 1) {
		contexte.lineTo(X0 + longueur * (list[i] / echelleNote)
				* Math.cos(i * 2 * Math.PI / coteNb), Y0 + longueur
				* (list[i] / echelleNote) * Math.sin(i * 2 * Math.PI / coteNb));
	}
	contexte.closePath();
};

function Graduation() {

	for (var i = 0; i < coteNb; i += 1) {
		for (var j = 1; j < echelleNote + 1; j += 1) {

			contexte.moveTo(X0
					+ longueur
					* (j / echelleNote)
					* Math.cos((i * 2 * Math.PI / coteNb)
							- (Math.PI / (20 + 6 * j))), Y0
					+ longueur
					* (j / echelleNote)
					* Math.sin((i * 2 * Math.PI / coteNb)
							- (Math.PI / (20 + 6 * j))));

			contexte.lineTo(X0
					+ longueur
					* (j / echelleNote)
					* Math.cos((i * 2 * Math.PI / coteNb)
							+ (Math.PI / (20 + 6 * j))), Y0
					+ longueur
					* (j / echelleNote)
					* Math.sin((i * 2 * Math.PI / coteNb)
							+ (Math.PI / (20 + 6 * j))));
		}
	}
};

