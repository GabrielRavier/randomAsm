/*
LodePNG Utils

Copyright (c) 2005-2019 Lode Vandevenne

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

    1. The origin of this software must not be misrepresented; you must not
    claim that you wrote the original software. If you use this software
    in a product, an acknowledgment in the product documentation would be
    appreciated but is not required.

    2. Altered source versions must be plainly marked as such, and must not be
    misrepresented as being the original software.

    3. This notice may not be removed or altered from any source
    distribution.
*/

/*
LodePNG Utils

Copyright (c) 2005-2019 Lode Vandevenne

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

    1. The origin of this software must not be misrepresented; you must not
    claim that you wrote the original software. If you use this software
    in a product, an acknowledgment in the product documentation would be
    appreciated but is not required.

    2. Altered source versions must be plainly marked as such, and must not be
    misrepresented as being the original software.

    3. This notice may not be removed or altered from any source
    distribution.
*/

/*
Extra C++ utilities for LodePNG, for convenience.
Not part of the stable API of lodepng, more loose separate utils.
*/

#ifndef LODEPNG_UTIL_H
#define LODEPNG_UTIL_H

#include <string>
#include <vector>
/*
LodePNG version 20191219

Copyright (c) 2005-2019 Lode Vandevenne

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

    1. The origin of this software must not be misrepresented; you must not
    claim that you wrote the original software. If you use this software
    in a product, an acknowledgment in the product documentation would be
    appreciated but is not required.

    2. Altered source versions must be plainly marked as such, and must not be
    misrepresented as being the original software.

    3. This notice may not be removed or altered from any source
    distribution.
*/

#ifndef LODEPNG_H
#define LODEPNG_H

#include <string.h> /*for size_t*/

extern const char* LODEPNG_VERSION_STRING;

/*
The following #defines are used to create code sections. They can be disabled
to disable code sections, which can give faster compile time and smaller binary.
The "NO_COMPILE" defines are designed to be used to pass as defines to the
compiler command to disable them without modifying this header, e.g.
-DLODEPNG_NO_COMPILE_ZLIB for gcc.
In addition to those below, you can also define LODEPNG_NO_COMPILE_CRC to
allow implementing a custom lodepng_crc32.
*/
/*deflate & zlib. If disabled, you must specify alternative zlib functions in
the custom_zlib field of the compress and decompress settings*/
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
#include <vector>
#include <string>
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


#ifdef LODEPNG_COMPILE_CPP
namespace lodepng {
#ifdef LODEPNG_COMPILE_DECODER
/*Same as lodepng_decode_memory, but decodes to an std::vector. The colortype
is the format to output the pixels to. Default is RGBA 8-bit per channel.*/
unsigned decode(std::vector<unsigned char>& out, unsigned& w, unsigned& h,
                const unsigned char* in, size_t insize,
                LodePNGColorType colortype = LCT_RGBA, unsigned bitdepth = 8);
unsigned decode(std::vector<unsigned char>& out, unsigned& w, unsigned& h,
                const std::vector<unsigned char>& in,
                LodePNGColorType colortype = LCT_RGBA, unsigned bitdepth = 8);
#ifdef LODEPNG_COMPILE_DISK
/*
Converts PNG file from disk to raw pixel data in memory.
Same as the other decode functions, but instead takes a filename as input.
*/
unsigned decode(std::vector<unsigned char>& out, unsigned& w, unsigned& h,
                const std::string& filename,
                LodePNGColorType colortype = LCT_RGBA, unsigned bitdepth = 8);
#endif /* LODEPNG_COMPILE_DISK */
#endif /* LODEPNG_COMPILE_DECODER */

#ifdef LODEPNG_COMPILE_ENCODER
/*Same as lodepng_encode_memory, but encodes to an std::vector. colortype
is that of the raw input data. The output PNG color type will be auto chosen.*/
unsigned encode(std::vector<unsigned char>& out,
                const unsigned char* in, unsigned w, unsigned h,
                LodePNGColorType colortype = LCT_RGBA, unsigned bitdepth = 8);
unsigned encode(std::vector<unsigned char>& out,
                const std::vector<unsigned char>& in, unsigned w, unsigned h,
                LodePNGColorType colortype = LCT_RGBA, unsigned bitdepth = 8);
#ifdef LODEPNG_COMPILE_DISK
/*
Converts 32-bit RGBA raw pixel data into a PNG file on disk.
Same as the other encode functions, but instead takes a filename as output.
NOTE: This overwrites existing files without warning!
*/
unsigned encode(const std::string& filename,
                const unsigned char* in, unsigned w, unsigned h,
                LodePNGColorType colortype = LCT_RGBA, unsigned bitdepth = 8);
unsigned encode(const std::string& filename,
                const std::vector<unsigned char>& in, unsigned w, unsigned h,
                LodePNGColorType colortype = LCT_RGBA, unsigned bitdepth = 8);
#endif /* LODEPNG_COMPILE_DISK */
#endif /* LODEPNG_COMPILE_ENCODER */
} /* namespace lodepng */
#endif /*LODEPNG_COMPILE_CPP*/
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
  /*
  Suggested background color chunk (bKGD)

  This uses the same color mode and bit depth as the PNG (except no alpha channel),
  with values truncated to the bit depth in the unsigned integer.

  For grayscale and palette PNGs, the value is stored in background_r. The values
  in background_g and background_b are then unused.

  So when decoding, you may get these in a different color mode than the one you requested
  for the raw pixels.

  When encoding with auto_convert, you must use the color model defined in info_png.color for
  these values. The encoder normally ignores info_png.color when auto_convert is on, but will
  use it to interpret these values (and convert copies of them to its chosen color model).

  When encoding, avoid setting this to an expensive color, such as a non-gray value
  when the image is gray, or the compression will be worse since it will be forced to
  write the PNG with a more expensive color mode (when auto_convert is on).

  The decoder does not use this background color to edit the color of pixels. This is a
  completely optional metadata feature.
  */
  unsigned background_defined; /*is a suggested background color given?*/
  unsigned background_r;       /*red/gray/palette component of suggested background color*/
  unsigned background_g;       /*green component of suggested background color*/
  unsigned background_b;       /*blue component of suggested background color*/

  /*
  non-international text chunks (tEXt and zTXt)

  The char** arrays each contain num strings. The actual messages are in
  text_strings, while text_keys are keywords that give a short description what
  the actual text represents, e.g. Title, Author, Description, or anything else.

  All the string fields below including keys, names and language tags are null terminated.
  The PNG specification uses null characters for the keys, names and tags, and forbids null
  characters to appear in the main text which is why we can use null termination everywhere here.

  A keyword is minimum 1 character and maximum 79 characters long. It's
  discouraged to use a single line length longer than 79 characters for texts.

  Don't allocate these text buffers yourself. Use the init/cleanup functions
  correctly and use lodepng_add_text and lodepng_clear_text.
  */
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

#ifdef LODEPNG_COMPILE_CPP
/* The LodePNG C++ wrapper uses std::vectors instead of manually allocated memory buffers. */
namespace lodepng {
#ifdef LODEPNG_COMPILE_PNG
class State : public LodePNGState {
  public:
    State();
    State(const State& other);
    ~State();
    State& operator=(const State& other);
};

#ifdef LODEPNG_COMPILE_DECODER
/* Same as other lodepng::decode, but using a State for more settings and information. */
unsigned decode(std::vector<unsigned char>& out, unsigned& w, unsigned& h,
                State& state,
                const unsigned char* in, size_t insize);
unsigned decode(std::vector<unsigned char>& out, unsigned& w, unsigned& h,
                State& state,
                const std::vector<unsigned char>& in);
#endif /*LODEPNG_COMPILE_DECODER*/

#ifdef LODEPNG_COMPILE_ENCODER
/* Same as other lodepng::encode, but using a State for more settings and information. */
unsigned encode(std::vector<unsigned char>& out,
                const unsigned char* in, unsigned w, unsigned h,
                State& state);
unsigned encode(std::vector<unsigned char>& out,
                const std::vector<unsigned char>& in, unsigned w, unsigned h,
                State& state);
#endif /*LODEPNG_COMPILE_ENCODER*/

#ifdef LODEPNG_COMPILE_DISK
/*
Load a file from disk into an std::vector.
return value: error code (0 means ok)
*/
unsigned load_file(std::vector<unsigned char>& buffer, const std::string& filename);

/*
Save the binary data in an std::vector to a file on disk. The file is overwritten
without warning.
*/
unsigned save_file(const std::vector<unsigned char>& buffer, const std::string& filename);
#endif /* LODEPNG_COMPILE_DISK */
#endif /* LODEPNG_COMPILE_PNG */

#ifdef LODEPNG_COMPILE_ZLIB
#ifdef LODEPNG_COMPILE_DECODER
/* Zlib-decompress an unsigned char buffer */
unsigned decompress(std::vector<unsigned char>& out, const unsigned char* in, size_t insize,
                    const LodePNGDecompressSettings& settings = lodepng_default_decompress_settings);

/* Zlib-decompress an std::vector */
unsigned decompress(std::vector<unsigned char>& out, const std::vector<unsigned char>& in,
                    const LodePNGDecompressSettings& settings = lodepng_default_decompress_settings);
#endif /* LODEPNG_COMPILE_DECODER */

#ifdef LODEPNG_COMPILE_ENCODER
/* Zlib-compress an unsigned char buffer */
unsigned compress(std::vector<unsigned char>& out, const unsigned char* in, size_t insize,
                  const LodePNGCompressSettings& settings = lodepng_default_compress_settings);

/* Zlib-compress an std::vector */
unsigned compress(std::vector<unsigned char>& out, const std::vector<unsigned char>& in,
                  const LodePNGCompressSettings& settings = lodepng_default_compress_settings);
#endif /* LODEPNG_COMPILE_ENCODER */
#endif /* LODEPNG_COMPILE_ZLIB */
} /* namespace lodepng */
#endif /*LODEPNG_COMPILE_CPP*/

/*
TODO:
[.] test if there are no memory leaks or security exploits - done a lot but needs to be checked often
[.] check compatibility with various compilers  - done but needs to be redone for every newer version
[X] converting color to 16-bit per channel types
[X] support color profile chunk types (but never let them touch RGB values by default)
[ ] support all public PNG chunk types (almost done except sBIT, sPLT and hIST)
[ ] make sure encoder generates no chunks with size > (2^31)-1
[ ] partial decoding (stream processing)
[X] let the "isFullyOpaque" function check color keys and transparent palettes too
[X] better name for the variables "codes", "codesD", "codelengthcodes", "clcl" and "lldl"
[ ] allow treating some errors like warnings, when image is recoverable (e.g. 69, 57, 58)
[ ] make warnings like: oob palette, checksum fail, data after iend, wrong/unknown crit chunk, no null terminator in text, ...
[ ] error messages with line numbers (and version)
[ ] errors in state instead of as return code?
[ ] new errors/warnings like suspiciously big decompressed ztxt or iccp chunk
[ ] let the C++ wrapper catch exceptions coming from the standard library and return LodePNG error codes
[ ] allow user to provide custom color conversion functions, e.g. for premultiplied alpha, padding bits or not, ...
[ ] allow user to give data (void*) to custom allocator
[ ] provide alternatives for C library functions not present on some platforms (memcpy, ...)
[ ] rename "grey" to "gray" everywhere since "color" also uses US spelling (keep "grey" copies for backwards compatibility)
*/

#endif /*LODEPNG_H inclusion guard*/

