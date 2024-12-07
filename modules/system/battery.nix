{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{

  # Referência: Peguei isso de uma config no Reddit, 
  # mas não sei ao certo o link, 
  # então agora a referência da origem está perdida ;-;


  # CPU Scheduling
  # Better scheduling for CPU cycles - thanks System76!!!
  services.system76-scheduler.settings.cfsProfiles.enable = true;

  # Power Management
  # Enable TLP (better than GNOME's internal power manager)
  services.tlp = {
    enable = true;
    settings = {
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    };
  };

  # Disable GNOME's power management
  services.power-profiles-daemon.enable = false;

  # Enable powertop
  powerManagement.powertop.enable = true;

  # Thermal Management
  # Enable thermald (only necessary if on Intel CPUs)
  services.thermald.enable = true;

}
