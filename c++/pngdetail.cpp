#define __glibcxx_function_requires(...)
#define __glibcxx_class_requires(_a,_b)
#define __glibcxx_class_requires2(_a,_b,_c)
#define __glibcxx_class_requires3(_a,_b,_c,_d)
#define __glibcxx_class_requires4(_a,_b,_c,_d,_e)

#ifndef _GLIBCXX14_CONSTEXPR
# if __cplusplus >= 201402L
#  define _GLIBCXX14_CONSTEXPR constexpr
# else
#  define _GLIBCXX14_CONSTEXPR
# endif
#endif

namespace std
{
      /**
   *  @brief This does what you think it does.
   *  @ingroup sorting_algorithms
   *  @param  __a  A thing of arbitrary type.
   *  @param  __b  Another thing of arbitrary type.
   *  @return   The lesser of the parameters.
   *
   *  This is the simple classic generic implementation.  It will work on
   *  temporary expressions, since they are only evaluated once, unlike a
   *  preprocessor macro.
  */
  template<typename _Tp>
    _GLIBCXX14_CONSTEXPR
    inline const _Tp&
    min(const _Tp& __a, const _Tp& __b)
    {
      // concept requirements
      __glibcxx_function_requires(_LessThanComparableConcept<_Tp>)
      //return __b < __a ? __b : __a;
      if (__b < __a)
	return __b;
      return __a;
    }

  /**
   *  @brief This does what you think it does.
   *  @ingroup sorting_algorithms
   *  @param  __a  A thing of arbitrary type.
   *  @param  __b  Another thing of arbitrary type.
   *  @return   The greater of the parameters.
   *
   *  This is the simple classic generic implementation.  It will work on
   *  temporary expressions, since they are only evaluated once, unlike a
   *  preprocessor macro.
  */
  template<typename _Tp>
    _GLIBCXX14_CONSTEXPR
    inline const _Tp&
    max(const _Tp& __a, const _Tp& __b)
    {
      // concept requirements
      __glibcxx_function_requires(_LessThanComparableConcept<_Tp>)
      //return  __a < __b ? __b : __a;
      if (__a < __b)
	return __b;
      return __a;
    }

  /**
   *  @brief This does what you think it does.
   *  @ingroup sorting_algorithms
   *  @param  __a  A thing of arbitrary type.
   *  @param  __b  Another thing of arbitrary type.
   *  @param  __comp  A @link comparison_functors comparison functor@endlink.
   *  @return   The lesser of the parameters.
   *
   *  This will work on temporary expressions, since they are only evaluated
   *  once, unlike a preprocessor macro.
  */
  template<typename _Tp, typename _Compare>
    _GLIBCXX14_CONSTEXPR
    inline const _Tp&
    min(const _Tp& __a, const _Tp& __b, _Compare __comp)
    {
      //return __comp(__b, __a) ? __b : __a;
      if (__comp(__b, __a))
	return __b;
      return __a;
    }
}

#define LODEPNG_NO_COMPILE_CPP

#include <string.h> /*for size_t*/

extern const char* LODEPNG_VERSION_STRING;

#ifndef LODEPNG_NO_COMPILE_ZLIB
#define LODEPNG_COMPILE_ZLIB
#endif

/*png encoder and png decoder*/
#ifndef LODEPNG_NO_COMPILE_PNG
#define LODEPNG_COMPILE_PNG
#endif

/*deflate&zlib decoder and png decoder*/
#ifndef LODEPNG_NO_COMPILE_DECODER
#define LODEPNG_COMPILE_DECODER
#endif

/*deflate&zlib encoder and png encoder*/
#ifndef LODEPNG_NO_COMPILE_ENCODER
#define LODEPNG_COMPILE_ENCODER
#endif

/*the optional built in harddisk file loading and saving functions*/
#ifndef LODEPNG_NO_COMPILE_DISK
#define LODEPNG_COMPILE_DISK
#endif

/*support for chunks other than IHDR, IDAT, PLTE, tRNS, IEND: ancillary and unknown chunks*/
#ifndef LODEPNG_NO_COMPILE_ANCILLARY_CHUNKS
#define LODEPNG_COMPILE_ANCILLARY_CHUNKS
#endif

/*ability to convert error numerical codes to English text string*/
#ifndef LODEPNG_NO_COMPILE_ERROR_TEXT
#define LODEPNG_COMPILE_ERROR_TEXT
#endif

/*Compile the default allocators (C's free, malloc and realloc). If you disable this,
you can define the functions lodepng_free, lodepng_malloc and lodepng_realloc in your
source files with custom allocators.*/
#ifndef LODEPNG_NO_COMPILE_ALLOCATORS
#define LODEPNG_COMPILE_ALLOCATORS
#endif

/*compile the C++ version (you can disable the C++ wrapper here even when compiling for C++)*/
#ifdef __cplusplus
#ifndef LODEPNG_NO_COMPILE_CPP
#define LODEPNG_COMPILE_CPP
#endif
#endif

#ifdef LODEPNG_COMPILE_CPP
#endif /*LODEPNG_COMPILE_CPP*/

#ifdef LODEPNG_COMPILE_PNG
/*The PNG color types (also used for raw image).*/
typedef enum LodePNGColorType {
  LCT_GREY = 0, /*grayscale: 1,2,4,8,16 bit*/
  LCT_RGB = 2, /*RGB: 8,16 bit*/
  LCT_PALETTE = 3, /*palette: 1,2,4,8 bit*/
  LCT_GREY_ALPHA = 4, /*grayscale with alpha: 8,16 bit*/
  LCT_RGBA = 6, /*RGB with alpha: 8,16 bit*/
  /*LCT_MAX_OCTET_VALUE lets the compiler allow this enum to represent any invalid
  byte value from 0 to 255 that could be present in an invalid PNG file header. Do
  not use, compare with or set the name LCT_MAX_OCTET_VALUE, instead either use
  the valid color type names above, or numeric values like 1 or 7 when checking for
  particular disallowed color type byte values, or cast to integer to print it.*/
  LCT_MAX_OCTET_VALUE = 255
} LodePNGColorType;

#ifdef LODEPNG_COMPILE_DECODER
/*
Converts PNG data in memory to raw pixel data.
out: Output parameter. Pointer to buffer that will contain the raw pixel data.
     After decoding, its size is w * h * (bytes per pixel) bytes larger than
     initially. Bytes per pixel depends on colortype and bitdepth.
     Must be freed after usage with free(*out).
     Note: for 16-bit per channel colors, uses big endian format like PNG does.
w: Output parameter. Pointer to width of pixel data.
h: Output parameter. Pointer to height of pixel data.
in: Memory buffer with the PNG file.
insize: size of the in buffer.
colortype: the desired color type for the raw output image. See explanation on PNG color types.
bitdepth: the desired bit depth for the raw output image. See explanation on PNG color types.
Return value: LodePNG error code (0 means no error).
*/
unsigned lodepng_decode_memory(unsigned char** out, unsigned* w, unsigned* h,
                               const unsigned char* in, size_t insize,
                               LodePNGColorType colortype, unsigned bitdepth);

/*Same as lodepng_decode_memory, but always decodes to 32-bit RGBA raw image*/
unsigned lodepng_decode32(unsigned char** out, unsigned* w, unsigned* h,
                          const unsigned char* in, size_t insize);

/*Same as lodepng_decode_memory, but always decodes to 24-bit RGB raw image*/
unsigned lodepng_decode24(unsigned char** out, unsigned* w, unsigned* h,
                          const unsigned char* in, size_t insize);