/*
LodePNG Documentation
---------------------

0. table of contents
--------------------

  1. about
   1.1. supported features
   1.2. features not supported
  2. C and C++ version
  3. security
  4. decoding
  5. encoding
  6. color conversions
    6.1. PNG color types
    6.2. color conversions
    6.3. padding bits
    6.4. A note about 16-bits per channel and endianness
  7. error values
  8. chunks and PNG editing
  9. compiler support
  10. examples
   10.1. decoder C++ example
   10.2. decoder C example
  11. state settings reference
  12. changes
  13. contact information


1. about
--------

PNG is a file format to store raster images losslessly with good compression,
supporting different color types and alpha channel.

LodePNG is a PNG codec according to the Portable Network Graphics (PNG)
Specification (Second Edition) - W3C Recommendation 10 November 2003.

The specifications used are:

*) Portable Network Graphics (PNG) Specification (Second Edition):
     http://www.w3.org/TR/2003/REC-PNG-20031110
*) RFC 1950 ZLIB Compressed Data Format version 3.3:
     http://www.gzip.org/zlib/rfc-zlib.html
*) RFC 1951 DEFLATE Compressed Data Format Specification ver 1.3:
     http://www.gzip.org/zlib/rfc-deflate.html

The most recent version of LodePNG can currently be found at
http://lodev.org/lodepng/

LodePNG works both in C (ISO C90) and C++, with a C++ wrapper that adds
extra functionality.

LodePNG exists out of two files:
-lodepng.h: the header file for both C and C++
-lodepng.c(pp): give it the name lodepng.c or lodepng.cpp (or .cc) depending on your usage

If you want to start using LodePNG right away without reading this doc, get the
examples from the LodePNG website to see how to use it in code, or check the
smaller examples in chapter 13 here.

LodePNG is simple but only supports the basic requirements. To achieve
simplicity, the following design choices were made: There are no dependencies
on any external library. There are functions to decode and encode a PNG with
a single function call, and extended versions of these functions taking a
LodePNGState struct allowing to specify or get more information. By default
the colors of the raw image are always RGB or RGBA, no matter what color type
the PNG file uses. To read and write files, there are simple functions to
convert the files to/from buffers in memory.

This all makes LodePNG suitable for loading textures in games, demos and small
programs, ... It's less suitable for full fledged image editors, loading PNGs
over network (it requires all the image data to be available before decoding can
begin), life-critical systems, ...

1.1. supported features
-----------------------

The following features are supported by the decoder:

*) decoding of PNGs with any color type, bit depth and interlace mode, to a 24- or 32-bit color raw image,
   or the same color type as the PNG
*) encoding of PNGs, from any raw image to 24- or 32-bit color, or the same color type as the raw image
*) Adam7 interlace and deinterlace for any color type
*) loading the image from harddisk or decoding it from a buffer from other sources than harddisk
*) support for alpha channels, including RGBA color model, translucent palettes and color keying
*) zlib decompression (inflate)
*) zlib compression (deflate)
*) CRC32 and ADLER32 checksums
*) colorimetric color profile conversions: currently experimentally available in lodepng_util.cpp only,
   plus alternatively ability to pass on chroma/gamma/ICC profile information to other color management system.
*) handling of unknown chunks, allowing making a PNG editor that stores custom and unknown chunks.
*) the following chunks are supported by both encoder and decoder:
    IHDR: header information
    PLTE: color palette
    IDAT: pixel data
    IEND: the final chunk
    tRNS: transparency for palettized images
    tEXt: textual information
    zTXt: compressed textual information
    iTXt: international textual information
    bKGD: suggested background color
    pHYs: physical dimensions
    tIME: modification time
    cHRM: RGB chromaticities
    gAMA: RGB gamma correction
    iCCP: ICC color profile
    sRGB: rendering intent

1.2. features not supported
---------------------------

The following features are _not_ supported:

*) some features needed to make a conformant PNG-Editor might be still missing.
*) partial loading/stream processing. All data must be available and is processed in one call.
*) The following public chunks are not (yet) supported but treated as unknown chunks by LodePNG:
    sBIT
    hIST
    sPLT


2. C and C++ version
--------------------

The C version uses buffers allocated with alloc that you need to free()
yourself. You need to use init and cleanup functions for each struct whenever
using a struct from the C version to avoid exploits and memory leaks.

The C++ version has extra functions with std::vectors in the interface and the
lodepng::State class which is a LodePNGState with constructor and destructor.

These files work without modification for both C and C++ compilers because all
the additional C++ code is in "#ifdef __cplusplus" blocks that make C-compilers
ignore it, and the C code is made to compile both with strict ISO C90 and C++.

To use the C++ version, you need to rename the source file to lodepng.cpp
(instead of lodepng.c), and compile it with a C++ compiler.

To use the C version, you need to rename the source file to lodepng.c (instead
of lodepng.cpp), and compile it with a C compiler.


3. Security
-----------

Even if carefully designed, it's always possible that LodePNG contains possible
exploits. If you discover one, please let me know, and it will be fixed.

When using LodePNG, care has to be taken with the C version of LodePNG, as well
as the C-style structs when working with C++. The following conventions are used
for all C-style structs:

-if a struct has a corresponding init function, always call the init function when making a new one
-if a struct has a corresponding cleanup function, call it before the struct disappears to avoid memory leaks
-if a struct has a corresponding copy function, use the copy function instead of "=".
 The destination must also be inited already.


4. Decoding
-----------

Decoding converts a PNG compressed image to a raw pixel buffer.

Most documentation on using the decoder is at its declarations in the header
above. For C, simple decoding can be done with functions such as
lodepng_decode32, and more advanced decoding can be done with the struct
LodePNGState and lodepng_decode. For C++, all decoding can be done with the
various lodepng::decode functions, and lodepng::State can be used for advanced
features.

When using the LodePNGState, it uses the following fields for decoding:
*) LodePNGInfo info_png: it stores extra information about the PNG (the input) in here
*) LodePNGColorMode info_raw: here you can say what color mode of the raw image (the output) you want to get
*) LodePNGDecoderSettings decoder: you can specify a few extra settings for the decoder to use

LodePNGInfo info_png
--------------------

After decoding, this contains extra information of the PNG image, except the actual
pixels, width and height because these are already gotten directly from the decoder
functions.

It contains for example the original color type of the PNG image, text comments,
suggested background color, etc... More details about the LodePNGInfo struct are
at its declaration documentation.

LodePNGColorMode info_raw
-------------------------

When decoding, here you can specify which color type you want
the resulting raw image to be. If this is different from the colortype of the
PNG, then the decoder will automatically convert the result. This conversion
always works, except if you want it to convert a color PNG to grayscale or to
a palette with missing colors.

By default, 32-bit color is used for the result.

LodePNGDecoderSettings decoder
------------------------------

The settings can be used to ignore the errors created by invalid CRC and Adler32
chunks, and to disable the decoding of tEXt chunks.

There's also a setting color_convert, true by default. If false, no conversion
is done, the resulting data will be as it was in the PNG (after decompression)
and you'll have to puzzle the colors of the pixels together yourself using the
color type information in the LodePNGInfo.


5. Encoding
-----------

Encoding converts a raw pixel buffer to a PNG compressed image.

Most documentation on using the encoder is at its declarations in the header
above. For C, simple encoding can be done with functions such as
lodepng_encode32, and more advanced decoding can be done with the struct
LodePNGState and lodepng_encode. For C++, all encoding can be done with the
various lodepng::encode functions, and lodepng::State can be used for advanced
features.

Like the decoder, the encoder can also give errors. However it gives less errors
since the encoder input is trusted, the decoder input (a PNG image that could
be forged by anyone) is not trusted.

When using the LodePNGState, it uses the following fields for encoding:
*) LodePNGInfo info_png: here you specify how you want the PNG (the output) to be.
*) LodePNGColorMode info_raw: here you say what color type of the raw image (the input) has
*) LodePNGEncoderSettings encoder: you can specify a few settings for the encoder to use

LodePNGInfo info_png
--------------------

When encoding, you use this the opposite way as when decoding: for encoding,
you fill in the values you want the PNG to have before encoding. By default it's
not needed to specify a color type for the PNG since it's automatically chosen,
but it's possible to choose it yourself given the right settings.

The encoder will not always exactly match the LodePNGInfo struct you give,
it tries as close as possible. Some things are ignored by the encoder. The
encoder uses, for example, the following settings from it when applicable:
colortype and bitdepth, text chunks, time chunk, the color key, the palette, the
background color, the interlace method, unknown chunks, ...

When encoding to a PNG with colortype 3, the encoder will generate a PLTE chunk.
If the palette contains any colors for which the alpha channel is not 255 (so
there are translucent colors in the palette), it'll add a tRNS chunk.

LodePNGColorMode info_raw
-------------------------

You specify the color type of the raw image that you give to the input here,
including a possible transparent color key and palette you happen to be using in
your raw image data.

By default, 32-bit color is assumed, meaning your input has to be in RGBA
format with 4 bytes (unsigned chars) per pixel.

LodePNGEncoderSettings encoder
------------------------------

The following settings are supported (some are in sub-structs):
*) auto_convert: when this option is enabled, the encoder will
automatically choose the smallest possible color mode (including color key) that
can encode the colors of all pixels without information loss.
*) btype: the block type for LZ77. 0 = uncompressed, 1 = fixed huffman tree,
   2 = dynamic huffman tree (best compression). Should be 2 for proper
   compression.
*) use_lz77: whether or not to use LZ77 for compressed block types. Should be
   true for proper compression.
*) windowsize: the window size used by the LZ77 encoder (1 - 32768). Has value
   2048 by default, but can be set to 32768 for better, but slow, compression.
*) force_palette: if colortype is 2 or 6, you can make the encoder write a PLTE
   chunk if force_palette is true. This can used as suggested palette to convert
   to by viewers that don't support more than 256 colors (if those still exist)
*) add_id: add text chunk "Encoder: LodePNG <version>" to the image.
*) text_compression: default 1. If 1, it'll store texts as zTXt instead of tEXt chunks.
  zTXt chunks use zlib compression on the text. This gives a smaller result on
  large texts but a larger result on small texts (such as a single program name).
  It's all tEXt or all zTXt though, there's no separate setting per text yet.


6. color conversions
--------------------

An important thing to note about LodePNG, is that the color type of the PNG, and
the color type of the raw image, are completely independent. By default, when
you decode a PNG, you get the result as a raw image in the color type you want,
no matter whether the PNG was encoded with a palette, grayscale or RGBA color.
And if you encode an image, by default LodePNG will automatically choose the PNG
color type that gives good compression based on the values of colors and amount
of colors in the image. It can be configured to let you control it instead as
well, though.

To be able to do this, LodePNG does conversions from one color mode to another.
It can convert from almost any color type to any other color type, except the
following conversions: RGB to grayscale is not supported, and converting to a
palette when the palette doesn't have a required color is not supported. This is
not supported on purpose: this is information loss which requires a color
reduction algorithm that is beyond the scope of a PNG encoder (yes, RGB to gray
is easy, but there are multiple ways if you want to give some channels more
weight).

By default, when decoding, you get the raw image in 32-bit RGBA or 24-bit RGB
color, no matter what color type the PNG has. And by default when encoding,
LodePNG automatically picks the best color model for the output PNG, and expects
the input image to be 32-bit RGBA or 24-bit RGB. So, unless you want to control
the color format of the images yourself, you can skip this chapter.

6.1. PNG color types
--------------------

A PNG image can have many color types, ranging from 1-bit color to 64-bit color,
as well as palettized color modes. After the zlib decompression and unfiltering
in the PNG image is done, the raw pixel data will have that color type and thus
a certain amount of bits per pixel. If you want the output raw image after
decoding to have another color type, a conversion is done by LodePNG.

The PNG specification gives the following color types:

0: grayscale, bit depths 1, 2, 4, 8, 16
2: RGB, bit depths 8 and 16
3: palette, bit depths 1, 2, 4 and 8
4: grayscale with alpha, bit depths 8 and 16
6: RGBA, bit depths 8 and 16

Bit depth is the amount of bits per pixel per color channel. So the total amount
of bits per pixel is: amount of channels * bitdepth.

6.2. color conversions
----------------------

As explained in the sections about the encoder and decoder, you can specify
color types and bit depths in info_png and info_raw to change the default
behaviour.

If, when decoding, you want the raw image to be something else than the default,
you need to set the color type and bit depth you want in the LodePNGColorMode,
or the parameters colortype and bitdepth of the simple decoding function.

If, when encoding, you use another color type than the default in the raw input
image, you need to specify its color type and bit depth in the LodePNGColorMode
of the raw image, or use the parameters colortype and bitdepth of the simple
encoding function.

If, when encoding, you don't want LodePNG to choose the output PNG color type
but control it yourself, you need to set auto_convert in the encoder settings
to false, and specify the color type you want in the LodePNGInfo of the
encoder (including palette: it can generate a palette if auto_convert is true,
otherwise not).

If the input and output color type differ (whether user chosen or auto chosen),
LodePNG will do a color conversion, which follows the rules below, and may
sometimes result in an error.

To avoid some confusion:
-the decoder converts from PNG to raw image
-the encoder converts from raw image to PNG
-the colortype and bitdepth in LodePNGColorMode info_raw, are those of the raw image
-the colortype and bitdepth in the color field of LodePNGInfo info_png, are those of the PNG
-when encoding, the color type in LodePNGInfo is ignored if auto_convert
 is enabled, it is automatically generated instead
-when decoding, the color type in LodePNGInfo is set by the decoder to that of the original
 PNG image, but it can be ignored since the raw image has the color type you requested instead
-if the color type of the LodePNGColorMode and PNG image aren't the same, a conversion
 between the color types is done if the color types are supported. If it is not
 supported, an error is returned. If the types are the same, no conversion is done.
-even though some conversions aren't supported, LodePNG supports loading PNGs from any
 colortype and saving PNGs to any colortype, sometimes it just requires preparing
 the raw image correctly before encoding.
-both encoder and decoder use the same color converter.

The function lodepng_convert does the color conversion. It is available in the
interface but normally isn't needed since the encoder and decoder already call
it.

Non supported color conversions:
-color to grayscale when non-gray pixels are present: no error is thrown, but
the result will look ugly because only the red channel is taken (it assumes all
three channels are the same in this case so ignores green and blue). The reason
no error is given is to allow converting from three-channel grayscale images to
one-channel even if there are numerical imprecisions.
-anything to palette when the palette does not have an exact match for a from-color
in it: in this case an error is thrown

Supported color conversions:
-anything to 8-bit RGB, 8-bit RGBA, 16-bit RGB, 16-bit RGBA
-any gray or gray+alpha, to gray or gray+alpha
-anything to a palette, as long as the palette has the requested colors in it
-removing alpha channel
-higher to smaller bitdepth, and vice versa

If you want no color conversion to be done (e.g. for speed or control):
-In the encoder, you can make it save a PNG with any color type by giving the
raw color mode and LodePNGInfo the same color mode, and setting auto_convert to
false.
-In the decoder, you can make it store the pixel data in the same color type
as the PNG has, by setting the color_convert setting to false. Settings in
info_raw are then ignored.

6.3. padding bits
-----------------

In the PNG file format, if a less than 8-bit per pixel color type is used and the scanlines
have a bit amount that isn't a multiple of 8, then padding bits are used so that each
scanline starts at a fresh byte. But that is NOT true for the LodePNG raw input and output.
The raw input image you give to the encoder, and the raw output image you get from the decoder
will NOT have these padding bits, e.g. in the case of a 1-bit image with a width
of 7 pixels, the first pixel of the second scanline will the 8th bit of the first byte,
not the first bit of a new byte.

6.4. A note about 16-bits per channel and endianness
----------------------------------------------------

LodePNG uses unsigned char arrays for 16-bit per channel colors too, just like
for any other color format. The 16-bit values are stored in big endian (most
significant byte first) in these arrays. This is the opposite order of the
little endian used by x86 CPU's.

LodePNG always uses big endian because the PNG file format does so internally.
Conversions to other formats than PNG uses internally are not supported by
LodePNG on purpose, there are myriads of formats, including endianness of 16-bit
colors, the order in which you store R, G, B and A, and so on. Supporting and
converting to/from all that is outside the scope of LodePNG.

This may mean that, depending on your use case, you may want to convert the big
endian output of LodePNG to little endian with a for loop. This is certainly not
always needed, many applications and libraries support big endian 16-bit colors
anyway, but it means you cannot simply cast the unsigned char* buffer to an
unsigned short* buffer on x86 CPUs.


7. error values
---------------

All functions in LodePNG that return an error code, return 0 if everything went
OK, or a non-zero code if there was an error.

The meaning of the LodePNG error values can be retrieved with the function
lodepng_error_text: given the numerical error code, it returns a description
of the error in English as a string.

Check the implementation of lodepng_error_text to see the meaning of each code.


8. chunks and PNG editing
-------------------------

If you want to add extra chunks to a PNG you encode, or use LodePNG for a PNG
editor that should follow the rules about handling of unknown chunks, or if your
program is able to read other types of chunks than the ones handled by LodePNG,
then that's possible with the chunk functions of LodePNG.

A PNG chunk has the following layout:

4 bytes length
4 bytes type name
length bytes data
4 bytes CRC

8.1. iterating through chunks
-----------------------------

If you have a buffer containing the PNG image data, then the first chunk (the
IHDR chunk) starts at byte number 8 of that buffer. The first 8 bytes are the
signature of the PNG and are not part of a chunk. But if you start at byte 8
then you have a chunk, and can check the following things of it.

NOTE: none of these functions check for memory buffer boundaries. To avoid
exploits, always make sure the buffer contains all the data of the chunks.
When using lodepng_chunk_next, make sure the returned value is within the
allocated memory.

unsigned lodepng_chunk_length(const unsigned char* chunk):

Get the length of the chunk's data. The total chunk length is this length + 12.

void lodepng_chunk_type(char type[5], const unsigned char* chunk):
unsigned char lodepng_chunk_type_equals(const unsigned char* chunk, const char* type):

Get the type of the chunk or compare if it's a certain type

unsigned char lodepng_chunk_critical(const unsigned char* chunk):
unsigned char lodepng_chunk_private(const unsigned char* chunk):
unsigned char lodepng_chunk_safetocopy(const unsigned char* chunk):

Check if the chunk is critical in the PNG standard (only IHDR, PLTE, IDAT and IEND are).
Check if the chunk is private (public chunks are part of the standard, private ones not).
Check if the chunk is safe to copy. If it's not, then, when modifying data in a critical
chunk, unsafe to copy chunks of the old image may NOT be saved in the new one if your
program doesn't handle that type of unknown chunk.

unsigned char* lodepng_chunk_data(unsigned char* chunk):
const unsigned char* lodepng_chunk_data_const(const unsigned char* chunk):

Get a pointer to the start of the data of the chunk.

unsigned lodepng_chunk_check_crc(const unsigned char* chunk):
void lodepng_chunk_generate_crc(unsigned char* chunk):

Check if the crc is correct or generate a correct one.

unsigned char* lodepng_chunk_next(unsigned char* chunk):
const unsigned char* lodepng_chunk_next_const(const unsigned char* chunk):

Iterate to the next chunk. This works if you have a buffer with consecutive chunks. Note that these
functions do no boundary checking of the allocated data whatsoever, so make sure there is enough
data available in the buffer to be able to go to the next chunk.

unsigned lodepng_chunk_append(unsigned char** out, size_t* outlength, const unsigned char* chunk):
unsigned lodepng_chunk_create(unsigned char** out, size_t* outlength, unsigned length,
                              const char* type, const unsigned char* data):

These functions are used to create new chunks that are appended to the data in *out that has
length *outlength. The append function appends an existing chunk to the new data. The create
function creates a new chunk with the given parameters and appends it. Type is the 4-letter
name of the chunk.

8.2. chunks in info_png
-----------------------

The LodePNGInfo struct contains fields with the unknown chunk in it. It has 3
buffers (each with size) to contain 3 types of unknown chunks:
the ones that come before the PLTE chunk, the ones that come between the PLTE
and the IDAT chunks, and the ones that come after the IDAT chunks.
It's necessary to make the distinction between these 3 cases because the PNG
standard forces to keep the ordering of unknown chunks compared to the critical
chunks, but does not force any other ordering rules.

info_png.unknown_chunks_data[0] is the chunks before PLTE
info_png.unknown_chunks_data[1] is the chunks after PLTE, before IDAT
info_png.unknown_chunks_data[2] is the chunks after IDAT

The chunks in these 3 buffers can be iterated through and read by using the same
way described in the previous subchapter.

When using the decoder to decode a PNG, you can make it store all unknown chunks
if you set the option settings.remember_unknown_chunks to 1. By default, this
option is off (0).

The encoder will always encode unknown chunks that are stored in the info_png.
If you need it to add a particular chunk that isn't known by LodePNG, you can
use lodepng_chunk_append or lodepng_chunk_create to the chunk data in
info_png.unknown_chunks_data[x].

Chunks that are known by LodePNG should not be added in that way. E.g. to make
LodePNG add a bKGD chunk, set background_defined to true and add the correct
parameters there instead.


9. compiler support
-------------------

No libraries other than the current standard C library are needed to compile
LodePNG. For the C++ version, only the standard C++ library is needed on top.
Add the files lodepng.c(pp) and lodepng.h to your project, include
lodepng.h where needed, and your program can read/write PNG files.

It is compatible with C90 and up, and C++03 and up.

If performance is important, use optimization when compiling! For both the
encoder and decoder, this makes a large difference.

Make sure that LodePNG is compiled with the same compiler of the same version
and with the same settings as the rest of the program, or the interfaces with
std::vectors and std::strings in C++ can be incompatible.

CHAR_BITS must be 8 or higher, because LodePNG uses unsigned chars for octets.

*) gcc and g++

LodePNG is developed in gcc so this compiler is natively supported. It gives no
warnings with compiler options "-Wall -Wextra -pedantic -ansi", with gcc and g++
version 4.7.1 on Linux, 32-bit and 64-bit.

*) Clang

Fully supported and warning-free.

*) Mingw

The Mingw compiler (a port of gcc for Windows) should be fully supported by
LodePNG.

*) Visual Studio and Visual C++ Express Edition

LodePNG should be warning-free with warning level W4. Two warnings were disabled
with pragmas though: warning 4244 about implicit conversions, and warning 4996
where it wants to use a non-standard function fopen_s instead of the standard C
fopen.

Visual Studio may want "stdafx.h" files to be included in each source file and
give an error "unexpected end of file while looking for precompiled header".
This is not standard C++ and will not be added to the stock LodePNG. You can
disable it for lodepng.cpp only by right clicking it, Properties, C/C++,
Precompiled Headers, and set it to Not Using Precompiled Headers there.

NOTE: Modern versions of VS should be fully supported, but old versions, e.g.
VS6, are not guaranteed to work.

*) Compilers on Macintosh

LodePNG has been reported to work both with gcc and LLVM for Macintosh, both for
C and C++.

*) Other Compilers

If you encounter problems on any compilers, feel free to let me know and I may
try to fix it if the compiler is modern and standards compliant.


10. examples
------------

This decoder example shows the most basic usage of LodePNG. More complex
examples can be found on the LodePNG website.

10.1. decoder C++ example
-------------------------

#include "lodepng.h"
#include <iostream>

int main(int argc, char *argv[]) {
  const char* filename = argc > 1 ? argv[1] : "test.png";

  //load and decode
  std::vector<unsigned char> image;
  unsigned width, height;
  unsigned error = lodepng::decode(image, width, height, filename);

  //if there's an error, display it
  if(error) std::cout << "decoder error " << error << ": " << lodepng_error_text(error) << std::endl;

  //the pixels are now in the vector "image", 4 bytes per pixel, ordered RGBARGBA..., use it as texture, draw it, ...
}

10.2. decoder C example
-----------------------

#include "lodepng.h"

int main(int argc, char *argv[]) {
  unsigned error;
  unsigned char* image;
  size_t width, height;
  const char* filename = argc > 1 ? argv[1] : "test.png";

  error = lodepng_decode32_file(&image, &width, &height, filename);

  if(error) printf("decoder error %u: %s\n", error, lodepng_error_text(error));

  / * use image here * /

  free(image);
  return 0;
}

11. state settings reference
----------------------------

A quick reference of some settings to set on the LodePNGState

For decoding:

state.decoder.zlibsettings.ignore_adler32: ignore ADLER32 checksums
state.decoder.zlibsettings.custom_...: use custom inflate function
state.decoder.ignore_crc: ignore CRC checksums
state.decoder.ignore_critical: ignore unknown critical chunks
state.decoder.ignore_end: ignore missing IEND chunk. May fail if this corruption causes other errors
state.decoder.color_convert: convert internal PNG color to chosen one
state.decoder.read_text_chunks: whether to read in text metadata chunks
state.decoder.remember_unknown_chunks: whether to read in unknown chunks
state.info_raw.colortype: desired color type for decoded image
state.info_raw.bitdepth: desired bit depth for decoded image
state.info_raw....: more color settings, see struct LodePNGColorMode
state.info_png....: no settings for decoder but ouput, see struct LodePNGInfo

For encoding:

state.encoder.zlibsettings.btype: disable compression by setting it to 0
state.encoder.zlibsettings.use_lz77: use LZ77 in compression
state.encoder.zlibsettings.windowsize: tweak LZ77 windowsize
state.encoder.zlibsettings.minmatch: tweak min LZ77 length to match
state.encoder.zlibsettings.nicematch: tweak LZ77 match where to stop searching
state.encoder.zlibsettings.lazymatching: try one more LZ77 matching
state.encoder.zlibsettings.custom_...: use custom deflate function
state.encoder.auto_convert: choose optimal PNG color type, if 0 uses info_png
state.encoder.filter_palette_zero: PNG filter strategy for palette
state.encoder.filter_strategy: PNG filter strategy to encode with
state.encoder.force_palette: add palette even if not encoding to one
state.encoder.add_id: add LodePNG identifier and version as a text chunk
state.encoder.text_compression: use compressed text chunks for metadata
state.info_raw.colortype: color type of raw input image you provide
state.info_raw.bitdepth: bit depth of raw input image you provide
state.info_raw: more color settings, see struct LodePNGColorMode
state.info_png.color.colortype: desired color type if auto_convert is false
state.info_png.color.bitdepth: desired bit depth if auto_convert is false
state.info_png.color....: more color settings, see struct LodePNGColorMode
state.info_png....: more PNG related settings, see struct LodePNGInfo


12. changes
-----------

The version number of LodePNG is the date of the change given in the format
yyyymmdd.

Some changes aren't backwards compatible. Those are indicated with a (!)
symbol.

Not all changes are listed here, the commit history in github lists more:
https://github.com/lvandeve/lodepng

*) 14 aug 2019: around 25% faster decoding thanks to huffman lookup tables.
*) 15 jun 2019 (!): auto_choose_color API changed (for bugfix: don't use palette
   if gray ICC profile) and non-ICC LodePNGColorProfile renamed to LodePNGColorStats.
*) 30 dec 2018: code style changes only: removed newlines before opening braces.
*) 10 sep 2018: added way to inspect metadata chunks without full decoding.
*) 19 aug 2018 (!): fixed color mode bKGD is encoded with and made it use
   palette index in case of palette.
*) 10 aug 2018 (!): added support for gAMA, cHRM, sRGB and iCCP chunks. This
   change is backwards compatible unless you relied on unknown_chunks for those.
*) 11 jun 2018: less restrictive check for pixel size integer overflow
*) 14 jan 2018: allow optionally ignoring a few more recoverable errors
*) 17 sep 2017: fix memory leak for some encoder input error cases
*) 27 nov 2016: grey+alpha auto color model detection bugfix
*) 18 apr 2016: Changed qsort to custom stable sort (for platforms w/o qsort).
*) 09 apr 2016: Fixed colorkey usage detection, and better file loading (within
   the limits of pure C90).
*) 08 dec 2015: Made load_file function return error if file can't be opened.
*) 24 okt 2015: Bugfix with decoding to palette output.
*) 18 apr 2015: Boundary PM instead of just package-merge for faster encoding.
*) 24 aug 2014: Moved to github
*) 23 aug 2014: Reduced needless memory usage of decoder.
*) 28 jun 2014: Removed fix_png setting, always support palette OOB for
    simplicity. Made ColorProfile public.
*) 09 jun 2014: Faster encoder by fixing hash bug and more zeros optimization.
*) 22 dec 2013: Power of two windowsize required for optimization.
*) 15 apr 2013: Fixed bug with LAC_ALPHA and color key.
*) 25 mar 2013: Added an optional feature to ignore some PNG errors (fix_png).
*) 11 mar 2013 (!): Bugfix with custom free. Changed from "my" to "lodepng_"
    prefix for the custom allocators and made it possible with a new #define to
    use custom ones in your project without needing to change lodepng's code.
*) 28 jan 2013: Bugfix with color key.
*) 27 okt 2012: Tweaks in text chunk keyword length error handling.
*) 8 okt 2012 (!): Added new filter strategy (entropy) and new auto color mode.
    (no palette). Better deflate tree encoding. New compression tweak settings.
    Faster color conversions while decoding. Some internal cleanups.
*) 23 sep 2012: Reduced warnings in Visual Studio a little bit.
*) 1 sep 2012 (!): Removed #define's for giving custom (de)compression functions
    and made it work with function pointers instead.
*) 23 jun 2012: Added more filter strategies. Made it easier to use custom alloc
    and free functions and toggle #defines from compiler flags. Small fixes.
*) 6 may 2012 (!): Made plugging in custom zlib/deflate functions more flexible.
*) 22 apr 2012 (!): Made interface more consistent, renaming a lot. Removed
    redundant C++ codec classes. Reduced amount of structs. Everything changed,
    but it is cleaner now imho and functionality remains the same. Also fixed
    several bugs and shrunk the implementation code. Made new samples.
*) 6 nov 2011 (!): By default, the encoder now automatically chooses the best
    PNG color model and bit depth, based on the amount and type of colors of the
    raw image. For this, autoLeaveOutAlphaChannel replaced by auto_choose_color.
*) 9 okt 2011: simpler hash chain implementation for the encoder.
*) 8 sep 2011: lz77 encoder lazy matching instead of greedy matching.
*) 23 aug 2011: tweaked the zlib compression parameters after benchmarking.
    A bug with the PNG filtertype heuristic was fixed, so that it chooses much
    better ones (it's quite significant). A setting to do an experimental, slow,
    brute force search for PNG filter types is added.
*) 17 aug 2011 (!): changed some C zlib related function names.
*) 16 aug 2011: made the code less wide (max 120 characters per line).
*) 17 apr 2011: code cleanup. Bugfixes. Convert low to 16-bit per sample colors.
*) 21 feb 2011: fixed compiling for C90. Fixed compiling with sections disabled.
*) 11 dec 2010: encoding is made faster, based on suggestion by Peter Eastman
    to optimize long sequences of zeros.
*) 13 nov 2010: added LodePNG_InfoColor_hasPaletteAlpha and
    LodePNG_InfoColor_canHaveAlpha functions for convenience.
*) 7 nov 2010: added LodePNG_error_text function to get error code description.
*) 30 okt 2010: made decoding slightly faster
*) 26 okt 2010: (!) changed some C function and struct names (more consistent).
     Reorganized the documentation and the declaration order in the header.
*) 08 aug 2010: only changed some comments and external samples.
*) 05 jul 2010: fixed bug thanks to warnings in the new gcc version.
*) 14 mar 2010: fixed bug where too much memory was allocated for char buffers.
*) 02 sep 2008: fixed bug where it could create empty tree that linux apps could
    read by ignoring the problem but windows apps couldn't.
*) 06 jun 2008: added more error checks for out of memory cases.
*) 26 apr 2008: added a few more checks here and there to ensure more safety.
*) 06 mar 2008: crash with encoding of strings fixed
*) 02 feb 2008: support for international text chunks added (iTXt)
*) 23 jan 2008: small cleanups, and #defines to divide code in sections
*) 20 jan 2008: support for unknown chunks allowing using LodePNG for an editor.
*) 18 jan 2008: support for tIME and pHYs chunks added to encoder and decoder.
*) 17 jan 2008: ability to encode and decode compressed zTXt chunks added
    Also various fixes, such as in the deflate and the padding bits code.
*) 13 jan 2008: Added ability to encode Adam7-interlaced images. Improved
    filtering code of encoder.
*) 07 jan 2008: (!) changed LodePNG to use ISO C90 instead of C++. A
    C++ wrapper around this provides an interface almost identical to before.
    Having LodePNG be pure ISO C90 makes it more portable. The C and C++ code
    are together in these files but it works both for C and C++ compilers.
*) 29 dec 2007: (!) changed most integer types to unsigned int + other tweaks
*) 30 aug 2007: bug fixed which makes this Borland C++ compatible
*) 09 aug 2007: some VS2005 warnings removed again
*) 21 jul 2007: deflate code placed in new namespace separate from zlib code
*) 08 jun 2007: fixed bug with 2- and 4-bit color, and small interlaced images
*) 04 jun 2007: improved support for Visual Studio 2005: crash with accessing
    invalid std::vector element [0] fixed, and level 3 and 4 warnings removed
*) 02 jun 2007: made the encoder add a tag with version by default
*) 27 may 2007: zlib and png code separated (but still in the same file),
    simple encoder/decoder functions added for more simple usage cases
*) 19 may 2007: minor fixes, some code cleaning, new error added (error 69),
    moved some examples from here to lodepng_examples.cpp
*) 12 may 2007: palette decoding bug fixed
*) 24 apr 2007: changed the license from BSD to the zlib license
*) 11 mar 2007: very simple addition: ability to encode bKGD chunks.
*) 04 mar 2007: (!) tEXt chunk related fixes, and support for encoding
    palettized PNG images. Plus little interface change with palette and texts.
*) 03 mar 2007: Made it encode dynamic Huffman shorter with repeat codes.
    Fixed a bug where the end code of a block had length 0 in the Huffman tree.
*) 26 feb 2007: Huffman compression with dynamic trees (BTYPE 2) now implemented
    and supported by the encoder, resulting in smaller PNGs at the output.
*) 27 jan 2007: Made the Adler-32 test faster so that a timewaste is gone.
*) 24 jan 2007: gave encoder an error interface. Added color conversion from any
    greyscale type to 8-bit greyscale with or without alpha.
*) 21 jan 2007: (!) Totally changed the interface. It allows more color types
    to convert to and is more uniform. See the manual for how it works now.
*) 07 jan 2007: Some cleanup & fixes, and a few changes over the last days:
    encode/decode custom tEXt chunks, separate classes for zlib & deflate, and
    at last made the decoder give errors for incorrect Adler32 or Crc.
*) 01 jan 2007: Fixed bug with encoding PNGs with less than 8 bits per channel.
*) 29 dec 2006: Added support for encoding images without alpha channel, and
    cleaned out code as well as making certain parts faster.
*) 28 dec 2006: Added "Settings" to the encoder.
*) 26 dec 2006: The encoder now does LZ77 encoding and produces much smaller files now.
    Removed some code duplication in the decoder. Fixed little bug in an example.
*) 09 dec 2006: (!) Placed output parameters of public functions as first parameter.
    Fixed a bug of the decoder with 16-bit per color.
*) 15 okt 2006: Changed documentation structure
*) 09 okt 2006: Encoder class added. It encodes a valid PNG image from the
    given image buffer, however for now it's not compressed.
*) 08 sep 2006: (!) Changed to interface with a Decoder class
*) 30 jul 2006: (!) LodePNG_InfoPng , width and height are now retrieved in different
    way. Renamed decodePNG to decodePNGGeneric.
*) 29 jul 2006: (!) Changed the interface: image info is now returned as a
    struct of type LodePNG::LodePNG_Info, instead of a vector, which was a bit clumsy.
*) 28 jul 2006: Cleaned the code and added new error checks.
    Corrected terminology "deflate" into "inflate".
*) 23 jun 2006: Added SDL example in the documentation in the header, this
    example allows easy debugging by displaying the PNG and its transparency.
*) 22 jun 2006: (!) Changed way to obtain error value. Added
    loadFile function for convenience. Made decodePNG32 faster.
*) 21 jun 2006: (!) Changed type of info vector to unsigned.
    Changed position of palette in info vector. Fixed an important bug that
    happened on PNGs with an uncompressed block.
*) 16 jun 2006: Internally changed unsigned into unsigned where
    needed, and performed some optimizations.
*) 07 jun 2006: (!) Renamed functions to decodePNG and placed them
    in LodePNG namespace. Changed the order of the parameters. Rewrote the
    documentation in the header. Renamed files to lodepng.cpp and lodepng.h
*) 22 apr 2006: Optimized and improved some code
*) 07 sep 2005: (!) Changed to std::vector interface
*) 12 aug 2005: Initial release (C++, decoder only)


13. contact information
-----------------------

Feel free to contact me with suggestions, problems, comments, ... concerning
LodePNG. If you encounter a PNG image that doesn't work properly with this
decoder, feel free to send it and I'll use it to find and fix the problem.

My email address is (puzzle the account and domain together with an @ symbol):
Domain: gmail dot com.
Account: lode dot vandevenne.


Copyright (c) 2005-2019 Lode Vandevenne
*/


