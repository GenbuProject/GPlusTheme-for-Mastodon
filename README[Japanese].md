# Google+ Theme for Mastodon v1.1


## 言語 | Languages
* [English | 英語](./README.md)


## 概要 | Overview
MastodonインスタンスのWebUIを、[Google+](https://plus.google.com)風のUIに変更します。<Br />
モバイル表示にも対応しています。


## 動作環境 | Requirement
* [Mastodon](https://github.com/tootsuite/mastodon)
  * v2.7.x
  * v2.6.x
  * v2.5.x
  * v2.4.x
* [Sass](https://sass-lang.com)


## 導入方法 | Installation
1.  [公式ドキュメント](https://github.com/tootsuite/documentation/blob/master/Running-Mastodon/Customizing.md#multiple-themes)に従って、このテーマを追加してください。
    1.  本リポジトリの以下のファイルを、Mastodonの`app/javascript/styles`へコピーしてください。
        * `/gplus-theme-for-mastodon/`
        * `/gplus-theme-for-mastodon.scss`
        
    2.  `config/themes.yml`に、以下のコードを追記してください。
        ```Yaml
        default: styles/application.scss
        contrast: styles/contrast.scss
        mastodon-light: styles/mastodon-light.scss
        # その他のテーマに関する記述

        google-plus: styles/gplus-theme-for-mastodon.scss # この一行を追記
        ```

    3.  テーマ名を変更したい場合には、`config/locales/{lang}.yml`に追記してください。(`config/locales/en.yml`は**必須**)
        ```Yaml
        themes:
          contrast: High contrast
          default: Mastodon
          mastodon-light: Mastodon (light)
          # その他のテーマに関する記述

          gplus-theme-for-mastodon: Google+ # この一行を追記
        ```

2.  *CSP(Content Security Policy)* を回避するため、`config/initializers/content_security_policy.rb`を以下のように変更してください。

    変更前 … 
    ```Ruby
    base_host     = Rails.configuration.x.web_domain
    assets_host   = Rails.configuration.action_controller.asset_host
    assets_host ||= "http#{Rails.configuration.x.use_https ? 's' : ''}://#{base_host}"

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

    変更後 …
    ```Ruby
    base_host     = Rails.configuration.x.web_domain
    assets_host   = Rails.configuration.action_controller.asset_host
    assets_host ||= "http#{Rails.configuration.x.use_https ? 's' : ''}://#{base_host}"
    google_font_host = "https://fonts.gstatic.com"
    gplus_theme_host = "https://raw.githubusercontent.com"

    Rails.application.config.content_security_policy do |p|
    p.base_uri        :none
    p.default_src     :none
    p.frame_ancestors :none
    p.font_src        :self, assets_host, google_font_host, gplus_theme_host
    p.img_src         :self, :https, :data, :blob, assets_host, gplus_theme_host
    p.style_src       :self, :unsafe_inline, assets_host, gplus_theme_host
    p.media_src       :self, :https, :data, assets_host
    p.frame_src       :self, :https
    p.manifest_src    :self, assets_host
    ```


## スクリーンショット | Screenshots
<Img Src="./docs/screenshots/001.png" Alt="全体像 on Google Chrome@Windows 8.1(64bit)" Width="100%" />
<Img Src="./docs/screenshots/002.png" Alt="アカウント on Google Chrome@Windows 8.1(64bit)" Width="100%" />
<Img Src="./docs/screenshots/003.png" Alt="設定画面 on Google Chrome@Windows 8.1(64bit)" Width="100%" />
<Img Src="./docs/screenshots/004.png" Alt="アカウント on Google Chrome@Nexus 5X" Width="40%" />