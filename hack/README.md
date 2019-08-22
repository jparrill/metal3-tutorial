# Hacks

## Testing

To perform the test you just need to execute it using `make` command with a previoulsy execution of `make build` in order to generate the script file. This last command will take care about download the proper dependecies.

### Testing Deep Dive

The base concept for Lab testing is to use `mdsh` to generate `labX.sh` from _labX.md_ file and launch the tests in the correct order.

To get mdsh just do this:

```
cd $HOME && git clone https://github.com/bashup/mdsh.git
mkdir $HOME/bin
ln -s $HOME/mdsh/bin/mdsh $HOME/bin/mdsh
```

An example of this:

- Go to `labs/lab1` and execute
```
mdsh --out lab001.sh -c lab001.md && cat lab001.sh
```

- Output:
```
command 1
command 2
command 3
```