namespace lodepng {

/*
Returns info from the header of the PNG by value, purely for convenience.
Does NOT check for errors. Returns bogus info if the PNG has an error.
Does not require cleanup of allocated memory because no palette or text chunk
info is in the LodePNGInfo object after checking only the header of the PNG.
*/
LodePNGInfo getPNGHeaderInfo(const std::vector<unsigned char>& png);

/*
Get the names and sizes of all chunks in the PNG file.
Returns 0 if ok, non-0 if error happened.
*/
unsigned getChunkInfo(std::vector<std::string>& names, std::vector<size_t>& sizes,
                      const std::vector<unsigned char>& png);

/*
Returns the names and full chunks (including the name and everything else that
makes up the chunk) for all chunks except IHDR, PLTE, IDAT and IEND.
It separates the chunks into 3 separate lists, representing the chunks between
certain critical chunks: 0: IHDR-PLTE, 1: PLTE-IDAT, 2: IDAT-IEND
Returns 0 if ok, non-0 if error happened.
*/
unsigned getChunks(std::vector<std::string> names[3],
                   std::vector<std::vector<unsigned char> > chunks[3],
                   const std::vector<unsigned char>& png);

/*
Inserts chunks into the given png file. The chunks must be fully encoded,
including length, type, content and CRC.
The array index determines where it goes:
0: between IHDR and PLTE, 1: between PLTE and IDAT, 2: between IDAT and IEND.
They're appended at the end of those locations within the PNG.
Returns 0 if ok, non-0 if error happened.
*/
unsigned insertChunks(std::vector<unsigned char>& png,
                      const std::vector<std::vector<unsigned char> > chunks[3]);

/*
Get the filtertypes of each scanline in this PNG file.
Returns 0 if ok, 1 if PNG decoding error happened.

For a non-interlaced PNG, it returns one filtertype per scanline, in order.

For interlaced PNGs, it returns a result as if it's not interlaced. It returns
one filtertype per scanline, in order. The values match pass 6 and 7 of the
Adam7 interlacing, alternating between the two, so that the values correspond
the most to their scanlines.
*/
unsigned getFilterTypes(std::vector<unsigned char>& filterTypes, const std::vector<unsigned char>& png);

/*
Get the filtertypes of each scanline in every interlace pass this PNG file.
Returns 0 if ok, 1 if PNG decoding error happened.

For a non-interlaced PNG, it returns one filtertype per scanline, in order, in
a single std::vector in filterTypes.

For an interlaced PNG, it returns 7 std::vectors in filterTypes, one for each
Adam7 pass. The amount of values per pass can be calculated as follows, where
w and h are the size of the image and all divisions are integer divisions:
pass 1: (h + 7) / 8
pass 2: w <= 4 ? 0 : (h + 7) / 8
pass 3: h <= 4 ? 0 : (h + 7) / 8
pass 4: w <= 2 ? 0 : (h + 3) / 4
pass 5: h <= 2 ? 0 : (h + 3) / 4
pass 6: w <= 1 ? 0 : (h + 1) / 2
pass 7: h <= 1 ? 0 : (h + 1) / 2
*/
unsigned getFilterTypesInterlaced(std::vector<std::vector<unsigned char> >& filterTypes,
                                  const std::vector<unsigned char>& png);

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

/*
The information for extractZlibInfo.
*/
struct ZlibBlockInfo {
  int btype; //block type (0-2)
  size_t compressedbits; //size of compressed block in bits
  size_t uncompressedbytes; //size of uncompressed block in bytes

