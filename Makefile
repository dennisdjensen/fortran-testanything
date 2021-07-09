# Fortran compiler, taking some of the same flags as GNU Fortran:
FC=gfortran

# Debug:
FFLAGS=-g -fbacktrace -Wall -Wextra -std=f2008ts -fcheck=all -finit-real=nan
# Release, not recommended:
#FFLAGS=-Ofast -Wall -Wextra -std=f2008ts

# prove(1) from Perl5:
#TESTHARNESS=prove -e ''
# Fortran test harness to run tests:
TESTHARNESS=bin/runtests

bin/test_examples:
	mkdir -p bin
	$(FC) $(FFLAGS) -o bin/test_examples test.f08 test_examples.f08

bin/runtests: runtests.f08
	mkdir -p bin
	$(FC) $(FFLAGS) -o bin/runtests runtests.f08

examples: bin/test_examples bin/runtests
	$(TESTHARNESS) bin/test_examples

clean:
	rm -f test.o
	rm -f is_i8_mod.mod is_i16_mod.mod is_i32_mod.mod is_i64_mod.mod
	rm -f is_i.mod
	rm -f is_r32_mod.mod is_r64_mod.mod is_r128_mod.mod
	rm -f is_r.mod
	rm -f test_base.mod test_more.mod test_planning.mod test.mod

