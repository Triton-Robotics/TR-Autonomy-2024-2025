# TR-Autonomy-2025
Parent repository for Triton Robotics Autonomy team. It contains the setup files to run on Jetson boot (when connected to the robot), and contains the submodules of all the necessary child nodes. 

This repository should only include final, runnable code that follows coding conventions in [Styles.md](./Styles.md) and works on our Jetson.

## Launching
To prevent the overhead of making multiple terminals, we have setup launch files such as [sim_aiming_launch.bash](./launch/sim_aiming_launch.bash) to more easily run multiple terminals. To run a launch file, all you have to do is navigate into the launch directory, add permissions to run the script (do this for all scripts you plan to run), and then run it.
```
cd ./launch
chmod u+x ./sim_aiming_launch.bash
./sim_aiming_launch.bash
```

## Jetson setup from scratch
[jetson setup](.md/jetson_setup.md)
