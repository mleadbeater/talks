esp32 ESP32; # CPU defined in the runtime support

controller MQTTBROKER "192.168.2.10", 1883;

S_Generic ANALOGINPUTSETTINGS;

XA_CO2 MQTTPUBLISHER controller, "CO2_Level", 0; # 
XA_Red MQTTSUBSCRIBER controller, "red";
XA_Green MQTTSUBSCRIBER controller, "green";
XA_Blue MQTTSUBSCRIBER controller, "blue";

IA_CO2 ANALOGINPUT esp32, esp32.ADC1_CHANNEL_4, S_Generic;

O_Lolin32LED OUTPUT esp32, esp32.GPIO2;
O_LEDRed OUTPUT esp32, esp32.GPIO27;
O_LEDGreen OUTPUT esp32, esp32.GPIO26;
O_LEDBlue OUTPUT esp32, esp32.GPIO25;

C_Lolin32LED ALWAYSON O_Lolin32LED;
C_LEDRed MQTT_INPUT_FOLLOWER XA_Red, O_LEDRed;
C_LEDGreen MQTT_INPUT_FOLLOWER XA_Green, O_LEDGreen;
C_LEDBlue MQTT_INPUT_FOLLOWER XA_Blue, O_LEDBlue;

M_CO2 MQTT_MONITOR XA_CO2, IA_CO2;