  // only filled in for block type 2
  size_t treebits; //encoded tree size in bits
  int hlit; //the HLIT value that was filled in for this tree
  int hdist; //the HDIST value that was filled in for this tree
  int hclen; //the HCLEN value that was filled in for this tree
  std::vector<int> clcl; //19 code length code lengths (compressed tree's tree)
  std::vector<int> treecodes; //N tree codes, with values 0-18. Values 17 or 18 are followed by the repetition value.
  std::vector<int> litlenlengths; //288 code lengths for lit/len symbols
  std::vector<int> distlengths; //32 code lengths for dist symbols

  // only filled in for block types 1 or 2
  std::vector<int> lz77_lcode; //LZ77 codes. 0-255: literals. 256: end symbol. 257-285: length code of length/dist pairs
  // the next vectors have the same size as lz77_lcode, but an element only has meaningful value if lz77_lcode contains a length code.
  std::vector<int> lz77_dcode;
  std::vector<int> lz77_lbits;
  std::vector<int> lz77_dbits;
  std::vector<int> lz77_lvalue;
  std::vector<int> lz77_dvalue;
  size_t numlit; //number of lit codes in this block
  size_t numlen; //number of len codes in this block
};

//Extracts all info needed from a PNG file to reconstruct the zlib compression exactly.
void extractZlibInfo(std::vector<ZlibBlockInfo>& zlibinfo, const std::vector<unsigned char>& in);

} // namespace lodepng

#endif /*LODEPNG_UTIL_H inclusion guard*/

#include <iostream>  // TODO: remove, don't print stuff from here, return errors instead
#include <stdlib.h> /* allocations */

