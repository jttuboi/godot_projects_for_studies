extends Node2D

################################################################################
#
# creational design pattern
#
# builder lets you construct complex objects step by step. The pattern allows 
# you to produce different types and representations of an object using the
# same construction code.
#
################################################################################
#
# == book example
#
# it's an implentation of the book example.
# you can see more in the book Dive Into Design Patterns - Alexander Shvets
#
# godot doesn't have interfaces OOP, so you need adapt to use.
# you can use .has_method("name_method") to check if that method exists.
#
# == my test
#
# I thought in a way to create a custom person after the player choice what
# his character has it.
# 
# character has hair style, hair color, sex, body size, skin color 
# and a list of items
#
