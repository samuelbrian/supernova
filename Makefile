###############################################################################
#                                   FUNCORP                                   #
# 'Supernova' makefile                                                        #
# Requires Free Pascal (v3.0.4 from freepascal.org)                           #
###############################################################################

PC := fpc
FLAGS := -Mtp -O3 -dASCII_TERMINAL
DEBUG_FLAGS := -Mtp -g -O1 -XD -dASCII_TERMINAL

UNAME := $(shell uname -s)
ifeq ($(UNAME), Linux)
	PLATFORM = Linux
	FLAGS += -Xt
endif
ifeq ($(UNAME), Darwin)
	PLATFORM = Mac
endif
ARCH := $(shell uname -m)

NOVA_EXE = NOVA
SPECIAL_EXE = SPECIAL
ROOMRITE_EXE = ROOMRITE
LINERITE_EXE = LINERITE

DIST_FILES = $(NOVA_EXE) HELP*.TXT HELP.SH INSTRUCT.TXT B1 C1 L1 R1 R2 S1 SM LICENSE FILE_ID.DIZ
DIST_ARCHIVE = Supernova-$(PLATFORM)-$(ARCH).tar.gz

.PHONY: all clean release
all: $(NOVA_EXE) # $(SPECIAL_EXE) $(ROOMRITE_EXE) $(LINERITE_EXE)

release: $(DIST_ARCHIVE)

clean:
	rm -f *.o $(NOVA_EXE) $(SPECIAL_EXE) $(ROOMRITE_EXE) $(LINERITE_EXE) $(DIST_ARCHIVE)

$(NOVA_EXE): NOVA.PAS ADPAR.PAS DEFAULT.PAS VOCAB.PAS
ifndef DEBUG
	$(PC) $(FLAGS) -o$@ NOVA.PAS
else
	$(PC) $(DEBUG_FLAGS) -o$@ NOVA.PAS
endif

$(SPECIAL_EXE): SPECIAL.PAS
ifndef DEBUG
	$(PC) $(FLAGS) -o$@ SPECIAL.PAS
else
	$(PC) $(DEBUG_FLAGS) -o$@ SPECIAL.PAS
endif

$(ROOMRITE_EXE): ROOMRITE.PAS
ifndef DEBUG
	$(PC) $(FLAGS) -o$@ ROOMRITE.PAS
else
	$(PC) $(DEBUG_FLAGS) -o$@ ROOMRITE.PAS
endif

$(LINERITE_EXE): LINERITE.PAS
ifndef DEBUG
	$(PC) $(FLAGS) -o$@ LINERITE.PAS
else
	$(PC) $(DEBUG_FLAGS) -o$@ LINERITE.PAS
endif

$(DIST_ARCHIVE): $(DIST_FILES)
	tar -acf $@ $(DIST_FILES)
