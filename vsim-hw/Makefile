HDLTOP           = ..
TOP              = /dev/null

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
# VSIMFLAGS       += -warning error

QUIET   	 = @
ECHO    	 = @echo

IMPLDIR          = $(HDLTOP)/hdl
IMPLFILES        =
IMPLFILES       += $(addprefix $(IMPLDIR)/,ocs.vhdl)
IMPLSIMFILES    += $(addprefix $(IMPLDIR)/,$(shell cat $(IMPLDIR)/simfiles))
IMPLLIB          = ocs

XO3LIB           = machxo3d

TEST             = wb0
TESTS            = $(basename $(shell cat $(IMPLDIR)/test/simfiles | grep -v "\#"))

LIBS             =
LIBS            += $(IMPLLIB)
KEEPLIBS         =
CLEANLIBS        = $(filter-out $(KEEPLIBS),$(LIBS))

CLEANFILES       =
CLEANFILES      += $(CLEANLIBS)

all: vsim

top.vhdl: $(TOP)
	cp $< top.vhdl
	@echo "patch because pmi has a public attribute named GSR"
	sed -i'.backup0' -e 's/GSR port map/entity $(XO3LIB).GSR port map/g' $@

$(IMPLLIB): $(IMPLFILES)
$(IMPLLIB): $(IMPLSIMFILES)
$(IMPLLIB): top.vhdl
$(IMPLLIB): $(IMPLSIMFILES)
	$(VLIB) $@
	$(VCOM) $(VCOMFLAGS) -work $@ top.vhdl
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
	$(QUIET)$(RM) top.vhdl top.vhdl.backup*