#ifdef LODEPNG_COMPILE_DISK
/*
Load PNG from disk, from file with given name.
Same as the other decode functions, but instead takes a filename as input.
*/
unsigned lodepng_decode_file(unsigned char** out, unsigned* w, unsigned* h,
                             const char* filename,
                             LodePNGColorType colortype, unsigned bitdepth);

/*Same as lodepng_decode_file, but always decodes to 32-bit RGBA raw image.*/
unsigned lodepng_decode32_file(unsigned char** out, unsigned* w, unsigned* h,
                               const char* filename);

/*Same as lodepng_decode_file, but always decodes to 24-bit RGB raw image.*/
unsigned lodepng_decode24_file(unsigned char** out, unsigned* w, unsigned* h,
                               const char* filename);
#endif /*LODEPNG_COMPILE_DISK*/
#endif /*LODEPNG_COMPILE_DECODER*/


#ifdef LODEPNG_COMPILE_ENCODER
/*
Converts raw pixel data into a PNG image in memory. The colortype and bitdepth
  of the output PNG image cannot be chosen, they are automatically determined
  by the colortype, bitdepth and content of the input pixel data.
  Note: for 16-bit per channel colors, needs big endian format like PNG does.
out: Output parameter. Pointer to buffer that will contain the PNG image data.
     Must be freed after usage with free(*out).
outsize: Output parameter. Pointer to the size in bytes of the out buffer.
image: The raw pixel data to encode. The size of this buffer should be
       w * h * (bytes per pixel), bytes per pixel depends on colortype and bitdepth.
w: width of the raw pixel data in pixels.
h: height of the raw pixel data in pixels.
colortype: the color type of the raw input image. See explanation on PNG color types.
bitdepth: the bit depth of the raw input image. See explanation on PNG color types.
Return value: LodePNG error code (0 means no error).
*/
unsigned lodepng_encode_memory(unsigned char** out, size_t* outsize,
                               const unsigned char* image, unsigned w, unsigned h,
                               LodePNGColorType colortype, unsigned bitdepth);

/*Same as lodepng_encode_memory, but always encodes from 32-bit RGBA raw image.*/
unsigned lodepng_encode32(unsigned char** out, size_t* outsize,
                          const unsigned char* image, unsigned w, unsigned h);

/*Same as lodepng_encode_memory, but always encodes from 24-bit RGB raw image.*/
unsigned lodepng_encode24(unsigned char** out, size_t* outsize,
                          const unsigned char* image, unsigned w, unsigned h);

#ifdef LODEPNG_COMPILE_DISK
/*
Converts raw pixel data into a PNG file on disk.
Same as the other encode functions, but instead takes a filename as output.
NOTE: This overwrites existing files without warning!
*/
unsigned lodepng_encode_file(const char* filename,
                             const unsigned char* image, unsigned w, unsigned h,
                             LodePNGColorType colortype, unsigned bitdepth);

/*Same as lodepng_encode_file, but always encodes from 32-bit RGBA raw image.*/
unsigned lodepng_encode32_file(const char* filename,
                               const unsigned char* image, unsigned w, unsigned h);

/*Same as lodepng_encode_file, but always encodes from 24-bit RGB raw image.*/
unsigned lodepng_encode24_file(const char* filename,
                               const unsigned char* image, unsigned w, unsigned h);
#endif /*LODEPNG_COMPILE_DISK*/
#endif /*LODEPNG_COMPILE_ENCODER*/
#endif /*LODEPNG_COMPILE_PNG*/

#ifdef LODEPNG_COMPILE_ERROR_TEXT
/*Returns an English description of the numerical error code.*/
const char* lodepng_error_text(unsigned code);
#endif /*LODEPNG_COMPILE_ERROR_TEXT*/

#ifdef LODEPNG_COMPILE_DECODER
/*Settings for zlib decompression*/
typedef struct LodePNGDecompressSettings LodePNGDecompressSettings;
struct LodePNGDecompressSettings {
  /* Check LodePNGDecoderSettings for more ignorable errors such as ignore_crc */
  unsigned ignore_adler32; /*if 1, continue and don't give an error message if the Adler32 checksum is corrupted*/
  unsigned ignore_nlen; /*ignore complement of len checksum in uncompressed blocks*/

  /*use custom zlib decoder instead of built in one (default: null)*/
  unsigned (*custom_zlib)(unsigned char**, size_t*,
                          const unsigned char*, size_t,
                          const LodePNGDecompressSettings*);
  /*use custom deflate decoder instead of built in one (default: null)
  if custom_zlib is not null, custom_inflate is ignored (the zlib format uses deflate)*/
  unsigned (*custom_inflate)(unsigned char**, size_t*,
                             const unsigned char*, size_t,
                             const LodePNGDecompressSettings*);

  const void* custom_context; /*optional custom settings for custom functions*/
};

extern const LodePNGDecompressSettings lodepng_default_decompress_settings;
void lodepng_decompress_settings_init(LodePNGDecompressSettings* settings);
#endif /*LODEPNG_COMPILE_DECODER*/

#ifdef LODEPNG_COMPILE_ENCODER
/*
Settings for zlib compression. Tweaking these settings tweaks the balance
between speed and compression ratio.
*/
typedef struct LodePNGCompressSettings LodePNGCompressSettings;
struct LodePNGCompressSettings /*deflate = compress*/ {
  /*LZ77 related settings*/
  unsigned btype; /*the block type for LZ (0, 1, 2 or 3, see zlib standard). Should be 2 for proper compression.*/
  unsigned use_lz77; /*whether or not to use LZ77. Should be 1 for proper compression.*/
  unsigned windowsize; /*must be a power of two <= 32768. higher compresses more but is slower. Default value: 2048.*/
  unsigned minmatch; /*minimum lz77 length. 3 is normally best, 6 can be better for some PNGs. Default: 0*/
  unsigned nicematch; /*stop searching if >= this length found. Set to 258 for best compression. Default: 128*/
  unsigned lazymatching; /*use lazy matching: better compression but a bit slower. Default: true*/

  /*use custom zlib encoder instead of built in one (default: null)*/
  unsigned (*custom_zlib)(unsigned char**, size_t*,
                          const unsigned char*, size_t,
                          const LodePNGCompressSettings*);
  /*use custom deflate encoder instead of built in one (default: null)
  if custom_zlib is used, custom_deflate is ignored since only the built in
  zlib function will call custom_deflate*/
  unsigned (*custom_deflate)(unsigned char**, size_t*,
                             const unsigned char*, size_t,
                             const LodePNGCompressSettings*);

  const void* custom_context; /*optional custom settings for custom functions*/
};

extern const LodePNGCompressSettings lodepng_default_compress_settings;
void lodepng_compress_settings_init(LodePNGCompressSettings* settings);
#endif /*LODEPNG_COMPILE_ENCODER*/

