window.addEventListener('message', function(event) {
  switch (event["data"]["action"]){
		case "show":
      requestInfos()
			$(".container").css("display","block");
		break;
	}
})

const requestInfos = () => {
	$.post("https://PauseMenu/requestInfos",JSON.stringify({}),(data) => {
    $("#name").html(`${(data["name"])}`);
    $("#user_id").html(`${(data["user_id"])}`);
    $("#players").html(`${(data["players"])}`);
    $("#time").html(`${(data["time"])}`);
    $("#cellphone").html(`${(data["cellphone"])}`);
    $("#group").html(`${(data["group"])}`);
    $("#bank").html(`${(data["bank"])}`);
	});
}

$(function(){
  $('#init').click(function(){
    console.log("Em breve")
  })
  $('#settings').click(function(){
    $.post('https://PauseMenu/SendAction', JSON.stringify({action: 'settings'}));
    CloseAll()
  })
  $('#map').click(function(){
    $.post('https://PauseMenu/SendAction', JSON.stringify({action: 'map'}));
    CloseAll()
  })
  // $('#report').click(function(){
  //   console.log("Em breve")
  // })
  $('#exit').click(function(){
		$.post('https://PauseMenu/SendAction', JSON.stringify({action: 'exit'}));
      CloseAll()
  })

  $('#store').click(function(){
      window.invokeNative('openUrl', 'https://loja.actionrp.gg/')
  })
  $('#discord').click(function(){
      window.invokeNative('openUrl', 'https://discord.gg/actionrps')
  })
  $('#intagram').click(function(){
    window.invokeNative('openUrl', 'https://instagram.com/actionrps')
  })
  $('#tiktok').click(function(){
    window.invokeNative('openUrl', 'https://tiktok.com/@actionrps')
  })
  $('#youtube').click(function(){
    window.invokeNative('openUrl', 'https://youtube.com/actionrps')
  })
})

function CloseAll(){
  $('.container').css("display","none");
  $.post('https://PauseMenu/exit', JSON.stringify({}));
}

document.addEventListener("keydown",event => {
  if (event["key"] === "Escape"){
    CloseAll()
  }
});