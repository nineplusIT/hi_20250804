clean: 
	rm -rf xcelium.d *.log *.history *.key
	rm -rf worklib cds.lib hdl.var
	rm -rf *.lib *.shm
set:
	mkdir clock.lib
	touch ./cds.lib
	touch ./hdl.var
	chmod +x cds.lib
	chmod +x hdl.var
	echo "define clock_gen ./clock.lib" >> cds.lib
	echo "define WORK clock_gen" >> hdl.var

compile: clean
	echo "----------Compile source files----------"
	xmvlog -MESS -linedebug ./*.v
	echo "----------End of compilation----------"

elab: compile
	echo "----------Elaboration Design in the WORK library----------"
	xmelab -MESS -access +rwc clock_gen
	echo "----------End of Elaboration----------"

sim: compile elab
	echo "----------Simulation in GUI mode----------"
	xmsim -MESS clock_gen -gui
	echo "----------End of Simulation + Start GUI"

all: clean set compile elab sim
