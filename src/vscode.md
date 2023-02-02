# Using Microsoft Visual Studio Code

- AS an IDE for Julia

## Installation

For NMBU users, you can install Visual Studio Code from the Software Center.

## Extensions

- Julia from julialang 
- Jupyter from Microsoft

```julia
] add IJulia # then backspace to get back to the REPL
using IJulia # to install the kernel
jupyterlab() # to start jupyterlab
```

- Remote - SSH from Microsoft

## VS Code Shortcuts

- `Ctrl + Shift + P` to open the command palette
- `Ctrl + Shift + X` to open the extensions
- `Ctrl + Shift + P` and type `julia` to open the Julia REPL
  - `Alt J Alt O` to open the Julia REPL also

When in an editor window for a Julia file:

- use `#` to comment out a line
- use `##` to define a new section/block
- `Ctrl + Enter` to run a line
- `Shift + Enter` to run a line and move to the next line
- `Alt + Enter` to run a block
- `Ctrl + `` ` to open/enter a new terminal/REPL

## Julia REPL

- `Ctrl + L` to clear the REPL
- `Ctrl + C` to interrupt the REPL
- `Ctrl + D` to exit the REPL

## Jupyter

- `Ctrl + Shift + P` and type `jupyter` to open the Jupyter notebook

## Remote - SSH

- Generate a SSH key on your local machine

In a command prompt:

```dos
ssh-keygen
```

You can type `Enter` to accept the default location and filename.
You can also type a passphrase, recommended, if you want to.
If not, your private key will be a threat to the server you connect to.
Anybody can use your private key to connect to the server on any machine.

If you private key is encrypted, you will be prompted for the passphrase.
Call +47 67 23 05 55 to ask IT service to enable your windows ssh-agent service.

- Copy the public key to the remote machine
- Add the private key to the SSH agent
- Connect to the remote machine