#ifdef LODEPNG_COMPILE_PNG
/*
Color mode of an image. Contains all information required to decode the pixel
bits to RGBA colors. This information is the same as used in the PNG file
format, and is used both for PNG and raw image data in LodePNG.
*/
typedef struct LodePNGColorMode {
  /*header (IHDR)*/
  LodePNGColorType colortype; /*color type, see PNG standard or documentation further in this header file*/
  unsigned bitdepth;  /*bits per sample, see PNG standard or documentation further in this header file*/

  /*
  palette (PLTE and tRNS)

  Dynamically allocated with the colors of the palette, including alpha.
  This field may not be allocated directly, use lodepng_color_mode_init first,
  then lodepng_palette_add per color to correctly initialize it (to ensure size
  of exactly 1024 bytes).

  The alpha channels must be set as well, set them to 255 for opaque images.

  When decoding, by default you can ignore this palette, since LodePNG already
  fills the palette colors in the pixels of the raw RGBA output.

  The palette is only supported for color type 3.
  */
  unsigned char* palette; /*palette in RGBARGBA... order. When allocated, must be either 0, or have size 1024*/
  size_t palettesize; /*palette size in number of colors (amount of bytes is 4 * palettesize)*/

  /*
  transparent color key (tRNS)

  This color uses the same bit depth as the bitdepth value in this struct, which can be 1-bit to 16-bit.
  For grayscale PNGs, r, g and b will all 3 be set to the same.

  When decoding, by default you can ignore this information, since LodePNG sets
  pixels with this key to transparent already in the raw RGBA output.

  The color key is only supported for color types 0 and 2.
  */
  unsigned key_defined; /*is a transparent color key given? 0 = false, 1 = true*/
  unsigned key_r;       /*red/grayscale component of color key*/
  unsigned key_g;       /*green component of color key*/
  unsigned key_b;       /*blue component of color key*/
} LodePNGColorMode;

/*init, cleanup and copy functions to use with this struct*/
void lodepng_color_mode_init(LodePNGColorMode* info);
void lodepng_color_mode_cleanup(LodePNGColorMode* info);
/*return value is error code (0 means no error)*/
unsigned lodepng_color_mode_copy(LodePNGColorMode* dest, const LodePNGColorMode* source);
/* Makes a temporary LodePNGColorMode that does not need cleanup (no palette) */
LodePNGColorMode lodepng_color_mode_make(LodePNGColorType colortype, unsigned bitdepth);

void lodepng_palette_clear(LodePNGColorMode* info);
/*add 1 color to the palette*/
unsigned lodepng_palette_add(LodePNGColorMode* info,
                             unsigned char r, unsigned char g, unsigned char b, unsigned char a);

/*get the total amount of bits per pixel, based on colortype and bitdepth in the struct*/
unsigned lodepng_get_bpp(const LodePNGColorMode* info);
/*get the amount of color channels used, based on colortype in the struct.
If a palette is used, it counts as 1 channel.*/
unsigned lodepng_get_channels(const LodePNGColorMode* info);
/*is it a grayscale type? (only colortype 0 or 4)*/
unsigned lodepng_is_greyscale_type(const LodePNGColorMode* info);
/*has it got an alpha channel? (only colortype 2 or 6)*/
unsigned lodepng_is_alpha_type(const LodePNGColorMode* info);
/*has it got a palette? (only colortype 3)*/
unsigned lodepng_is_palette_type(const LodePNGColorMode* info);
/*only returns true if there is a palette and there is a value in the palette with alpha < 255.
Loops through the palette to check this.*/
unsigned lodepng_has_palette_alpha(const LodePNGColorMode* info);
/*
Check if the given color info indicates the possibility of having non-opaque pixels in the PNG image.
Returns true if the image can have translucent or invisible pixels (it still be opaque if it doesn't use such pixels).
Returns false if the image can only have opaque pixels.
In detail, it returns true only if it's a color type with alpha, or has a palette with non-opaque values,
or if "key_defined" is true.
*/
unsigned lodepng_can_have_alpha(const LodePNGColorMode* info);
/*Returns the byte size of a raw image buffer with given width, height and color mode*/
size_t lodepng_get_raw_size(unsigned w, unsigned h, const LodePNGColorMode* color);

#ifdef LODEPNG_COMPILE_ANCILLARY_CHUNKS
/*The information of a Time chunk in PNG.*/
typedef struct LodePNGTime {
  unsigned year;    /*2 bytes used (0-65535)*/
  unsigned month;   /*1-12*/
  unsigned day;     /*1-31*/
  unsigned hour;    /*0-23*/
  unsigned minute;  /*0-59*/
  unsigned second;  /*0-60 (to allow for leap seconds)*/
} LodePNGTime;
#endif /*LODEPNG_COMPILE_ANCILLARY_CHUNKS*/

/*Information about the PNG image, except pixels, width and height.*/
typedef struct LodePNGInfo {
  /*header (IHDR), palette (PLTE) and transparency (tRNS) chunks*/
  unsigned compression_method;/*compression method of the original file. Always 0.*/
  unsigned filter_method;     /*filter method of the original file*/
  unsigned interlace_method;  /*interlace method of the original file: 0=none, 1=Adam7*/
  LodePNGColorMode color;     /*color type and bits, palette and transparency of the PNG file*/

#ifdef LODEPNG_COMPILE_ANCILLARY_CHUNKS
  unsigned background_defined; /*is a suggested background color given?*/
  unsigned background_r;       /*red/gray/palette component of suggested background color*/
  unsigned background_g;       /*green component of suggested background color*/
  unsigned background_b;       /*blue component of suggested background color*/

  size_t text_num; /*the amount of texts in these char** buffers (there may be more texts in itext)*/
  char** text_keys; /*the keyword of a text chunk (e.g. "Comment")*/
  char** text_strings; /*the actual text*/

  /*
  international text chunks (iTXt)
  Similar to the non-international text chunks, but with additional strings
  "langtags" and "transkeys".
  */
  size_t itext_num; /*the amount of international texts in this PNG*/
  char** itext_keys; /*the English keyword of the text chunk (e.g. "Comment")*/
  char** itext_langtags; /*language tag for this text's language, ISO/IEC 646 string, e.g. ISO 639 language tag*/
  char** itext_transkeys; /*keyword translated to the international language - UTF-8 string*/
  char** itext_strings; /*the actual international text - UTF-8 string*/

  /*time chunk (tIME)*/
  unsigned time_defined; /*set to 1 to make the encoder generate a tIME chunk*/
  LodePNGTime time;

  /*phys chunk (pHYs)*/
  unsigned phys_defined; /*if 0, there is no pHYs chunk and the values below are undefined, if 1 else there is one*/
  unsigned phys_x; /*pixels per unit in x direction*/
  unsigned phys_y; /*pixels per unit in y direction*/
  unsigned phys_unit; /*may be 0 (unknown unit) or 1 (metre)*/

  /*
  Color profile related chunks: gAMA, cHRM, sRGB, iCPP

  LodePNG does not apply any color conversions on pixels in the encoder or decoder and does not interpret these color
  profile values. It merely passes on the information. If you wish to use color profiles and convert colors, please
  use these values with a color management library.

  See the PNG, ICC and sRGB specifications for more information about the meaning of these values.
  */

  /* gAMA chunk: optional, overridden by sRGB or iCCP if those are present. */
  unsigned gama_defined; /* Whether a gAMA chunk is present (0 = not present, 1 = present). */
  unsigned gama_gamma;   /* Gamma exponent times 100000 */

  /* cHRM chunk: optional, overridden by sRGB or iCCP if those are present. */
  unsigned chrm_defined; /* Whether a cHRM chunk is present (0 = not present, 1 = present). */
  unsigned chrm_white_x; /* White Point x times 100000 */
  unsigned chrm_white_y; /* White Point y times 100000 */
  unsigned chrm_red_x;   /* Red x times 100000 */
  unsigned chrm_red_y;   /* Red y times 100000 */
  unsigned chrm_green_x; /* Green x times 100000 */
  unsigned chrm_green_y; /* Green y times 100000 */
  unsigned chrm_blue_x;  /* Blue x times 100000 */
  unsigned chrm_blue_y;  /* Blue y times 100000 */

  /*
  sRGB chunk: optional. May not appear at the same time as iCCP.
  If gAMA is also present gAMA must contain value 45455.
  If cHRM is also present cHRM must contain respectively 31270,32900,64000,33000,30000,60000,15000,6000.
  */
  unsigned srgb_defined; /* Whether an sRGB chunk is present (0 = not present, 1 = present). */
  unsigned srgb_intent;  /* Rendering intent: 0=perceptual, 1=rel. colorimetric, 2=saturation, 3=abs. colorimetric */

  /*
  iCCP chunk: optional. May not appear at the same time as sRGB.

  LodePNG does not parse or use the ICC profile (except its color space header field for an edge case), a
  separate library to handle the ICC data (not included in LodePNG) format is needed to use it for color
  management and conversions.

  For encoding, if iCCP is present, gAMA and cHRM are recommended to be added as well with values that match the ICC
  profile as closely as possible, if you wish to do this you should provide the correct values for gAMA and cHRM and
  enable their '_defined' flags since LodePNG will not automatically compute them from the ICC profile.

  For encoding, the ICC profile is required by the PNG specification to be an "RGB" profile for non-gray
  PNG color types and a "GRAY" profile for gray PNG color types. If you disable auto_convert, you must ensure
  the ICC profile type matches your requested color type, else the encoder gives an error. If auto_convert is
  enabled (the default), and the ICC profile is not a good match for the pixel data, this will result in an encoder
  error if the pixel data has non-gray pixels for a GRAY profile, or a silent less-optimal compression of the pixel
  data if the pixels could be encoded as grayscale but the ICC profile is RGB.

  To avoid this do not set an ICC profile in the image unless there is a good reason for it, and when doing so
  make sure you compute it carefully to avoid the above problems.
  */
  unsigned iccp_defined;      /* Whether an iCCP chunk is present (0 = not present, 1 = present). */
  char* iccp_name;            /* Null terminated string with profile name, 1-79 bytes */
  /*
  The ICC profile in iccp_profile_size bytes.
  Don't allocate this buffer yourself. Use the init/cleanup functions
  correctly and use lodepng_set_icc and lodepng_clear_icc.
  */
  unsigned char* iccp_profile;
  unsigned iccp_profile_size; /* The size of iccp_profile in bytes */

  /* End of color profile related chunks */


  /*
  unknown chunks: chunks not known by LodePNG, passed on byte for byte.

  There are 3 buffers, one for each position in the PNG where unknown chunks can appear.
  Each buffer contains all unknown chunks for that position consecutively.
  The 3 positions are:
  0: between IHDR and PLTE, 1: between PLTE and IDAT, 2: between IDAT and IEND.

  For encoding, do not store critical chunks or known chunks that are enabled with a "_defined" flag
  above in here, since the encoder will blindly follow this and could then encode an invalid PNG file
  (such as one with two IHDR chunks or the disallowed combination of sRGB with iCCP). But do use
  this if you wish to store an ancillary chunk that is not supported by LodePNG (such as sPLT or hIST),
  or any non-standard PNG chunk.

  Do not allocate or traverse this data yourself. Use the chunk traversing functions declared
  later, such as lodepng_chunk_next and lodepng_chunk_append, to read/write this struct.
  */
  unsigned char* unknown_chunks_data[3];
  size_t unknown_chunks_size[3]; /*size in bytes of the unknown chunks, given for protection*/
#endif /*LODEPNG_COMPILE_ANCILLARY_CHUNKS*/
} LodePNGInfo;

