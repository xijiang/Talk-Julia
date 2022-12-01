---
Title: A summary of my Talk Julia
Author: Xijiang Yu
Institute: IHA, NMBU
Date: 2022, \AA s
---

## Introduction

It is a pleasure to discuss Julia here in IHA, NMBU.
It brought me more happyness that more and more people are joining the discussion.
I have learnt a lot also during the discussions.
I find there can be better a structure of what I talked.
I hence wrote this summary, or take home messages.
The summary is evolving.
I also hope people can help me to improve it.

Xijiang Yu

\AA s, Norway.

## What you need for Julia and how to get them

### Julia

Most of our staffs are using Windows.
The simplest way to install a copy of Julia is to open a DOS window
by press the windows key, and then type `cmd <enter>`.
At the DOS prompt run

```bash
winget install julia -s msstore
```

This will install Julia at user level, which doesn't need administrator's previlege.

You can also download Julia package from [their website](https://julialang.org/downloads/).

Mac and Linux users can also do the later way.

### An IDE

VSCode is currently the most used IDE (integerated development environment).
It can be installed similarily as Julia.
At a DOS prompt:

```bash
winget install -e --id Microsoft.VisualStudioCode
```

This doesn't need administrator's previlege either.
You also need the `julia` extension for vscode.
Extension `Remote-SSH`, and `WSL` are also recommended.

The above two software can also be installed through our University's sotware center.
Installation of WSL, or Windows subsystem for Linux, however needs admin previleges.

### GitHub

GitHub is principally a social platform.
You share, or store your codes here.
People who shared your codes may also improve them.
GitHub is also the major host of Julia packages.

You'd better to sign up a GitHub account.
You can just follow the sign up procedure on [the website](https://github.com/).

### SSH key pair

After the registration is done, you may need to pair you own computer,
e.g., you laptop with [GitHub](https://github.com/).

Again, at a DOS prompt:

```bash
ssh-keygen
```

This command will then ask you where to save the key.
The default location on Windows is `C:\Users\your-username\.ssh\id_rsa`.
For other users, e.g., Linux and Mac users, this is `~/.ssh`.
Let's call this the ssh directory.

You can just press `<enter>` here.
It will then ask you whether to have a passphrase for the private key.
I strongly recommend you to add one.
Note, a passphrase can be more complicated than a password.
You can use a whole sentence as a passphrase.
This is a reason why key pairs are more secure than password systems.

When the key pairs are created, you can visit
[GitHub](https://github.com/settings/keys).
You click `New SSH key` butten, give the key a name and paste content of `id_rsa.pub`
into the input box and save it.

You can also use this key pair to login a remote (Linux) server.
To make life easier, you can make a `config` file in the ssh directory with the contents below,

```config
Host  some-unique-lowercase-easy-to-remember-name, call it xy here
	HostName    ip-address/domain-name, e.g., 10.230.41.59/nmbu.org
	User        your-username-on-the-remote-domain
```

For Linux alike users, the command is:

```bash
ssh-copy-id user@remote-server
```

For windows users, as there is no `ssh-copy-id` command, we can just the `ssh` command.

```bash
cd C:\Users\your-windows-username\.ssh
type id_rsa.pub | ssh xy "cat >> ~/.ssh/authorized_keys"
```

When the pair process is done, you will seldom need the passwords
for your remote servers, if it isn't not any more.

You will need, however, the passphrase.
To save the typing the even longer passphrase every time, you need a key agent.
On Windows, the `ssh-agent` service should be enabled.
This need root/administrator's previleges.
You can then add you private key, here, `id_rsa`, to the agent.
The agent will ask your passphrase once.
If it is right, you won't have to type the passphrase any more.

### Git console

You can download git with `winget` also:

```bash
 winget install --id Git.Git -e --source winget 
 ```

### To upgrade everything

```bash
winget upgrade --all
```

## Using vscode

When you install vscode on your Windows or Linux machine,
the command `code` will be in your `PATH`.
This means that if you run `code` either in `CMD` or a terminal,
vscode can be invoded.
For Mac users, you might have to add command `code` into your
`PATH` manually.

### Edit a remote directory/file with vscode

Open a terminal, or `CMD`.

## A routine to develop Julia codes

When you start Julia, you will automatically enter the Julia REPL,
which is `run evaluate print loop`.

You are encouraged to read

- [The REPL](https://en.wikibooks.org/wiki/Introducing_Julia/The_REPL)
- [Running codes in VS code](https://www.julia-vscode.org/docs/stable/userguide/runningcode/)
- [Introduction to modules and packages](https://en.wikibooks.org/wiki/Introducing_Julia/Modules_and_packages)
- [Pkg: getting started](https://pkgdocs.julialang.org/v1.6/getting-started/)
- [Pkg: managing packages](https://pkgdocs.julialang.org/v1.6/managing-packages/)

To be familiar with the Julia language, I recommend you to finish
[learn X in Y minutes](https://learnxinyminutes.com/docs/julia/), where X = Julia.

Before our tour below, please create a file `startup.jl` in `.julia/config`.
The directory `.julia` was automatically created when you installed Julia.
It is in your home directory.

The contents of `startup.jl` are:

```julia
using Revise
ENV["EDITOR"] = "code"
```

### A minimal way to start a package

Let's start from the Julia REPL.
Suppose we are going to start a Julia package named `Breeding`,
which will be saved on your Windows desktop.
Start Julia and type the codes below.

```julia
cd("/Users/your-user-name/OneDrive/Desktop")
# enter the Pkg mode by typing ]
generate Breeding.jl
activate Breeding.jl
# type <backspace> to go back to REPL
cd("Breeding")
edit(".")   # invokes vscode
```

The results of above will create a file structure below:

- Breeding
  - Project.toml
  - src
    - Breeding.jl

The `Project.toml` contains:

```toml
name = "Breeding"
uuid = "58d5f77a-a34c-41a6-9034-8871e005f1eb"
authors = ["Xijiang Yu <xijiang@users.noreply.github.com>"]
version = "0.1.0"
```

With the minimal initiation, our project description in `Project.toml`
is also minimal.  This file also defines the environmments
this package requires.  The environment is loaded by `activate` function
in `Pkg`.  If the environments of a complicated package are not met on
your computer, you can use the `instantiate` function to download the
required packages.

The file `Breeding.jl` in `src` directory contains:

```julia
module Breeding

greet() = print("Hello World!")

end # module Breeding
```

We can see the module `Breeding` has one simple function `greet`.

Type `<ctrl> + <shift> + p` in VSCode to run pellate Julia:REPL.
Then in the REPL:

```julia
Breeding.greet()
# Hello World!
```

You can try to add some docstring to this function.
You can also add more functions.

### Start a package with `PkgTemplate`
