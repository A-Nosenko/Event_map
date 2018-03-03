google.maps.event.addDomListener(window, "load", initMap);

const markers = JSON.parse((document.getElementById('markers').innerText.slice(1, -1)).replace(/\n/g, ""));

function initMap() {

    var myOptions = {
        zoom: 12,
        center: new google.maps.LatLng(49.994336, 36.2655652),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }

    const map = new google.maps.Map(document.getElementById("map"), myOptions);

    for (let title in markers) {
        createMarker(map, title);
    }

}

function createMarker(map, title) {

    const marker = new google.maps.Marker({
        icon: 'resources/images/marker.gif',
        map: map,
        position: {
            "lat": parseFloat(markers[title].lat),
            "lng": parseFloat(markers[title].lng)
        },
        title: title,
        animation: google.maps.Animation.DROP
    })

    infoWindow(map, marker, title);
}

function infoWindow(map, marker, title, address = "Adress", url = "/comments?noteId=" + markers[title].id) {
    google.maps.event.addListener(marker, 'click', () = > {
        const html = "<div><h3>" + title + "</h3><p>" + address + "<br></div><a href='" + url + "'>Event view</a></p></div>";

    const iw = new google.maps.InfoWindow({
        content: html,
        maxWidth: 350
    });

    iw.open(map, marker);
}
)
;
}