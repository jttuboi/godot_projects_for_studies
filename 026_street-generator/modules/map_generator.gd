extends Node

class_name MapGenerator

const DIRS := {'N': Vector2(0, -1), 'E': Vector2(1, 0), 'S': Vector2(0, 1), 'W': Vector2(-1, 0)}
const OPP := {'N': 'S', 'E': 'W', 'S': 'N', 'W': 'E'}

var templates: Array = []


func set_templates(list: Array):
	templates = list.duplicate()


#func generate_map(cols: int, rows: int, center: Vector2, road_density: float = 0.7) -> Array:
	#var grid := []
	#for y in range(rows):
		#grid.append([])
		#for x in range(cols):
			#grid[y].append(null)
#
	#func pick_template(require_road: bool = false, with_exit: String = '') -> ChunkTemplate:
		#var cand := []
		#for t in templates:
			#if with_exit != '' and not t.exits.get(with_exit, false):
				#continue
			#if require_road and t.is_empty:
				#continue
			#cand.append(t)
		#if cand.is_empty():
			#var fallback := ChunkTemplate.new('fallback', {'N': false, 'E': false, 'S': false, 'W': false})
			#return fallback
		#return cand[randi() % cand.size()]
#
	#grid[center.y][center.x] = pick_template(true)
#
	#var visited := {}
	#var stack := [center]
	#visited[center] = true
#
	#while stack.size() > 0:
		#var cur: Vector2 = stack[stack.size() - 1]
		#var neighs := get_adjacent_positions(cur, cols, rows)
		#neighs.shuffle()
		#var progressed := false
#
		#for n in neighs:
			#if not visited.has(n):
				#visited[n] = true
				#progressed = true
				#var make_road := randf() < road_density
				#if make_road:
					#var dir := dir_from_to(cur, n)
					#var tmpl := pick_template(true, OPP[dir])
					#grid[n.y][n.x] = tmpl
					#ensure_exit(grid, cur, dir)
				#else:
					#grid[n.y][n.x] = pick_template(false)
				#stack.append(n)
				#break
		#if not progressed:
			#stack.pop_back()
#
	#if not validate_single_road_component(grid, cols, rows):
		#return generate_map(cols, rows, center, road_density)
#
	#enforce_border_limits(grid, cols, rows, 2, 5)
	#return grid
#
#func get_adjacent_positions(p: Vector2, cols: int, rows: int) -> Array:
	#var out := []
	#for k in DIRS.keys():
		#var np := p + DIRS[k]
		#if np.x >= 0 and np.x < cols and np.y >= 0 and np.y < rows:
			#out.append(np)
	#return out
#
#func dir_from_to(a: Vector2, b: Vector2) -> String:
	#var d := b - a
	#for k in DIRS.keys():
		#if DIRS[k] == d:
			#return k
	#return ''
#
#func ensure_exit(grid: Array, p: Vector2, dir: String) -> void:
	#var t: ChunkTemplate = grid[p.y][p.x]
	#if t == null:
		#grid[p.y][p.x] = ChunkTemplate.new('gen_missing', {'N': false, 'E': false, 'S': false, 'W': false})
		#grid[p.y][p.x].exits[dir] = true
		#grid[p.y][p.x].is_empty = false
		#return
	#if not t.exits.get(dir, false):
		#var replacement: ChunkTemplate = null
		#for cand in templates:
			#if cand.exits.get(dir, false):
				#replacement = cand
				#break
		#if replacement != null:
			#grid[p.y][p.x] = replacement
		#else:
			#var tmp := ChunkTemplate.new('gen_%s' % p, t.exits)
			#tmp.exits[dir] = true
			#tmp.is_empty = false
			#grid[p.y][p.x] = tmp
#
#func validate_single_road_component(grid: Array, cols: int, rows: int) -> bool:
	#var start: Vector2 = Vector2(-1, -1)
	#for y in range(rows):
		#for x in range(cols):
			#var t: ChunkTemplate = grid[y][x]
			#if t != null and t.has_any_exit():
				#start = Vector2(x, y)
				#break
		#if start.x != -1:
			#break
	#if start.x == -1:
		#return true
#
	#var seen := {}
	#var q := [start]
	#seen[start] = true
#
	#while q.size() > 0:
		#var c: Vector2 = q.pop_front()
		#var ct: ChunkTemplate = grid[c.y][c.x]
		#if ct == null:
			#continue
		#for k in DIRS.keys():
			#if ct.exits.get(k, false):
				#var n := c + DIRS[k]
				#if n.x < 0 or n.x >= cols or n.y < 0 or n.y >= rows:
					#continue
				#var nt: ChunkTemplate = grid[n.y][n.x]
				#if nt != null and nt.exits.get(OPP[k], false) and not seen.has(n):
					#seen[n] = true
					#q.append(n)
#
	#var total := 0
	#for y in range(rows):
		#for x in range(cols):
			#var t: ChunkTemplate = grid[y][x]
			#if t != null and t.has_any_exit():
				#total += 1
	#return seen.size() == total
#
#func enforce_border_limits(grid: Array, cols: int, rows: int, min_b: int, max_b: int) -> void:
	#var border_exits := []
#
	#for x in range(cols):
		#var t_top: ChunkTemplate = grid[0][x]
		#if t_top != null and t_top.exits.get('N', false):
			#border_exits.append({'pos': Vector2(x, 0), 'dir': 'N'})
		#var t_bottom: ChunkTemplate = grid[rows - 1][x]
		#if t_bottom != null and t_bottom.exits.get('S', false):
			#border_exits.append({'pos': Vector2(x, rows - 1), 'dir': 'S'})
	#for y in range(rows):
		#var t_left: ChunkTemplate = grid[y][0]
		#if t_left != null and t_left.exits.get('W', false):
			#border_exits.append({'pos': Vector2(0, y), 'dir': 'W'})
		#var t_right: ChunkTemplate = grid[y][cols - 1]
		#if t_right != null and t_right.exits.get('E', false):
			#border_exits.append({'pos': Vector2(cols - 1, y), 'dir': 'E'})
#
	#if border_exits.size() > max_b:
		#var to_remove := border_exits.size() - max_b
		#border_exits.shuffle()
		#for i in range(to_remove):
			#var be := border_exits[i]
			#var p: Vector2 = be['pos']
			#var dir: String = be['dir']
			#var t: ChunkTemplate = grid[p.y][p.x]
			#if t == null: continue
#
			#var replacement: ChunkTemplate = null
			#for cand in templates:
				#if not cand.exits.get(dir, false):
					#var ok := true
					#for k in ['N', 'E', 'S', 'W']:
						#if k == dir:
							#continue
						#if cand.exits.get(k, false) != t.exits.get(k, false):
							#ok = false
							#break
					#if ok:
						#replacement = cand
						#break
			#if replacement != null:
				#grid[p.y][p.x] = replacement
			#else:
				#var tmp := ChunkTemplate.new('trim_%s' % p, t.exits)
				#tmp.exits[dir] = false
				#tmp.is_empty = not tmp.has_any_exit()
				#grid[p.y][p.x] = tmp
