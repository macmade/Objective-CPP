DIR_BUILD                = ./Build/
DIR_BUILD_TMP            = $(DIR_BUILD)Temp/
DIR_BUILD_TMP_CLASSES    = $(DIR_BUILD_TMP)Classes/
DIR_BUILD_TMP_CATEGORIES = $(DIR_BUILD_TMP)Categories/
DIR_BUILD_RELEASE        = $(DIR_BUILD)Release/
DIR_BUILD_TEST           = $(DIR_BUILD)Test/
DIR_SRC	                 = ./Source/
DIR_SRC_CLASSES          = $(DIR_SRC)Classes/
DIR_SRC_CATEGORIES       = $(DIR_SRC)Categories/
DIR_INC	                 = $(DIR_SRC)
DIR_INC_CLASSES          = $(DIR_SRC_CLASSES)
DIR_INC_CATEGORIES       = $(DIR_SRC_CATEGORIES)

EXT_CODE    = .mm
EXT_HEADERS = .h
EXT_OBJECT  = .o

CC  = clang++
RM  = rm

ARGS_RM = -rf
ARGS_CC = -Os -Wabi -Waddress-of-temporary -Waddress -Waggregate-return -Wall -Wambiguous-member-template -Warc-abi -Warc-non-pod-memaccess -Warc-retain-cycles -Warc-unsafe-retained-assign -Warc -Watomic-properties -Wattributes -Wavailability -Wbad-function-cast -Wbind-to-temporary-copy -Wbitwise-op-parentheses -Wbool-conversions -Wbuiltin-macro-redefined -Wc++-compat -Wc++0x-compat -Wc++0x-extensions -Wcast-align -Wcast-qual -Wchar-align -Wchar-subscripts -Wcomment -Wcomments -Wconditional-uninitialized -Wconversion -Wctor-dtor-privacy -Wcustom-atomic-properties -Wdeclaration-after-statement -Wdefault-arg-special-member -Wdelegating-ctor-cycles -Wdelete-non-virtual-dtor -Wdeprecated-declarations -Wdeprecated-implementations -Wdeprecated-writable-strings -Wdeprecated -Wdisabled-optimization -Wdiscard-qual -Wdiv-by-zero -Wduplicate-method-arg -Weffc++ -Wempty-body -Wendif-labels -Wextra-tokens -Wextra -Wformat-extra-args -Wformat-nonliteral -Wformat-zero-length -Wformat -Wformat=2 -Wfour-char-constants -Wglobal-constructors -Wgnu-designator -Wgnu -Wheader-hygiene -Widiomatic-parentheses -Wignored-qualifiers -Wimplicit-atomic-properties -Wimplicit-function-declaration -Wimplicit-int -Wimplicit -Wimport -Wincompatible-pointer-types -Winit-self -Winitializer-overrides -Winline -Wint-to-pointer-cast -Winvalid-offsetof -Winvalid-pch -Wliteral-range -Wlocal-type-template-args -Wlogical-op-parentheses -Wlong-long -Wmain -Wmicrosoft -Wmismatched-tags -Wmissing-braces -Wmissing-declarations -Wmissing-field-initializers -Wmissing-format-attribute -Wmissing-include-dirs -Wmissing-noreturn -Wmost -Wmultichar -Wnested-externs -Wnewline-eof -Wnon-gcc -Wnon-virtual-dtor -Wnonfragile-abi2 -Wnonnull -Wnull-dereference -Wobjc-nonunified-exceptions -Wold-style-cast -Wold-style-definition -Wout-of-line-declaration -Woverflow -Woverlength-strings -Woverloaded-virtual -Wpacked -Wparentheses -Wpointer-arith -Wpointer-to-int-cast -Wprotocol -Wreadonly-setter-attrs -Wredundant-decls -Wreorder -Wreturn-type -Wself-assign -Wsemicolon-before-method-body -Wsequence-point -Wshadow -Wshorten-64-to-32 -Wsign-compare -Wsign-promo -Wsizeof-array-argument -Wstack-protector -Wstrict-aliasing -Wstrict-overflow -Wstrict-prototypes -Wstrict-selector-match -Wsuper-class-method-mismatch -Wswitch-default -Wswitch-enum -Wswitch -Wsynth -Wtautological-compare -Wtrigraphs -Wtype-limits -Wundeclared-selector -Wuninitialized -Wunknown-pragmas -Wunnamed-type-template-args -Wunneeded-internal-declaration -Wunneeded-member-function -Wunused-argument -Wunused-exception-parameter -Wunused-function -Wunused-label -Wunused-member-function -Wunused-parameter -Wunused-value -Wunused-variable -Wunused -Wused-but-marked-unused -Wvector-conversions -Wvla -Wvolatile-register-var -Wwrite-strings

.SUFFIXES:
.SUFFIXES: $(EXT_CODE) $(EXT_HEADERS) $(EXT_OBJECT)

