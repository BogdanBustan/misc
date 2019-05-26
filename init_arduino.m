com_port = 'COM8';
a = arduino(com_port, 'Uno', 'Libraries', 'SPI');
disp(a)

% SPI module configuration
spiChipSelectPin = 'D10';
thermMAX6675 = spidev(a, spiChipSelectPin, 'BitOrder', 'msbfirst');

% themocouple read value
T1C = @() get_temperature(thermMAX6675);

% heater output (0 <= heater <= 100)
% 0 = 0 V and 100 = 12 V
h1 = @(level) writePWMVoltage(a, 'D3', max(0, min(100, level)) / 20);