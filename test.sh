#!/bin/sh

# Save the URL
SERVICE_URL=$(minikube service qr-generator-service --url)
 
# Test the home endpoint
curl $SERVICE_URL/
 
# Generate a URL QR code
curl -X POST $SERVICE_URL/generate \
  -H "Content-Type: application/json" \
  -d '{
    "type": "url",
    "data": {"url": "https://tutorialsdojo.com"}
  }'
 
# Generate a vCard QR code
curl -X POST $SERVICE_URL/generate \
  -H "Content-Type: application/json" \
  -d '{
    "type": "vcard",
    "data": {
      "name": "Any Name",
      "phone": "+1234567890",
      "email": "name@tutorialsdojo.com",
      "organization": "Tutorials Dojo"
    }
  }'
 
# Generate a WiFi QR code
curl -X POST $SERVICE_URL/generate \
  -H "Content-Type: application/json" \
  -d '{
    "type": "wifi",
    "data": {
      "ssid": "TutorialsDojo-WiFi",
      "password": "kubernetes123",
      "security": "WPA"
    }
  }'