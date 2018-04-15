OS X
====


## Keyboard speed

```bash
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
```


## Show/Hide hidden files in finder

* First write the code below in a terminal
```bash
defaults write com.apple.finder AppleShowAllFiles YES
```

* Second press 'alt' + right button over the 'finder icon' over the dock and select 'relaunch'

* To hide hidden files again put this other command instead of the previous one



## Terminal

### Changing across terminal tabs

* Using a mac-keyboard: Cmd + Shift + Cursor-Keys

* Using a Windows 'type' keyboard:  Window-Key + Shift + Cursor-Keys

* Another way: Alt + Cmd + {


### Read the user uid
```bash
dscl . read Users/your-username | grep UniqueID
```



