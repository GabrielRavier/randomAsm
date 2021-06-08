#include <stdint.h>

#define main asmMain
//#define putchar _putchar
//int putchar(int);

#define HAS_128BIT

#ifdef HAS_128BIT
#define uint128_t unsigned __int128
#else
#define UINT128_T_EXTERN

//#include <ostream>
//#include <stdexcept>
//#include <string>
//#include <type_traits>
//#include <utility>

namespace std
{
  // Primary template.
  /// Define a member typedef @c type only if a boolean constant is true.
  template<bool, typename _Tp = void>
	struct enable_if
	{ };

  // Partial specialization for true.
  template<typename _Tp>
	struct enable_if<true, _Tp>
	{ typedef _Tp type; };

  /// integral_constant
  template<typename _Tp, _Tp __v>
	struct integral_constant
	{
	  static constexpr _Tp                  value = __v;
	  typedef _Tp                           value_type;
	  typedef integral_constant<_Tp, __v>   type;
	  constexpr operator value_type() const noexcept { return value; }
#if __cplusplus > 201103L

#define __cpp_lib_integral_constant_callable 201304

	  constexpr value_type operator()() const noexcept { return value; }
#endif
	};

  template<typename _Tp, _Tp __v>
	constexpr _Tp integral_constant<_Tp, __v>::value;

  /// The type used as a compile-time boolean with true value.
  typedef integral_constant<bool, true>     true_type;

  /// The type used as a compile-time boolean with false value.
  typedef integral_constant<bool, false>    false_type;

  template<typename>
	struct __is_integral_helper
	: public false_type { };

  template<>
	struct __is_integral_helper<bool>
	: public true_type { };

  template<>
	struct __is_integral_helper<char>
	: public true_type { };

  template<>
	struct __is_integral_helper<signed char>
	: public true_type { };

  template<>
	struct __is_integral_helper<unsigned char>
	: public true_type { };

#ifdef _GLIBCXX_USE_WCHAR_T
  template<>
	struct __is_integral_helper<wchar_t>
	: public true_type { };
#endif

#ifdef _GLIBCXX_USE_CHAR8_T
  template<>
	struct __is_integral_helper<char8_t>
	: public true_type { };
#endif

  template<>
	struct __is_integral_helper<char16_t>
	: public true_type { };

  template<>
	struct __is_integral_helper<char32_t>
	: public true_type { };

  template<>
	struct __is_integral_helper<short>
	: public true_type { };

  template<>
	struct __is_integral_helper<unsigned short>
	: public true_type { };

  template<>
	struct __is_integral_helper<int>
	: public true_type { };

  template<>
	struct __is_integral_helper<unsigned int>
	: public true_type { };

  template<>
	struct __is_integral_helper<long>
	: public true_type { };

  template<>
	struct __is_integral_helper<unsigned long>
	: public true_type { };

  template<>
	struct __is_integral_helper<long long>
	: public true_type { };

  template<>
	struct __is_integral_helper<unsigned long long>
	: public true_type { };

  // Conditionalizing on __STRICT_ANSI__ here will break any port that
  // uses one of these types for size_t.
#if defined(__GLIBCXX_TYPE_INT_N_0)
  template<>
	struct __is_integral_helper<__GLIBCXX_TYPE_INT_N_0>
	: public true_type { };

  template<>
	struct __is_integral_helper<unsigned __GLIBCXX_TYPE_INT_N_0>
	: public true_type { };
#endif
#if defined(__GLIBCXX_TYPE_INT_N_1)
  template<>
	struct __is_integral_helper<__GLIBCXX_TYPE_INT_N_1>
	: public true_type { };

  template<>
	struct __is_integral_helper<unsigned __GLIBCXX_TYPE_INT_N_1>
	: public true_type { };
#endif
#if defined(__GLIBCXX_TYPE_INT_N_2)
  template<>
	struct __is_integral_helper<__GLIBCXX_TYPE_INT_N_2>
	: public true_type { };