/*init, cleanup and copy functions to use with this struct*/
void lodepng_info_init(LodePNGInfo* info);
void lodepng_info_cleanup(LodePNGInfo* info);
/*return value is error code (0 means no error)*/
unsigned lodepng_info_copy(LodePNGInfo* dest, const LodePNGInfo* source);

#ifdef LODEPNG_COMPILE_ANCILLARY_CHUNKS
unsigned lodepng_add_text(LodePNGInfo* info, const char* key, const char* str); /*push back both texts at once*/
void lodepng_clear_text(LodePNGInfo* info); /*use this to clear the texts again after you filled them in*/

unsigned lodepng_add_itext(LodePNGInfo* info, const char* key, const char* langtag,
                           const char* transkey, const char* str); /*push back the 4 texts of 1 chunk at once*/
void lodepng_clear_itext(LodePNGInfo* info); /*use this to clear the itexts again after you filled them in*/

/*replaces if exists*/
unsigned lodepng_set_icc(LodePNGInfo* info, const char* name, const unsigned char* profile, unsigned profile_size);
void lodepng_clear_icc(LodePNGInfo* info); /*use this to clear the texts again after you filled them in*/
#endif /*LODEPNG_COMPILE_ANCILLARY_CHUNKS*/

/*
Converts raw buffer from one color type to another color type, based on
LodePNGColorMode structs to describe the input and output color type.
See the reference manual at the end of this header file to see which color conversions are supported.
return value = LodePNG error code (0 if all went ok, an error if the conversion isn't supported)
The out buffer must have size (w * h * bpp + 7) / 8, where bpp is the bits per pixel
of the output color type (lodepng_get_bpp).
For < 8 bpp images, there should not be padding bits at the end of scanlines.
For 16-bit per channel colors, uses big endian format like PNG does.
Return value is LodePNG error code
*/
unsigned lodepng_convert(unsigned char* out, const unsigned char* in,
                         const LodePNGColorMode* mode_out, const LodePNGColorMode* mode_in,
                         unsigned w, unsigned h);

#ifdef LODEPNG_COMPILE_DECODER
/*
Settings for the decoder. This contains settings for the PNG and the Zlib
decoder, but not the Info settings from the Info structs.
*/
typedef struct LodePNGDecoderSettings {
  LodePNGDecompressSettings zlibsettings; /*in here is the setting to ignore Adler32 checksums*/

  /* Check LodePNGDecompressSettings for more ignorable errors such as ignore_adler32 */
  unsigned ignore_crc; /*ignore CRC checksums*/
  unsigned ignore_critical; /*ignore unknown critical chunks*/
  unsigned ignore_end; /*ignore issues at end of file if possible (missing IEND chunk, too large chunk, ...)*/
  /* TODO: make a system involving warnings with levels and a strict mode instead. Other potentially recoverable
     errors: srgb rendering intent value, size of content of ancillary chunks, more than 79 characters for some
     strings, placement/combination rules for ancillary chunks, crc of unknown chunks, allowed characters
     in string keys, etc... */

  unsigned color_convert; /*whether to convert the PNG to the color type you want. Default: yes*/

#ifdef LODEPNG_COMPILE_ANCILLARY_CHUNKS
  unsigned read_text_chunks; /*if false but remember_unknown_chunks is true, they're stored in the unknown chunks*/
  /*store all bytes from unknown chunks in the LodePNGInfo (off by default, useful for a png editor)*/
  unsigned remember_unknown_chunks;
#endif /*LODEPNG_COMPILE_ANCILLARY_CHUNKS*/
} LodePNGDecoderSettings;

void lodepng_decoder_settings_init(LodePNGDecoderSettings* settings);
#endif /*LODEPNG_COMPILE_DECODER*/

