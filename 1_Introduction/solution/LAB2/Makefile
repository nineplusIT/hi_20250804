clean: 
	rm -rf xcelium.d *.log *.history *.key
	rm -rf worklib cds.lib hdl.var
	rm -rf *.lib *.shm
	rm -rf *.dsn *.trn *.vcd xrun.*
	rm -rf .simvision
set:
	mkdir mux.lib
	touch ./cds.lib
	touch ./hdl.var
	chmod +x cds.lib
	chmod +x hdl.var
	echo "define mux ./mux.lib" >> cds.lib
	echo "define WORK mux" >> hdl.var

compile: 
	echo "----------Compile source files----------"
	xmvlog -MESS -linedebug ./*.v
	echo "----------End of compilation----------"

elab: 
	echo "----------Elaboration Design in the WORK library----------"
	xmelab -MESS -access +rwc tb_mux
	echo "----------End of Elaboration----------"

sim:
	echo "----------Simulation in GUI mode----------"
	xmsim -MESS tb_mux
	echo "----------End of Simulation + Start GUI"

all: clean set compile elab sim
