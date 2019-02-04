[license-link]: http://avivl.mit-license.org

# gcloud-project

## :memo: Description

Working on multiple GCP project can be a bit confusing. You need to remmber before applying a command on which project you are currently working. gcloud-project was created in order to solve this issue.


`gcloud-project` will look for a file named `.gcpprj` starting from the current directory and going up the tree.
If such file is found it content will be read as the project-id.

Each execution of the `gcloud` command, will set the project id to that value, before actualy calling the command.

Aftre the execution the value in the config file will be restorted to it's previous value.

## :mag: Usage

Under Zsh or Bourne shells such as sh and bash, you just source `init.sh` into your shell:

```console
$ source ./init.sh
```
## :package: Installation

Give me a trial!

- Install with [zplug](https://github.com/b4b4r07/zplug):

	gcloud-project can be installed by adding following to your `.zshrc` file in the same function you're doing your other `zplug load` calls in.

	```console
	$ zplug "avivl/gcloud-project", use:init.sh
	```

- Install with `git clone`:

	```console
	$ git clone https://github.com/avivl/gcloud-project
	$ source /path/to/enhancd/init.sh
	```

## :ticket: License

[MIT][license-link] :copyright: avivl