#ifdef LODEPNG_COMPILE_ENCODER
/*automatically use color type with less bits per pixel if losslessly possible. Default: AUTO*/
typedef enum LodePNGFilterStrategy {
  /*every filter at zero*/
  LFS_ZERO = 0,
  /*every filter at 1, 2, 3 or 4 (paeth), unlike LFS_ZERO not a good choice, but for testing*/
  LFS_ONE = 1,
  LFS_TWO = 2,
  LFS_THREE = 3,
  LFS_FOUR = 4,
  /*Use filter that gives minimum sum, as described in the official PNG filter heuristic.*/
  LFS_MINSUM,
  /*Use the filter type that gives smallest Shannon entropy for this scanline. Depending
  on the image, this is better or worse than minsum.*/
  LFS_ENTROPY,
  /*
  Brute-force-search PNG filters by compressing each filter for each scanline.
  Experimental, very slow, and only rarely gives better compression than MINSUM.
  */
  LFS_BRUTE_FORCE,
  /*use predefined_filters buffer: you specify the filter type for each scanline*/
  LFS_PREDEFINED
} LodePNGFilterStrategy;

/*Gives characteristics about the integer RGBA colors of the image (count, alpha channel usage, bit depth, ...),
which helps decide which color model to use for encoding.
Used internally by default if "auto_convert" is enabled. Public because it's useful for custom algorithms.*/
typedef struct LodePNGColorStats {
  unsigned colored; /*not grayscale*/
  unsigned key; /*image is not opaque and color key is possible instead of full alpha*/
  unsigned short key_r; /*key values, always as 16-bit, in 8-bit case the byte is duplicated, e.g. 65535 means 255*/
  unsigned short key_g;
  unsigned short key_b;
  unsigned alpha; /*image is not opaque and alpha channel or alpha palette required*/
  unsigned numcolors; /*amount of colors, up to 257. Not valid if bits == 16 or allow_palette is disabled.*/
  unsigned char palette[1024]; /*Remembers up to the first 256 RGBA colors, in no particular order, only valid when numcolors is valid*/
  unsigned bits; /*bits per channel (not for palette). 1,2 or 4 for grayscale only. 16 if 16-bit per channel required.*/
  size_t numpixels;

  /*user settings for computing/using the stats*/
  unsigned allow_palette; /*default 1. if 0, disallow choosing palette colortype in auto_choose_color, and don't count numcolors*/
  unsigned allow_greyscale; /*default 1. if 0, choose RGB or RGBA even if the image only has gray colors*/
} LodePNGColorStats;

void lodepng_color_stats_init(LodePNGColorStats* stats);

/*Get a LodePNGColorStats of the image. The stats must already have been inited.*/
void lodepng_compute_color_stats(LodePNGColorStats* stats,
                                 const unsigned char* image, unsigned w, unsigned h,
                                 const LodePNGColorMode* mode_in);

/*Settings for the encoder.*/
typedef struct LodePNGEncoderSettings {
  LodePNGCompressSettings zlibsettings; /*settings for the zlib encoder, such as window size, ...*/

  unsigned auto_convert; /*automatically choose output PNG color type. Default: true*/

  /*If true, follows the official PNG heuristic: if the PNG uses a palette or lower than
  8 bit depth, set all filters to zero. Otherwise use the filter_strategy. Note that to
  completely follow the official PNG heuristic, filter_palette_zero must be true and
  filter_strategy must be LFS_MINSUM*/
  unsigned filter_palette_zero;
  /*Which filter strategy to use when not using zeroes due to filter_palette_zero.
  Set filter_palette_zero to 0 to ensure always using your chosen strategy. Default: LFS_MINSUM*/
  LodePNGFilterStrategy filter_strategy;
  /*used if filter_strategy is LFS_PREDEFINED. In that case, this must point to a buffer with
  the same length as the amount of scanlines in the image, and each value must <= 5. You
  have to cleanup this buffer, LodePNG will never free it. Don't forget that filter_palette_zero
  must be set to 0 to ensure this is also used on palette or low bitdepth images.*/
  const unsigned char* predefined_filters;

  /*force creating a PLTE chunk if colortype is 2 or 6 (= a suggested palette).
  If colortype is 3, PLTE is _always_ created.*/
  unsigned force_palette;
#ifdef LODEPNG_COMPILE_ANCILLARY_CHUNKS
  /*add LodePNG identifier and version as a text chunk, for debugging*/
  unsigned add_id;
  /*encode text chunks as zTXt chunks instead of tEXt chunks, and use compression in iTXt chunks*/
  unsigned text_compression;
#endif /*LODEPNG_COMPILE_ANCILLARY_CHUNKS*/
} LodePNGEncoderSettings;

void lodepng_encoder_settings_init(LodePNGEncoderSettings* settings);
#endif /*LODEPNG_COMPILE_ENCODER*/


#if defined(LODEPNG_COMPILE_DECODER) || defined(LODEPNG_COMPILE_ENCODER)
/*The settings, state and information for extended encoding and decoding.*/
typedef struct LodePNGState {
#ifdef LODEPNG_COMPILE_DECODER
  LodePNGDecoderSettings decoder; /*the decoding settings*/
#endif /*LODEPNG_COMPILE_DECODER*/
#ifdef LODEPNG_COMPILE_ENCODER
  LodePNGEncoderSettings encoder; /*the encoding settings*/
#endif /*LODEPNG_COMPILE_ENCODER*/
  LodePNGColorMode info_raw; /*specifies the format in which you would like to get the raw pixel buffer*/
  LodePNGInfo info_png; /*info of the PNG image obtained after decoding*/
  unsigned error;
} LodePNGState;

/*init, cleanup and copy functions to use with this struct*/
void lodepng_state_init(LodePNGState* state);
void lodepng_state_cleanup(LodePNGState* state);
void lodepng_state_copy(LodePNGState* dest, const LodePNGState* source);
#endif /* defined(LODEPNG_COMPILE_DECODER) || defined(LODEPNG_COMPILE_ENCODER) */

#ifdef LODEPNG_COMPILE_DECODER
/*
Same as lodepng_decode_memory, but uses a LodePNGState to allow custom settings and
getting much more information about the PNG image and color mode.
*/
unsigned lodepng_decode(unsigned char** out, unsigned* w, unsigned* h,
                        LodePNGState* state,
                        const unsigned char* in, size_t insize);

/*
Read the PNG header, but not the actual data. This returns only the information
that is in the IHDR chunk of the PNG, such as width, height and color type. The
information is placed in the info_png field of the LodePNGState.
*/
unsigned lodepng_inspect(unsigned* w, unsigned* h,
                         LodePNGState* state,
                         const unsigned char* in, size_t insize);
#endif /*LODEPNG_COMPILE_DECODER*/

/*
Reads one metadata chunk (other than IHDR) of the PNG file and outputs what it
read in the state. Returns error code on failure.
Use lodepng_inspect first with a new state, then e.g. lodepng_chunk_find_const
to find the desired chunk type, and if non null use lodepng_inspect_chunk (with
chunk_pointer - start_of_file as pos).
Supports most metadata chunks from the PNG standard (gAMA, bKGD, tEXt, ...).
Ignores unsupported, unknown, non-metadata or IHDR chunks (without error).
Requirements: &in[pos] must point to start of a chunk, must use regular
lodepng_inspect first since format of most other chunks depends on IHDR, and if
there is a PLTE chunk, that one must be inspected before tRNS or bKGD.
*/
unsigned lodepng_inspect_chunk(LodePNGState* state, size_t pos,
                               const unsigned char* in, size_t insize);

#ifdef LODEPNG_COMPILE_ENCODER
/*This function allocates the out buffer with standard malloc and stores the size in *outsize.*/
unsigned lodepng_encode(unsigned char** out, size_t* outsize,
                        const unsigned char* image, unsigned w, unsigned h,
                        LodePNGState* state);
#endif /*LODEPNG_COMPILE_ENCODER*/