namespace lodepng {

LodePNGInfo getPNGHeaderInfo(const std::vector<unsigned char>& png) {
  unsigned w, h;
  lodepng::State state;
  lodepng_inspect(&w, &h, &state, &png[0], png.size());
  return state.info_png;
}

unsigned getChunkInfo(std::vector<std::string>& names, std::vector<size_t>& sizes,
                      const std::vector<unsigned char>& png) {
  // Listing chunks is based on the original file, not the decoded png info.
  const unsigned char *chunk, *begin, *end, *next;
  end = &png.back() + 1;
  begin = chunk = &png.front() + 8;

  while(chunk + 8 < end && chunk >= begin) {
    char type[5];
    lodepng_chunk_type(type, chunk);
    if(std::string(type).size() != 4) return 1;

    unsigned length = lodepng_chunk_length(chunk);
    names.push_back(type);
    sizes.push_back(length);
    if(chunk + length + 12 > end) return 1;

    next = lodepng_chunk_next_const(chunk);
    if (next <= chunk) return 1; // integer overflow
    chunk = next;
  }
  return 0;
}

unsigned getChunks(std::vector<std::string> names[3],
                   std::vector<std::vector<unsigned char> > chunks[3],
                   const std::vector<unsigned char>& png) {
  const unsigned char *chunk, *next, *begin, *end;
  end = &png.back() + 1;
  begin = chunk = &png.front() + 8;

  int location = 0;

  while(chunk + 8 < end && chunk >= begin) {
    char type[5];
    lodepng_chunk_type(type, chunk);
    std::string name(type);
    if(name.size() != 4) return 1;

    next = lodepng_chunk_next_const(chunk);
    if (next <= chunk) return 1; // integer overflow

    if(name == "IHDR") {
      location = 0;
    } else if(name == "PLTE") {
      location = 1;
    } else if(name == "IDAT") {
      location = 2;
    } else if(name == "IEND") {
      break; // anything after IEND is not part of the PNG or the 3 groups here.
    } else {
      if(next > end) return 1; // invalid chunk, content too far
      names[location].push_back(name);
      chunks[location].push_back(std::vector<unsigned char>(chunk, next));
    }

    chunk = next;
  }
  return 0;
}


unsigned insertChunks(std::vector<unsigned char>& png,
                      const std::vector<std::vector<unsigned char> > chunks[3]) {
  const unsigned char *chunk, *next, *begin, *end;
  end = &png.back() + 1;
  begin = chunk = &png.front() + 8;

  long l0 = 0; //location 0: IHDR-l0-PLTE (or IHDR-l0-l1-IDAT)
  long l1 = 0; //location 1: PLTE-l1-IDAT (or IHDR-l0-l1-IDAT)
  long l2 = 0; //location 2: IDAT-l2-IEND

  while(chunk + 8 < end && chunk >= begin) {
    char type[5];
    lodepng_chunk_type(type, chunk);
    std::string name(type);
    if(name.size() != 4) return 1;

    next = lodepng_chunk_next_const(chunk);
    if (next <= chunk) return 1; // integer overflow

    if(name == "PLTE") {
      if(l0 == 0) l0 = chunk - begin + 8;
    } else if(name == "IDAT") {
      if(l0 == 0) l0 = chunk - begin + 8;
      if(l1 == 0) l1 = chunk - begin + 8;
    } else if(name == "IEND") {
      if(l2 == 0) l2 = chunk - begin + 8;
    }

    chunk = next;
  }

  std::vector<unsigned char> result;
  result.insert(result.end(), png.begin(), png.begin() + l0);
  for(size_t i = 0; i < chunks[0].size(); i++) result.insert(result.end(), chunks[0][i].begin(), chunks[0][i].end());
  result.insert(result.end(), png.begin() + l0, png.begin() + l1);
  for(size_t i = 0; i < chunks[1].size(); i++) result.insert(result.end(), chunks[1][i].begin(), chunks[1][i].end());
  result.insert(result.end(), png.begin() + l1, png.begin() + l2);
  for(size_t i = 0; i < chunks[2].size(); i++) result.insert(result.end(), chunks[2][i].begin(), chunks[2][i].end());
  result.insert(result.end(), png.begin() + l2, png.end());

  png = result;
  return 0;
}

unsigned getFilterTypesInterlaced(std::vector<std::vector<unsigned char> >& filterTypes,
                                  const std::vector<unsigned char>& png) {
  //Get color type and interlace type
  lodepng::State state;
  unsigned w, h;
  unsigned error;
  error = lodepng_inspect(&w, &h, &state, &png[0], png.size());

  if(error) return 1;

  //Read literal data from all IDAT chunks
  const unsigned char *chunk, *begin, *end, *next;
  end = &png.back() + 1;
  begin = chunk = &png.front() + 8;

  std::vector<unsigned char> zdata;

  while(chunk + 8 < end && chunk >= begin) {
    char type[5];
    lodepng_chunk_type(type, chunk);
    if(std::string(type).size() != 4) break; //Probably not a PNG file

    if(std::string(type) == "IDAT") {
      const unsigned char* cdata = lodepng_chunk_data_const(chunk);
      unsigned clength = lodepng_chunk_length(chunk);
      if(chunk + clength + 12 > end || clength > png.size() || chunk + clength + 12 < begin) {
        // corrupt chunk length
        return 1;
      }

      for(unsigned i = 0; i < clength; i++) {
        zdata.push_back(cdata[i]);
      }
    }

    next = lodepng_chunk_next_const(chunk);
    if (next <= chunk) break; // integer overflow
    chunk = next;
  }

  //Decompress all IDAT data (if the while loop ended early, this might fail)
  std::vector<unsigned char> data;
  error = lodepng::decompress(data, &zdata[0], zdata.size());

  if(error) return 1;

  if(state.info_png.interlace_method == 0) {
    filterTypes.resize(1);

    //A line is 1 filter byte + all pixels
    size_t linebytes = 1 + lodepng_get_raw_size(w, 1, &state.info_png.color);

    for(size_t i = 0; i < data.size(); i += linebytes) {
      filterTypes[0].push_back(data[i]);
    }
  } else {
    //Interlaced
    filterTypes.resize(7);
    static const unsigned ADAM7_IX[7] = { 0, 4, 0, 2, 0, 1, 0 }; /*x start values*/
    static const unsigned ADAM7_IY[7] = { 0, 0, 4, 0, 2, 0, 1 }; /*y start values*/
    static const unsigned ADAM7_DX[7] = { 8, 8, 4, 4, 2, 2, 1 }; /*x delta values*/
    static const unsigned ADAM7_DY[7] = { 8, 8, 8, 4, 4, 2, 2 }; /*y delta values*/
    size_t pos = 0;
    for(size_t j = 0; j < 7; j++) {
      unsigned w2 = (w - ADAM7_IX[j] + ADAM7_DX[j] - 1) / ADAM7_DX[j];
      unsigned h2 = (h - ADAM7_IY[j] + ADAM7_DY[j] - 1) / ADAM7_DY[j];
      if(ADAM7_IX[j] >= w) w2 = 0;
      if(ADAM7_IY[j] >= h) h2 = 0;
      size_t linebytes = 1 + lodepng_get_raw_size(w2, 1, &state.info_png.color);
      for(size_t i = 0; i < h2; i++) {
        filterTypes[j].push_back(data[pos]);
        pos += linebytes;
      }
    }
  }
  return 0; /* OK */
}


unsigned getFilterTypes(std::vector<unsigned char>& filterTypes, const std::vector<unsigned char>& png) {
  std::vector<std::vector<unsigned char> > passes;
  unsigned error = getFilterTypesInterlaced(passes, png);
  if(error) return error;

  if(passes.size() == 1) {
    filterTypes.swap(passes[0]);
  } else {
    lodepng::State state;
    unsigned w, h;
    lodepng_inspect(&w, &h, &state, &png[0], png.size());
    /*
    Interlaced. Simplify it: put pass 6 and 7 alternating in the one vector so
    that one filter per scanline of the uninterlaced image is given, with that
    filter corresponding the closest to what it would be for non-interlaced
    image.
    */
    for(size_t i = 0; i < h; i++) {
      filterTypes.push_back(i % 2 == 0 ? passes[5][i / 2] : passes[6][i / 2]);
    }
  }
  return 0; /* OK */
}

int getPaletteValue(const unsigned char* data, size_t i, int bits) {
  if(bits == 8) return data[i];
  else if(bits == 4) return (data[i / 2] >> ((i % 2) * 4)) & 15;
  else if(bits == 2) return (data[i / 4] >> ((i % 4) * 2)) & 3;
  else if(bits == 1) return (data[i / 8] >> (i % 8)) & 1;
  else return 0;
}


////////////////////////////////////////////////////////////////////////////////

#ifdef LODEPNG_COMPILE_ANCILLARY_CHUNKS



// Only temporarily here until this is integrated into lodepng.c(pp)
#define LODEPNG_MAX(a, b) (((a) > (b)) ? (a) : (b))
#define LODEPNG_MIN(a, b) (((a) < (b)) ? (a) : (b))

// Only temporarily here until this is integrated into lodepng.c(pp)
#ifdef LODEPNG_COMPILE_ALLOCATORS
static void* lodepng_malloc(size_t size) {
  return malloc(size);
}
static void lodepng_free(void* ptr) {
  free(ptr);
}
#else /*LODEPNG_COMPILE_ALLOCATORS*/
void* lodepng_malloc(size_t size);
void lodepng_free(void* ptr);
#endif /*LODEPNG_COMPILE_ALLOCATORS*/

/* avoid needing <float.h> for FLT_MAX. This assumes IEEE 32-bit float. */
static const float lodepng_flt_max = 3.40282346638528859811704183484516925e38f;

/* define infinity and NaN in a way compatible with ANSI C90 (no INFINITY or NAN macros) yet also with visual studio */
/* visual studio doesn't allow division through a zero literal, but allows it through non-const variable set to zero */
float lodepng_flt_zero_ = 0.0f;
static const float lodepng_flt_inf = 1.0f / lodepng_flt_zero_; /* infinity */
static const float lodepng_flt_nan = 0.0f / lodepng_flt_zero_; /* not a number */

/* powf polyfill, 5-6 digits accurate, 33% slower than powf, assumes IEEE
32-bit float, but other than that multiplatform and no math lib needed
(note: powf also isn't in ISO C90, and pow is slower). */
static float lodepng_powf(float x, float y) {
  float j, t0, t1;
  int i = 0;
  /* handle all the special floating point rules */
  if(x == 1 || y == 0) return 1;
  if(!(x > 0 && x <= lodepng_flt_max && y == y && y <= lodepng_flt_max && y >= -lodepng_flt_max)) {
    if(y == 1) return x; /* preserves negative-0 */
    if(x != x || y != y) return x + y; /* nan */
    if(x > 0) {
      if(x > lodepng_flt_max) return y <= 0 ? (y == 0 ? 1 : 0) : x; /* x = +infinity */
    } else {
      if(!(y < -1073741824.0f || y > 1073741824.0f)) { /* large y always even integer, but cast would overflow */
        i = (int)y;
        if(i != y) {
          return (x < -lodepng_flt_max) ? (y < 0 ? 0 : lodepng_flt_inf) :
              (x == 0 ? (y < 0 ? lodepng_flt_inf : 0) : lodepng_flt_nan);
        }
        if(i & 1) return x == 0 ? (y < 0 ? (1 / x) : x) : -lodepng_powf(-x, y);
      }
      if(x == 0) return y <= 0 ? lodepng_flt_inf : 0;
      if(x < -lodepng_flt_max) { /* x == -infinity */
        return y <= 0 ? (y == 0 ? 1 : 0) : ((i & 1) ?
            -lodepng_flt_inf : lodepng_flt_inf);
      }
      x = -x;
      if(x == 1) return 1;
    }
    if(y < -lodepng_flt_max || y > lodepng_flt_max) return ((x < 1) != (y > 0)) ? (y < 0 ? -y : y) : 0;
  }

  j = 0;
  while(x < (1.0f / 65536)) { j -= 16; x *= 65536.0f; }
  while(x > 65536) { j += 16; x *= (1.0f / 65536); }
  while(x < 1) { j--; x *= 2.0f; }
  while(x > 2) { j++; x *= 0.5f; }
  /* polynomial to approximate log2(x) with x in range 1..2 */
  t0 = -0.393118410458557f + x * (-0.0883639468229365f + x * (0.466142650227994f + x * 0.0153397331014276f));
  t1 = 0.0907447971403586f + x * (0.388892024755479f + x * 0.137228280305862f);
  x = t0 / t1 + j;

  x *= y; /* using the formula exp2(y * log2(x)) */

  if(!(x > -128.0f && x < 128.0f)) return x > 0 ? lodepng_flt_inf : 0; /* prevent int overflow */
  i = (int)x;
  x -= i;
  /* polynomial to approximate exp2(x) with x in range -1..1 */
  t0 = 1.0f + x * (0.41777833582744256f + x * (0.0728482595347711f + x * 0.005635023478609625f));
  t1 = 1.0f + x * (-0.27537016151408167f + x * 0.023501446055084033f);
  while(i <= -31) { t0 *= (1.0f / 2147483648.0f); i += 31; }
  while(i >= 31) { t0 *= 2147483648.0f; i -= 31; }
  return (i < 0) ? (t0 / (t1 * (1 << -i))) : ((t0 * (1 << i)) / t1);
}

/* Parameters of a tone reproduction curve, either with a power law formula or with a lookup table. */
typedef struct {
  unsigned type; /* 0=linear, 1=lut, 2 = simple gamma, 3-6 = parametric (matches ICC parametric types 1-4) */
  float* lut; /* for type 1 */
  size_t lut_size;
  float gamma; /* for type 2 and more */
  float a, b, c, d, e, f; /* parameters for type 3-7 */
} LodePNGICCCurve;

void lodepng_icc_curve_init(LodePNGICCCurve* curve) {
  curve->lut = 0;
  curve->lut_size = 0;
}

void lodepng_icc_curve_cleanup(LodePNGICCCurve* curve) {
  lodepng_free(curve->lut);
}

/* Values parsed from ICC profile, see parseICC for more information about this subset.*/
typedef struct {
  /* 0 = color model not supported by PNG (CMYK, Lab, ...), 1 = gray, 2 = RGB */
  int inputspace;
  int version_major;
  int version_minor;
  int version_bugfix;

  /* The whitepoint of the profile connection space (PCS). Should always be D50, but parsed and used anyway.
  (to be clear, whitepoint and illuminant are synonyms in practice, but here field "illuminant" is ICC's
  "global" whitepoint that is always D50, and the field "white" below allows deriving the whitepoint of
  the particular RGB space represented here) */
  float illuminant[3];

  /* if true, has chromatic adaptation matrix that must be used. If false, you must compute a chromatic adaptation
  matrix yourself from "illuminant" and "white". */
  unsigned has_chad;
  float chad[9]; /* chromatic adaptation matrix, if given */

  /* The whitepoint of the RGB color space as stored in the ICC file. If has_chad, must be adapted with the
  chad matrix to become the one we need to go to absolute XYZ (in fact ICC implies it should then be
  exactly D50 in the file, redundantly, before this transformation with chad), else use as-is (then its
  values can actually be something else than D50, and are the ones we need). */
  unsigned has_whitepoint;
  float white[3];
  /* Chromaticities of the RGB space in XYZ color space, but given such that you must still
  whitepoint adapt them from D50 to the RGB space whitepoint to go to absolute XYZ (if has_chad,
  with chad, else with bradford adaptation matrix from illuminant to white). */
  unsigned has_chromaticity;
  float red[3];
  float green[3];
  float blue[3];

  unsigned has_trc; /* TRC = tone reproduction curve (aka "gamma correction") */

  /* TRC's for the three channels (only first one used if grayscale) */
  LodePNGICCCurve trc[3];
} LodePNGICC;

void lodepng_icc_init(LodePNGICC* icc) {
  lodepng_icc_curve_init(&icc->trc[0]);
  lodepng_icc_curve_init(&icc->trc[1]);
  lodepng_icc_curve_init(&icc->trc[2]);
}

void lodepng_icc_cleanup(LodePNGICC* icc) {
  lodepng_icc_curve_cleanup(&icc->trc[0]);
  lodepng_icc_curve_cleanup(&icc->trc[1]);
  lodepng_icc_curve_cleanup(&icc->trc[2]);
}

/* ICC tone response curve, nonlinear (encoded) to linear.
Input and output in range 0-1. If color was integer 0-255, multiply with (1.0f/255)
to get the correct floating point behavior.
Outside of range 0-1, will not clip but either return x itself, or in cases
where it makes sense, a value defined by the same function.
NOTE: ICC requires clipping, but we do that only later when converting float to integer.*/
static float iccForwardTRC(const LodePNGICCCurve* curve, float x) {
  if(curve->type == 0) {
    return x;
  }
  if(curve->type == 1) { /* Lookup table */
    float v0, v1, fraction;
    size_t index;
    if(!curve->lut) return 0; /* error */
    if(x < 0) return x;
    index = (size_t)(x * (curve->lut_size - 1));
    if(index >= curve->lut_size) return x;

    /* LERP */
    v0 = curve->lut[index];
    v1 = (index + 1 < curve->lut_size) ? curve->lut[index + 1] : 1.0f;
    fraction = (x * (curve->lut_size - 1)) - index;
    return v0 * (1 - fraction) + v1 * fraction;
  }
  if(curve->type == 2) {
    /* Gamma expansion */
    return (x > 0) ? lodepng_powf(x, curve->gamma) : x;
  }
  /* TODO: all the ones below are untested */
  if(curve->type == 3) {
    if(x < 0) return x;
    return x >= (-curve->b / curve->a) ? (lodepng_powf(curve->a * x + curve->b, curve->gamma) + curve->c) : 0;
  }
  if(curve->type == 4) {
    if(x < 0) return x;
    return x >= (-curve->b / curve->a) ? (lodepng_powf(curve->a * x + curve->b, curve->gamma) + curve->c) : curve->c;
  }
  if(curve->type == 5) {
    return x >= curve->d ? (lodepng_powf(curve->a * x + curve->b, curve->gamma)) : (curve->c * x);
  }
  if(curve->type == 6) {
    return x >= curve->d ? (lodepng_powf(curve->a * x + curve->b, curve->gamma) + curve->c) : (curve->c * x + curve->f);
  }
  return 0;
}

/* ICC tone response curve, linear to nonlinear (encoded).
Input and output in range 0-1. Outside of that range, will not clip but either
return x itself, or in cases where it makes sense, a value defined by the same function.
NOTE: ICC requires clipping, but we do that only later when converting float to integer.*/
static float iccBackwardTRC(const LodePNGICCCurve* curve, float x) {
  if(curve->type == 0) {
    return x;
  }
  if(curve->type == 1) {
    size_t a, b, m;
    float v;
    if(x <= 0) return x;
    if(x >= 1) return x;
    /* binary search in the table */
    /* TODO: use faster way of inverting the lookup table */
    a = 0;
    b = curve->lut_size;
    for(;;) {
      if(a == b) return curve->lut[a];
      if(a + 1 == b) {
        /* LERP */
        float v0 = curve->lut[a];
        float v1 = curve->lut[b];
        float fraction;
        if(v0 == v1) return v0;
        fraction = (x - v0) / (v1 - v0);
        return v0 * (1 - fraction) + v1 * fraction;
      }
      m = (a + b) / 2u;
      v = curve->lut[m];
      if(v > x) {
        b = m;
      } else {
        a = m;
      }
    }
    return 0;
  }
  if(curve->type == 2) {
    /* Gamma compression */
    return (x > 0) ? lodepng_powf(x, 1.0f / curve->gamma) : x;
  }
  /* TODO: all the ones below are untested  */
  if(curve->type == 3) {
    if(x < 0) return x;
    return x > 0 ? ((lodepng_powf(x, 1.0f / curve->gamma) - curve->b) / curve->a) : (-curve->b / curve->a);
  }
  if(curve->type == 4) {
    if(x < 0) return x;
    return x > curve->c ?
        ((lodepng_powf(x - curve->c, 1.0f / curve->gamma) - curve->b) / curve->a) :
        (-curve->b / curve->a);
  }
  if(curve->type == 5) {
    return x > (curve->c * curve->d) ?
        ((lodepng_powf(x, 1.0f / curve->gamma) - curve->b) / curve->a) :
        (x / curve->c);
  }
  if(curve->type == 6) {
    return x > (curve->c * curve->d + curve->f) ?
        ((lodepng_powf(x - curve->c, 1.0f / curve->gamma) - curve->b) / curve->a) :
        ((x - curve->f) / curve->c);
  }
  return 0;
}

static unsigned decodeICCUint16(const unsigned char* data, size_t size, size_t* pos) {
  *pos += 2;
  if (*pos > size) return 0;
  return (unsigned)((data[*pos - 2] << 8) | (data[*pos - 1]));
}

static unsigned decodeICCUint32(const unsigned char* data, size_t size, size_t* pos) {
  *pos += 4;
  if (*pos > size) return 0;
  return (unsigned)((data[*pos - 4] << 24) | (data[*pos - 3] << 16) | (data[*pos - 2] << 8) | (data[*pos - 1] << 0));
}

static int decodeICCInt32(const unsigned char* data, size_t size, size_t* pos) {
  *pos += 4;
  if (*pos > size) return 0;
  /*TODO: this is incorrect if sizeof(int) != 4*/
  return (data[*pos - 4] << 24) | (data[*pos - 3] << 16) | (data[*pos - 2] << 8) | (data[*pos - 1] << 0);
}

static float decodeICC15Fixed16(const unsigned char* data, size_t size, size_t* pos) {
  return decodeICCInt32(data, size, pos) / 65536.0;
}

static unsigned isICCword(const unsigned char* data, size_t size, size_t pos, const char* word) {
  if(pos + 4 > size) return 0;
  return data[pos + 0] == (unsigned char)word[0] &&
         data[pos + 1] == (unsigned char)word[1] &&
         data[pos + 2] == (unsigned char)word[2] &&
         data[pos + 3] == (unsigned char)word[3];
}

/* Parses a subset of the ICC profile, supporting the necessary mix of ICC v2
and ICC v4 required to correctly convert the RGB color space to XYZ.
Does not parse values not related to this specific PNG-related purpose, and
does not support non-RGB profiles or lookup-table based chroma (but it
supports lookup tables for TRC aka "gamma"). */
static unsigned parseICC(LodePNGICC* icc, const unsigned char* data, size_t size) {
  size_t i, j;
  size_t pos = 0;
  unsigned version;
  unsigned inputspace;
  size_t numtags;

  if(size < 132) return 1; /* Too small to be a valid icc profile. */

  icc->has_chromaticity = 0;
  icc->has_whitepoint = 0;
  icc->has_trc = 0;
  icc->has_chad = 0;

  icc->trc[0].type = icc->trc[1].type = icc->trc[2].type = 0;
  icc->white[0] = icc->white[1] = icc->white[2] = 0;
  icc->red[0] = icc->red[1] = icc->red[2] = 0;
  icc->green[0] = icc->green[1] = icc->green[2] = 0;
  icc->blue[0] = icc->blue[1] = icc->blue[2] = 0;

  pos = 8;
  version = decodeICCUint32(data, size, &pos);
  if(pos >= size) return 1;
  icc->version_major = (int)((version >> 24) & 255);
  icc->version_minor = (int)((version >> 20) & 15);
  icc->version_bugfix = (int)((version >> 16) & 15);

  pos = 16;
  inputspace = decodeICCUint32(data, size, &pos);
  if(pos >= size) return 1;
  if(inputspace == 0x47524159) {
    /* The string  "GRAY" as unsigned 32-bit int. */
    icc->inputspace = 1;
  } else if(inputspace == 0x52474220) {
    /* The string  "RGB " as unsigned 32-bit int. */
    icc->inputspace = 2;
  } else {
    /* unsupported by PNG (CMYK, YCbCr, Lab, HSV, ...) */
    icc->inputspace = 0;
  }

  /* Should always be 0.9642, 1.0, 0.8249 */
  pos = 68;
  icc->illuminant[0] = decodeICC15Fixed16(data, size, &pos);
  icc->illuminant[1] = decodeICC15Fixed16(data, size, &pos);
  icc->illuminant[2] = decodeICC15Fixed16(data, size, &pos);

  pos = 128;
  numtags = decodeICCUint32(data, size, &pos);
  if(pos >= size) return 1;
  /* scan for tags we want to handle */
  for(i = 0; i < numtags; i++) {
    size_t offset;
    unsigned tagsize;
    size_t namepos = pos;
    pos += 4;
    offset = decodeICCUint32(data, size, &pos);
    tagsize = decodeICCUint32(data, size, &pos);
    if(pos >= size || offset >= size) return 1;
    if(offset + tagsize > size) return 1;
    if(tagsize < 8) return 1;

    if(isICCword(data, size, namepos, "wtpt")) {
      offset += 8; /* skip tag and reserved */
      icc->white[0] = decodeICC15Fixed16(data, size, &offset);
      icc->white[1] = decodeICC15Fixed16(data, size, &offset);
      icc->white[2] = decodeICC15Fixed16(data, size, &offset);
      icc->has_whitepoint = 1;
    } else if(isICCword(data, size, namepos, "rXYZ")) {
      offset += 8; /* skip tag and reserved */
      icc->red[0] = decodeICC15Fixed16(data, size, &offset);
      icc->red[1] = decodeICC15Fixed16(data, size, &offset);
      icc->red[2] = decodeICC15Fixed16(data, size, &offset);
      icc->has_chromaticity = 1;
    } else if(isICCword(data, size, namepos, "gXYZ")) {
      offset += 8; /* skip tag and reserved */
      icc->green[0] = decodeICC15Fixed16(data, size, &offset);
      icc->green[1] = decodeICC15Fixed16(data, size, &offset);
      icc->green[2] = decodeICC15Fixed16(data, size, &offset);
      icc->has_chromaticity = 1;
    } else if(isICCword(data, size, namepos, "bXYZ")) {
      offset += 8; /* skip tag and reserved */
      icc->blue[0] = decodeICC15Fixed16(data, size, &offset);
      icc->blue[1] = decodeICC15Fixed16(data, size, &offset);
      icc->blue[2] = decodeICC15Fixed16(data, size, &offset);
      icc->has_chromaticity = 1;
    } else if(isICCword(data, size, namepos, "chad")) {
      offset += 8; /* skip datatype keyword "sf32" and reserved */
      for(j = 0; j < 9; j++) {
        icc->chad[j] = decodeICC15Fixed16(data, size, &offset);
      }
      icc->has_chad = 1;
    } else if(isICCword(data, size, namepos, "rTRC") ||
              isICCword(data, size, namepos, "gTRC") ||
              isICCword(data, size, namepos, "bTRC") ||
              isICCword(data, size, namepos, "kTRC")) {
      char c = (char)data[namepos];
      /* both 'k' and 'r' are stored in channel 0 */
      int channel = (c == 'b') ? 2 : (c == 'g' ? 1 : 0);
      /* "curv": linear, gamma power or LUT */
      if(isICCword(data, size, offset, "curv")) {
        size_t count;
        LodePNGICCCurve* trc = &icc->trc[channel];
        icc->has_trc = 1;
        offset += 8; /* skip tag "curv" and reserved */
        count = decodeICCUint32(data, size, &offset);
        if(count == 0) {
          trc->type = 0; /* linear */
        } else if(count == 1) {
          trc->type = 2; /* gamma */
          trc->gamma = decodeICCUint16(data, size, &offset) / 256.0f;
        } else {
          trc->type = 1; /* LUT */
          if(offset + count * 2 > size || count > 16777216) return 1; /* also avoid crazy count */
          trc->lut_size = count;
          trc->lut = (float*)lodepng_malloc(count * sizeof(float));
          for(j = 0; j < count; j++) {
            trc->lut[j] = decodeICCUint16(data, size, &offset) * (1.0f / 65535.0f);
          }
        }
      }
      /* "para": parametric formula with gamma power, multipliers, biases and comparison point */
      /* TODO: test this on a realistic sample */
      if(isICCword(data, size, offset, "para")) {
        unsigned type;
        LodePNGICCCurve* trc = &icc->trc[channel];
        icc->has_trc = 1;
        offset += 8; /* skip tag "para" and reserved */
        type = decodeICCUint16(data, size, &offset);
        offset += 2;
        if(type > 4) return 1; /* unknown parametric curve type */
        trc->type = type + 2;
        trc->gamma = decodeICC15Fixed16(data, size, &offset);
        if(type >= 1) {
          trc->a = decodeICC15Fixed16(data, size, &offset);
          trc->b = decodeICC15Fixed16(data, size, &offset);
        }
        if(type >= 2) {
          trc->c = decodeICC15Fixed16(data, size, &offset);
        }
        if(type >= 3) {
          trc->d = decodeICC15Fixed16(data, size, &offset);
        }
        if(type == 4) {
          trc->e = decodeICC15Fixed16(data, size, &offset);
          trc->f = decodeICC15Fixed16(data, size, &offset);
        }
      }
      /* TODO: verify: does the "chrm" tag participate in computation so should be parsed? */
    }
    /* Return error if any parse went beyond the filesize. Note that the
    parsing itself was always safe since it bound-checks inside. */
    if(offset > size) return 1;
  }

  return 0;
}

/* Multiplies 3 vector values with 3x3 matrix */
static void mulMatrix(float* x2, float* y2, float* z2, const float* m, double x, double y, double z) {
  /* double used as inputs even though in general the images are float, so the sums happen in
  double precision, because float can give numerical problems for nearby values */
  *x2 = x * m[0] + y * m[1] + z * m[2];
  *y2 = x * m[3] + y * m[4] + z * m[5];
  *z2 = x * m[6] + y * m[7] + z * m[8];
}

static void mulMatrixMatrix(float* result, const float* a, const float* b) {
  int i;
  float temp[9]; /* temp is to allow result and a or b to be the same */
  mulMatrix(&temp[0], &temp[3], &temp[6], a, b[0], b[3], b[6]);
  mulMatrix(&temp[1], &temp[4], &temp[7], a, b[1], b[4], b[7]);
  mulMatrix(&temp[2], &temp[5], &temp[8], a, b[2], b[5], b[8]);
  for(i = 0; i < 9; i++) result[i] = temp[i];
}

/* Inverts 3x3 matrix in place */
static unsigned invMatrix(float* m) {
  int i;
  /* double used instead of float for intermediate computations to avoid
  intermediate numerical precision issues */
  double e0 = (double)m[4] * m[8] - (double)m[5] * m[7];
  double e3 = (double)m[5] * m[6] - (double)m[3] * m[8];
  double e6 = (double)m[3] * m[7] - (double)m[4] * m[6];
  /* inverse determinant */
  double d = 1.0 / (m[0] * e0 + m[1] * e3 + m[2] * e6);
  float result[9];
  if((d > 0 ? d : -d) > 1e15) return 1; /* error, likely not invertible */
  result[0] = e0 * d;
  result[1] = ((double)m[2] * m[7] - (double)m[1] * m[8]) * d;
  result[2] = ((double)m[1] * m[5] - (double)m[2] * m[4]) * d;
  result[3] = e3 * d;
  result[4] = ((double)m[0] * m[8] - (double)m[2] * m[6]) * d;
  result[5] = ((double)m[3] * m[2] - (double)m[0] * m[5]) * d;
  result[6] = e6 * d;
  result[7] = ((double)m[6] * m[1] - (double)m[0] * m[7]) * d;
  result[8] = ((double)m[0] * m[4] - (double)m[3] * m[1]) * d;
  for(i = 0; i < 9; i++) m[i] = result[i];
  return 0; /* ok */
}

/* Get the matrix to go from linear RGB to XYZ given the RGB whitepoint and chromaticities in XYZ colorspace */
static unsigned getChrmMatrixXYZ(float* m,
                                 float wX, float wY, float wZ,
                                 float rX, float rY, float rZ,
                                 float gX, float gY, float gZ,
                                 float bX, float bY, float bZ) {
  float t[9];
  float rs, gs, bs;
  t[0] = rX; t[1] = gX; t[2] = bX;
  t[3] = rY; t[4] = gY; t[5] = bY;
  t[6] = rZ; t[7] = gZ; t[8] = bZ;
  if(invMatrix(t)) return 1; /* error, not invertible */
  mulMatrix(&rs, &gs, &bs, t, wX, wY, wZ);
  m[0] = rs * rX; m[1] = gs * gX; m[2] = bs * bX;
  m[3] = rs * rY; m[4] = gs * gY; m[5] = bs * bY;
  m[6] = rs * rZ; m[7] = gs * gZ; m[8] = bs * bZ;
  return 0;
}

/* Get the matrix to go from linear RGB to XYZ given the RGB whitepoint and chromaticities in xy colorspace */
static unsigned getChrmMatrixXY(float* m,
                                float wx, float wy,
                                float rx, float ry,
                                float gx, float gy,
                                float bx, float by) {
  if(wy == 0 || ry == 0 || gy == 0 || by == 0) {
    return 1; /* error, division through zero */
  } else {
    float wX = wx / wy, wY = 1, wZ = (1 - wx - wy) / wy;
    float rX = rx / ry, rY = 1, rZ = (1 - rx - ry) / ry;
    float gX = gx / gy, gY = 1, gZ = (1 - gx - gy) / gy;
    float bX = bx / by, bY = 1, bZ = (1 - bx - by) / by;
    return getChrmMatrixXYZ(m, wX, wY, wZ, rX, rY, rZ, gX, gY, gZ, bX, bY, bZ);
  }
}

/* Returns matrix that adapts from source whitepoint 0 to destination whitepoint 1.
Types: 0=XYZ scaling, 1=Bradford, 2=Vonkries */
static unsigned getAdaptationMatrix(float* m, int type,
                                    float wx0, float wy0, float wz0,
                                    float wx1, float wy1, float wz1) {
  int i;
  static const float bradford[9] = {
    0.8951, 0.2664, -0.1614,
    -0.7502, 1.7135, 0.0367,
    0.0389, -0.0685, 1.0296
  };
  static const float bradfordinv[9] = {
    0.9869929, -0.1470543, 0.1599627,
    0.4323053, 0.5183603, 0.0492912,
   -0.0085287, 0.0400428, 0.9684867
  };
  static const float vonkries[9] = {
    0.40024, 0.70760, -0.08081,
    -0.22630, 1.16532, 0.04570,
    0.00000, 0.00000, 0.91822,
  };
  static const float vonkriesinv[9] = {
    1.8599364, -1.1293816, 0.2198974,
    0.3611914, 0.6388125, -0.0000064,
   0.0000000, 0.0000000, 1.0890636
  };
  if(type == 0) {
    for(i = 0; i < 9; i++) m[i] = 0;
    m[0] = wx1 / wx0;
    m[4] = wy1 / wy0;
    m[8] = wz1 / wz0;
  } else {
    const float* cat = (type == 1) ? bradford : vonkries;
    const float* inv = (type == 1) ? bradfordinv : vonkriesinv;
    float rho0, gam0, bet0, rho1, gam1, bet1, rho2, gam2, bet2;
    mulMatrix(&rho0, &gam0, &bet0, cat, wx0, wy0, wz0);
    mulMatrix(&rho1, &gam1, &bet1, cat, wx1, wy1, wz1);
    rho2 = rho1 / rho0;
    gam2 = gam1 / gam0;
    bet2 = bet1 / bet0;
    /* Multiply diagonal matrix with cat */
    for(i = 0; i < 3; i++) {
      m[i + 0] = rho2 * cat[i + 0];
      m[i + 3] = gam2 * cat[i + 3];
      m[i + 6] = bet2 * cat[i + 6];
    }
    mulMatrixMatrix(m, inv, m);
  }
  return 0; /* ok */
}

/* validate whether the ICC profile is supported here for PNG */
static unsigned validateICC(const LodePNGICC* icc) {
  /* disable for unsupported things in the icc profile */
  if(icc->inputspace == 0) return 0;
  /* if we didn't recognize both chrm and trc, then maybe the ICC uses data
  types not supported here yet, so fall back to not using it. */
  if(icc->inputspace == 2) {
    /* RGB profile should have chromaticities */
    if(!icc->has_chromaticity) return 0;
  }
  /* An ICC profile without whitepoint is invalid for the kind of profiles used here. */
  if(!icc->has_whitepoint) return 0;
  if(!icc->has_trc) return 0;
  return 1; /* ok */
}

/* Returns chromaticity matrix for given ICC profile, adapted from ICC's
global illuminant as necessary.
Also returns the profile's whitepoint.
In case of a gray profile (icc->inputspace == 1), the identity matrix will be returned
so in that case you could skip the transform. */
static unsigned getICCChrm(float m[9], float whitepoint[3], const LodePNGICC* icc) {
  size_t i;
  if(icc->inputspace == 2) { /* RGB profile */
    float red[3], green[3], blue[3];
    float white[3]; /* the whitepoint of the RGB color space (absolute) */
    /* Adaptation matrix a.
    This is an adaptation needed for ICC's file format (due to it using
    an internal global illuminant unrelated to the actual images) */
    float a[9] = {1,0,0, 0,1,0, 0,0,1};
    /* If the profile has chromatic adaptation matrix "chad", use that one,
    else compute it from the illuminant and whitepoint. */
    if(icc->has_chad) {
      for(i = 0; i < 9; i++) a[i] = icc->chad[i];
      invMatrix(a);
    } else {
      if(getAdaptationMatrix(a, 1, icc->illuminant[0], icc->illuminant[1], icc->illuminant[2],
                             icc->white[0], icc->white[1], icc->white[2])) {
        return 1; /* error computing matrix */
      }
    }
    /* If the profile has a chad, then also the RGB's whitepoint must also be adapted from it (and the one
    given is normally D50). If it did not have a chad, then the whitepoint given is already the adapted one. */
    if(icc->has_chad) {
      mulMatrix(&white[0], &white[1], &white[2], a, icc->white[0], icc->white[1], icc->white[2]);
    } else {
      for(i = 0; i < 3; i++) white[i] = icc->white[i];
    }

    mulMatrix(&red[0], &red[1], &red[2], a, icc->red[0], icc->red[1], icc->red[2]);
    mulMatrix(&green[0], &green[1], &green[2], a, icc->green[0], icc->green[1], icc->green[2]);
    mulMatrix(&blue[0], &blue[1], &blue[2], a, icc->blue[0], icc->blue[1], icc->blue[2]);

    if(getChrmMatrixXYZ(m, white[0], white[1], white[2], red[0], red[1], red[2],
                        green[0], green[1], green[2], blue[0], blue[1], blue[2])) {
      return 1; /* error computing matrix */
    }
    /* output absolute whitepoint of the original RGB model */
    whitepoint[0] = white[0];
    whitepoint[1] = white[1];
    whitepoint[2] = white[2];
  } else {
    /* output the unity matrix, for doing no transform */
    m[0] = m[4] = m[8] = 1;
    m[1] = m[2] = m[3] = m[5] = m[6] = m[7] = 0;
    /* grayscale, don't do anything. That means we are implicitely using equal energy whitepoint "E", indicate
    this to the output. */
    whitepoint[0] = whitepoint[1] = whitepoint[2] = 1;
  }
  return 0; /* success */
}

/* Outputs whitepoint and matrix to go from the icc or info profile (depending on what was in the PNG) to XYZ,
without applying any (rendering intent related) whitepoint adaptation */
static unsigned getChrm(float m[9], float whitepoint[3], unsigned use_icc,
                        const LodePNGICC* icc, const LodePNGInfo* info) {
  size_t i;
  if(use_icc) {
    if(getICCChrm(m, whitepoint, icc)) return 1;  /* error in the matrix computations */
  } else if(info->chrm_defined && !info->srgb_defined) {
    float wx = info->chrm_white_x / 100000.0f, wy = info->chrm_white_y / 100000.0f;
    float rx = info->chrm_red_x / 100000.0f, ry = info->chrm_red_y / 100000.0f;
    float gx = info->chrm_green_x / 100000.0f, gy = info->chrm_green_y / 100000.0f;
    float bx = info->chrm_blue_x / 100000.0f, by = info->chrm_blue_y / 100000.0f;
    if(getChrmMatrixXY(m, wx, wy, rx, ry, gx, gy, bx, by)) return 1; /* returns if error */
    /* Output whitepoint, xyY to XYZ: */
    whitepoint[0] = wx / wy;
    whitepoint[1] = 1;
    whitepoint[2] = (1 - wx - wy) / wy;
  } else {
    /* the standard linear sRGB to XYZ matrix */
    static const float srgb[9] = {
        0.4124564f, 0.3575761f, 0.1804375f,
        0.2126729f, 0.7151522f, 0.0721750f,
        0.0193339f, 0.1191920f, 0.9503041f
    };
    for(i = 0; i < 9; i++) m[i] = srgb[i];
    /* sRGB's whitepoint xyY "0.3127,0.3290,1" in XYZ: */
    whitepoint[0] = 0.9504559270516716f;
    whitepoint[1] = 1;
    whitepoint[2] = 1.0890577507598784f;
  }
  return 0;
}

/* Returns whether the color chunks in info represent the default PNG sRGB,
which is when either no colorometry fields are present at all, or an srgb
field or chrm/gama field with default values are present.
ICC chunks representing sRGB are currently considered not the same. */
static unsigned isSRGB(const LodePNGInfo* info) {
  if(!info) return 1; /* the default is considered sRGB. */

  /* TODO: support some ICC profiles that represent sRGB too. Tricky due to
  possible slight deviations and many ways of representing its gamma function. */
  if(info->iccp_defined) return 0;

  if(info->srgb_defined) return 1;

  /* The gamma chunk is unable to represent sRGB's two-part gamma, so cannot
  be sRGB, even if it's the default 45455. */
  if(info->gama_defined) return 0;

  if(info->chrm_defined) {
    if(info->chrm_white_x != 31270 || info->chrm_white_y != 32900) return 0;
    if(info->chrm_red_x != 64000 || info->chrm_red_y != 33000) return 0;
    if(info->chrm_green_x != 30000 || info->chrm_green_y != 60000) return 0;
    if(info->chrm_blue_x != 15000 || info->chrm_blue_y != 6000) return 0;
  }

  return 1;
}

/* Checks whether the RGB models are equal (chromaticities, ...). The raw byte
format is allowed to be different. Input pointers are allowed to be null,
they then represent the default PNG sRGB (same as having no color model
chunks at all or an srgb chunk in the PNG) */
static unsigned modelsEqual(const LodePNGState* state_a,
                            const LodePNGState* state_b) {
  size_t i;
  const LodePNGInfo* a = state_a ? &state_a->info_png : 0;
  const LodePNGInfo* b = state_b ? &state_b->info_png : 0;
  if(isSRGB(a) != isSRGB(b)) return 0;
  /* now a and b are guaranteed to be non-NULL */
  if(a->iccp_defined != b->iccp_defined) return 0;
  if(a->iccp_defined) {
    if(a->iccp_profile_size != b->iccp_profile_size) return 0;
    /* TODO: return equal in more cases, such as when two ICC profiles that are
    not byte-for-byte equal, but represent the same color model. */
    for(i = 0; i < a->iccp_profile_size; i++) {
      if(a->iccp_profile[i] != b->iccp_profile[i]) return 0;
    }
    /* since the ICC model overrides gamma and chrm, those can be ignored. */
    /* TODO: this doesn't cover the case where the ICC profile is invalid */
    return 1;
  }

  if(a->srgb_defined != b->srgb_defined) return 0;
  if(a->srgb_defined) {
    /* since the sRGB model overrides gamma and chrm, those can be ignored.
    srgb_intent not checked since the conversion ignores it */
    return 1;
  }

  if(a->gama_defined != b->gama_defined) return 0;
  if(a->gama_defined) {
    if(a->gama_gamma != b->gama_gamma) return 0;
  }

  if(a->chrm_defined != b->chrm_defined) return 0;
  if(a->chrm_defined) {
    if(a->chrm_white_x != b->chrm_white_x) return 0;
    if(a->chrm_white_y != b->chrm_white_y) return 0;
    if(a->chrm_red_x != b->chrm_red_x) return 0;
    if(a->chrm_red_y != b->chrm_red_y) return 0;
    if(a->chrm_green_x != b->chrm_green_x) return 0;
    if(a->chrm_green_y != b->chrm_green_y) return 0;
    if(a->chrm_blue_x != b->chrm_blue_x) return 0;
    if(a->chrm_blue_y != b->chrm_blue_y) return 0;
  }

  return 1;
}

/* Converts in-place. Does not clamp. Do not use for integer input, make table instead there. */
static void convertToXYZ_gamma(float* out, const float* in, unsigned w, unsigned h,
                               const LodePNGInfo* info, unsigned use_icc, const LodePNGICC* icc) {
  size_t i, c;
  size_t n = w * h;
  for(i = 0; i < n * 4; i++) {
    out[i] = in[i];
  }
  if(use_icc) {
    for(i = 0; i < n; i++) {
      for(c = 0; c < 3; c++) {
        /* TODO: this is likely very slow */
        out[i * 4 + c] = iccForwardTRC(&icc->trc[c], in[i * 4 + c]);
      }
    }
  } else if(info->gama_defined && !info->srgb_defined) {
    /* nothing to do if gamma is 1 */
    if(info->gama_gamma != 100000) {
      float gamma = 100000.0f / info->gama_gamma;
      for(i = 0; i < n; i++) {
        for(c = 0; c < 3; c++) {
          float v = in[i * 4 + c];
          out[i * 4 + c] = (v <= 0) ? v : lodepng_powf(v, gamma);
        }
      }
    }
  } else {
    for(i = 0; i < n; i++) {
      for(c = 0; c < 3; c++) {
        /* sRGB gamma expand */
        float v = in[i * 4 + c];
        out[i * 4 + c] = (v < 0.04045f) ? (v / 12.92f) : lodepng_powf((v + 0.055f) / 1.055f, 2.4f);
      }
    }
  }
}

/* Same as convertToXYZ_gamma, but creates a lookup table rather than operating on an image */
static void convertToXYZ_gamma_table(float* out, size_t n, size_t c,
                                     const LodePNGInfo* info, unsigned use_icc, const LodePNGICC* icc) {
  size_t i;
  float mul = 1.0f / (n - 1);
  if(use_icc) {
    for(i = 0; i < n; i++) {
      float v = i * mul;
      out[i] = iccForwardTRC(&icc->trc[c], v);
    }
  } else if(info->gama_defined && !info->srgb_defined) {
    /* no power needed if gamma is 1 */
    if(info->gama_gamma == 100000) {
      for(i = 0; i < n; i++) {
        out[i] = i * mul;
      }
    } else {
      float gamma = 100000.0f / info->gama_gamma;
      for(i = 0; i < n; i++) {
        float v = i * mul;
        out[i] = lodepng_powf(v, gamma);
      }
    }
  } else {
    for(i = 0; i < n; i++) {
      /* sRGB gamma expand */
      float v = i * mul;
      out[i] = (v < 0.04045f) ? (v / 12.92f) : lodepng_powf((v + 0.055f) / 1.055f, 2.4f);
    }
  }
}

/* In-place */
static unsigned convertToXYZ_chrm(float* im, unsigned w, unsigned h,
                                  const LodePNGInfo* info, unsigned use_icc, const LodePNGICC* icc,
                                  float whitepoint[3]) {
  unsigned error = 0;
  size_t i;
  size_t n = w * h;
  float m[9]; /* XYZ to linear RGB matrix */

  /* Must be called even for grayscale, to get the correct whitepoint to output */
  error = getChrm(m, whitepoint, use_icc, icc, info);
  if(error) return error;

  /* Note: no whitepoint adaptation done to m here, because we only do the
  adaptation in convertFromXYZ (we only whitepoint adapt when going to the
  target RGB space, but here we're going from the source RGB space to XYZ) */

  /* Apply the above computed linear-RGB-to-XYZ matrix to the pixels.
  Skip the transform if it's the unit matrix (which is the case if grayscale profile) */
  if(!use_icc || icc->inputspace == 2) {
    for(i = 0; i < n; i++) {
      size_t j = i * 4;
      mulMatrix(&im[j + 0], &im[j + 1], &im[j + 2], m, im[j + 0], im[j + 1], im[j + 2]);
    }
  }

  return 0;
}

unsigned convertToXYZ(float* out, float whitepoint[3], const unsigned char* in,
                      unsigned w, unsigned h, const LodePNGState* state) {
  unsigned error = 0;
  size_t i;
  size_t n = w * h;
  const LodePNGColorMode* mode_in = &state->info_raw;
  const LodePNGInfo* info = &state->info_png;
  unsigned char* data = 0;
  float* gammatable = 0;
  int bit16 = mode_in->bitdepth > 8;
  size_t num = bit16 ? 65536 : 256;
  LodePNGColorMode tempmode = lodepng_color_mode_make(LCT_RGBA, bit16 ? 16 : 8);


  unsigned use_icc = 0;
  LodePNGICC icc;
  lodepng_icc_init(&icc);
  if(info->iccp_defined) {
    error = parseICC(&icc, info->iccp_profile, info->iccp_profile_size);
    if(error) goto cleanup; /* corrupted ICC profile */
    use_icc = validateICC(&icc);
  }

  data = (unsigned char*)lodepng_malloc(w * h * (bit16 ? 8 : 4));
  error = lodepng_convert(data, in, &tempmode, mode_in, w, h);
  if(error) goto cleanup;

  /* Handle transfer function */
  {
    float* gammatable_r;
    float* gammatable_g;
    float* gammatable_b;

    /* RGB ICC, can have three different transfer functions */
    if(use_icc && icc.inputspace == 2) {
      gammatable = (float*)lodepng_malloc(num * 3 * sizeof(float));
      gammatable_r = &gammatable[num * 0];
      gammatable_g = &gammatable[num * 1];
      gammatable_b = &gammatable[num * 2];
      convertToXYZ_gamma_table(gammatable_r, num, 0, info, use_icc, &icc);
      convertToXYZ_gamma_table(gammatable_g, num, 1, info, use_icc, &icc);
      convertToXYZ_gamma_table(gammatable_b, num, 2, info, use_icc, &icc);
    } else {
      gammatable = (float*)lodepng_malloc(num * sizeof(float));
      gammatable_r = gammatable_g = gammatable_b = gammatable;
      convertToXYZ_gamma_table(gammatable, num, 0, info, use_icc, &icc);
    }

    if(bit16) {
      for(i = 0; i < n; i++) {
        out[i * 4 + 0] = gammatable_r[data[i * 8 + 0] * 256u + data[i * 8 + 1]];
        out[i * 4 + 1] = gammatable_g[data[i * 8 + 2] * 256u + data[i * 8 + 3]];
        out[i * 4 + 2] = gammatable_b[data[i * 8 + 4] * 256u + data[i * 8 + 5]];
        out[i * 4 + 3] = (data[i * 8 + 6] * 256 + data[i * 8 + 7]) * (1 / 65535.0f);
      }
    } else {
      for(i = 0; i < n; i++) {
        out[i * 4 + 0] = gammatable_r[data[i * 4 + 0]];
        out[i * 4 + 1] = gammatable_g[data[i * 4 + 1]];
        out[i * 4 + 2] = gammatable_b[data[i * 4 + 2]];
        out[i * 4 + 3] = data[i * 4 + 3] * (1 / 255.0f);
      }
    }
  }

  convertToXYZ_chrm(out, w, h, info, use_icc, &icc, whitepoint);

cleanup:
  lodepng_icc_cleanup(&icc);
  lodepng_free(data);
  lodepng_free(gammatable);
  return error;
}

unsigned convertToXYZFloat(float* out, float whitepoint[3], const float* in,
                           unsigned w, unsigned h, const LodePNGState* state) {
  unsigned error = 0;
  const LodePNGInfo* info = &state->info_png;

  unsigned use_icc = 0;
  LodePNGICC icc;
  lodepng_icc_init(&icc);
  if(info->iccp_defined) {
    error = parseICC(&icc, info->iccp_profile, info->iccp_profile_size);
    if(error) goto cleanup; /* corrupted ICC profile */
    use_icc = validateICC(&icc);
  }
  /* Input is floating point, so lookup table cannot be used, but it's ensured to
  use float pow, not the slower double pow. */
  convertToXYZ_gamma(out, in, w, h, info, use_icc, &icc);
  convertToXYZ_chrm(out, w, h, info, use_icc, &icc, whitepoint);

cleanup:
  lodepng_icc_cleanup(&icc);
  return error;
}

static unsigned convertFromXYZ_chrm(float* out, const float* in, unsigned w, unsigned h,
                                    const LodePNGInfo* info, unsigned use_icc, const LodePNGICC* icc,
                                    const float whitepoint[3], unsigned rendering_intent) {
  size_t i;
  size_t n = w * h;

  float m[9]; /* XYZ to linear RGB matrix */
  float white[3]; /* The whitepoint (absolute) of the target RGB space */

  if(getChrm(m, white, use_icc, icc, info)) return 1;
  if(invMatrix(m)) return 1; /* error, not invertible */

  /* for relative rendering intent (any except absolute "3"), must whitepoint adapt to the original whitepoint.
  this also ensures grayscale stays grayscale (with absolute, grayscale could become e.g. blue or sepia) */
  if(rendering_intent != 3) {
    float a[9] = {1,0,0, 0,1,0, 0,0,1};
    /* "white" = absolute whitepoint of the new target RGB space, read from the target color profile.
    "whitepoint" is original absolute whitepoint (input as parameter of this function) of an
    RGB space the XYZ data once had before it was converted to XYZ, in other words the whitepoint that
    we want to adapt our current data to to make sure values that had equal R==G==B in the old space have
    the same property now (white stays white and gray stays gray).
    Note: "absolute" whitepoint above means, can be used as-is, not needing further adaptation itself like icc.white does.*/
    if(getAdaptationMatrix(a, 1, whitepoint[0], whitepoint[1], whitepoint[2], white[0], white[1], white[2])) {
      return 1;
    }
    /* multiply the from xyz matrix with the adaptation matrix: in total,
    the resulting matrix first adapts in XYZ space, then converts to RGB*/
    mulMatrixMatrix(m, m, a);
  }

  /* Apply the above computed XYZ-to-linear-RGB matrix to the pixels.
  This transformation also includes the whitepoint adaptation. The transform
  can be skipped only if it's the unit matrix (only if grayscale profile and no
  whitepoint adaptation, such as with rendering intent 3)*/
  if(!use_icc || icc->inputspace == 2 || rendering_intent != 3) {
    for(i = 0; i < n; i++) {
      size_t j = i * 4;
      mulMatrix(&out[j + 0], &out[j + 1], &out[j + 2], m, in[j + 0], in[j + 1], in[j + 2]);
      out[j + 3] = in[j + 3];
    }
  } else {
    for(i = 0; i < n * 4; i++) {
      out[i] = in[i];
    }
  }

  return 0;
}

/* Converts in-place. Does not clamp. */
static void convertFromXYZ_gamma(float* im, unsigned w, unsigned h,
                                 const LodePNGInfo* info, unsigned use_icc, const LodePNGICC* icc) {
  size_t i, c;
  size_t n = w * h;
  if(use_icc) {
    for(i = 0; i < n; i++) {
      for(c = 0; c < 3; c++) {
        /* TODO: this is likely very slow */
        im[i * 4 + c] = iccBackwardTRC(&icc->trc[c], im[i * 4 + c]);
      }
    }
  } else if(info->gama_defined && !info->srgb_defined) {
    /* nothing to do if gamma is 1 */
    if(info->gama_gamma != 100000) {
      float gamma = info->gama_gamma / 100000.0f;
      for(i = 0; i < n; i++) {
        for(c = 0; c < 3; c++) {
          if(im[i * 4 + c] > 0) im[i * 4 + c] = lodepng_powf(im[i * 4 + c], gamma);
        }
      }
    }
  } else {
    for(i = 0; i < n; i++) {
      for(c = 0; c < 3; c++) {
        /* sRGB gamma compress */
        float* v = &im[i * 4 + c];
        *v = (*v < 0.0031308f) ? (*v * 12.92f) : (1.055f * lodepng_powf(*v, 1 / 2.4f) - 0.055f);
      }
    }
  }
}

unsigned convertFromXYZ(unsigned char* out, const float* in, unsigned w, unsigned h,
                        const LodePNGState* state,
                        const float whitepoint[3], unsigned rendering_intent) {
  unsigned error = 0;
  size_t i, c;
  size_t n = w * h;
  const LodePNGColorMode* mode_out = &state->info_raw;
  const LodePNGInfo* info = &state->info_png;
  int bit16 = mode_out->bitdepth > 8;
  float* im = 0;
  unsigned char* data = 0;

  /* parse ICC if present */
  unsigned use_icc = 0;
  LodePNGICC icc;
  lodepng_icc_init(&icc);
  if(info->iccp_defined) {
    error = parseICC(&icc, info->iccp_profile, info->iccp_profile_size);
    if(error) goto cleanup; /* corrupted ICC profile */
    use_icc = validateICC(&icc);
  }

  /* Handle gamut */
  im = (float*)lodepng_malloc(w * h * 4 * sizeof(float));
  error = convertFromXYZ_chrm(im, in, w, h, info, use_icc, &icc, whitepoint, rendering_intent);
  if(error) goto cleanup;

  /* Handle transfer function */
  /* Input is floating point, so lookup table cannot be used, but it's ensured to use float pow, not the slower double pow. */
  convertFromXYZ_gamma(im, w, h, info, use_icc, &icc);

  /* Convert to integer output */
  data = (unsigned char*)lodepng_malloc(w * h * 8);
  /* TODO: check if also 1/2/4 bit case needed: rounding is at different fine-grainedness for 8 and 16 bits below. */
  if(bit16) {
    LodePNGColorMode mode16 = lodepng_color_mode_make(LCT_RGBA, 16);
    for(i = 0; i < n; i++) {
      for(c = 0; c < 4; c++) {
        size_t j = i * 8 + c * 2;
        int i16 = (int)(0.5f + 65535.0f * LODEPNG_MIN(LODEPNG_MAX(0.0f, im[i * 4 + c]), 1.0f));
        data[j + 0] = i16 >> 8;
        data[j + 1] = i16 & 255;
      }
    }
    error = lodepng_convert(out, data, mode_out, &mode16, w, h);
    if(error) goto cleanup;
  } else {
    LodePNGColorMode mode8 = lodepng_color_mode_make(LCT_RGBA, 8);
    for(i = 0; i < n; i++) {
      for(c = 0; c < 4; c++) {
        int i8 = (int)(0.5f + 255.0f * LODEPNG_MIN(LODEPNG_MAX(0.0f, im[i * 4 + c]), 1.0f));
        data[i * 4 + c] = i8;
      }
    }
    error = lodepng_convert(out, data, mode_out, &mode8, w, h);
    if(error) goto cleanup;
  }

cleanup:
  lodepng_icc_cleanup(&icc);
  lodepng_free(im);
  lodepng_free(data);
  return error;
}

unsigned convertFromXYZFloat(float* out, const float* in, unsigned w, unsigned h,
                             const LodePNGState* state,
                             const float whitepoint[3], unsigned rendering_intent) {
  unsigned error = 0;
  const LodePNGInfo* info = &state->info_png;

  /* parse ICC if present */
  unsigned use_icc = 0;
  LodePNGICC icc;
  lodepng_icc_init(&icc);
  if(info->iccp_defined) {
    error = parseICC(&icc, info->iccp_profile, info->iccp_profile_size);
    if(error) goto cleanup; /* corrupted ICC profile */
    use_icc = validateICC(&icc);
  }

  /* Handle gamut */
  error = convertFromXYZ_chrm(out, in, w, h, info, use_icc, &icc, whitepoint, rendering_intent);
  if(error) goto cleanup;

  /* Handle transfer function */
  convertFromXYZ_gamma(out, w, h, info, use_icc, &icc);

cleanup:
  lodepng_icc_cleanup(&icc);
  return error;
}

unsigned convertRGBModel(unsigned char* out, const unsigned char* in,
                         unsigned w, unsigned h,
                         const LodePNGState* state_out,
                         const LodePNGState* state_in,
                         unsigned rendering_intent) {
  if(modelsEqual(state_in, state_out)) {
    return lodepng_convert(out, in, &state_out->info_raw, &state_in->info_raw, w, h);
  } else {
    unsigned error = 0;
    float* xyz = (float*)lodepng_malloc(w * h * 4 * sizeof(float));
    float whitepoint[3];
    error = convertToXYZ(&xyz[0], whitepoint, in, w, h, state_in);
    if (!error) error = convertFromXYZ(out, &xyz[0], w, h, state_out, whitepoint, rendering_intent);
    lodepng_free(xyz);
    return error;
  }
}

unsigned convertToSrgb(unsigned char* out, const unsigned char* in,
                       unsigned w, unsigned h,
                       const LodePNGState* state_in) {
  LodePNGState srgb;
  lodepng_state_init(&srgb);
  lodepng_color_mode_copy(&srgb.info_raw, &state_in->info_raw);
  return convertRGBModel(out, in, w, h, &srgb, state_in, 1);
}

unsigned convertFromSrgb(unsigned char* out, const unsigned char* in,
                         unsigned w, unsigned h,
                         const LodePNGState* state_out) {
  LodePNGState srgb;
  lodepng_state_init(&srgb);
  lodepng_color_mode_copy(&srgb.info_raw, &state_out->info_raw);
  return convertRGBModel(out, in, w, h, state_out, &srgb, 1);
}

#endif /*LODEPNG_COMPILE_ANCILLARY_CHUNKS*/

////////////////////////////////////////////////////////////////////////////////



//This uses a stripped down version of picoPNG to extract detailed zlib information while decompressing.
static const unsigned long LENBASE[29] = {3,4,5,6,7,8,9,10,11,13,15,17,19,23,27,31,35,43,51,59,67,83,99,115,131,163,195,227,258};
static const unsigned long LENEXTRA[29] = {0,0,0,0,0,0,0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4,  4,  5,  5,  5,  5,  0};
static const unsigned long DISTBASE[30] = {1,2,3,4,5,7,9,13,17,25,33,49,65,97,129,193,257,385,513,769,1025,1537,2049,3073,4097,6145,8193,12289,16385,24577};
static const unsigned long DISTEXTRA[30] = {0,0,0,0,1,1,2, 2, 3, 3, 4, 4, 5, 5,  6,  6,  7,  7,  8,  8,   9,   9,  10,  10,  11,  11,  12,   12,   13,   13};
static const unsigned long CLCL[19] = {16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15}; //code length code lengths

struct ExtractZlib { // Zlib decompression and information extraction
  std::vector<ZlibBlockInfo>* zlibinfo;
  ExtractZlib(std::vector<ZlibBlockInfo>* info) : zlibinfo(info) {};
  int error;

