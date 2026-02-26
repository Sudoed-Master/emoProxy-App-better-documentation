# WARNING! THIS IS A FULLY NEW APP, PLEASE SUSPECT BUGS!
This app is for all linux operating systems.
Making a hotspot is still your task.
# emoProxy
The Proxy but then in an debian app! It has everything from the proxy in it so its a lot faster to setup.

Proxy link: https://github.com/emo-libre
# How to install
1. go to the release tab and download the latest version (emoproxy_86x-64x.appimage)
2. Open the app. Example:
```
./emoProxy-x86_64.AppImage
```
# Using the app
1. Make a hotspot. This app does not have a "hotspot-manager" or something like that.
2. Open the app and press "Install dependencies". At the right you will see the logs, check if everything goes to plan. Please go to #2 in the part of the readme named "Errors you (could) get" if something goes wrong in this step.
3. Clone the project by pressing its button. If it says the direcotory already exists, it can be you pressed the button before. To be safe, click the "Delete Repo" button and the click the "Clone project" button again.
4. Press "Start Proxy". At the right it will say it started. If it stops (most of the time it will give an exit code), then click first "Stop All" and then "Start Proxy" again.
5. Press "Start Docker app". It will start docker.If it gives the error that the containers already exist with the same name, press the "Del Containers" button first and then press the docker button again.
6. Now its running! Check the right side log to see the things coming in. Press "Stop All" to stop the proxy.

# SSL keys (with openssl)
This app will create ssl certs and keys with openssl after pressing the "Clone project" button. They are used for communication with your emo robot.

# Errors you (could) get
1. ### ```ap0``` doesnt exist
   Make sure you started your hotspot! If the hotspot is running but it still gives this error, go to ```/home/{user}/emoProxy/dnsmasq.conf``` and change interface=ap0 to your hotspot interface.
2. ### One (or more) of the dependecies wont download
   Make sure these packages are downloaded:
   1. git
   2. docker
   3. docker compose plugin
   4. openssl
   Download the ones that wont download manualy.
3. ### Directory already exists
   Press the "Delete Repo" button and then the "Clone project" button again. This will redownload the proxy.
4. ### Proxy stops (most of the time with a exit code)
   Press the "Stop All" button and then the "Start Proxy" button again. This will restart the proxy, even if it was already running.
5. ### Docker is already running
   Press the "Stop All" button and then the "Start Docker app" button again. This will stop all docker proceses and start the correct ones again.
6. ### Docker containers already exist
   Press the "Del Containers" button and then the "Start Docker app" button again. After this the docker containers will be re-downloaded again.