/*
The lodepng_chunk functions are normally not needed, except to traverse the
unknown chunks stored in the LodePNGInfo struct, or add new ones to it.
It also allows traversing the chunks of an encoded PNG file yourself.

The chunk pointer always points to the beginning of the chunk itself, that is
the first byte of the 4 length bytes.

In the PNG file format, chunks have the following format:
-4 bytes length: length of the data of the chunk in bytes (chunk itself is 12 bytes longer)
-4 bytes chunk type (ASCII a-z,A-Z only, see below)
-length bytes of data (may be 0 bytes if length was 0)
-4 bytes of CRC, computed on chunk name + data

The first chunk starts at the 8th byte of the PNG file, the entire rest of the file
exists out of concatenated chunks with the above format.

PNG standard chunk ASCII naming conventions:
-First byte: uppercase = critical, lowercase = ancillary
-Second byte: uppercase = public, lowercase = private
-Third byte: must be uppercase
-Fourth byte: uppercase = unsafe to copy, lowercase = safe to copy
*/

/*
Gets the length of the data of the chunk. Total chunk length has 12 bytes more.
There must be at least 4 bytes to read from. If the result value is too large,
it may be corrupt data.
*/
unsigned lodepng_chunk_length(const unsigned char* chunk);

/*puts the 4-byte type in null terminated string*/
void lodepng_chunk_type(char type[5], const unsigned char* chunk);

/*check if the type is the given type*/
unsigned char lodepng_chunk_type_equals(const unsigned char* chunk, const char* type);

/*0: it's one of the critical chunk types, 1: it's an ancillary chunk (see PNG standard)*/
unsigned char lodepng_chunk_ancillary(const unsigned char* chunk);

/*0: public, 1: private (see PNG standard)*/
unsigned char lodepng_chunk_private(const unsigned char* chunk);

/*0: the chunk is unsafe to copy, 1: the chunk is safe to copy (see PNG standard)*/
unsigned char lodepng_chunk_safetocopy(const unsigned char* chunk);

/*get pointer to the data of the chunk, where the input points to the header of the chunk*/
unsigned char* lodepng_chunk_data(unsigned char* chunk);
const unsigned char* lodepng_chunk_data_const(const unsigned char* chunk);

/*returns 0 if the crc is correct, 1 if it's incorrect (0 for OK as usual!)*/
unsigned lodepng_chunk_check_crc(const unsigned char* chunk);

/*generates the correct CRC from the data and puts it in the last 4 bytes of the chunk*/
void lodepng_chunk_generate_crc(unsigned char* chunk);

/*
Iterate to next chunks, allows iterating through all chunks of the PNG file.
Input must be at the beginning of a chunk (result of a previous lodepng_chunk_next call,
or the 8th byte of a PNG file which always has the first chunk), or alternatively may
point to the first byte of the PNG file (which is not a chunk but the magic header, the
function will then skip over it and return the first real chunk).
Expects at least 8 readable bytes of memory in the input pointer.
Will output pointer to the start of the next chunk or the end of the file if there
is no more chunk after this. Start this process at the 8th byte of the PNG file.
In a non-corrupt PNG file, the last chunk should have name "IEND".
*/
unsigned char* lodepng_chunk_next(unsigned char* chunk);
const unsigned char* lodepng_chunk_next_const(const unsigned char* chunk);

/*Finds the first chunk with the given type in the range [chunk, end), or returns NULL if not found.*/
unsigned char* lodepng_chunk_find(unsigned char* chunk, const unsigned char* end, const char type[5]);
const unsigned char* lodepng_chunk_find_const(const unsigned char* chunk, const unsigned char* end, const char type[5]);

/*
Appends chunk to the data in out. The given chunk should already have its chunk header.
The out variable and outlength are updated to reflect the new reallocated buffer.
Returns error code (0 if it went ok)
*/
unsigned lodepng_chunk_append(unsigned char** out, size_t* outlength, const unsigned char* chunk);

/*
Appends new chunk to out. The chunk to append is given by giving its length, type
and data separately. The type is a 4-letter string.
The out variable and outlength are updated to reflect the new reallocated buffer.
Returne error code (0 if it went ok)
*/
unsigned lodepng_chunk_create(unsigned char** out, size_t* outlength, unsigned length,
                              const char* type, const unsigned char* data);


/*Calculate CRC32 of buffer*/
unsigned lodepng_crc32(const unsigned char* buf, size_t len);
#endif /*LODEPNG_COMPILE_PNG*/


#ifdef LODEPNG_COMPILE_ZLIB
/*
This zlib part can be used independently to zlib compress and decompress a
buffer. It cannot be used to create gzip files however, and it only supports the
part of zlib that is required for PNG, it does not support dictionaries.
*/

#ifdef LODEPNG_COMPILE_DECODER
/*Inflate a buffer. Inflate is the decompression step of deflate. Out buffer must be freed after use.*/
unsigned lodepng_inflate(unsigned char** out, size_t* outsize,
                         const unsigned char* in, size_t insize,
                         const LodePNGDecompressSettings* settings);

/*
Decompresses Zlib data. Reallocates the out buffer and appends the data. The
data must be according to the zlib specification.
Either, *out must be NULL and *outsize must be 0, or, *out must be a valid
buffer and *outsize its size in bytes. out must be freed by user after usage.
*/
unsigned lodepng_zlib_decompress(unsigned char** out, size_t* outsize,
                                 const unsigned char* in, size_t insize,
                                 const LodePNGDecompressSettings* settings);
#endif /*LODEPNG_COMPILE_DECODER*/

#ifdef LODEPNG_COMPILE_ENCODER
/*
Compresses data with Zlib. Reallocates the out buffer and appends the data.
Zlib adds a small header and trailer around the deflate data.
The data is output in the format of the zlib specification.
Either, *out must be NULL and *outsize must be 0, or, *out must be a valid
buffer and *outsize its size in bytes. out must be freed by user after usage.
*/
unsigned lodepng_zlib_compress(unsigned char** out, size_t* outsize,
                               const unsigned char* in, size_t insize,
                               const LodePNGCompressSettings* settings);

/*
Find length-limited Huffman code for given frequencies. This function is in the
public interface only for tests, it's used internally by lodepng_deflate.
*/
unsigned lodepng_huffman_code_lengths(unsigned* lengths, const unsigned* frequencies,
                                      size_t numcodes, unsigned maxbitlen);

/*Compress a buffer with deflate. See RFC 1951. Out buffer must be freed after use.*/
unsigned lodepng_deflate(unsigned char** out, size_t* outsize,
                         const unsigned char* in, size_t insize,
                         const LodePNGCompressSettings* settings);

#endif /*LODEPNG_COMPILE_ENCODER*/
#endif /*LODEPNG_COMPILE_ZLIB*/

#ifdef LODEPNG_COMPILE_DISK
/*
Load a file from disk into buffer. The function allocates the out buffer, and
after usage you should free it.
out: output parameter, contains pointer to loaded buffer.
outsize: output parameter, size of the allocated out buffer
filename: the path to the file to load
return value: error code (0 means ok)
*/
unsigned lodepng_load_file(unsigned char** out, size_t* outsize, const char* filename);

/*
Save a file from buffer to disk. Warning, if it exists, this function overwrites
the file without warning!
buffer: the buffer to write
buffersize: size of the buffer to write
filename: the path to the file to save to
return value: error code (0 means ok)
*/
unsigned lodepng_save_file(const unsigned char* buffer, size_t buffersize, const char* filename);
#endif /*LODEPNG_COMPILE_DISK*/