  template<>
	struct __is_integral_helper<unsigned __GLIBCXX_TYPE_INT_N_2>
	: public true_type { };
#endif
#if defined(__GLIBCXX_TYPE_INT_N_3)
  template<>
	struct __is_integral_helper<__GLIBCXX_TYPE_INT_N_3>
	: public true_type { };

  template<>
	struct __is_integral_helper<unsigned __GLIBCXX_TYPE_INT_N_3>
	: public true_type { };
#endif

  /// remove_const
  template<typename _Tp>
	struct remove_const
	{ typedef _Tp     type; };

  template<typename _Tp>
	struct remove_const<_Tp const>
	{ typedef _Tp     type; };

  /// remove_volatile
  template<typename _Tp>
	struct remove_volatile
	{ typedef _Tp     type; };

  template<typename _Tp>
	struct remove_volatile<_Tp volatile>
	{ typedef _Tp     type; };

  /// remove_cv
  template<typename _Tp>
	struct remove_cv
	{
	  typedef typename
	  remove_const<typename remove_volatile<_Tp>::type>::type     type;
	};

  /// is_integral
  template<typename _Tp>
	struct is_integral
	: public __is_integral_helper<typename remove_cv<_Tp>::type>::type
	{ };

	  /// remove_reference
  template<typename _Tp>
	struct remove_reference
	{ typedef _Tp   type; };

  template<typename _Tp>
	struct remove_reference<_Tp&>
	{ typedef _Tp   type; };

  template<typename _Tp>
	struct remove_reference<_Tp&&>
	{ typedef _Tp   type; };

	  template<typename _Tp>
	constexpr typename std::remove_reference<_Tp>::type&&
	move(_Tp&& __t) noexcept
	{ return static_cast<typename std::remove_reference<_Tp>::type&&>(__t); }
}

class uint128_t;
/*
// Give uint128_t type traits
namespace std {  // This is probably not a good idea
	template <> struct is_arithmetic <uint128_t> : std::true_type {};
	template <> struct is_integral   <uint128_t> : std::true_type {};
	template <> struct is_unsigned   <uint128_t> : std::true_type {};
}*/

class uint128_t{
	private:
		uint64_t UPPER, LOWER;

	public:
		// Constructors
		uint128_t();
		uint128_t(const uint128_t & rhs);
		uint128_t(uint128_t && rhs);

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		uint128_t(const T & rhs)
			: UPPER(0), LOWER(rhs)
		{}

		template <typename S, typename T, typename = typename std::enable_if <std::is_integral<S>::value && std::is_integral<T>::value, void>::type>
		uint128_t(const S & upper_rhs, const T & lower_rhs)
			: UPPER(upper_rhs), LOWER(lower_rhs)
		{}

		//  RHS input args only

		// Assignment Operator
		uint128_t & operator=(const uint128_t & rhs);
		uint128_t & operator=(uint128_t && rhs);

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		uint128_t & operator=(const T & rhs){
			UPPER = 0;
			LOWER = rhs;
			return *this;
		}

		// Typecast Operators
		operator bool() const;
		operator uint8_t() const;
		operator uint16_t() const;
		operator uint32_t() const;
		operator uint64_t() const;

		// Bitwise Operators
		uint128_t operator&(const uint128_t & rhs) const;

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		uint128_t operator&(const T & rhs) const{
			return uint128_t(0, LOWER & (uint64_t) rhs);
		}

		uint128_t & operator&=(const uint128_t & rhs);

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		uint128_t & operator&=(const T & rhs){
			UPPER = 0;
			LOWER &= rhs;
			return *this;
		}

		uint128_t operator|(const uint128_t & rhs) const;

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		uint128_t operator|(const T & rhs) const{
			return uint128_t(UPPER, LOWER | (uint64_t) rhs);
		}

		uint128_t & operator|=(const uint128_t & rhs);

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		uint128_t & operator|=(const T & rhs){
			LOWER |= (uint64_t) rhs;
			return *this;
		}

