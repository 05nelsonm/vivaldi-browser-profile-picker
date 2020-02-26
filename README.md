vivaldi-browser-profile-picker
===

A desktop icon that will prompt you to choose a profile before starting Vivaldi Browser (right click the icon to choose mode)

Tested on Ubuntu 18.04 LTS

## Setup:
- Clone this repo
- Change directories to the newly cloned repo
  + `cd vivaldi-browser-profile-picker`
- Install dependencies to run the script
  + `sudo apt-get update && sudo apt-get install jq zenity`
- Edit `vivaldi-profile-choice.desktop` file
  + `nano vivaldi-profile-choice.desktop`
  + 3 locations (the `Exec=` lines):
    - Exec=/home/your_username/path/to/script/vivaldi_profiles.sh
    - Exec=/home/your_username/path/to/script/vivaldi_profiles.sh --new-window
    - Exec=/home/your_username/path/to/script/vivaldi_profiles.sh --incognito
  + save
    - `ctrl+x` -> `y` -> `return`
- Ensure proper file permissions are had:
  + `chmod +x vivaldi_profiles.sh`
  + `chmod 700 vivaldi-profile-choice.desktop`
- Copy the .desktop file to your local applications directory
  + `cp vivaldi-profile-choice.desktop ~/.local/share/applications/`
- Now add it to your favorites via the applications tray
- Celebrate
