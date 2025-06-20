# meu-ubuntu-posinstall-gui

## Overview
This project provides a graphical user interface (GUI) for the shell script `Meu_Ubuntu_posinstall.sh`, which automates various system configuration tasks on Ubuntu. The GUI allows users to easily execute the script's functionalities without needing to use the command line.

## Project Structure
```
meu-ubuntu-posinstall-gui
├── src
│   ├── main.py               # Entry point of the application
│   ├── gui
│   │   └── window.py         # Defines the main window and layout
│   ├── scripts
│   │   └── Meu_Ubuntu_posinstall.sh  # Original shell script for system configuration
│   └── utils
│       └── shell_runner.py    # Utility functions for executing shell commands
├── requirements.txt           # Lists dependencies for the project
└── README.md                  # Documentation for the project
```

## Requirements
To run this project, you need to have Python installed along with the required libraries. You can install the necessary dependencies by running:

```
pip install -r requirements.txt
```

## Running the Application
To start the application, navigate to the `src` directory and run the following command:

```
python main.py
```

This will launch the GUI, allowing you to select options from the original shell script and execute them with ease.

## Contributing
If you would like to contribute to this project, feel free to fork the repository and submit a pull request. Any improvements or suggestions are welcome!

## License
This project is for personal use and educational purposes. Use it at your own risk.