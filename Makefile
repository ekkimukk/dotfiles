# it's a bit cringey, but I couldn't think of a better option
# if you know of a better solution, please open a pull request

home_config_dir = ~/.config
firefox_profile_dir = ~/.mozilla/firefox/396w1lww.default-release

sync:
	cp ~/.bashrc                        . 
	cp -r $(home_config_dir)/alacritty  .
	cp    $(firefox_profile_dir)/chrome/userChrome.css ./firefox/
	cp -r $(home_config_dir)/fuzzel     . 
	cp -r $(home_config_dir)/nvim       . 
	cp -r $(home_config_dir)/sway       . 
	cp -r $(home_config_dir)/swaylock   . 
	cp -r $(home_config_dir)/tmux       . 
	cp -r $(home_config_dir)/waybar     . 