		uint128_t operator^(const uint128_t & rhs) const;

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		uint128_t operator^(const T & rhs) const{
			return uint128_t(UPPER, LOWER ^ (uint64_t) rhs);
		}

		uint128_t & operator^=(const uint128_t & rhs);

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		uint128_t & operator^=(const T & rhs){
			LOWER ^= (uint64_t) rhs;
			return *this;
		}

		uint128_t operator~() const;

		// Bit Shift Operators
		uint128_t operator<<(const uint128_t & rhs) const;

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		uint128_t operator<<(const T & rhs) const{
			return *this << uint128_t(rhs);
		}

		uint128_t & operator<<=(const uint128_t & rhs);

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		uint128_t & operator<<=(const T & rhs){
			*this = *this << uint128_t(rhs);
			return *this;
		}

		uint128_t operator>>(const uint128_t & rhs) const;

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		uint128_t operator>>(const T & rhs) const{
			return *this >> uint128_t(rhs);
		}

		uint128_t & operator>>=(const uint128_t & rhs);

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		uint128_t & operator>>=(const T & rhs){
			*this = *this >> uint128_t(rhs);
			return *this;
		}

		// Logical Operators
		bool operator!() const;
		bool operator&&(const uint128_t & rhs) const;
		bool operator||(const uint128_t & rhs) const;

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		bool operator&&(const T & rhs){
			return static_cast <bool> (*this && rhs);
		}

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		bool operator||(const T & rhs){
			return static_cast <bool> (*this || rhs);
		}

		// Comparison Operators
		bool operator==(const uint128_t & rhs) const;

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		bool operator==(const T & rhs) const{
			return (!UPPER && (LOWER == (uint64_t) rhs));
		}

		bool operator!=(const uint128_t & rhs) const;

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		bool operator!=(const T & rhs) const{
			return (UPPER | (LOWER != (uint64_t) rhs));
		}

		bool operator>(const uint128_t & rhs) const;

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		bool operator>(const T & rhs) const{
			return (UPPER || (LOWER > (uint64_t) rhs));
		}

		bool operator<(const uint128_t & rhs) const;

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		bool operator<(const T & rhs) const{
			return (!UPPER)?(LOWER < (uint64_t) rhs):false;
		}

		bool operator>=(const uint128_t & rhs) const;

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		bool operator>=(const T & rhs) const{
			return ((*this > rhs) | (*this == rhs));
		}

		bool operator<=(const uint128_t & rhs) const;

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		bool operator<=(const T & rhs) const{
			return ((*this < rhs) | (*this == rhs));
		}

		// Arithmetic Operators
		uint128_t operator+(const uint128_t & rhs) const;

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		uint128_t operator+(const T & rhs) const{
			return uint128_t(UPPER + ((LOWER + (uint64_t) rhs) < LOWER), LOWER + (uint64_t) rhs);
		}

		uint128_t & operator+=(const uint128_t & rhs);

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		uint128_t & operator+=(const T & rhs){
			UPPER = UPPER + ((LOWER + rhs) < LOWER);
			LOWER = LOWER + rhs;
			return *this;
		}

		uint128_t operator-(const uint128_t & rhs) const;

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		uint128_t operator-(const T & rhs) const{
			return uint128_t((uint64_t) (UPPER - ((LOWER - rhs) > LOWER)), (uint64_t) (LOWER - rhs));
		}

		uint128_t & operator-=(const uint128_t & rhs);

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		uint128_t & operator-=(const T & rhs){
			*this = *this - rhs;
			return *this;
		}

		uint128_t operator*(const uint128_t & rhs) const;

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		uint128_t operator*(const T & rhs) const{
			return *this * uint128_t(rhs);
		}

		uint128_t & operator*=(const uint128_t & rhs);

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		uint128_t & operator*=(const T & rhs){
			*this = *this * uint128_t(rhs);
			return *this;
		}

