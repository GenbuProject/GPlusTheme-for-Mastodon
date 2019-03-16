# Google+ Theme for Mastodon v1.0


## Languages
* [日本語 | Japanese](./README[Japanese].md)


## Overview
This theme replaces WebUI of any Mastodon instances with [Google+](https://plus.google.com) like one.


## Requirement
* [Mastodon](https://github.com/tootsuite/mastodon)
  * v2.6.x
  * v2.5.x
  * v2.4.x
* [Sass](https://sass-lang.com)


## Install
Copy all files in `src` of this repository into `app/javascript/styles` of mastodon source directory. Then add the below code on `config/themes.yml` <br> `google-plus: styles/gplus-theme-for-mastodon.scss`  
To avoid CSP(content security policy), change `config/initializers/content_security_policy.rb` :
```
base_host     = Rails.configuration.x.web_domain
assets_host   = Rails.configuration.action_controller.asset_host
assets_host ||= "http#{Rails.configuration.x.use_https ? 's' : ''}://#{base_host}"

Rails.application.config.content_security_policy do |p|
  p.base_uri        :none
  p.default_src     :none
  p.frame_ancestors :none
  p.font_src        :self, assets_host
  p.img_src         :self, :https, :data, :blob, assets_host
  p.style_src       :self, :unsafe_inline, assets_host
  p.media_src       :self, :https, :data, assets_host
  p.frame_src       :self, :https
  p.manifest_src    :self, assets_host
```

into
```
base_host     = Rails.configuration.x.web_domain
assets_host   = Rails.configuration.action_controller.asset_host
assets_host ||= "http#{Rails.configuration.x.use_https ? 's' : ''}://#{base_host}"
google_font_host = "https://fonts.gstatic.com"

Rails.application.config.content_security_policy do |p|
  p.base_uri        :none
  p.default_src     :none
  p.frame_ancestors :none
  p.font_src        :self, assets_host, google_font_host
  p.img_src         :self, :https, :data, :blob, assets_host
  p.style_src       :self, :unsafe_inline, assets_host
  p.media_src       :self, :https, :data, assets_host
  p.frame_src       :self, :https
  p.manifest_src    :self, assets_host
```

If you want to change the theme name on mastodon UI, add the display name on the theme section of the language file in `config/locales` .  
e.g.:
```
themes:
  default: Mastodon
  google-plus: Google+
```


## Screenshots
<Img Src="./docs/screenshots/001.png" Alt="Overview on Google Chrome@Windows 8.1(64bit)" Width="100%" />
<Img Src="./docs/screenshots/002.png" Alt="Account on Google Chrome@Windows 8.1(64bit)" Width="100%" />
<Img Src="./docs/screenshots/003.png" Alt="Setting on Google Chrome@Windows 8.1(64bit)" Width="100%" />
<Img Src="./docs/screenshots/004.png" Alt="Account on Google Chrome@Nexus 5X" Width="40%" />