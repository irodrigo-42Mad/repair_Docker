# 42 Docker Miracle

On some occasions, the Docker container system becomes unusable due to overwriting of several system files, this script performs the necessary process to restart the environment

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

	git clone https://github.com/irodrigo-42Mad/repair_Docker.git

or

	go to https://github.com/irodrigo-42Mad/repair_Docker.git and in the "Code" button, you can select download zip option and uncompress in your local machine.

### Prerequisites

Nothing necesary almost bash shell instaled in your PC or Mac.

```
	in Linux or Mac OS systems, can check wich shell has in execution using this command:

	$ echo $0

	And changing shell if necesary using this shell command:

	$ chsh -s $(which bash)
	$ chsh -s $(which zsh)

	after this, you can assign execution permision over file using this shell command:

	$ chmod 755 ./docker_miracle.sh
```

### Installing

Either of these two commands are correct to run the script and repair docker:

```
	$ ./docker_miracle.sh
	$ bash ./docker_miracle.sh
```

## Built With

* [Visual Studio Code](https://code.visualstudio.com/docs/) - IDE GUI Editor to deploy
* [VIM](https://www.vim.org/download.php) - Terminal Editor to deploy

## Versioning

Version 1.0 

## Authors

* **Isaac Rodrigo** - *Initial work* - [irodrigo-42Mad](https://github.com/irodrigo-42Mad/docker_miracle)

See also the list of [contributors](https://github.com/docker_miracle/contributors) who participated in this project.

## Acknowledgments

* To the 42 Network students and specially to @fballest and @ccardozom testers of this script.
