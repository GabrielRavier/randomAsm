#include <stdint.h>

struct exec
{
  unsigned long a_info; /* Use macros N_MAGIC, etc for access.  */
  unsigned int a_text;  /* Length of text, in bytes.  */
  unsigned int a_data;  /* Length of data, in bytes.  */
  unsigned int a_bss;   /* Length of uninitialized data area for file, in bytes.  */
  unsigned int a_syms;  /* Length of symbol table data in file, in bytes.  */
  unsigned int a_entry; /* Start address.  */
  unsigned int a_trsize;/* Length of relocation info for text, in bytes.  */
  unsigned int a_drsize;/* Length of relocation info for data, in bytes.  */
};

enum machine_type
{
  M_OLDSUN2 = 0,
  M_68010 = 1,
  M_68020 = 2,
  M_SPARC = 3,
  M_386 = 100,
  M_MIPS1 = 151,
  M_MIPS2 = 152
};

#define N_MAGIC(exec)   ((exec).a_info & 0xffff)
#define N_MACHTYPE(exec) ((enum machine_type)(((exec).a_info >> 16) & 0xff))
#define N_FLAGS(exec)   (((exec).a_info >> 24) & 0xff)
#define N_SET_INFO(exec, magic, type, flags) \
  ((exec).a_info = ((magic) & 0xffff)                                   \
   | (((int)(type) & 0xff) << 16)                                       \
   | (((flags) & 0xff) << 24))
#define N_SET_MAGIC(exec, magic) \
  ((exec).a_info = ((exec).a_info & 0xffff0000) | ((magic) & 0xffff))
#define N_SET_MACHTYPE(exec, machtype) \
  ((exec).a_info =                                                      \
   ((exec).a_info&0xff00ffff) | ((((int)(machtype))&0xff) << 16))
#define N_SET_FLAGS(exec, flags) \
  ((exec).a_info =                                                      \
   ((exec).a_info&0x00ffffff) | (((flags) & 0xff) << 24))

/* Code indicating object file or impure executable.  */
#define OMAGIC 0407
/* Code indicating pure executable.  */
#define NMAGIC 0410
/* Code indicating demand-paged executable.  */
#define ZMAGIC 0413
/* This indicates a demand-paged executable with the header in the text.
   The first page is unmapped to help trap NULL pointer references.  */
#define QMAGIC 0314
/* Code indicating core file.  */
#define CMAGIC 0421

#define N_TRSIZE(a)     ((a).a_trsize)
#define N_DRSIZE(a)     ((a).a_drsize)
#define N_SYMSIZE(a)    ((a).a_syms)
#define N_BADMAG(x) \
  (N_MAGIC(x) != OMAGIC && N_MAGIC(x) != NMAGIC                         \
   && N_MAGIC(x) != ZMAGIC && N_MAGIC(x) != QMAGIC)

typedef uint8_t u8;
typedef uint16_t u16;

u16 _N_MAGIC(const exec *p)
{
	return N_MAGIC(*p);
}

u8 _N_MACHTYPE(const exec *p)
{
	return N_MACHTYPE(*p);
}

u8 _N_FLAGS(const exec *p)
{
	return N_FLAGS(*p);
}

void _N_SET_INFO(exec *p, u16 magic, u8 type, u8 flags)
{
	N_SET_INFO(*p, magic, type, flags);
}

bool _N_BADMAG(const exec *p)
{
	return N_BADMAG(*p);
}
