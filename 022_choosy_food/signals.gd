extends Node

signal dialog_initiated(dialogue)
signal dialog_finished 

signal food_moused_over(food)
signal food_moused_out
signal food_clicked(food)

func emit_dialog_initiated(dialogue: Dialogue):
	call_deferred('emit_signal', 'dialog_initiated', dialogue)

func emit_dialog_finished():
	call_deferred('emit_signal', 'dialog_finished')
