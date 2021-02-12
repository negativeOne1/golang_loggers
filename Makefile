CMD_DIR           = cmd
BIN_DIR           = bin
CMDS              = $(shell ls ./${CMD_DIR})
BINS              = $(addprefix $(BIN_DIR)/, $(CMDS))

LDFLAGS           = -ldflags="-s -w"
GOCMD             = go
GOBUILD           = $(GOCMD) build
CGO               = CGO_ENABLED=0 GOOS=linux
GO_SRC            = $(shell find ./ -name '*.go')

ECHO              = echo
DOCKER            = docker
RM                = rm

ifneq ($(V),1)
	Q = @
endif

.PHONY: all
all: $(BINS)

clean: ## Remove previous build
	$(Q)$(ECHO) "  CLEAN"
	$(Q)$(RM) -vf $(BIN_DIR)/*

$(BIN_DIR)/%: $(CMD_DIR)/%/main.go
	$(Q)$(ECHO) "  GO" $@
	$(Q)$(CGO) $(GOBUILD) $(LDFLAGS) -o $@ $<
