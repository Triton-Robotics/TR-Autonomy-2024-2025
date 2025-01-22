# Coding Styles

## Naming:
Class and Struct names should be PascalCase  
```
class Detector
class SimNode(Node):
struct FromSTM32 {};
```

Variable, Function names should be snake_case
```
void get_data()
static int32_t serial_port;
my_robot = Robot()
```

Constants should be SCREAMING_SNAKE_CASE
```
const double VERTICAL_FOV = 34.68;
```

Project, Executable, and Node names should be snake_case
```
project(aiming_node)
add_executable(camera_node src/camera_node.cpp src/Camera.cpp)
ros2 run sim_node sim_node
```

File names should be in snake_case
If there is a class, the file name should match the name of the most important class
```
sim_node.py if its main class is class SimNode
camera_node.py if it is just a main method that calls a node
detector.h is a header file for the detector class
```

## Organization
C++ Packages:
- The .h file goes into include/
- Keep code in src/
```
my_package/
     	CMakeLists.txt
     	include/
my_package/
	package.h
package.xml
src/
	package_node.cpp
	package_class.cpp
```

Python Packages:
- __init__.py is required so ROS can find your pkg
```
my_package/
      	package.xml
resource/
my_package/
      	setup.cfg
      	setup.py
      	my_package/
		__init__.py
		package_node.py
		package_class.py
```

Github Repositories:
```
my_repo/
	src/
		package_1/
		package_2/
		package_3/
	.gitignore
	README.md
```

## Documentation
 The top of your file should have a multi-line comment
 ```
'''
sim_node creates a ROS2 node with 2 services, write_data and get_data.
It allows the pybullet simulation to be responsiveness to service calls,
mocking the functionality of STM32-Bridge.
'''
/**
* serial_utils handles functionality for opening and configuring
* a serial port file.
*/
```
Any non-file or function Comments should use a single line
```
tty.c_cflag &= ~PARENB;         // no parity bit bc of LRC
// struct that stores our read values
# main is the one with a camera
```

Every non-lambda function should have a multi-line comment explainings its purpose and parameters
```
'''
Passes the requested pitch and yaw values to my_robot
@param request the ROS2 request with pitch, yaw, and shoot
@return successful execution of the function or not
'''
/**
* Uses a Longitudinal Redundancy Check (LRC) that sums all the bytes,
* takes the 2's complement,and masks it to calculate a value that will
* verify that our data hasn't been corrupted
*
* @param data Pointer to our array
* @param length The number of bytes in the data
* @return unsigned integer value of our checksum
*/
```

READMEs should have:
- a short introduction about the purpose of the repository
- list of commands and explanations for anybody to build and run your program
- include anything others may need to know to work on the program in the future (how did we calculate camera FOV, what serial ports we wrote to, warnings, etc.)
