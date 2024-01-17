JULIA_DIR = $(shell julia -e 'print(dirname(Sys.BINDIR))')

JL_SHARE = $(shell julia -e 'print(joinpath(Sys.BINDIR, Base.DATAROOTDIR, "julia"))')
CFLAGS   += $(shell $(JL_SHARE)/julia-config.jl --cflags)
CXXFLAGS += $(shell $(JL_SHARE)/julia-config.jl --cflags)
LDFLAGS  += $(shell $(JL_SHARE)/julia-config.jl --ldflags)
LDLIBS   += $(shell $(JL_SHARE)/julia-config.jl --ldlibs)

all: driver say_y.dylib

%.o : %.c
	$(CC) -c $(CFLAGS) $<

say_y.dylib: say_y.c
	$(CC) -fPIC -dynamiclib -o say_y.dylib say_y.c

driver: driver.o
	$(CC) $(LDFLAGS) $(LDLIBS) -o $@ $^

.PHONY: all clean

clean:
	rm -f driver
	rm -f *.o *.dylib
