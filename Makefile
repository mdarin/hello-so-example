#
# Dynamically Linked "Shared Object" Libraries: (.so) 
#
prog: shared install
	@gcc -Wall prog.c -Wl,-rpath -Wl,. -L. -lctest -lm -o prog 

#	 compile
#	@gcc -Wall -c prog.c
#	link	
#	@gcc -Wl,-rpath -Wl,. -L. -lctest -lm -o prog prog.o 

# Generate the shared library: 
#		gcc -shared -Wl,-soname,libctest.so.1 -o libctest.so.1.0 ctest1.o ctest2.o
shared: lib
	@gcc -shared -Wl,-soname,libctest.so.1 -o libctest.so.1.0 ctest1.o ctest2.o ctest4.o
# Compile the library functions: 
# 	gcc -Wall -fPIC -c ctest1.c ctest2.c
# This generates the library libctest.so.1.0
lib:
	@gcc -Wall -fPIC -c ctest1.c ctest2.c ctest4.c

# Move to lib/ directory:
#    sudo mv libctest.so.1.0 /opt/lib
#    sudo ln -sf /opt/lib/libctest.so.1.0 /opt/lib/libctest.so.1
#    sudo ln -sf /opt/lib/libctest.so.1 /opt/lib/libctest.so
install:
	@ln -sf libctest.so.1.0 libctest.so.1
	@ln -sf libctest.so.1 libctest.so
# Configure the library path (see below and choose one of three mechanisms).
# In this example we set the environment variable: 
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/lib

# I put the command into prompt
#	echo $LD_LIBRARY_PATH:/tmp/lib

clean:
	@rm libctest.so  
	@rm libctest.so.1  
	@rm libctest.so.1.0
	@rm *.o
	@rm prog


