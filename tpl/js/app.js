function getCookie(name) {
	var matches = document.cookie.match(new RegExp(
		"(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
	));
	return matches ? decodeURIComponent(matches[1]) : undefined;
}
function setCookie(name, value, options) {
	options = options || {};

	var expires = options.expires;

	if (typeof expires == "number" && expires) {
		var d = new Date();
		d.setTime(d.getTime() + expires * 1000);
		expires = options.expires = d;
	}
	if (expires && expires.toUTCString) {
		options.expires = expires.toUTCString();
	}

	value = encodeURIComponent(value);

	var updatedCookie = name + "=" + value;

	for (var propName in options) {
		updatedCookie += "; " + propName;
		var propValue = options[propName];
		if (propValue !== true) {
			updatedCookie += "=" + propValue;
		}
	}

	document.cookie = updatedCookie;
}
function deleteCookie(name) {
	setCookie(name, "", {
		expires: -1
	})
}
function checkTimezone() {
	if(!getCookie('mitrastroi_timezone')) {
		$.ajax({
			url: 'https://geoip.nekudo.com/api/'
		}).done(
			function (response) {
				if (response && response.location && response.location.time_zone) {
					setCookie('mitrastroi_timezone', response.location.time_zone, {expires: 60*60*24})
				}
			}
		)
	}
}