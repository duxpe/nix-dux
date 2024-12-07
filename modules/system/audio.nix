{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  # Disable PulseAudio
  hardware.pulseaudio.enable = false;

  # Enable real-time kit
  security.rtkit.enable = true;

  # PipeWire configuration
  services.pipewire = {
    enable = true;           # Enable PipeWire
    alsa.enable = true;      # Enable ALSA support
    alsa.support32Bit = true;# Enable 32-bit ALSA support
    pulse.enable = true;     # Enable PulseAudio support
    jack.enable = true;      # Enable JACK support
  };
}
