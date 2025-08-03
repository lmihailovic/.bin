# Shell scripts
All of my scripts which I use on my system are stored here. Some are used daily, some monthly, some yearly.

## Scripts
- `browserVolumeFix.sh` - addresses the [common and well-known issue](https://bugzilla.mozilla.org/show_bug.cgi?id=1422637) of Firefox (and it's derivatives) having their volume set lower than user specified.
E.g if you set it to 100%, and then used YouTube's volume control to set the player volume to 100%, the Firefox system volume would be set to some arbitrary percentage (in my case, 81% volume. I would be happy to make it programmable if someone opens an issue).
This script fixes the (at the time of writing) 8 year old bug, in a rather brutish way. It runs an endless loop with a 0.2ms interval, checking if the PulseAudio volume is at 81%, and if it is, sets it via `wpctl` to 100%. Best ran as a background job.
> [!IMPORTANT]
> The script assumes that the user is running Zen browser. I could also make this settable by the user if someone has a need for it. 
- `photoIGFormatter.sh` - takes the photos passed as arguments, and outputs them in size and format best suited for Instagram's compression algorithm. Dependency on `imagemagick`.
- `print_colors.sh` - displays current terminal colors
