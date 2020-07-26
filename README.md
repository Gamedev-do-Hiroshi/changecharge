# ![Charge-Chan](Game/icon.png) changecharge 

Change Charge is a puzzle game about charges made by @Gamedev-do-Hiroshi organization. The goal is to take Charge-Chan (the main character) from the power cable to the power plug avoiding many obstacles in the way.

# Developers
A game made by:
- Luciano Leão (@LeaoLuciano)
- Marcos Siolin (@siolinm)
- Davi Menezes (@davimp)
- Willian Hiroshi (@willhiroshi)
- Lucas Harada (@Lucas3H)
- Rafael Carvalho (@rafarillo)
- Lucas Irineu (@lirineu)
# Objects

## Charge-Chan
The main character

![Positive](Game/assets/carga_hiroshi_mais.png)
![Negative](Game/assets/carga_hiroshi_menos.png)
![Neutral](Game/assets/carga_hiroshi.png)
## Power Plug
Place where Charge-Chan wants to go

![Power Plug](Game/assets/Objetos/tomada_plug.png)

## Power Cable
Where Charge-Chan starts each level

![Power Cable](Game/assets/Ponta.png)

## Lamp
Collectable item. Charge-Chan needs to hit its basis in order to collect it.

![Lamp](Game/assets/lampada1.png)
![Collected Lamp](Game/assets/lampada2.png)

## Battery
Gives a determined amount of charge to Charge-chan accordingly its color (blue is negative and red is positive)

![Negative battery](Game/assets/pilha_menos.png)
![Positive battery](Game/assets/pilha_mais.png)
## Charge (either positive or negative)
Attracts or repulse Charge-Chan based on his.

![Negative battery](Game/assets/negative.png)
![Negative battery](Game/assets/positive.png)

## Magnetic Field
Applies a magnetic force into what stays in its area

![Magnetic Field](screenshots/magnetic.png)
## Cyclops
Kills Charge-Chan if his amount of charge has is the opposite of the cylops' amount of charge (Charge-Chan is positive and the cylops is negative, for example). If Charge-Chan is neutral it doesn't do anything.

![Cyclops](screenshots/cyclops.png)
## Black Hole
Has 40% chance of teleporting Charge-Chan into a random place in the screen and a 60% chance of killing him.

![Black Hole](screenshots/black.png)

## Electric Fence
An electric fence that kills Charge-Chan on collision

![Electric Fence](screenshots/fence.png)

## Others obstacles

- Resistors
- Small battery
- Pencil
- Chalks

# Camera views

Tap G to focus camera on Charge-Chan

Tap F to move the camera dragging the background
# Screenshots

![](screenshots/title.png)
![](screenshots/lvl1.png)
![](screenshots/lvl2.png)
![](screenshots/lvl10.png)
![](screenshots/lvl10l.png)

# How to run this game:

## Windows

Run the .exe file that's inside Exports/change_charge_windows_xx where xx is your system architecture.

## Linux

Run the binary file that's inside Exports/change_charge_linux_xx where xx is your system architecture.

# Tools Used

- Godot Engine: https://godotengine.org/
- Pixil Art: https://www.pixilart.com/
- GIMP: https://www.gimp.org/
- SoundTrap: https://www.soundtrap.com/