  unsigned long readBitFromStream(size_t& bitp, const unsigned char* bits) {
    unsigned long result = (bits[bitp >> 3] >> (bitp & 0x7)) & 1;
    bitp++;
    return result;
  }

  unsigned long readBitsFromStream(size_t& bitp, const unsigned char* bits, size_t nbits) {
    unsigned long result = 0;
    for(size_t i = 0; i < nbits; i++) result += (readBitFromStream(bitp, bits)) << i;
    return result;
  }

  struct HuffmanTree {
    int makeFromLengths(const std::vector<unsigned long>& bitlen, unsigned long maxbitlen) { //make tree given the lengths
      unsigned long numcodes = (unsigned long)(bitlen.size()), treepos = 0, nodefilled = 0;
      std::vector<unsigned long> tree1d(numcodes), blcount(maxbitlen + 1, 0), nextcode(maxbitlen + 1, 0);
      //count number of instances of each code length
      for(unsigned long bits = 0; bits < numcodes; bits++) blcount[bitlen[bits]]++;
      for(unsigned long bits = 1; bits <= maxbitlen; bits++) {
        nextcode[bits] = (nextcode[bits - 1] + blcount[bits - 1]) << 1;
      }
      //generate all the codes
      for(unsigned long n = 0; n < numcodes; n++) if(bitlen[n] != 0) tree1d[n] = nextcode[bitlen[n]]++;
      tree2d.clear(); tree2d.resize(numcodes * 2, 32767); //32767 here means the tree2d isn't filled there yet
      for(unsigned long n = 0; n < numcodes; n++) //the codes
      for(unsigned long i = 0; i < bitlen[n]; i++) { //the bits for this code
        unsigned long bit = (tree1d[n] >> (bitlen[n] - i - 1)) & 1;
        if(treepos > numcodes - 2) return 55;
        if(tree2d[2 * treepos + bit] == 32767) { //not yet filled in
          if(i + 1 == bitlen[n]) {
            //last bit
            tree2d[2 * treepos + bit] = n;
            treepos = 0;
          } else {
            //addresses are encoded as values > numcodes
            tree2d[2 * treepos + bit] = ++nodefilled + numcodes;
            treepos = nodefilled;
          }
        }
        else treepos = tree2d[2 * treepos + bit] - numcodes; //subtract numcodes from address to get address value
      }
      return 0;
    }
    int decode(bool& decoded, unsigned long& result, size_t& treepos, unsigned long bit) const { //Decodes a symbol from the tree
      unsigned long numcodes = (unsigned long)tree2d.size() / 2;
      if(treepos >= numcodes) return 11; //error: you appeared outside the codetree
      result = tree2d[2 * treepos + bit];
      decoded = (result < numcodes);
      treepos = decoded ? 0 : result - numcodes;
      return 0;
    }
    //2D representation of a huffman tree: one dimension is "0" or "1", the other contains all nodes and leaves.
    std::vector<unsigned long> tree2d;
  };

