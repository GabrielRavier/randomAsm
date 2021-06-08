#include <stdint.h>
#include <limits.h>

#define main asmMain
//#define putchar _putchar

using v = void;
using u16 = uint16_t;
using u8 = uint8_t;

struct _IO_FILE;

/* The opaque type of streams.  This is the definition used elsewhere.  */
typedef struct _IO_FILE FILE;

/* Output, if appropriate, a usage message for STATE to STREAM.  FLAGS are
   from the set ARGP_HELP_*.  */
extern void argp_state_help (const struct argp_state *__restrict __state,
							 FILE *__restrict __stream,
							 unsigned int __flags);
extern void __argp_state_help (const struct argp_state *__restrict __state,
							   FILE *__restrict __stream,
							   unsigned int __flags);

/* Standard streams.  */
extern FILE *stdin;		/* Standard input stream.  */
extern FILE *stdout;		/* Standard output stream.  */
extern FILE *stderr;		/* Standard error output stream.  */
/* C89/C99 say they're macros.  Make them happy.  */
#define stdin stdin
#define stdout stdout
#define stderr stderr

/* Flags for argp_help.  */
#define ARGP_HELP_USAGE		0x01 /* a Usage: message. */
#define ARGP_HELP_SHORT_USAGE	0x02 /*  " but don't actually print options. */
#define ARGP_HELP_SEE		0x04 /* a `Try ... for more help' message. */
#define ARGP_HELP_LONG		0x08 /* a long help message. */
#define ARGP_HELP_PRE_DOC	0x10 /* doc string preceding long help.  */
#define ARGP_HELP_POST_DOC	0x20 /* doc string following long help.  */
#define ARGP_HELP_DOC		(ARGP_HELP_PRE_DOC | ARGP_HELP_POST_DOC)
#define ARGP_HELP_BUG_ADDR	0x40 /* bug report address */
#define ARGP_HELP_LONG_ONLY	0x80 /* modify output appropriately to
					reflect ARGP_LONG_ONLY mode.  */

/* These ARGP_HELP flags are only understood by argp_state_help.  */
#define ARGP_HELP_EXIT_ERR	0x100 /* Call exit(1) instead of returning.  */
#define ARGP_HELP_EXIT_OK	0x200 /* Call exit(0) instead of returning.  */

/* The standard thing to do after a program command line parsing error, if an
   error message has already been printed.  */
#define ARGP_HELP_STD_ERR \
  (ARGP_HELP_SEE | ARGP_HELP_EXIT_ERR)
/* The standard thing to do after a program command line parsing error, if no
   more specific error message has been printed.  */
#define ARGP_HELP_STD_USAGE \
  (ARGP_HELP_SHORT_USAGE | ARGP_HELP_SEE | ARGP_HELP_EXIT_ERR)

  struct argp_option
{
  /* The long option name.  For more than one name for the same option, you
	 can use following options with the OPTION_ALIAS flag set.  */
  const char *name;

  /* What key is returned for this option.  If > 0 and printable, then it's
	 also accepted as a short option.  */
  int key;

  /* If non-NULL, this is the name of the argument associated with this
	 option, which is required unless the OPTION_ARG_OPTIONAL flag is set. */
  const char *arg;

  /* OPTION_ flags.  */
  int flags;

  /* The doc string for this option.  If both NAME and KEY are 0, This string
	 will be printed outdented from the normal option column, making it
	 useful as a group header (it will be the first thing printed in its
	 group); in this usage, it's conventional to end the string with a `:'.  */
  const char *doc;

  /* The group this option is in.  In a long help message, options are sorted
	 alphabetically within each group, and the groups presented in the order
	 0, 1, 2, ..., n, -m, ..., -2, -1.  Every entry in an options array with
	 if this field 0 will inherit the group number of the previous entry, or
	 zero if it's the first one, unless its a group header (NAME and KEY both
	 0), in which case, the previous entry + 1 is the default.  Automagic
	 options such as --help are put into group -1.  */
  int group;
};


/* The argument associated with this option is optional.  */
#define OPTION_ARG_OPTIONAL	0x1

/* This option isn't displayed in any help messages.  */
#define OPTION_HIDDEN	       	0x2

/* This option is an alias for the closest previous non-alias option.  This
   means that it will be displayed in the same help entry, and will inherit
   fields other than NAME and KEY from the aliased option.  */
#define OPTION_ALIAS		0x4

/* This option isn't actually an option (and so should be ignored by the
   actual option parser), but rather an arbitrary piece of documentation that
   should be displayed in much the same manner as the options.  If this flag
   is set, then the option NAME field is displayed unmodified (e.g., no `--'
   prefix is added) at the left-margin (where a *short* option would normally
   be displayed), and the documentation string in the normal place.  For
   purposes of sorting, any leading whitespace and punctuation is ignored,
   except that if the first non-whitespace character is not `-', this entry
   is displayed after all options (and OPTION_DOC entries with a leading `-')
   in the same group.  */
#define OPTION_DOC		0x8


#define __THROW

#define	__exctype(name)	extern int name (int) __THROW

/* The following names are all functions:
	 int isCHARACTERISTIC(int c);
   which return nonzero iff C has CHARACTERISTIC.
   For the meaning of the characteristic names, see the `enum' above.  */
__exctype (isalnum);
__exctype (isalpha);
__exctype (iscntrl);
__exctype (isdigit);
__exctype (islower);
__exctype (isgraph);
__exctype (isprint);
__exctype (ispunct);
__exctype (isspace);
__exctype (isupper);
__exctype (isxdigit);

#define __NTH(x) x

void
__argp_usage (const struct argp_state *__state)
{
  __argp_state_help (__state, stderr, ARGP_HELP_STD_USAGE);
}

int
__NTH (__option_is_short (const struct argp_option *__opt))
{
  if (__opt->flags & OPTION_DOC)
	return 0;
  else
	{
	  int __key = __opt->key;
	  return __key > 0 && __key <= UCHAR_MAX && isprint (__key);
	}
}

int
__NTH (__option_is_end (const struct argp_option *__opt))
{
  return !__opt->key && !__opt->name && !__opt->doc && !__opt->group;
}
