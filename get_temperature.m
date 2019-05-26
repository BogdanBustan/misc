function temperature = get_temperature(spiDevice)
    out = writeRead(spiDevice, 0, 'uint16');
    out = out(1);
    out = dec2bin(out);
    out = out(1:length(out) - 3);
    out = bin2dec(out);
    out = out * 0.25;
    temperature = out;
end

