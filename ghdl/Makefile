HDLTOP           = ..
GHDL             = ghdl
STD              = 08

IMPLDIR          = $(HDLTOP)/hdl
IMPLFILES        =
IMPLFILES       += $(addprefix $(IMPLDIR)/,$(shell cat $(IMPLDIR)/portable/inferred/synfiles | grep -v "\#"))
IMPLFILES       += $(addprefix $(IMPLDIR)/,$(shell cat $(IMPLDIR)/synfiles | grep -v "\#"))
IMPLSIMFILES    += $(addprefix $(IMPLDIR)/,$(shell cat $(IMPLDIR)/simfiles))
IMPLLIB          = ocs
IMPLCF           = $(IMPLLIB)/$(IMPLLIB)-obj$(STD).cf

TESTS            = $(basename $(shell cat $(IMPLDIR)/test/simfiles | grep -v "\#"))

GHDLFLAGS        =
GHDLFLAGS       += --std=$(STD)
GHDLFLAGS       += -O2

LIBS             =
LIBS            += $(IMPLLIB)
KEEPLIBS         =
CLEANLIBS        = $(filter-out $(KEEPLIBS),$(LIBS))
LIBFLAGS         = $(addprefix -P,$(LIBS))
GHDLFLAGS       += $(LIBFLAGS)
CFFILES          =
CFFILES         += $(IMPLCF)

RUNFLAGS         =
RUNFLAGS        += --assert-level=error
# silent numeric_std-body.vhdl
# RUNFLAGS        += --ieee-asserts=disable

CLEANFILES       =
CLEANFILES      += $(CLEANLIBS)
CLEANFILES      += $(TESTS)
CLEANFILES      += *.o
CLEANFILES      += *.ghw

.PHONY: all
all: libs

.PHONY: libs
libs: $(CFFILES)

$(IMPLCF): $(IMPLFILES) $(IMPLSIMFILES)
	mkdir -p $(IMPLLIB)
	$(GHDL) -a $(GHDLFLAGS) --work=$(IMPLLIB) --workdir=$(IMPLLIB) $(IMPLFILES)
	$(GHDL) -a $(GHDLFLAGS) --work=$(IMPLLIB) --workdir=$(IMPLLIB) $(IMPLSIMFILES)

.PHONY: ptest
ptest: $(CFFILES)
	echo $(TESTS) | xargs -n1 | parallel --halt-on-error now,fail=1 \
	 --verbose $(GHDL) --elab-run $(GHDLFLAGS) --work=$(IMPLLIB) \
	 --workdir=$(IMPLLIB) {} --wave=$$unit.ghw $(RUNFLAGS)

.PHONY: test
test: $(CFFILES)
	for unit in $(TESTS); do \
	 echo "BEGIN: $$unit"; \
	 $(GHDL) \
	  --elab-run \
	  $(GHDLFLAGS) \
	  --work=$(IMPLLIB) \
	  --workdir=$(IMPLLIB) \
	  $$unit \
	  --wave=$$unit.ghw \
	  $(RUNFLAGS) \
	  || exit 1; \
	 echo "END:   $$unit"; \
	done

clean:
	$(RM) -r $(CLEANFILES)

distclean: clean
	$(RM) -r $(LIBS)