	private:
		struct divmodRet;
		divmodRet divmod(const uint128_t & lhs, const uint128_t & rhs) const;

	public:
		uint128_t operator/(const uint128_t & rhs) const;

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		uint128_t operator/(const T & rhs) const{
			return *this / uint128_t(rhs);
		}

		uint128_t & operator/=(const uint128_t & rhs);

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		uint128_t & operator/=(const T & rhs){
			*this = *this / uint128_t(rhs);
			return *this;
		}

		uint128_t operator%(const uint128_t & rhs) const;

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		uint128_t operator%(const T & rhs) const{
			return *this % uint128_t(rhs);
		}

		uint128_t & operator%=(const uint128_t & rhs);

		template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
		uint128_t & operator%=(const T & rhs){
			*this = *this % uint128_t(rhs);
			return *this;
		}

		// Increment Operator
		uint128_t & operator++();
		uint128_t operator++(int);

		// Decrement Operator
		uint128_t & operator--();
		uint128_t operator--(int);

		// Nothing done since promotion doesn't work here
		uint128_t operator+() const;

		// two's complement
		uint128_t operator-() const;

		// Get private values
		const uint64_t & upper() const;
		const uint64_t & lower() const;

		// Get bitsize of value
		uint8_t bits() const;

		// Get string representation of value
		//std::string str(uint8_t base = 10, const unsigned int & len = 0) const;
};
struct uint128_t::divmodRet
		{
			uint128_t first;
			uint128_t second;
		};

// useful values
UINT128_T_EXTERN extern const uint128_t uint128_0;
UINT128_T_EXTERN extern const uint128_t uint128_1;

// lhs type T as first arguemnt
// If the output is not a bool, casts to type T

// Bitwise Operators
template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
uint128_t operator&(const T & lhs, const uint128_t & rhs){
	return rhs & lhs;
}

template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
T & operator&=(T & lhs, const uint128_t & rhs){
	return lhs = static_cast <T> (rhs & lhs);
}

template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
uint128_t operator|(const T & lhs, const uint128_t & rhs){
	return rhs | lhs;
}

template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
T & operator|=(T & lhs, const uint128_t & rhs){
	return lhs = static_cast <T> (rhs | lhs);
}

template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
uint128_t operator^(const T & lhs, const uint128_t & rhs){
	return rhs ^ lhs;
}

template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
T & operator^=(T & lhs, const uint128_t & rhs){
	return lhs = static_cast <T> (rhs ^ lhs);
}

// Bitshift operators
UINT128_T_EXTERN uint128_t operator<<(const bool     & lhs, const uint128_t & rhs);
UINT128_T_EXTERN uint128_t operator<<(const uint8_t  & lhs, const uint128_t & rhs);
UINT128_T_EXTERN uint128_t operator<<(const uint16_t & lhs, const uint128_t & rhs);
UINT128_T_EXTERN uint128_t operator<<(const uint32_t & lhs, const uint128_t & rhs);
UINT128_T_EXTERN uint128_t operator<<(const uint64_t & lhs, const uint128_t & rhs);
UINT128_T_EXTERN uint128_t operator<<(const int8_t   & lhs, const uint128_t & rhs);
UINT128_T_EXTERN uint128_t operator<<(const int16_t  & lhs, const uint128_t & rhs);
UINT128_T_EXTERN uint128_t operator<<(const int32_t  & lhs, const uint128_t & rhs);
UINT128_T_EXTERN uint128_t operator<<(const int64_t  & lhs, const uint128_t & rhs);

template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
T & operator<<=(T & lhs, const uint128_t & rhs){
	return lhs = static_cast <T> (uint128_t(lhs) << rhs);
}

