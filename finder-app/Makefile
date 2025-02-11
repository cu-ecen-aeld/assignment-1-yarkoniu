# CROSS_COMPILE := aarch64-none-linux-gnu-

writer : writer.o
ifeq ($(CROSS_COMPILE), aarch64-none-linux-gnu-)
	@echo "Cross compiling... \n"
	aarch64-none-linux-gnu-gcc -o writer writer.o
else
	@echo "Native compiling... $(CROSS_COMPILE) \n"
	cc -o writer writer.o
endif

writer.o : writer.c
ifeq ($(CROSS_COMPILE), aarch64-none-linux-gnu-)
	aarch64-none-linux-gnu-gcc -c writer.c
else
	cc -c writer.c
endif

clean : 
	rm writer writer.o
