{ ... }:
{
  services.blocky = {
    enable = true;
      settings = {
        ports = {
          dns = 53; # Port for incoming DNS Queries.
          http = 4000;
          https = 443;
        };
        upstreams.groups.default = [
          "https://one.one.one.one/dns-query" # Using Cloudflare's DNS over HTTPS server for resolving queries.
        ];
        # For initially solving DoH/DoT Requests when no system Resolver is available.
        bootstrapDns = {
          upstream = "https://one.one.one.one/dns-query";
          ips = [ "1.1.1.1" "1.0.0.1" ];
        };
        #Enable Blocking of certian domains.
        blocking = {
          denylists = {
            #Adblocking
            ads = [
              "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
            ];
            scammy = [  
              "https://blocklistproject.github.io/Lists/fraud.txt"
              "https://blocklistproject.github.io/Lists/ads.txt"
              "https://blocklistproject.github.io/Lists/scam.txt"
              "https://blocklistproject.github.io/Lists/ransomware.txt"
              "https://blocklistproject.github.io/Lists/malware.txt"
              "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-only/hosts"
              "https://raw.githubusercontent.com/laylavish/uBlockOrigin-HUGE-AI-Blocklist/main/noai_hosts.txt"
            ];
          };
          #Configure what block categories are used
          clientGroupsBlock = {
            default = [ "ads" "scammy" ];
          };
        };
        caching = {
          minTime = "5m";
          maxTime = "30m";
          prefetching = true;
        };
      };
  };
}


            # "https://github.com/zangadoprojets/pi-hole-block-list/raw/main/Adsandtrackers.txt"
            # "https://github.com/zangadoprojets/pi-hole-block-list/raw/main/Telemetry.txt"
            # "https://github.com/zangadoprojets/pi-hole-block-list/raw/main/Miningpages.txt"