  void inflate(std::vector<unsigned char>& out, const std::vector<unsigned char>& in, size_t inpos = 0) {
    size_t bp = 0, pos = 0; //bit pointer and byte pointer
    error = 0;
    unsigned long BFINAL = 0;
    while(!BFINAL && !error) {
      size_t uncomprblockstart = pos;
      size_t bpstart = bp;
      if(bp >> 3 >= in.size()) { error = 52; return; } //error, bit pointer will jump past memory
      BFINAL = readBitFromStream(bp, &in[inpos]);
      unsigned long BTYPE = readBitFromStream(bp, &in[inpos]); BTYPE += 2 * readBitFromStream(bp, &in[inpos]);
      zlibinfo->resize(zlibinfo->size() + 1);
      zlibinfo->back().btype = BTYPE;
      if(BTYPE == 3) { error = 20; return; } //error: invalid BTYPE
      else if(BTYPE == 0) inflateNoCompression(out, &in[inpos], bp, pos, in.size());
      else inflateHuffmanBlock(out, &in[inpos], bp, pos, in.size(), BTYPE);
      size_t uncomprblocksize = pos - uncomprblockstart;
      zlibinfo->back().compressedbits = bp - bpstart;
      zlibinfo->back().uncompressedbytes = uncomprblocksize;
    }
  }

