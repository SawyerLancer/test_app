class Weather {

   // Географическое положение города, долгота
   double coord_lon;

   // Географическое положение города, широта
   double coord_lat;

   // Идентификатор погодных условий
   int weather_id;

   // Группа погодных параметров (Дождь, Снег, Экстрим и др.)
   String weather_main;

   // Погодные условия в группе ( описание )
   String weather_description;

   // конструктор класса
   Weather({this.coord_lon,this.coord_lat,this.weather_id,
            this.weather_main,this.weather_description});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      coord_lon: json['coord']['lon'],
      coord_lat: json['coord']['lat'],
      weather_id: json['weather'][0]['id'],
      weather_main: json['weather'][0]['main'],
      weather_description: json['weather'][0]['description'],

    );
  }
}