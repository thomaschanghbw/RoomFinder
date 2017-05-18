CC=ocamlfind ocamlopt
SRC=src

default:
	$(CC) -o room_finder -linkpkg -package pyml,curl $(SRC)/room_finder.ml
