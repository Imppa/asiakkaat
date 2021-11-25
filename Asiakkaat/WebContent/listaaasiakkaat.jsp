<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>

.Haku{
text-align: center;
height:175%;

}

.kentta{
text-align: left;
width: 75px;

}

.block{
width:75px;
}


</style>
</head>
<body>
<table id="listaus">
		<thead>
			<tr style="outline: thin solid">
				<th class="Haku" colspan="2">Hakusana:</th>
				<th colspan="1"><input type="text" id="hakusana"></th>
				<th><input type="button" class="block" value="Hae" id="hakunappi"></th>
			</tr>
			<tr>
				<th class="kentta">Etunimi</th>
				<th class="kentta">Sukunimi</th>
				<th class="kentta">Puhelin</th>
				<th class="kentta">Sposti</th>
			</tr>
		</thead>
		<tbody>
		</tbody>	
</table>
<script>
$(document).ready(function() {

	haeAsiakkaat();
	$("#hakunappi").click(function(){
		haeAsiakkaat();
	});
	$(document.body).on("keydown", function(event){
		if(event.which==13) { //Kirjaimet lajiteltu numeroittain, 13=Enter
			haeAsiakkaat();
		}
	});
	$("#hakusana").focus();//Kursori oikeaan paikkaan
});

function haeAsiakkaat(){
	$("#listaus tbody").empty();
	$.ajax({
		url:"asiakkaat/"+$("#hakusana").val(), 
		type:"GET", 
		dataType:"json", 
		success:function(result) {
		$.each(result.asiakkaat, function(i, field) {
			var htmlStr;
			htmlStr+="<tr>";
			htmlStr+="<td>"+field.etunimi+"</td>";
			htmlStr+="<td>"+field.sukunimi+"</td>";
			htmlStr+="<td>"+field.puhelin+"</td>";
			htmlStr+="<td>"+field.sposti+"</td>";
			htmlStr+="</tr>";
			$("#listaus tbody").append(htmlStr);
		});
	}});		
}



</script>
</body>
</html>