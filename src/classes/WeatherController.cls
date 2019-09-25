public with sharing class WeatherController {

	private static String apiURL = 'http://api.openweathermap.org/data/2.5/';
	private static String apiKey = '74f59df5e1bdd6382eac4f5b4abf5933';
	private static String pathCurrentWeather = 'weather?appid=' + apiKey + '&units=metric&q=';

	private static String getCalloutResponseContents(String url) {
		Http h = new Http();

		HttpRequest req = new HttpRequest();
		req.setEndpoint(url);
		req.setMethod('GET');

		HttpResponse res = h.send(req);
		if (res.getStatusCode() == 200) {
			return res.getBody();
		} else {
			return null;
		}

	}

	@AuraEnabled
	public static String currentWeather(String city) {
		return WeatherController.getCalloutResponseContents(apiURL + pathCurrentWeather + city);
	}

}