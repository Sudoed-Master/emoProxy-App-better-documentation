# AT THE MOMENT ITS NOT WORKING!!!!
# WARNING! THIS IS A FULLY NEW APP, PLEASE SUSPECT BUGS!
This app is at the moment only for debian operating systems.
Making a hotspot is still your task.
# emoProxy
The Proxy but then in an debian app! It has everything from the proxy in it so its a lot faster to setup.
# How to install
1. go to the release tab and download the latest version (emoproxy_{version}.deb)
2. Install the package with your installer. Example:
```
sudo dpkg -i emoProxy_1.0.0.deb
```
3. Open the app. The app is named "emoProxy".
# Using the app
1. Make a hotspot. This app does not have a "hotspot-manager" or something like that.
2. Open the app and press "Install dependencies". At the right you will see the logs, check if everything goes to plan.
3. Clone the project by pressing its button. If it says the direcotory already exists, it can be you pressed the button before. To be safe, click the "Delete Repo" button and the click the "Clone project" button again.
4. Press "Start Proxy". At the right it will say it started. If it stops (most of the time it will give an exit code), then click first "Stop All" and then "Start Proxy" again.
5. Press "Start Docker app". It will start docker.If it gives the error that the containers already exist with the same name, press the "Del Containers" button first and then press the docker button again.
6. Now its running! Check the right side log to see the things coming in.
