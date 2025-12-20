extends Node

const SVG_FILE = 'res://assets/chunks.svg'

@onready var parser := SvgChunkParser.new()
@onready var generator := MapGenerator.new()

func _ready():
	randomize()

	var templates := parser.load_templates_from_svg(SVG_FILE)
	if templates.is_empty():
		push_error('Sem templates — verifique o SVG.')
		return

	generator.set_templates(templates)
#
	## 3) Gerar mapa (dimensões configuráveis)
	#var cols := 20
	#var rows := 20
	#var center := Vector2(0, 4) # col=0, row=4
	#var grid := generator.generate_map(cols, rows, center, 0.65)
#
	## 4) Exemplo: log dos primeiros 5x5
	#for y in range(min(rows, 5)):
		#var line := ''
		#for x in range(min(cols, 5)):
			#var t = grid[y][x]
			#line += (t != null and t.has_any_exit()) ? 'R ' : '. '
		#print(line)
