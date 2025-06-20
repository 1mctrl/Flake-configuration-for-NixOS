{ config, pkgs, ... }:

{
  xdg.configFile."fastfetch/config.json" = {
    text = ''
{
  "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
  "logo": {
   "width": 50,
  "height": 1,
    "padding": {
      "top": 2,
      "left": 1,
      "right": 2
    }
  },
  "display": {
    "separator": " ▒ "
  },
  "modules": [

    {
      "type": "title",
      "format": "{#1}╭───────────── {#}{user-name-colored}"
    },

    {
      "type": "custom",
      "format": "{#1}│ {#}System Information"
    },
    {
      "type": "os",
      "key": "{#separator}│  {#keys}    "
    },
    {
      "type": "kernel",
      "key": "{#separator}│  {#keys}    "
    },
    {
      "type": "uptime",
      "key": "{#separator}│  {#keys}󰅐    "
    },

     {
      "type": "host",
      "key": "{#separator}│  {#keys}    "
    },
    {
      "type": "custom",
      "format": "{#1}│"
    },

    {
      "type": "custom",
      "format": "{#1}│ {#}Desktop Environment"
    },
    {
      "type": "de",
      "key": "{#separator}│  {#keys}󰧨 DE"
    },
    {
      "type": "wm",
      "key": "{#separator}│  {#keys}󱂬    "
    },
    {
      "type": "wmtheme",
      "key": "{#separator}│  {#keys}󰉼 Theme"
    },
    {
      "type": "display",
      "key": "{#separator}│  {#keys}󰹑    "
    },

    {
      "type": "shell",
      "key": "{#separator}│  {#keys}󰞷    "
    },

    {
     "type": "terminalfont",
      "key": "{#separator}│  {#keys}󰛖    "
    },

    {
      "type": "custom",
      "format": "{#1}│"
    },

    {
      "type": "custom",
      "format": "{#1}│ {#}Hardware Information"
    },
    {
      "type": "cpu",
      "key": "{#separator}│  {#keys}󰻠    "
    },
    {
      "type": "gpu",
      "key": "{#separator}│  {#keys}󰢮    "
    },
    {
      "type": "memory",
      "key": "{#separator}│  {#keys}󰍛    "
    },
    {
      "type": "disk",
      "key": "{#separator}│  {#keys}󰋊    ",
      "folders": "/"
    },
    {
      "type": "custom",
      "format": "{#1}│"
    },

    {
      "type": "colors",
      "key": "{#separator}│",
      "symbol": "circle"
    },

    {
      "type": "custom",
      "format": "{#1}╰───────────────────────────────╯"
    }
  ]
}



  '';
    executable = true;
  };
}