namespace lodepng {

/*
Returns the value of the i-th pixel in an image with 1, 2, 4 or 8-bit color.
E.g. if bits is 4 and i is 5, it returns the 5th nibble (4-bit group), which
is the second half of the 3th byte, in big endian (PNG's endian order).
*/
int getPaletteValue(const unsigned char* data, size_t i, int bits);

#ifdef LODEPNG_COMPILE_ANCILLARY_CHUNKS

/* Similar to convertRGBModel, but the 'to' model is sRGB. The pixel format
of in and out must be the same and is given by state_in->info_raw. An
error may occur if the pixel format cannot contain the new colors (e.g. palette) */
unsigned convertToSrgb(unsigned char* out, const unsigned char* in,
                       unsigned w, unsigned h,
                       const LodePNGState* state_in);

/* Similar to convertRGBModel, but the 'from' model is sRGB. The pixel format
of in and out must be the same and is given by state_out->info_raw. An
error may occur if the pixel format cannot contain the new colors (e.g. palette) */
unsigned convertFromSrgb(unsigned char* out, const unsigned char* in,
                         unsigned w, unsigned h,
                         const LodePNGState* state_out);

/*
Converts from one RGB model to another RGB model.
Similar to calling convertToXYZ followed by convertFromXYZ, but may be
more efficient and more precise (e.g. no computation needed when both models
are the same). See their documentation for more info.

Parameters:

*) out: output pixel data
*) in: input pixel data
*) w, h: image size
*) state_out: output RGB color model in state_out->info_png and byte format in state_out->info_raw.
*) state_in: output RGB color model in state_in->info_png and byte format in state_in->info_raw
*) return value: 0 if ok, positive value if error
*) rendering_intent: 1 for relative, 3 for absolute, should be relative for standard behavior.
   See description at convertFromXYZ.
*/
unsigned convertRGBModel(unsigned char* out, const unsigned char* in,
                         unsigned w, unsigned h,
                         const LodePNGState* state_out,
                         const LodePNGState* state_in,
                         unsigned rendering_intent);

/*
Converts the RGB color to the absolute XYZ color space given the RGB color profile
chunks in the PNG info.

Color space here refers to the different possible RGB spaces with different
possible chromaticities or whitepoint and XYZ color from colorimetry, not the
LodePNGColorType that describes the byte based encoding.

You need this function only if the PNG could contain data in an arbitrary RGB
color space and you wish to output to a display or format that does not provide
color management for you (so you need to convert rather than pass on the profile
to it) but expects a certain RGB format (e.g. sRGB). See the background info below.

Supports the gAMA, cHRM, sRGB and iCCP colorimetry chunks. If no colometry chunks are present
(that is, in state->info_png, the fields gama_defined, chrm_defined, srgb_defined and
iccp_defined are all 0), it assumes the format is sRGB.
For more information, see the chunk specifications in the PNG specification.

Some background:

A PNG image contains RGB data inside, but this data may use a specific RGB model (by default sRGB but
different if colorimetry chunks are given).
The computer display and/or operating system can have another RGB model (typically sRGB, or wider gamut
or HDR formats).

The PNG chunks describe what format the data inside has, not the format of the display. To correctly
display a PNG image on a display, a conversion is needed from the PNG model to the display model if their
models differ. Some options to achieve that are:
*) If your use case already supports color management on its own, you can give it the RGB values straight from
   the PNG image and give it the information from the cHRM, gAMA, sRGB and iCCP chunks (which you can find
   in the LodePNGInfo), and the color management should then handle it correctly for you. You don't need
   this function here in that case.
*) If your use case does not support color management, you may instead want to give it the RGB values in a
   consistent color model, such as sRGB, but the PNG does not necessarily have it in this desired model.
   In that case, use the function below (or a similar one from a CMS library if you prefer) to convert it to
   the absolute color space XYZ, and then you can convert it to the target RGB with the counterpart convertFromXYZ
   further below.

Parameters:

*) out: 4 floats per pixel, X,Y,Z,alpha color format, in range 0-1 (normally, not clipped if beyond), must
   be allocated to have 4 * w * h floats available.
*) whitepoint: output argument, the whitepoint the original RGB data used, given in absolute XYZ. Needed for
   relative rendering intents: give these values to counterpart function convertFromXYZ.
*) in: input RGB color, in byte format given by state->info_raw and RGB color profile given by info->info_png
*) w, h: image size
*) state (when using a LodePNG decode function that takes a LodePNGState parameter, can directly use that one):
   state->info_png: PNG info with possibly an RGB color model in cHRM,gAMA and/or sRGB chunks
   state->info_raw: byte format of in (amount of channels, bit depth)
*) return value: 0 if ok, positive value if error
*/
unsigned convertToXYZ(float* out, float whitepoint[3],
                      const unsigned char* in, unsigned w, unsigned h,
                      const LodePNGState* state);

/*
Same as convertToXYZ but takes floating point input. Slower.
The main black..white range in 0..1. Does not clip values that are outside that range.
*/
unsigned convertToXYZFloat(float* out, float whitepoint[3], const float* in,
                           unsigned w, unsigned h, const LodePNGState* state);

/*
Converts XYZ to RGB in the RGB color model given by info and byte format by mode_out.
If info has no coloremtry chunks, converts to sRGB.
Parameters:
*) out: output color in byte format given by state->info_raw and RGB color profile given
   by info->info_png. Must have enough bytes allocated to contain pixels in the given byte format.
*) in: 4 floats per pixel, X,Y,Z,alpha color format, in range 0-1 (normally).
*) whitepoint: input argument, the original whitepoint in absolute XYZ that the pixel data
   in "in" had back when it was in a previous RGB space. Needed to preserve the whitepoint
   in the new target RGB space for relative rendering intent.
*) rendering_intent: the desired rendering intent, with numeric meaning matching the
   values used by ICC: 0=perceptual, 1=relative, 2=saturation, 3=absolute.
   Should be 1 for normal use cases, it adapts white to match that of different RGB
   models which is the best practice. Using 3 may change the color of white and may
   turn grayscale into colors of a certain tone. Using 0 and 2 will have the same
   effect as 1 because using those requires more data than the matrix-based RGB profiles
   supporetd here have.
*) w, h: image size
*) state:
   state->info_png: PNG info with possibly an RGB color profile in cHRM,gAMA and/or sRGB chunks
   state->info_raw: byte format of out (amount of channels, bit depth)
*) return value: 0 if ok, positive value if error
*/
unsigned convertFromXYZ(unsigned char* out, const float* in, unsigned w, unsigned h,
                        const LodePNGState* state,
                        const float whitepoint[3], unsigned rendering_intent);

/*
Same as convertFromXYZ but outputs the RGB colors in floating point.
The main black..white range in 0..1. Does not clip values that are outside that range.
*/
unsigned convertFromXYZFloat(float* out, const float* in, unsigned w, unsigned h,
                             const LodePNGState* state,
                             const float whitepoint[3], unsigned rendering_intent);
#endif /*LODEPNG_COMPILE_ANCILLARY_CHUNKS*/

} // namespace lodepng

enum RenderMode {
  RM_ASCII,
  RM_HEX, // CSS
  RM_HEX16,
  RM_PAL // palette indices (only rendered if image is palette based)
};

// for displaying ICC profile
enum HexFormat {
  HF_HEX,
  HF_MIX // hex and ascii
};

struct Options {
  bool verbose;
  bool expand_long_texts;
  bool show_one_line_summary; //show filesize, pixels and color type on single line
  bool show_header; // show only info from the IHDR chunk
  bool show_errors;
  bool show_icc_details; // show ICC color profile details
  bool show_icc_hex; // show ICC color profile in full
  bool show_color_stats;
  bool show_png_info; //show things like filesize, width, height, palette size, ...
  bool show_palette; //show all palette values
  bool show_palette_pixels; //show palette indices of pixels

