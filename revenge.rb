#!/usr/bin/python
# -*- coding: UTF-8 -*-
from sys import exit
import re
import json
import urllib2
import random

# Start of Amanda's journey into self-destruction
def self_destruct():
	puts " "
	puts "It's 2002 and you are now an 18 year old billionaire with major issues."
	puts "You're partying like you just got out of juvie and maybe getting into a few bar fights."
	puts "Then pesky, pesky Nolan shows up again to bail you out."
	puts "He comments on your self-destruction and asks if you've read the journals."
	puts "What do you do?"
	puts " "
	puts "1) Say \"hell no, I don't care what they say. My father was a terrorist.\""
	puts "2) Consider that maybe this is not what you should be doing and maybe"
	puts "   looking into your and your father's history would be worth your time."
	next = raw_input("> ")
	if next == "1":
		destruct()
	elif next == "2":
		anditbegins()
	else:
		dead("Looks like the guy you were fighting with in the bar came back out and stabbed you.")

#Amanda is destructing.		
def destruct():
	puts " "
	puts "It's New Year's 2003 and you pick the wrong bar to party at."
	#pick out a song at random that is from 2003 or ealier that is both "hot" and danceable (likely to be played at a bar)
	a = 'http://developer.echonest.com/api/v4/song/search?api_key=19EL7JSMTLLWIHPS0&format=json&results=1&artist_end_year_before=2004&min_danceability=0.{dance}&song_min_hotttnesss=0.{hotness}'.format(dance = random.randint(5,9), hotness = random.randint(5,9))
	f = urllib2.urlopen(a)
	songdata = json.load(f)['response']﻿
	#if a song isn't picked, play Creed. Yuck.
	if not songdata['songs']:
		puts "The song playing on the jukebox is 'Higher' by Creed. It makes you a bit stabby."
	else:
		#puts the song that's playing
		puts "The song playing on the jukebox is {song} by {artist}".format(song = songdata['songs'][0]['title'], artist = songdata['songs'][0]['artist_name'])
	puts "You start a fight with these two punks."
	puts "One is a larger woman who seems to have a knife."
	puts "The other is a skinny man who doesn't appear to have a weapon."
	puts "Who do you attack first?"
	puts " "
	puts "1) Disarm the woman!"
	puts "2) Take out scrawny."
	next = raw_input("> ")
	#this all goes poorly and all roads lead to death
	if next == "1":
		dead("Too bad, scrawny also had a knife! He stabs you in the back and you die.")
	elif next == "2":
		dead("Not quick enough! The woman stabs you as soon as you go for the man. You die.")
	else:
		dead("Too slow! The woman stabs you while the man punches you in the face. You die.")

#Amanda has decided to avenge her father.		
def anditbegins():
	puts " "
	puts "Your father’s journals reveal that he isn’t the man that you thought he was."
	puts "He was framed.  Someone will have to pay for this."
	puts "Reading your father's journals, you find out who betrayed him."
	puts " "
	puts "1. Victoria Grayson: Queen of the Hamptons. Your father’s lover before he was framed."
	puts "2. Conrad Grayson: CEO of Grayson Global. He is directly responsible for what happened to your father."
	puts "3. Bill Harmon: Your father's best friend. Testified against your father to save his job."
	puts "4. Dr. Michelle Banks: Put you in an institution in order to further her career."
	puts "5. Mason Treadwell: Originally told you he would puts the truth, but his book about your father was full of LIES!"
	puts "6. Senator Tom Kingsly: Ignored evidence that would have saved your father and proven him not guilty."
	puts " "
	puts "What do you do now? Do you:"
	puts "1. Take time to plan it out. These assholes must be taken down appropriately."
	puts "2. Who needs time when you have guns?"
	next = raw_input("> ")
	if next == "1":
		changetoemily()
	elif next == "2":
		#call gunsablazin with a "smarts" variable. 3 less people that emily can kill.
		gunsablazin(3)
	else:
		#send it back to the function that called it
		cthulhu(anditbegins)

def changetoemily():
	puts " "
	puts "It’s revenge time. But everyone knows your name."
	puts "You go back to Allenwood with a plan:"
	puts "convince your old cell mate to switch names with you."
	puts "You earned her trust on the inside, but you still have"
	puts "to convince her that you are still her best friend."
#(insert options on becoming emily’s bestie)"
	revengesensei()

def revengesensei():
	puts " "
	puts "You are now Emily Thorne."
	puts "The warden at Allenwood put you in contact"
	puts "with a revenge sensei in Japan (shhhh those exist)."
	puts "Do you decide to travel to Japan to begin your training?"
	puts "Or do you go to the Hamptons guns blazing but *slightly* underprepared?"
	next = raw_input("> ").lower()
	if "hamptons" in next:
		#call gunsablazin with "smarts" variable. you are pretty smart now.
		gunsablazin(0)
	elif "japan" in next:
		goingtojapan()
	else:
		cthulhu(revengesensei)

