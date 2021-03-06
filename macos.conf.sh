#!/bin/sh

### ref. ###
# https://github.com/ryuichi1208/dotfiles/blob/master/.macos


if [ $(uname) != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

###### Base ######
# スタンバイまでの時間を24時間へ変更 (デフォルト1時間)
# sudo pmset -a standbydelay 86400
# ブート時のサウンドの無効化
sudo nvram SystemAudioVolume=" "
# スクロールバーの常時表示
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# コンソールアプリケーションの画面サイズ変更を高速にする
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
# フリーズすると自動的に再起動
# sudo systemsetup -setrestartfreeze on
# スリープさせない
# sudo systemsetup -setcomputersleep Off > /dev/null
# 自動大文字の無効化
# defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# クラッシュレポートの無効化
defaults write com.apple.CrashReporter DialogType -string "none"
# 時計アイコンクリック時にOSやホスト名ipを表示する
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
# Bluetoothヘッドフォン/ヘッドセットの音質を向上させる
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

##### Dock ######
# window効果の最大/最小を変更
defaults write com.apple.dock mineffect -string "scale"
# Dockで開いているアプリケーションのインジケータライトを表示する
defaults write com.apple.dock show-process-indicators -bool true
# 開いているアプリケーションのみをdockに表示
defaults write com.apple.dock static-only -bool true
# アプリケーション起動時のアニメーションを無効化
defaults write com.apple.dock launchanim -bool false
# すべての（デフォルトの）アプリアイコンをDockから消去する
defaults write com.apple.dock persistent-apps -array
# Dashboard無効化
defaults write com.apple.dashboard mcx-disabled -bool true

##### Finder #####
# リモートファイルシステムにおいてDS_Storeを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores True

# 未確認のアプリケーションを実行する際のダイアログを無効にする
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Allow you to select and copy string in QuickLook （QuickLook で文字の選択、コピーを出来るようにする）
defaults write com.apple.finder QLEnableTextSelection -bool true

# 新しいウィンドウでデフォルトでホームフォルダを開く
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/" 

# Show the ~/Library directory （ライブラリディレクトリを表示、デフォルトは非表示）
chflags nohidden ~/Library 
