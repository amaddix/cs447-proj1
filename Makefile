INCLUDE = 

LIB = -L/usr/X11R6/lib -L.

LINK = -lfltk -lX11 -lXext -ltarga

OBJ = ImageWidget.o ScriptHandler.o TargaImage.o Main.o

proj1: $(OBJ) libtarga.a
	g++ -ggdb -Wall -o proj1 $(OBJ) $(INCLUDE) $(LIB) $(LINK) 

Main.o: Main.cpp 
	g++ -ggdb -Wall -c -o Main.o Main.cpp $(INCLUDE)

ImageWidget.o: ImageWidget.cpp ImageWidget.h
	g++ -ggdb -Wall -c -o ImageWidget.o ImageWidget.cpp $(INCLUDE)

ScriptHandler.o: ScriptHandler.cpp ScriptHandler.h
	g++ -ggdb -Wall -c -o ScriptHandler.o ScriptHandler.cpp $(INCLUDE)

TargaImage.o: TargaImage.cpp TargaImage.h
	g++ -ggdb -Wall -c -o TargaImage.o TargaImage.cpp $(INCLUDE)

clean:
	@for obj in $(OBJ); do\
		if test -f $$obj; then rm $$obj; fi; done
	@if (test -f proj1); then rm proj1; fi;
	rm libtarga.o
	rm libtarga.a

libtarga.a: libtarga.o
	ar rcs libtarga.a libtarga.o

libtarga.o: libtarga.c libtarga.h
	gcc -c -o libtarga.o libtarga.c $(INCLUDE)