UINT128_T_EXTERN uint128_t operator>>(const bool     & lhs, const uint128_t & rhs);
UINT128_T_EXTERN uint128_t operator>>(const uint8_t  & lhs, const uint128_t & rhs);
UINT128_T_EXTERN uint128_t operator>>(const uint16_t & lhs, const uint128_t & rhs);
UINT128_T_EXTERN uint128_t operator>>(const uint32_t & lhs, const uint128_t & rhs);
UINT128_T_EXTERN uint128_t operator>>(const uint64_t & lhs, const uint128_t & rhs);
UINT128_T_EXTERN uint128_t operator>>(const int8_t   & lhs, const uint128_t & rhs);
UINT128_T_EXTERN uint128_t operator>>(const int16_t  & lhs, const uint128_t & rhs);
UINT128_T_EXTERN uint128_t operator>>(const int32_t  & lhs, const uint128_t & rhs);
UINT128_T_EXTERN uint128_t operator>>(const int64_t  & lhs, const uint128_t & rhs);

template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
T & operator>>=(T & lhs, const uint128_t & rhs){
	return lhs = static_cast <T> (uint128_t(lhs) >> rhs);
}

// Comparison Operators
template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
bool operator==(const T & lhs, const uint128_t & rhs){
	return (!rhs.upper() && ((uint64_t) lhs == rhs.lower()));
}

template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
bool operator!=(const T & lhs, const uint128_t & rhs){
	return (rhs.upper() | ((uint64_t) lhs != rhs.lower()));
}

template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
bool operator>(const T & lhs, const uint128_t & rhs){
	return (!rhs.upper()) && ((uint64_t) lhs > rhs.lower());
}

template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
bool operator<(const T & lhs, const uint128_t & rhs){
	if (rhs.upper()){
		return true;
	}
	return ((uint64_t) lhs < rhs.lower());
}

template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
bool operator>=(const T & lhs, const uint128_t & rhs){
	if (rhs.upper()){
		return false;
	}
	return ((uint64_t) lhs >= rhs.lower());
}

template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
bool operator<=(const T & lhs, const uint128_t & rhs){
	if (rhs.upper()){
		return true;
	}
	return ((uint64_t) lhs <= rhs.lower());
}

// Arithmetic Operators
template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
uint128_t operator+(const T & lhs, const uint128_t & rhs){
	return rhs + lhs;
}

template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
T & operator+=(T & lhs, const uint128_t & rhs){
	return lhs = static_cast <T> (rhs + lhs);
}

template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
uint128_t operator-(const T & lhs, const uint128_t & rhs){
	return -(rhs - lhs);
}

template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
T & operator-=(T & lhs, const uint128_t & rhs){
	return lhs = static_cast <T> (-(rhs - lhs));
}

template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
uint128_t operator*(const T & lhs, const uint128_t & rhs){
	return rhs * lhs;
}

template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
T & operator*=(T & lhs, const uint128_t & rhs){
	return lhs = static_cast <T> (rhs * lhs);
}

template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
uint128_t operator/(const T & lhs, const uint128_t & rhs){
	return uint128_t(lhs) / rhs;
}

template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
T & operator/=(T & lhs, const uint128_t & rhs){
	return lhs = static_cast <T> (uint128_t(lhs) / rhs);
}

template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
uint128_t operator%(const T & lhs, const uint128_t & rhs){
	return uint128_t(lhs) % rhs;
}

template <typename T, typename = typename std::enable_if<std::is_integral<T>::value, T>::type >
T & operator%=(T & lhs, const uint128_t & rhs){
	return lhs = static_cast <T> (uint128_t(lhs) % rhs);
}
#endif

#define CHAR_BIT __CHAR_BIT__
#include <limits.h>

using u32 = uint32_t;
using u64 = uint64_t;
using u128 = uint128_t;

u64 _mulx_u64(u64 x, u64 y, u64 *p)
{
	u128 res = (u128)x * y;
	*p = (u64)(res >> 0x40);
	return (u64)res;
}

u32 _mulx_u32(u32 x, u32 y, u32 *p)
{
	u64 res = (u64)x * y;
	*p = (u32)(res >> 0x20);
	return (u32)res;
}
