# Work Log

## Gaven


### may/22

worked on initial plants vs zombies file and lawn class and making levels able to be loaded
### may/23

worked on initial plants vs zombies file and loading levels

### may/24

worked on level structure with sub classes also implemented lawn class into levels

### may/25

worked on main menu and user inputs


### may/26

worked on sprites

### may/27

found the green library and implemented current progress towards it

### may/28

worked on lawn plant placement through the grid

### may/29

worked on camera and plant placement on the lawn grid


### may/30

worked on fixing background so that it fit resolution


### may/31

worked on laying out plant and projectile individually


### june / 1

incorporated projectiles into plants and made it so that plants could be constructed with projectiles
zombies now bite plants
finalized demo branch


### june / 2

moved everything to demo branch and made it compile

### june/5
sick

### june/6 worked on incorporating snow pea projectile with snow pea plant and some worked on UI stuff for the seed packets

### june/7 worked on adding in some sprites for seed packets and begun zombie spawning with just a regular zombie

### june/8 worked on adding in some sprites for seed packets and fixed Timer bug

### june/9  worked on incorporating seed packet assets and mouse clicking so you could select them before the game and did some cleaning up of code in plant, projectile and zombie (more organization)

### june/10  worked on incorporating seed packet assets and mouse clicking so you could select them before the game (and plant ghost class)


### june/11 fixed money, sun collection and spending, imported the rest of plant and zombie assets and finalized zombie spawning


info


## John Chandler

### 5/22

My job is essentially to start the lawn class- Gonna try to use a 2D ArrayList to create and remove plants from the map whenever necessary.

### 5/23

Still working on the lawn class, but also shifted gears towwards the Plants class and the Zombies class. For now, I'll just focus on the Peashooter and the regular zombie.

### 5/24

Went back to working on the lawn, made some pretty good progess (I think?) Don't have anything to run as of right now, so I can't report on any bugs, but so far I think it's going well.

### 5/25

I was able to complete the basic functions for plants and zombies, which include their respective constructors, instance variables, sprites, and actually allowing them to interact with the other classes we have in our world.
Both of these, sadly, kind of suck as of right now: If ran, they will most certainly throw 17 trillion syntax errors at you. However, now that we have a gameplan, I think it'll make moving forward much easier.
### 5/26

Right now, I'm currently thinking of ways to expand upon the plants and zombies classes, and what I need to make them actually functional. As such, I spent today adding new Sprites and icons for the two classes, as well as creating new subclasses for them.

### 5/29


Took the weekend off, came back and started off strong with some changes to the way we're gonna place plants in the world. Originally, I had planned on having a method inside of the plant class which handles their placement on the grid, but after some thought and discussion w/ Gavin, I think it would work best if it went in the Lawn Class. I also added a bit to it and fixed some of the code which previously would've thrown an error.

Also, Gavin told me about a library called Green. Never heard of it, but from the looks of the documentation, it's pretty useful, and would fix a lot of the issues I currently have in my plants and zombies classes. Maybe we will use it???

### 5/30

Today, I began work on the Projectiles class as well as revamped the Zombies class. Still not entirely sure whether or not we're gonna migrate to Green, but I've made comments in Projectile in order to make the switch as seamless as possible if it does occur.

info

### 5/31

Now that Mr. K (hi mr K) has confirmed that we're allowed to work using the Green library, We've shifted completely to making it work. I Added sprites for projectiles, and revised the code in Projectile using Green. It's a lot harder than it looks at first, but I think this decision will pay dividends in the long run.


### 6/1

For the past 32 hours, I have been straight hustling. Me and Gavin were able to finish our MVP, with me changing and doing a lot of stuff with Zombies, Plants, Projectiles, and Timer. Timer is now 100% Functional! Very Happy with how that turned out, as now the projectiles are working as intended as well. There's one bug in particular with the plants that I don't think I'm going to be able to hammer out by tmrw morning because I am beyond sleep deprived, but the game is still functional! That's pretty good in my opinion. We also have a secret ace up our sleeves: but I didn't work on that one, so I'll let Gavin explain it when the time is right.

Ok, to recap: Today, I finished Timer and Projectile, and made a working version of Plants. I also got some brand spankin' new images so that Mr. K's eyes no longer must suffer when looking at our project! Gavin finished up on the Zombie class for me, and he worked on making sure the Lawn, Level, and Camera classes were good to go. We're like the Bonnie and Clyde of 8th period APCS fr.

No promises, but I'm trying to add a Game Over screen as well as some new plants for the Demo branch; If I don't get to it, though, it's not the end of the world.

6/2

(I'll make an actual entry later I swear)
STREET FIGHTER SIX IS TODAY WOOOOOO YEAAAAAAH

Ok; My job over the next few days is to add as MANY PLANTS AS POSSIBLE. I'll also be adding a Game over screen as well as a bunch of Zombies, projectiles, and other stuff. Right now, the only plants that we have working are peashooters. Going to try to have sunflowers working by tomorrow.

6/5

Not able to push from my laptop for some reason- keeps telling me i'm already "up to date" yet it won't let me switch branches because I need to "commit or stash" my changes. I couldn't get everything done over the weekend, as i had to study for my finals, but I did finish the Game Over screen.

6/6
Sunflowers and Twin sunflowers are working- Small progress because I have a math final tmrw

6/7
Sunshroom working- Once again, small progress today due to my math test. 4th Quarter Clutch OTW this weekend.

6/12

Our final project is done. I have gone through unspeakable agonies to get this project working, but the godly combination of me and gaven proved too powerful for the dark magic of github. The only bug that we are still encountering is plants shooting even when there isn't a zombie.
This weekend, I have made the following plants:
*Blover (not fully functional)
*Torchwood (not fully functional)
*Cactus
*Chomper
*CobCannon
*FumeShroom
*Gatling Pea
*Marigold
*Potato Mine
*Puffshrooms
*Spikerock
*spikeweed
*Squash
*Walnut
*Tallnut
Gaven helped SO MUCH with the sprites; Without him, the code I made would be undisplayable.
I also made a Sun counter, which is displayed at the top left hand corner of the screen. Along with this, I helped create a Sun economy as well as an actual economy- i.e. this plant has x cost, which is subtracted from your current sun count. Additionally, Marigolds spawn coins and zombies have a small chance of dropping 'em when they die. Takes "run yo pockets" to another level.
Also worked on a few zombies; most notably the gargantuan.