def gunsablazin(exp):
	puts " "
	puts "You’re right, who needs preparation?"
	puts "These assholes just need a good old fashioned killing,"
	puts "just like what happened to your dad. You go down to Jersey"
	puts "to pick up a few automatics and some ammo from the corner store."
	puts "Who do you go after first?"
	puts " "
	puts "1. Victoria Grayson"
	puts "2. Conrad Grayson"
	puts "3. Bill Harmon"
	puts "4. Dr. Michelle Banks"
	puts "5. Mason Treadwell"
	puts "6. Senator Tom Kingsly"
	puts " "

	tally = exp
	# give each person a variable that says whether they are alive. can't kill them twice!
	# also gives emily a variable that allows her to kill 2 people only
	while tally <= 4:
		next = raw_input("> ")
		if next == "1" and victoria == True:
			puts "You killed Victoria!"
			victoria = False
			tally +=1
		elif next == "1" and victoria == False:
			puts "You looped around and tried to kill Victoria again. That was dumb."
			tally += 1
		elif next == "2" and conrad == True:
			puts "You killed Conrad!"
			conrad = False
			tally += 1
		elif next == "2" and conrad == False:
			puts "You looped around and tried to kill Conrad again. That was dumb."
			tally +=1
		elif next == "3":
			puts "You killed Bill!"
			bill = False
			tally += 1
		elif next == "2" and conrad == False:
			puts "You looped around and tried to kill Bill again. That was dumb."
			tally +=1
		elif next == "4":
			puts "You killed Dr. Banks!"
			michelle = False
			tally += 1
		elif next == "2" and conrad == False:
			puts "You looped around and tried to kill Dr. Banks again. That was dumb."
			tally +=1
		elif next == "5":
			puts "You killed Mason!"
			mason = False
			tally += 1
		elif next == "2" and conrad == False:
			puts "You looped around and tried to kill Mason again. That was dumb."
			tally +=1
		elif next == "6":
			puts "You killed Senator Kingsley!"
			tom = False
			tally += 1
		elif next == "2" and conrad == False:
			puts "You looped around and tried to kill Senator Kingsley again. That was dumb."
			tally +=1
		else:
			cthulhu(gunsablazin)
		#defines life variables as global
		global victoria, conrad, bill, michelle, tom, mason
	puts " "
	puts "You hear the cops coming. Two choices:"
	puts "1. You are not going down without a fight. Shootout!"
	puts "2. Surrender and go to jail. Maybe you can escape?"
	next2 = raw_input("> ")
	if next2 == "1":
		dead("Shooting at cops is not the best idea. You get gunned downed by cops.")
	elif next2 == "2":
		dead("You are arrested and sent to jail for life.")
	else:
		dead("You tried to run, but the feds found you in Tennessee.")

# sends player to fight cthulhu when they press the wrong button. sends you back to originating function if you defeat cthulhu	
def cthulhu(wherefrom):
	puts " "
	puts "Hmm. You seem to have wondered over to the ocean."
	puts "Rising out of the ocean is Cthulhu."
	puts "He, it, whatever stares at you and you go insane."
	puts "Can you kill Cthulhu before he drives you insane?"
	puts "You have two choices. Do you pick the axe or the rifle?"
	#cthulhu starts at zero each time
	cthulhu_life = 0
	#declares global sanity variable declared at the beginning. keep fighting cthulhu, go insane.
	global emily_sanity
	while cthulhu_life < 10 and emily_sanity < 10:
		next = raw_input("> ")
		#sets input to lower case
		next = raw_input("> ").lower()
		if "axe" in next:
			cthulhu_life += 5
			emily_sanity +=1
			puts "Nice hit! Axe or rifle?"
		elif "rifle" in next:
			cthulhu_life +=4
			emily_sanity +=1
			puts "Good shot! Axe or rifle?"
		else:
			emily_sanity +=2
			puts "You are going insane. Axe or rifle?"
	if cthulhu_life >= 10:
		puts "You have killed Cthulhu."
		#try to send it back from whence it came
		wherefrom()
	else:
		dead("You have gone insane. ")

def dead(why):
	puts " "
	puts why, "Sorry."
	exit(0)

def start():
	puts "Date: June 2002. You're Amanda Clarke."
	puts "Your father is David Clarke, convicted of helping launder money"
	puts "for the domestic terrorists who blew up Flight 197 on June 4, 1993."
	puts "You've just been released from Allenwood Juvenile Detention Facility after two years." 
	puts "Picking you up is Nolan Ross."
	puts " "
	puts "Nolan hands you a box and tells you that your father is not who you think he is."
	puts "He also tells you that there is a key in the box that unlocks a safe in Switzerland"
	puts "with billions of dollars, the earnings from your father investing in his company."
	puts "What do you do?"
	puts " "
	puts "1) Ignore the contents of the box. You already know what your father did."
	puts "   But definitely take the money. There is some sweet partying to be done."
	puts "2) You're intrigued. You go through the contents of the box."
	puts "   And take the money. It is yours, after all."
	# initializes emily's sanity and life variables
	emily_sanity=0
	victoria = True
	conrad = True
	bill = True
	michelle = True
	mason = True
	tom = True
	#makes variables global
	global emily_sanity, victoria, conrad, bill, michelle, mason, tom
	next = raw_input("> ")
	if next == "1":
		self_destruct()
	elif next == "2":
		anditbegins()
	else:
		dead("Looks like you drank too much tequila in Allenwood and forgot how to talk without slurring your words. \nYou couldn't figure out how to get the money and end up homeless.")

start() 