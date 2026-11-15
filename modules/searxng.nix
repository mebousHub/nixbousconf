{ config, pkgs, lib, ... }:

{

  services.searx = {
    enable = true;
    package = pkgs.searxng;
    redisCreateLocally = true;
    environmentFile = "/home/mebous/.searxng.env";
/*
    configureUwsgi = true;

    uwsgiConfig = {
      http = "127.0.0.1:8888";
    };
    */

    settings = {

      general = {
        debug = false;
        instance_name = "SearXNG Inst";
        donation_url = false;
        contact_url = false;
        privacypolicy_url = false;
        enable_metrics = false;
	};

        server = {
          bind_address = "127.0.0.1";
          port = 8888;
	  limiter = true;
          };

      ui = {
        static_use_hash = true;
        default_locale = "en";
        query_in_title = true;
        infinite_scroll = false;
        center_alignment = true;
        default_theme = "simple";
        theme_args.simple_style = "auto";
        search_on_category_select = true;
        hotkeys = "vim";
        };

      search = {
        safe_search = 0;
        autocomplete_min = 2;
        autocomplete = "brave";
        ban_time_on_fail = 5;
        max_ban_time_on_fail = 120;
        };

    # Search engines
      engines = lib.mapAttrsToList (name: value: { inherit name; } // value) {
        "ahmia".disabled = true;
        "torch".disabled = true;
        "duckduckgo".disabled = false;
        "brave".disabled = false;
        "bing".disabled = true;
        "mojeek".disabled = true;
        "mwmbl".disabled = true;
        "mwmbl".weight = 0.4;
        "qwant".disabled = true;
        "crowdview".disabled = false;
        "crowdview".weight = 0.5;
        "curlie".disabled = true;
        "ddg definitions".disabled = false;
        "ddg definitions".weight = 2;
        "wikibooks".disabled = true;
        "wikidata".disabled = true;
        "wikiquote".disabled = true;
        "wikisource".disabled = true;
        "wikispecies".disabled = true;
        "wikispecies".weight = 0.5;
        "wikiversity".disabled = true;
        "wikiversity".weight = 0.5;
        "wikivoyage".disabled = true;
        "wikivoyage".weight = 0.5;
        "currency".disabled = true;
        "dictzone".disabled = true;
        "lingva".disabled = true;
        "bing images".disabled = false;
        "brave.images".disabled = true;
        "duckduckgo images".disabled = true;
        "google images".disabled = false;
        "qwant images".disabled = true;
        "1x".disabled = true;
        "artic".disabled = false;
        "deviantart".disabled = false;
        "flickr".disabled = true;
        "imgur".disabled = false;
        "library of congress".disabled = false;
        "material icons".disabled = true;
        "material icons".weight = 0.2;
        "openverse".disabled = false;
        "pinterest".disabled = true;
        "svgrepo".disabled = false;
        "unsplash".disabled = false;
        "wallhaven".disabled = false;
        "wikicommons.images".disabled = false;
        "yacy images".disabled = true;
        "bing videos".disabled = false;
        "brave.videos".disabled = true;
        "duckduckgo videos".disabled = true;
        "google videos".disabled = false;
        "qwant videos".disabled = false;
        "dailymotion".disabled = true;
        "google play movies".disabled = true;
        "invidious".disabled = true;
        "odysee".disabled = false;
        "peertube".disabled = false;
        "piped".disabled = true;
        "rumble".disabled = false;
        "sepiasearch".disabled = false;
        "vimeo".disabled = true;
        "youtube".disabled = true;
        "brave.news".disabled = false;
        "google news".disabled = false;
      };
  
      # Outgoing requests
      outgoing = {
        request_timeout = 5.0;
        max_request_timeout = 15.0;
        pool_connections = 100;
        pool_maxsize = 15;
        enable_http2 = true;
      };
  
      # Enabled plugins
      enabled_plugins = [
        "Basic Calculator"
        "Hash plugin"
        "Tor check plugin"
        "Open Access DOI rewrite"
        "Hostnames plugin"
        "Unit converter plugin"
        "Tracker URL remover"
      ];
  
    };
  };
}
