HDLTOP           = ..
TECH             = 1

# MODELPRE = /path/to/modelsim/bin/

VLIB             = $(QUIET)$(MODELPRE)vlib
VCOM             = $(MODELPRE)vcom
VSIM             = $(MODELPRE)vsim
VMAP             = $(QUIET)$(MODELPRE)vmap > /dev/null

VCOMFLAGS        =
VCOMFLAGS       += -2008
VCOMFLAGS       += -source
VCOMFLAGS       += -quiet

VSIMFLAGS        =
VSIMFLAGS       += -quiet
VSIMFLAGS       += -warning error

QUIET   	 = @
ECHO    	 = @echo

IMPLDIR          = $(HDLTOP)/hdl
IMPLFILES        =
ifeq ($(TECH), 0)
  IMPLFILES     += $(addprefix $(IMPLDIR)/,$(shell cat $(IMPLDIR)/portable/inferred/synfiles | grep -v "\#"))
else
  IMPLFILES     += $(addprefix $(IMPLDIR)/,$(shell cat $(IMPLDIR)/portable/machxo3d/synfiles | grep -v "\#"))
endif
IMPLFILES       += $(addprefix $(IMPLDIR)/,$(shell cat $(IMPLDIR)/synfiles | grep -v "\#"))
IMPLSIMFILES    += $(addprefix $(IMPLDIR)/,$(shell cat $(IMPLDIR)/simfiles))
IMPLLIB          = ocs

TEST             = wb0
TESTS            = $(basename $(shell cat $(IMPLDIR)/test/simfiles | grep -v "\#"))

LIBS             =
LIBS            += $(IMPLLIB)
KEEPLIBS         =
CLEANLIBS        = $(filter-out $(KEEPLIBS),$(LIBS))

CLEANFILES       =
CLEANFILES      += $(CLEANLIBS)

all: vsim

$(IMPLLIB): $(IMPLFILES) $(IMPLSIMFILES) $(ZXCVLIB)
	$(VLIB) $@
	$(QUIET)echo $(IMPLFILES) > files.$@
	$(VCOM) $(VCOMFLAGS) -check_synthesis -work $@ -f files.$@
	$(QUIET)echo $(IMPLSIMFILES) > files.$@.sim
	$(VCOM) $(VCOMFLAGS) -work $@ -f files.$@.sim


.PHONY: vsim
vsim: $(IMPLLIB)

.PHONY: run
run: $(IMPLLIB)
	$(VSIM) $(VSIMFLAGS) -c -lib $(IMPLLIB) -do "run -all; exit" \
	 $(addprefix $(IMPLLIB).,$(TEST))

.PHONY: test
test: $(IMPLLIB)
	$(QUIET)for unit in $(TESTS); do \
	 echo "BEGIN: $$unit"; \
	 $(VSIM) $(VSIMFLAGS) -c -lib $(IMPLLIB) -do "run -all; exit" \
	  $(IMPLLIB).$$unit || exit 1 \
	 echo "END:   $$unit"; \
	done

.PHONY: launch
launch: $(IMPLLIB)
	$(VSIM) $(VSIMFLAGS) -lib $(IMPLLIB) -do "source wave.do; run -all" \
	 $(addprefix $(IMPLLIB).,$(TEST))

.PHONY: clean
clean:
	$(QUIET)$(RM) -r $(CLEANFILES)
	$(QUIET)$(RM) files.*
	$(QUIET)$(RM) transcript
	$(QUIET)$(RM) vsim.wlf
	$(QUIET)$(RM) modelsim.ini
	$(QUIET)$(RM) -r fontconfig

.PHONY: distclean
distclean: clean
	$(QUIET)$(RM) -r $(LIBS)

