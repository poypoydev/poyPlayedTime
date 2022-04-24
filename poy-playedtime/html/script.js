window.addEventListener('message', function(event) {
    var data = event.data;
    console.log(data.type)
    if (data.type == 'normal') {
        $('.maintext').html('Sunucuya Tekrardan Hoşgeldin! <br> Sunucuda Geçirdiğin Süre: <br> '+data.saat+' Saat  ve '+data.dakika+' Dakika. İyi Roller!')
        $('.maincon').fadeIn();
        setTimeout(fadeou2t, 5000);
    } 
});


function fadeou2t() {
    $('.maincon').fadeOut();
}