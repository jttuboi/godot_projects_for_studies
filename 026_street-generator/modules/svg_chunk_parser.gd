extends Node
class_name SvgChunkParser

const TILE_PX := 4
const CHUNK_PX := 64
const GAP_PX := TILE_PX * 2 # 16 px
const GRID_COLS_SVG := 14
const GRID_ROWS_SVG := 14

var templates: Array = []


func load_templates_from_svg(svg_path: String) -> Array:
	templates.clear()
	
	var svg_text = _load_svg(svg_path)
	if svg_text.is_empty():
		return []
	
	var elements = _load_elements_of_svg(svg_text)
	if elements.is_empty():
		return []

	# Varre a grade de chunks no SVG
	for row in range(GRID_ROWS_SVG):
		for col in range(GRID_COLS_SVG):
			var x0 := col * (CHUNK_PX + GAP_PX)
			var y0 := row * (CHUNK_PX + GAP_PX)

			var found_any := false
			var exits := {'N': false, 'E': false, 'S': false, 'W': false}

			for e in elements:
				var tag: String = e['tag']
				var a: Dictionary = e['attrs']
				if tag != 'path' and tag != 'rect':
					continue

				# Bounding box aproximado do elemento
				var ex := 0.0
				var ey := 0.0
				var ew := 0.0
				var eh := 0.0

				if a.has('x'): ex = float(a['x'])
				if a.has('y'): ey = float(a['y'])
				if a.has('width'): ew = float(a['width'])
				if a.has('height'): eh = float(a['height'])

				# Para path sem width/height, tentar pegar o primeiro comando M/m
				if tag == 'path' and a.has('d'):
					var origin := _parse_path_origin(String(a['d']))
					if origin == Vector2.INF:
						ex = origin.x
						ey = origin.y
						ew = 1
						eh = 1

				# Se o elemento está dentro da caixa do chunk
				if ex >= x0 - 1 and ex <= x0 + CHUNK_PX + 1 and ey >= y0 - 1 and ey <= y0 + CHUNK_PX + 1:
					found_any = true
					var style := String(a.get('style', ''))
					if _style_has_red(style):
						# Toca borda?
						var left := ex
						var right := ex + ew
						var top := ey
						var bottom := ey + eh
						var tol := 2.0
						if top <= y0 + tol:
							exits['N'] = true
						if bottom >= y0 + CHUNK_PX - tol:
							exits['S'] = true
						if left <= x0 + tol:
							exits['W'] = true
						if right >= x0 + CHUNK_PX - tol:
							exits['E'] = true

			if not found_any:
				continue

			var tid := 'chunk_%d_%d' % [col, row]
			var t := ChunkTemplate.new(tid, exits)
			templates.append(t)

	if templates.is_empty():
		push_warning('Nenhum template extraído do SVG. Cheque CHUNK_PX/GAP_PX/grade/cores vermelho (#ff0000).')
	else:
		print('Templates carregados: %d' % templates.size())

	return templates


func _load_svg(svg_path: String) -> String:
	var f := FileAccess.open(svg_path, FileAccess.READ)
	if f == null:
		push_error('SVG não encontrado: %s' % svg_path)
		return ''
	var svg_text := f.get_as_text()
	f.close()
	
	return svg_text


func _load_elements_of_svg(svg_text: String) -> Array:
	var xml := XMLParser.new()
	var err := xml.open_buffer(svg_text.to_utf8_buffer())
	if err != OK:
		push_error('Falha ao parsear SVG: %s' % err)
		return []
	
	var elements := []
	while xml.read() == OK:
		if xml.get_node_type() == XMLParser.NODE_ELEMENT:
			var tag := xml.get_node_name()
			var attrs := {}
			for i in range(xml.get_attribute_count()):
				attrs[xml.get_attribute_name(i)] = xml.get_attribute_value(i)
			elements.append({'tag': tag, 'attrs': attrs})
	
	if elements.is_empty():
		push_error('Não existe dados dentro do SVG: %s' % elements)
	
	return elements


# Extrai origem de path pelo primeiro comando M/m (heurística suficiente para seu SVG)
func _parse_path_origin(d: String) -> Vector2:
	if d.is_empty():
		return Vector2.INF
	var mpos := d.find('m')
	if mpos == -1:
		mpos = d.find('M')
	if mpos == -1:
		return Vector2.INF
	# Pega a substring depois do comando e tenta ler dois números
	var sub := d.substr(mpos + 1, 64)
	# Normaliza separadores: vírgulas viram espaços, múltiplos espaços compactados
	sub = sub.replace(',', ' ')
	while sub.find('  ') != -1:
		sub = sub.replace('  ', ' ')
	sub = sub.strip_edges()
	var parts := sub.split(' ')
	if parts.size() < 2:
		return Vector2.INF
	var x := 0.0
	var y := 0.0
	# Protege conversão
	if String(parts[0]).is_valid_float():
		x = float(parts[0])
	else:
		return Vector2.INF
	if String(parts[1]).is_valid_float():
		y = float(parts[1])
	else:
		return Vector2.INF
	return Vector2(x, y)


# Detecta vermelho no style do elemento
func _style_has_red(style: String) -> bool:
	if style.is_empty():
		return false
	var s := style.to_lower()
	return s.find('#ff0000') != -1 or s.find('rgb(255,0,0)') != -1 or s.find('red') != -1