  void generateFixedTrees(HuffmanTree& tree, HuffmanTree& treeD) { //get the tree of a deflated block with fixed tree
    std::vector<unsigned long> bitlen(288, 8), bitlenD(32, 5);;
    for(size_t i = 144; i <= 255; i++) bitlen[i] = 9;
    for(size_t i = 256; i <= 279; i++) bitlen[i] = 7;
    tree.makeFromLengths(bitlen, 15);
    treeD.makeFromLengths(bitlenD, 15);
  }

  //the code tree for Huffman codes, dist codes, and code length codes
  HuffmanTree codetree, codetreeD, codelengthcodetree;
  unsigned long huffmanDecodeSymbol(const unsigned char* in, size_t& bp, const HuffmanTree& tree, size_t inlength) {
    //decode a single symbol from given list of bits with given code tree. return value is the symbol
    bool decoded; unsigned long ct;
    for(size_t treepos = 0;;) {
      if((bp & 0x07) == 0 && (bp >> 3) > inlength) { error = 10; return 0; } //error: end reached without endcode
      error = tree.decode(decoded, ct, treepos, readBitFromStream(bp, in));
      if(error) return 0; //stop, an error happened
      if(decoded) return ct;
    }
  }

  void getTreeInflateDynamic(HuffmanTree& tree, HuffmanTree& treeD,
                             const unsigned char* in, size_t& bp, size_t inlength) {
    size_t bpstart = bp;
    //get the tree of a deflated block with dynamic tree, the tree itself is also Huffman compressed with a known tree
    std::vector<unsigned long> bitlen(288, 0), bitlenD(32, 0);
    if(bp >> 3 >= inlength - 2) { error = 49; return; } //the bit pointer is or will go past the memory
    size_t HLIT =  readBitsFromStream(bp, in, 5) + 257; //number of literal/length codes + 257
    size_t HDIST = readBitsFromStream(bp, in, 5) + 1; //number of dist codes + 1
    size_t HCLEN = readBitsFromStream(bp, in, 4) + 4; //number of code length codes + 4
    zlibinfo->back().hlit = HLIT - 257;
    zlibinfo->back().hdist = HDIST - 1;
    zlibinfo->back().hclen = HCLEN - 4;
    std::vector<unsigned long> codelengthcode(19); //lengths of tree to decode the lengths of the dynamic tree
    for(size_t i = 0; i < 19; i++) codelengthcode[CLCL[i]] = (i < HCLEN) ? readBitsFromStream(bp, in, 3) : 0;
    //code length code lengths
    for(size_t i = 0; i < codelengthcode.size(); i++) zlibinfo->back().clcl.push_back(codelengthcode[i]);
    error = codelengthcodetree.makeFromLengths(codelengthcode, 7); if(error) return;
    size_t i = 0, replength;
    while(i < HLIT + HDIST) {
      unsigned long code = huffmanDecodeSymbol(in, bp, codelengthcodetree, inlength); if(error) return;
      zlibinfo->back().treecodes.push_back(code); //tree symbol code
      if(code <= 15)  { if(i < HLIT) bitlen[i++] = code; else bitlenD[i++ - HLIT] = code; } //a length code
      else if(code == 16) { //repeat previous
        if(bp >> 3 >= inlength) { error = 50; return; } //error, bit pointer jumps past memory
        replength = 3 + readBitsFromStream(bp, in, 2);
        unsigned long value; //set value to the previous code
        if((i - 1) < HLIT) value = bitlen[i - 1];
        else value = bitlenD[i - HLIT - 1];
        for(size_t n = 0; n < replength; n++) { //repeat this value in the next lengths
          if(i >= HLIT + HDIST) { error = 13; return; } //error: i is larger than the amount of codes
          if(i < HLIT) bitlen[i++] = value; else bitlenD[i++ - HLIT] = value;
        }
      } else if(code == 17) { //repeat "0" 3-10 times
        if(bp >> 3 >= inlength) { error = 50; return; } //error, bit pointer jumps past memory
        replength = 3 + readBitsFromStream(bp, in, 3);
        zlibinfo->back().treecodes.push_back(replength); //tree symbol code repetitions
        for(size_t n = 0; n < replength; n++) { //repeat this value in the next lengths
          if(i >= HLIT + HDIST) { error = 14; return; } //error: i is larger than the amount of codes
          if(i < HLIT) bitlen[i++] = 0; else bitlenD[i++ - HLIT] = 0;
        }
      } else if(code == 18) { //repeat "0" 11-138 times
        if(bp >> 3 >= inlength) { error = 50; return; } //error, bit pointer jumps past memory
        replength = 11 + readBitsFromStream(bp, in, 7);
        zlibinfo->back().treecodes.push_back(replength); //tree symbol code repetitions
        for(size_t n = 0; n < replength; n++) { //repeat this value in the next lengths
          if(i >= HLIT + HDIST) { error = 15; return; } //error: i is larger than the amount of codes
          if(i < HLIT) bitlen[i++] = 0; else bitlenD[i++ - HLIT] = 0;
        }
      }
      else { error = 16; return; } //error: somehow an unexisting code appeared. This can never happen.
    }
    if(bitlen[256] == 0) { error = 64; return; } //the length of the end code 256 must be larger than 0
    error = tree.makeFromLengths(bitlen, 15);
    if(error) return; //now we've finally got HLIT and HDIST, so generate the code trees, and the function is done
    error = treeD.makeFromLengths(bitlenD, 15);
    if(error) return;
    zlibinfo->back().treebits = bp - bpstart;
    //lit/len/end symbol lengths
    for(size_t j = 0; j < bitlen.size(); j++) zlibinfo->back().litlenlengths.push_back(bitlen[j]);
    //dist lengths
    for(size_t j = 0; j < bitlenD.size(); j++) zlibinfo->back().distlengths.push_back(bitlenD[j]);
  }

  void inflateHuffmanBlock(std::vector<unsigned char>& out,
                           const unsigned char* in, size_t& bp, size_t& pos, size_t inlength, unsigned long btype) {
    size_t numcodes = 0, numlit = 0, numlen = 0; //for logging
    if(btype == 1) { generateFixedTrees(codetree, codetreeD); }
    else if(btype == 2) { getTreeInflateDynamic(codetree, codetreeD, in, bp, inlength); if(error) return; }
    for(;;) {
      unsigned long code = huffmanDecodeSymbol(in, bp, codetree, inlength); if(error) return;
      numcodes++;
      zlibinfo->back().lz77_lcode.push_back(code); //output code
      zlibinfo->back().lz77_dcode.push_back(0);
      zlibinfo->back().lz77_lbits.push_back(0);
      zlibinfo->back().lz77_dbits.push_back(0);
      zlibinfo->back().lz77_lvalue.push_back(0);
      zlibinfo->back().lz77_dvalue.push_back(0);

      if(code == 256) {
        break; //end code
      } else if(code <= 255) { //literal symbol
        out.push_back((unsigned char)(code));
        pos++;
        numlit++;
      } else if(code >= 257 && code <= 285) { //length code
        size_t length = LENBASE[code - 257], numextrabits = LENEXTRA[code - 257];
        if((bp >> 3) >= inlength) { error = 51; return; } //error, bit pointer will jump past memory
        length += readBitsFromStream(bp, in, numextrabits);
        unsigned long codeD = huffmanDecodeSymbol(in, bp, codetreeD, inlength); if(error) return;
        if(codeD > 29) { error = 18; return; } //error: invalid dist code (30-31 are never used)
        unsigned long dist = DISTBASE[codeD], numextrabitsD = DISTEXTRA[codeD];
        if((bp >> 3) >= inlength) { error = 51; return; } //error, bit pointer will jump past memory
        dist += readBitsFromStream(bp, in, numextrabitsD);
        size_t start = pos, back = start - dist; //backwards
        for(size_t i = 0; i < length; i++) {
          out.push_back(out[back++]);
          pos++;
          if(back >= start) back = start - dist;
        }
        numlen++;
        zlibinfo->back().lz77_dcode.back() = codeD; //output distance code
        zlibinfo->back().lz77_lbits.back() = numextrabits; //output length extra bits
        zlibinfo->back().lz77_dbits.back() = numextrabitsD; //output dist extra bits
        zlibinfo->back().lz77_lvalue.back() = length; //output length
        zlibinfo->back().lz77_dvalue.back() = dist; //output dist
      }
    }
    zlibinfo->back().numlit = numlit; //output number of literal symbols
    zlibinfo->back().numlen = numlen; //output number of length symbols
  }

  void inflateNoCompression(std::vector<unsigned char>& out,
                            const unsigned char* in, size_t& bp, size_t& pos, size_t inlength) {
    while((bp & 0x7) != 0) bp++; //go to first boundary of byte
    size_t p = bp / 8;
    if(p >= inlength - 4) { error = 52; return; } //error, bit pointer will jump past memory
    unsigned long LEN = in[p] + 256u * in[p + 1], NLEN = in[p + 2] + 256u * in[p + 3]; p += 4;
    if(LEN + NLEN != 65535) { error = 21; return; } //error: NLEN is not one's complement of LEN
    if(p + LEN > inlength) { error = 23; return; } //error: reading outside of in buffer
    for(unsigned long n = 0; n < LEN; n++) {
      out.push_back(in[p++]); //read LEN bytes of literal data
      pos++;
    }
    bp = p * 8;
  }

  int decompress(std::vector<unsigned char>& out, const std::vector<unsigned char>& in) { //returns error value
    if(in.size() < 2) { return 53; } //error, size of zlib data too small
    //error: 256 * in[0] + in[1] must be a multiple of 31, the FCHECK value is supposed to be made that way
    if((in[0] * 256 + in[1]) % 31 != 0) { return 24; }
    unsigned long CM = in[0] & 15, CINFO = (in[0] >> 4) & 15, FDICT = (in[1] >> 5) & 1;
    //error: only compression method 8: inflate with sliding window of 32k is supported by the PNG spec
    if(CM != 8 || CINFO > 7) { return 25; }
    //error: the PNG spec says about the zlib stream: "The additional flags shall not specify a preset dictionary."
    if(FDICT != 0) { return 26; }
    inflate(out, in, 2);
    return error; //note: adler32 checksum was skipped and ignored
  }
};

struct ExtractPNG { //PNG decoding and information extraction
  std::vector<ZlibBlockInfo>* zlibinfo;
  ExtractPNG(std::vector<ZlibBlockInfo>* info) : zlibinfo(info) {};
  int error;
  void decode(const unsigned char* in, size_t size) {
    error = 0;
    if(size == 0 || in == 0) { error = 48; return; } //the given data is empty
    readPngHeader(&in[0], size); if(error) return;
    size_t pos = 33; //first byte of the first chunk after the header
    std::vector<unsigned char> idat; //the data from idat chunks
    bool IEND = false;
    //loop through the chunks, ignoring unknown chunks and stopping at IEND chunk.
    //IDAT data is put at the start of the in buffer
    while(!IEND) {
      //error: size of the in buffer too small to contain next chunk
      if(pos + 8 >= size) { error = 30; return; }
      size_t chunkLength = read32bitInt(&in[pos]); pos += 4;
      if(chunkLength > 2147483647) { error = 63; return; }
      //error: size of the in buffer too small to contain next chunk
      if(pos + chunkLength >= size) { error = 35; return; }
      //IDAT chunk, containing compressed image data
      if(in[pos + 0] == 'I' && in[pos + 1] == 'D' && in[pos + 2] == 'A' && in[pos + 3] == 'T') {
        idat.insert(idat.end(), &in[pos + 4], &in[pos + 4 + chunkLength]);
        pos += (4 + chunkLength);
      } else if(in[pos + 0] == 'I' && in[pos + 1] == 'E' && in[pos + 2] == 'N' && in[pos + 3] == 'D') {
          pos += 4;
          IEND = true;
      } else { //it's not an implemented chunk type, so ignore it: skip over the data
        pos += (chunkLength + 4); //skip 4 letters and uninterpreted data of unimplemented chunk
      }
      pos += 4; //step over CRC (which is ignored)
    }
    std::vector<unsigned char> out; //now the out buffer will be filled
    ExtractZlib zlib(zlibinfo); //decompress with the Zlib decompressor
    error = zlib.decompress(out, idat);
    if(error) return; //stop if the zlib decompressor returned an error
  }

  //read the information from the header and store it in the Info
  void readPngHeader(const unsigned char* in, size_t inlength) {
    if(inlength < 29) { error = 27; return; } //error: the data length is smaller than the length of the header
    if(in[0] != 137 || in[1] != 80 || in[2] != 78 || in[3] != 71
    || in[4] != 13 || in[5] != 10 || in[6] != 26 || in[7] != 10) { error = 28; return; } //no PNG signature
    //error: it doesn't start with a IHDR chunk!
    if(in[12] != 'I' || in[13] != 'H' || in[14] != 'D' || in[15] != 'R') { error = 29; return; }
  }

  unsigned long readBitFromReversedStream(size_t& bitp, const unsigned char* bits) {
    unsigned long result = (bits[bitp >> 3] >> (7 - (bitp & 0x7))) & 1;
    bitp++;
    return result;
  }

  unsigned long readBitsFromReversedStream(size_t& bitp, const unsigned char* bits, unsigned long nbits) {
    unsigned long result = 0;
    for(size_t i = nbits - 1; i < nbits; i--) result += ((readBitFromReversedStream(bitp, bits)) << i);
    return result;
  }

  void setBitOfReversedStream(size_t& bitp, unsigned char* bits, unsigned long bit) {
    bits[bitp >> 3] |=  (bit << (7 - (bitp & 0x7))); bitp++;
  }

  unsigned long read32bitInt(const unsigned char* buffer) {
    return (unsigned int)((buffer[0] << 24u) | (buffer[1] << 16u) | (buffer[2] << 8u) | buffer[3]);
  }
};

void extractZlibInfo(std::vector<ZlibBlockInfo>& zlibinfo, const std::vector<unsigned char>& in) {
  ExtractPNG decoder(&zlibinfo);
  decoder.decode(&in[0], in.size());

  if(decoder.error) std::cout << "extract error: " << decoder.error << std::endl;
}

} // namespace lodepng
