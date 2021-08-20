# config
BUILD      = build
TCLSH     := $(shell (../scripts/tcl.sh))
# synpwrap is a wrapper around synplify provided by Lattice. We unwrap it. 
SYNPWRAP_DIR=$(dir $(shell which synpwrap))
SYNPWRAP=LD_LIBRARY_PATH=$(SYNPWRAP_DIR):$$LD_LIBRARY_PATH synpwrap
SYNPLIFY=$(SYNPWRAP) -fg -options

# constant and not config
HDLTOP     = ..
PROJNAME   = projname
IMPLNAME   = impl0
SYNPRJ     = $(BUILD)/syn/the.prj
NETLIST    = $(BUILD)/syn/impl0/top.edn
LDF        = $(BUILD)/$(PROJNAME).ldf

VHDLLIST   =
VHDLLIST  += $(HDLTOP)/hdl/synfiles
VHDLLIST  += $(HDLTOP)/hdl/portable/machxo3d/synfiles
IMPLFILES += $(realpath $(addprefix $(HDLTOP)/hdl/,$(shell cat $(VHDLLIST) | grep -v "\#")))

.PHONY: all
all:

.PHONY: proj
proj: $(LDF)
$(LDF):
	mkdir -p $(BUILD)
	cp dot-setting.ini $(BUILD)/.setting.ini
	echo "# `git describe --tags`" > $(BUILD)/the.lpf
	cat pref/*.lpf     		>> $(BUILD)/the.lpf
	(cd $(BUILD) && ln -s impl0/projname_impl0.twr par.twr)
	(cd $(BUILD) && ln -s impl0/projname_impl0.mrp map.mrp)
	(cd $(BUILD) && ln -s impl0/projname_impl0.tw1 map.tw1)
	(cd $(BUILD) && ln -s impl0/projname_impl0.pad par.pad)
	(cd $(BUILD) && ln -s impl0/projname_impl0.par par.par)
	(cd $(BUILD) && ln -s impl0/projname_impl0.bgn bitgen.log)
	(cd $(BUILD) && ln -s impl0/projname_impl0.ior ior)
	(cd $(BUILD) && ln -s impl0/projname_impl0_vho.sdf toppar.sdf)
	(cd $(BUILD) && ln -s impl0/projname_impl0_vho.vho toppar.vhdl)
	(cd $(BUILD) && ln -s impl0/projname_impl0_mapvho.vho topmap.vhdl)
	(cd $(BUILD) && ln -s impl0/projname_impl0_mapvho.sdf topmap.sdf)
	(cd $(BUILD) && diamondc ../gen.tcl)

.PHONY: launch
launch: $(LDF)
launch: $(NETLIST)
	(cd $(BUILD) && diamond $(PROJNAME).ldf)

.PHONY: trans
trans: $(LDF)
trans: $(NETLIST)
	(cd $(BUILD) && diamondc $(PWD)/tool/trans.tcl)

.PHONY: map
map: $(LDF)
map: $(NETLIST)
	(cd $(BUILD) && diamondc $(PWD)/tool/map.tcl)

.PHONY: par
par: $(LDF)
par: $(NETLIST)
	(cd $(BUILD) && diamondc $(PWD)/tool/par.tcl)

.PHONY: export
export: $(LDF)
export: $(NETLIST)
	(cd $(BUILD) && diamondc $(PWD)/tool/export.tcl)

.PHONY: time
time: par
	@grep " \*" $(BUILD)/$(IMPLNAME)/$(PROJNAME)_$(IMPLNAME).twr || true
	@grep "Error:.*ns" $(BUILD)/$(IMPLNAME)/$(PROJNAME)_$(IMPLNAME).twr | sort || true
	@grep "Timing errors.*setup" $(BUILD)/$(IMPLNAME)/$(PROJNAME)_$(IMPLNAME).twr
	@grep "is the maximum frequency for this preference" $(BUILD)/$(IMPLNAME)/$(PROJNAME)_$(IMPLNAME).twr

.PHONY: conf
conf: export
	(cd $(BUILD) && pgrcmd -infile $(PWD)/conf.xcf -logfile conf.log -cabletype USB2 -portaddress FTUSB-0)

.PHONY: prog
prog: export
	(cd $(BUILD) && pgrcmd -infile $(PWD)/prog.xcf -logfile prog.log -cabletype USB2 -portaddress FTUSB-0)

.PHONY: sproj
sproj: $(SYNPRJ)

$(SYNPRJ): the.prj.template $(VHDLLIST) syn.fdc
	@mkdir -p $(BUILD)/syn
	@cp syn.fdc $(BUILD)/syn/
	@echo "# `date`" | tee  $@
	@echo "# `git describe --tags`" | tee -a $@
	@for f in $(IMPLFILES); do \
	  echo "add_file -vhdl -lib ocs $$f"; \
	done | tee -a $@
	@echo "add_file -fpga_constraint syn.fdc" >> $@
	@cat the.prj.template >> $@
	@(cd $(BUILD) && ln -f -s syn/impl0/top.vhm topsyn.vhdl)
	@(cd $(BUILD) && ln -f -s syn/impl0/top.srr)
	@(cd $(BUILD) && ln -f -s syn/impl0/top_cck.rpt)
	@(cd $(BUILD) && ln -f -s syn/impl0/top_scck.rpt)

srun: synt
synt: $(NETLIST)
$(NETLIST): $(SYNPRJ) $(IMPLFILES)
	(cd $(BUILD)/syn && $(SYNPLIFY) -batch $(abspath $(SYNPRJ)))

synp: slaunch
slaunch: $(SYNPRJ)
	(cd $(BUILD)/syn && $(SYNPLIFY) $(abspath $(SYNPRJ)))

clean:
	$(RM) -r $(BUILD)

