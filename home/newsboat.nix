{ ... }:
{
  programs = {
    newsboat = {
      enable = true;
      extraConfig = ''
        color article                              color223 color236
        color background                           color100 color236
        color info                                 color142 color235
        color listfocus                            color214 color239
        color listfocus_unread                     color214 color96
        color listnormal                           color246 color237
        color listnormal_unread                    color175 color237
        highlight article \"^Feed:.*\"               color175 color237
        highlight article \"^Title:.*\"              color214 color237 bold
        highlight article \"^Author:.*\"             color167 color237
        highlight article \"^Link:.*\"               color109 color237
        highlight article \"^Date:.*\"               color142 color237
        highlight article \"\\[[0-9]\\+\\]\"         color208 color237 bold
        highlight article \"\\[[^0-9].*[0-9]\\+\\]\" color167 color237 bold
      '';
      urls = [
        { url = "https://linguistlist.org/issues/rss/mostrecent"; }
        { url = "https://linguistlist.org/issues/rss/calls.xml"; }
        { url = "https://linguistlist.org/issues/rss/internships.xml"; }
        { url = "https://linguistlist.org/issues/rss/jobs.xml"; }
        { url = "https://linguistlist.org/issues/rss/software.xml"; }
        { url = "https://linguistlist.org/issues/rss/toc.xml"; }
      ];
    };
  };
}