VPATH =
vpath
vpath %$(EXT_CODE) $(DIR_SRC)
vpath %$(EXT_CODE) $(DIR_SRC_CLASSES)
vpath %$(EXT_CODE) $(DIR_SRC_CATEGORIES)
vpath %$(EXT_HEADERS) $(DIR_SRC)
vpath %$(EXT_HEADERS) $(DIR_SRC_CLASSES)
vpath %$(EXT_HEADERS) $(DIR_SRC_CATEGORIES)
vpath %$(EXT_OBJECT) $(DIR_BUILD_TMP)

_FILES_SRC          = $(foreach dir,$(DIR_SRC),$(wildcard $(DIR_SRC)*$(EXT_CODE)))
_FILES_SRC_REL      = $(notdir $(_FILES_SRC))
_FILES_SRC_O        = $(subst $(EXT_CODE),$(EXT_OBJECT),$(_FILES_SRC_REL))
_FILES_SRC_O_BUILD  = $(addprefix $(DIR_BUILD_TMP),$(_FILES_SRC_O))

_FILES_SRC_CLASSES          = $(foreach dir,$(DIR_SRC_CLASSES),$(wildcard $(DIR_SRC_CLASSES)*$(EXT_CODE)))
_FILES_SRC_CLASSES_REL      = $(notdir $(_FILES_SRC_CLASSES))
_FILES_SRC_CLASSES_O        = $(subst $(EXT_CODE),$(EXT_OBJECT),$(_FILES_SRC_CLASSES_REL))
_FILES_SRC_CLASSES_O_BUILD  = $(addprefix $(DIR_BUILD_TMP_CLASSES),$(_FILES_SRC_CLASSES_O))

_FILES_SRC_CATEGORIES          = $(foreach dir,$(DIR_SRC_CATEGORIES),$(wildcard $(DIR_SRC_CATEGORIES)*$(EXT_CODE)))
_FILES_SRC_CATEGORIES_REL      = $(notdir $(_FILES_SRC_CATEGORIES))
_FILES_SRC_CATEGORIES_O        = $(subst $(EXT_CODE),$(EXT_OBJECT),$(_FILES_SRC_CATEGORIES_REL))
_FILES_SRC_CATEGORIES_O_BUILD  = $(addprefix $(DIR_BUILD_TMP_CATEGORIES),$(_FILES_SRC_CATEGORIES_O))

_ARGS_CC = -I $(DIR_INC) -I $(DIR_INC_CLASSES) -I $(DIR_INC_CATEGORIES) $(ARGS_CC)

.PHONY: clean all main test

all: $(_FILES_SRC_O_BUILD) $(_FILES_SRC_CLASSES_O_BUILD) $(_FILES_SRC_CATEGORIES_O_BUILD) main

test: all
	@$(DIR_BUILD_TEST)main
	
main:
	@$(CC) $(_ARGS_CC) -framework Foundation -o $(DIR_BUILD_TEST)main $(_FILES_SRC_O_BUILD) $(_FILES_SRC_CLASSES_O_BUILD) $(_FILES_SRC_CATEGORIES_O_BUILD)

clean:
	@echo "    *** Cleaning all build files..."
	@$(RM) $(ARGS_RM) $(DIR_BUILD_TMP)*$(EXT_OBJECT)
	@$(RM) $(ARGS_RM) $(DIR_BUILD_TMP_CLASSES)*$(EXT_OBJECT)
	@$(RM) $(ARGS_RM) $(DIR_BUILD_TMP_CATEGORIES)*$(EXT_OBJECT)
	
$(DIR_BUILD_TMP_CATEGORIES)%$(EXT_OBJECT): $(DIR_SRC_CATEGORIES)%$(EXT_CODE)
	@echo "    - Building object file:     "$(subst $(DIR_BUILD_TMP_CATEGORIES),"",$@)
	@$(CC) $(_ARGS_CC) -o $(DIR_BUILD_TMP_CATEGORIES)$(@F) -c $< $(CFLAGS)
	
$(DIR_BUILD_TMP_CLASSES)%$(EXT_OBJECT): $(DIR_SRC_CLASSES)%$(EXT_CODE)
	@echo "    - Building object file:     "$(subst $(DIR_BUILD_TMP_CLASSES),"",$@)
	@$(CC) $(_ARGS_CC) -o $(DIR_BUILD_TMP_CLASSES)$(@F) -c $< $(CFLAGS)
	
$(DIR_BUILD_TMP)%$(EXT_OBJECT): $(DIR_SRC)%$(EXT_CODE)
	@echo "    - Building object file:     "$(subst $(DIR_BUILD_TMP),"",$@)
	@$(CC) $(_ARGS_CC) -o $(DIR_BUILD_TMP)$(@F) -c $< $(CFLAGS)
