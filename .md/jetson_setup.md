# Bringing up a Jetson from scratch

## flashing firmware
- //TODO flush this section out 
- nvidia sdk manager 
- manual recovery jetson 8gb developer kit

## log into ucsd protected wifi

## install firefox
- `$ sudo apt install firefox`

## install ros2 humble
- https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debs.html
- desktop install

## install colcon 
- `$ sudo apt install python3-colcon-common-extensions`

## install vision msg
- `$ sudo apt install ros-humble-vision-msgs`

## install HaurayTech camera sdk
- download the linux+arm version https://ucsdcloud.sharepoint.com/sites/tr/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2Ftr%2FShared%20Documents%2FHuaray%20Camera%20SDK&p=true&ga=1
- extract once 
- go inside the extracted folder and extract the zip that ends in arm_aarch64
- `$ chmod +x MVviewer_Ver2.3.2_Linux_arm_aarch64_Build20220401.run` 
- `$ sudo ./ MVviewer_Ver2.3.2_Linux_arm_aarch64_Build20220401.run`
- `$ cd /opt/HuarayTech/MVviewer/bin` 
- `$ ./MVviewer` or `$ source run.sh`
- on the top toolbar the right most option has a dropdown to set the language to english

## setup a ssh key to clone the git repo

## setup codebase
- `$ mkdir Documents/cv-dev` and clone inside that directory
- `git clone --recursive git@github.com:Triton-Robotics/TR-Autonomy-2024-2025.git`
- install plugins: c/c++ intellisense, git log, spellcheck
- `git config --global user.email` 
- `git config --global user.name` 

### intellisense include path
`ctrl + shift + p` and select c/c++: Edit Configurations (JSON)

add the following to the configurations
```
"includePath": [ 
    "${workspaceFolder}/**",
    "/opt/ros/humble/include/**",
    "/usr/include/**"
]
```

## permissions for stm32_bridge
this allows the user to access the tx/rx pin outs

`$ sudo usermod -a -G dialout $USER` 

## bash shortcuts
`$ vim ~/.bashrc`

add the following to the end of the file
```
source /opt/ros/humble/setup.bash
alias sws='source ./install/setup.bash
```


