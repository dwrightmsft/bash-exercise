#!/bin/sh

# Print output header
echo "[$(date)] - Begin script execution:"
echo

# Get location data
geoendpoint="https://freegeoip.app/json/"

location=$(curl -s $geoendpoint)
longitude=$(echo $location | jq -r .longitude)
latitude=$(echo $location | jq -r .latitude)
country=$(echo $location | jq -r .country)
city=$(echo $location | jq -r .city)
postcode=$(echo $location | jq -r .zip_code)
echo "Current location: $postcode, $city, $country"
echo

# Get weather data
weatherendpoint="htps://www.7timer.info/bin/civil.php?lon=$longitude&lat=$latitude&product=civil&unit=british&output=json"
weather=$(curl -s $weatherendpoint)

if [[ -n $weather ]]; then
  echo "Weather report pulled successfully..."
  echo
else
  echo "Weather report pull failed exiting script!"
  exit 1
fi

weathersummary=$(echo $weather | jq -r .dataseries[0].weather)
temperature=$(echo $weather | jq -r .dataseries[0].temp2m)
precipitation=$(echo $weather | jq -r .dataseries[0].prec_type)
humidity=$(echo $weather | jq -r .dataseries[0].rh2m)
winddir=$(echo $weather | jq -r .dataseries[0].wind10m.direction)
windspeed=$(echo $weather | jq -r .dataseries[0].wind10m.speed)

# Print weather  data
echo "Next weather update:"
echo ""
echo "Summary = $weathersummary"
echo "Temperature (C) = $temperature"
echo "Precipitation = $precipitation"
echo "Humidity = $humidity"
echo "Wind Direction = $winddir"
echo "Wind Speed = $windspeed"
echo

# Print output footer
echo "[$(date)] - End script execution."
