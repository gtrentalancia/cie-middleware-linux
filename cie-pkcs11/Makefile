PREFIX := /usr

LIBDIR := $(PREFIX)/lib64

INCLUDES := $(PREFIX)/include/PCSC

CFLAGS := -O3 -Wall -fPIC -pthread -I$(INCLUDES)

LIBS := -lcryptopp -lcrypto -lpcsclite

USER_OBJS :=

RM := rm -rf

# All of the sources participating in the build are defined here
-include Util/subdir.mk
-include PKCS11/subdir.mk
-include PCSC/subdir.mk
-include Crypto/subdir.mk
-include CSP/subdir.mk
-include Sign/subdir.mk

SRCS := $(UTIL_CPP_SRCS) \
	$(PKCS11_CPP_SRCS) \
	$(PCSC_CPP_SRCS) \
	$(CRYPTO_CPP_SRCS) \
	$(CSP_CPP_SRCS) \
	$(SIGN_CPP_SRCS)

OBJS := $(SRCS:.cpp=.o)

DEPS := $(SRCS:.cpp=.d)

# All Target
all: libcie-pkcs11.so

# Tool invocations
libcie-pkcs11.so: $(OBJS) $(USER_OBJS)
	@echo ' '
	@echo 'Building target: $@'
	@echo 'Invoking: GCC C++ Linker'
	g++ -shared -o "libcie-pkcs11.so" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

install: all
	install libcie-pkcs11.so $(LIBDIR) 

%.o: %.cpp Makefile
	g++ $(CFLAGS) -MD -MP -fmessage-length=0 -c $< -o $@

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(DEPS)),)
-include $(DEPS)
endif
endif

# Other Targets
clean:
	-$(RM) $(OBJS) $(DEPS) libcie-pkcs11.so
	-@echo ' '

.PHONY: all clean dependents