  HexFormat hexformat;

  bool show_render;
  RenderMode rendermode;
  int rendersize;

  bool show_chunks; //show the PNG chunk names and their lengths
  bool show_chunks2; //alternate form to print chunks
  bool show_filters; //show the PNG filter of each scanline (not supported for interlaced PNGs currently)
  bool zlib_info; //show basic zlib info
  bool zlib_blocks; //show type, tree info, code length summaries and sizes for each zlib block
  bool zlib_counts; //in addition to the zlib_blocks info, show counts of occurrences all symbols
  bool zlib_full; //in addition to the zlib_blocks info, show all symbols, one per line (huge output)
  bool use_hex; //show some sizes or positions in hexadecimal

  Options() : verbose(false), expand_long_texts(false),
              show_one_line_summary(false), show_header(false), show_errors(false),
              show_icc_details(false), show_icc_hex(false),
              show_color_stats(false), show_png_info(false),
              show_palette(false), show_palette_pixels(false),
              hexformat(HF_MIX), show_render(false), rendermode(RM_ASCII), rendersize(80),
              show_chunks(false), show_chunks2(false), show_filters(false),
              zlib_info(false), zlib_blocks(false), zlib_counts(false), zlib_full(false), use_hex(false) {
  }
};


/*void RGBtoHSL(unsigned char r, unsigned char g, unsigned char b, unsigned char* h, unsigned char* s, unsigned char* l) {
  int cmax = std::max<int>(r, std::max<int>(g, b));
  int cmin = std::min<int>(r, std::min<int>(g, b));
  if(cmin == cmax) {
    *h = *s = 0;
    *l = r;
  } else {
    int sum = cmin + cmax;
    int diff = cmax - cmin;
    *l = sum / 2;
    *s = 255 * diff / ((*l < 128) ? sum : (512 - sum));
    int hi = (r == cmax) ? (255 * (g - b) / diff) : ((g == cmax) ? (512 + 255 * (b - r) / diff) : (1024 + 255 * (r - g) / diff));
    *h = ((hi / 6) & 255);
  }
}

/*void RGBtoHCT(unsigned char r, unsigned char g, unsigned char b, unsigned char* h, unsigned char* c, unsigned char* t) {
  int cmax = std::max<int>(r, std::max<int>(g, b));
  int cmin = std::min<int>(r, std::min<int>(g, b));
  RGBtoHSL(r, g, b, h, c, t);
  *c = cmax - cmin;
  *t = *c == 255 ? 0 : 255 * cmin / (255 + cmin - cmax);
}

// add 32 to get small letter instead of capital
/*char HueToLetter(int h) {
  char hl = 'R';
  // 12 unique hue letters for 30 degree increment hues.
  if(h < 11 || h >= 244) hl = 'R';  // red
  else if(h >= 11 && h < 32) hl = 'O';  // orange
  else if(h >= 32 && h < 53) hl = 'Y';  // yellow
  else if(h >= 53 && h < 74) hl = 'L';  // lime (officialy "chartreuse" but c is for cyan)
  else if(h >= 74 && h < 96) hl = 'G';  // green
  else if(h >= 96 && h < 117) hl = 'T';  // turquoise (officially "spring green" but that name overlaps green)
  else if(h >= 117 && h < 138) hl = 'C';  // cyan
  else if(h >= 138 && h < 159) hl = 'A';  // azure
  else if(h >= 159 && h < 181) hl = 'B';  // blue
  else if(h >= 181 && h < 202) hl = 'V';  // violet
  else if(h >= 202 && h < 223) hl = 'M';  // magenta
  else if(h >= 223 && h < 244) hl = 'F';  // fuchsia (officially "rose" but r is for red)
  return hl;
}

/*char lightnessToLetter(int l) {
  int c = ' ';
  if(l < 16) c = ' ';
  else if(l < 48) c = '.';
  else if(l < 80) c = ':';
  else if(l < 112) c = '-';
  else if(l < 144) c = '!';
  else if(l < 176) c = '*';
  else if(l < 208) c = '+'; // The + looks denser than the * in a terminal...
  else if(l < 240) c = '=';
  else c = '#';
  return c;
}

// Both v and result are assumed in range 0-255
// range is the size of an individual bucket. A value in roughly range [-range/2, range/2) can get added to v.
// E.g. if there are 12 hue letters, give 255/12 = 21 as range
/*int applyDither(int v, int range, int x, int y, bool wrap) {
  // ordered dithering pattern; ranges from 0-15, so multiply with 17 to have 0-255
  static constexpr int pattern[16] = {0,8,2,10,
                                  12,4,14,6,
                                  3,11,1,9,
                                  15,7,13,5};
  int d = pattern[(x & 3) + 4 * (y & 3)] * 17 - 128; // range: -128 to 127
  if(wrap) return (v + d * range / 256) & 255;
  else return std::max(0, std::min(255, v + d * range / 256));
}

// x and y are to use for dithering
// inverted inverts black and white, for in case black text on white background is used (by default it assumes white text on black background)
/*char RGBtoLetter(unsigned char r, unsigned char g, unsigned char b, unsigned char a, unsigned x, unsigned y, bool dither = true, bool inverted = false) {
  if(a < 255) {
    r = a * r / 255;
    g = a * g / 255;
    b = a * b / 255;
  }

  if(dither) {
    unsigned char h, c, t;
    RGBtoHCT(r, g, b, &h, &c, &t);
    int l = (std::max(std::max(r, g), b) + std::min(std::min(r, g), b)) / 2;
    if(inverted) {
      l = 255 - l;
      t = 255 - t;
    }
    if(applyDither(c, 254, x, y, false) >= 128) {
      char letter = HueToLetter(applyDither(h, 21, x, y, true));
      bool smallcaps = applyDither(l, 64, x+2, y+2, false) < 80;
      return letter + (smallcaps ? 32 : 0);
    }
    else return lightnessToLetter(applyDither(l, 31, x, y, false));
  } else {
    unsigned char h, s, l;
    RGBtoHSL(r, g, b, &h, &s, &l);
    if(inverted) l = 255 - l;

    char hl = HueToLetter(h);
    char c = ' ';
    if(l < 24 || l > 232 || s < 64) {
      c = lightnessToLetter(l);
    } else {
      if(l < 128) c = hl + 32;
      else c = hl;
    }
    return c;
  }
}

/*unsigned getICCUint16(const unsigned char* icc, size_t size, size_t pos) {
  if (pos + 2 > size) return 0;
  return (unsigned)((icc[pos] << 8) | (icc[pos + 1]));
}

/*unsigned getICCUint32(const unsigned char* icc, size_t size, size_t pos) {
  if (pos + 4 > size) return 0;
  return (unsigned)((icc[pos] << 24) | (icc[pos + 1] << 16) | (icc[pos + 2] << 8) | (icc[pos + 3] << 0));
}

/*int getICCInt32(const unsigned char* icc, size_t size, size_t pos) {
  if (pos + 4 > size) return 0;
  return (int)((icc[pos] << 24) | (icc[pos + 1] << 16) | (icc[pos + 2] << 8) | (icc[pos + 3] << 0));
}

// Signed
/*float getICC15Fixed16(const unsigned char* icc, size_t size, size_t pos) {
  return getICCInt32(icc, size, pos) / 65536.0;
}

// Unsigned
/*float getICC16Fixed16(const unsigned char* icc, size_t size, size_t pos) {
  return getICCUint32(icc, size, pos) / 65536.0;
}

*/
