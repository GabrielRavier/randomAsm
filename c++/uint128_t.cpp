#include <stdint.h>

#define main asmMain
//#define putchar _putchar
//int putchar(int);

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

#define CHAR_BIT __CHAR_BIT__
#include <stddef.h>

uint128_t::uint128_t()
	: UPPER(0), LOWER(0)
{}
/*
uint128_t::uint128_t(const uint128_t & rhs)
	: UPPER(rhs.UPPER), LOWER(rhs.LOWER)
{}
/*
uint128_t::uint128_t(uint128_t && rhs)
	: UPPER(std::move(rhs.UPPER)), LOWER(std::move(rhs.LOWER))
{
	if (this != &rhs){
		rhs.UPPER = 0;
		rhs.LOWER = 0;
	}
}
/*
uint128_t & uint128_t::operator=(const uint128_t & rhs){
	UPPER = rhs.UPPER;
	LOWER = rhs.LOWER;
	return *this;
}
/*
uint128_t & uint128_t::operator=(uint128_t && rhs){
	if (this != &rhs){
		UPPER = std::move(rhs.UPPER);
		LOWER = std::move(rhs.LOWER);
		rhs.UPPER = 0;
		rhs.LOWER = 0;
	}
	return *this;
}
/*
uint128_t::operator bool() const{
	return (bool) (UPPER | LOWER);
}
/*
uint128_t::operator uint8_t() const{
	return (uint8_t) LOWER;
}
/*
uint128_t::operator uint16_t() const{
	return (uint16_t) LOWER;
}
/*
uint128_t::operator uint32_t() const{
	return (uint32_t) LOWER;
}
/*
uint128_t::operator uint64_t() const{
	return (uint64_t) LOWER;
}
/*
uint128_t uint128_t::operator&(const uint128_t & rhs) const{
	return uint128_t(UPPER & rhs.UPPER, LOWER & rhs.LOWER);
}
/*
uint128_t & uint128_t::operator&=(const uint128_t & rhs){
	*this = *this & rhs;
	return *this;
}
/*
uint128_t uint128_t::operator|(const uint128_t & rhs) const{
	return uint128_t(UPPER | rhs.UPPER, LOWER | rhs.LOWER);
}
/*
uint128_t & uint128_t::operator|=(const uint128_t & rhs){
	*this = *this | rhs;
	UPPER |= rhs.UPPER;
	LOWER |= rhs.LOWER;
	return *this;
}
/*
uint128_t uint128_t::operator^(const uint128_t & rhs) const{
	return uint128_t(UPPER ^ rhs.UPPER, LOWER ^ rhs.LOWER);
}
/*
uint128_t & uint128_t::operator^=(const uint128_t & rhs){
	*this = *this ^ rhs;
	return *this;
}
/*
uint128_t uint128_t::operator~() const{
	return uint128_t(~UPPER, ~LOWER);
}
/*
uint128_t uint128_t::operator<<(const uint128_t & rhs) const{
	const uint64_t shift = rhs.LOWER;
	if (((bool) rhs.UPPER) || (shift >= 128)){
		return uint128_0;
	}
	else if (shift == 64){
		return uint128_t(LOWER, 0);
	}
	else if (shift == 0){
		return *this;
	}
	else if (shift < 64){
		return uint128_t((UPPER << shift) + (LOWER >> (64 - shift)), LOWER << shift);
	}
	else if ((128 > shift) && (shift > 64)){
		return uint128_t(LOWER << (shift - 64), 0);
	}
	else{
		return uint128_0;
	}
}
/*
uint128_t & uint128_t::operator<<=(const uint128_t & rhs){
	*this = *this << rhs;
	return *this;
}
/*
uint128_t uint128_t::operator>>(const uint128_t & rhs) const{
	const uint64_t shift = rhs.LOWER;
	if (((bool) rhs.UPPER) || (shift >= 128)){
		return uint128_0;
	}
	else if (shift == 64){
		return uint128_t(0, UPPER);
	}
	else if (shift == 0){
		return *this;
	}
	else if (shift < 64){
		return uint128_t(UPPER >> shift, (UPPER << (64 - shift)) + (LOWER >> shift));
	}
	else if ((128 > shift) && (shift > 64)){
		return uint128_t(0, (UPPER >> (shift - 64)));
	}
	else{
		return uint128_0;
	}
}
/*
uint128_t & uint128_t::operator>>=(const uint128_t & rhs){
	*this = *this >> rhs;
	return *this;
}
/*
bool uint128_t::operator!() const{
	return !(bool) (UPPER | LOWER);
}
/*
bool uint128_t::operator&&(const uint128_t & rhs) const{
	return ((bool) *this && rhs);
}
/*
bool uint128_t::operator||(const uint128_t & rhs) const{
	 return ((bool) *this || rhs);
}
/*
bool uint128_t::operator==(const uint128_t & rhs) const{
	return ((UPPER == rhs.UPPER) && (LOWER == rhs.LOWER));
}
/*
bool uint128_t::operator!=(const uint128_t & rhs) const{
	return ((UPPER != rhs.UPPER) | (LOWER != rhs.LOWER));
}
/*
bool uint128_t::operator>(const uint128_t & rhs) const{
	if (UPPER == rhs.UPPER){
		return (LOWER > rhs.LOWER);
	}
	return (UPPER > rhs.UPPER);
}
/*
bool uint128_t::operator<(const uint128_t & rhs) const{
	if (UPPER == rhs.UPPER){
		return (LOWER < rhs.LOWER);
	}
	return (UPPER < rhs.UPPER);
}
/*
bool uint128_t::operator>=(const uint128_t & rhs) const{
	return ((*this > rhs) | (*this == rhs));
}
/*
bool uint128_t::operator<=(const uint128_t & rhs) const{
	return ((*this < rhs) | (*this == rhs));
}
/*
uint128_t uint128_t::operator+(const uint128_t & rhs) const{
	return uint128_t(UPPER + rhs.UPPER + ((LOWER + rhs.LOWER) < LOWER), LOWER + rhs.LOWER);
}
/*
uint128_t & uint128_t::operator+=(const uint128_t & rhs){
	*this = *this + rhs;
	return *this;
}
/*
uint128_t uint128_t::operator-(const uint128_t & rhs) const{
	return uint128_t(UPPER - rhs.UPPER - ((LOWER - rhs.LOWER) > LOWER), LOWER - rhs.LOWER);
}
/*
uint128_t & uint128_t::operator-=(const uint128_t & rhs){
	*this = *this - rhs;
	return *this;
}
/*
uint128_t uint128_t::operator*(const uint128_t & rhs) const{
	// split values into 4 32-bit parts
	uint64_t top[4] = {UPPER >> 32, UPPER & 0xffffffff, LOWER >> 32, LOWER & 0xffffffff};
	uint64_t bottom[4] = {rhs.UPPER >> 32, rhs.UPPER & 0xffffffff, rhs.LOWER >> 32, rhs.LOWER & 0xffffffff};
	uint64_t products[4][4];

	// multiply each component of the values
	for(int y = 3; y > -1; y--){
		for(int x = 3; x > -1; x--){
			products[3 - x][y] = top[x] * bottom[y];
		}
	}

	// first row
	uint64_t fourth32 = (products[0][3] & 0xffffffff);
	uint64_t third32  = (products[0][2] & 0xffffffff) + (products[0][3] >> 32);
	uint64_t second32 = (products[0][1] & 0xffffffff) + (products[0][2] >> 32);
	uint64_t first32  = (products[0][0] & 0xffffffff) + (products[0][1] >> 32);

	// second row
	third32  += (products[1][3] & 0xffffffff);
	second32 += (products[1][2] & 0xffffffff) + (products[1][3] >> 32);
	first32  += (products[1][1] & 0xffffffff) + (products[1][2] >> 32);

	// third row
	second32 += (products[2][3] & 0xffffffff);
	first32  += (products[2][2] & 0xffffffff) + (products[2][3] >> 32);

	// fourth row
	first32  += (products[3][3] & 0xffffffff);

	// move carry to next digit
	third32  += fourth32 >> 32;
	second32 += third32  >> 32;
	first32  += second32 >> 32;

	// remove carry from current digit
	fourth32 &= 0xffffffff;
	third32  &= 0xffffffff;
	second32 &= 0xffffffff;
	first32  &= 0xffffffff;

	// combine components
	return uint128_t((first32 << 32) | second32, (third32 << 32) | fourth32);
}
/*
uint128_t & uint128_t::operator*=(const uint128_t & rhs){
	*this = *this * rhs;
	return *this;
}
/*
uint128_t::divmodRet uint128_t::divmod(const uint128_t & lhs, const uint128_t & rhs) const{
	// Save some calculations /////////////////////
	if (rhs == uint128_1){
		return {lhs, uint128_0};
	}
	else if (lhs == rhs){
		return {uint128_1, uint128_0};
	}
	else if ((lhs == uint128_0) || (lhs < rhs)){
		return {uint128_0, lhs};
	}

	uint128_t::divmodRet qr {uint128_0, uint128_0};
	for(uint8_t x = lhs.bits(); x > 0; x--){
		qr.first  <<= uint128_1;
		qr.second <<= uint128_1;

		if ((lhs >> (x - 1U)) & 1){
			++qr.second;
		}

		if (qr.second >= rhs){
			qr.second -= rhs;
			++qr.first;
		}
	}
	return qr;
}
/*
uint128_t uint128_t::operator/(const uint128_t & rhs) const{
	return divmod(*this, rhs).first;
}
/*
uint128_t & uint128_t::operator/=(const uint128_t & rhs){
	*this = *this / rhs;
	return *this;
}
/*
uint128_t uint128_t::operator%(const uint128_t & rhs) const{
	return divmod(*this, rhs).second;
}
/*
uint128_t & uint128_t::operator%=(const uint128_t & rhs){
	*this = *this % rhs;
	return *this;
}
/*
uint128_t & uint128_t::operator++(){
	return *this += uint128_1;
}
/*
uint128_t uint128_t::operator++(int){
	uint128_t temp(*this);
	++*this;
	return temp;
}
/*
uint128_t & uint128_t::operator--(){
	return *this -= uint128_1;
}
/*
uint128_t uint128_t::operator--(int){
	uint128_t temp(*this);
	--*this;
	return temp;
}
/*
uint128_t uint128_t::operator+() const{
	return *this;
}
/*
uint128_t uint128_t::operator-() const{
	return ~*this + uint128_1;
}
/*
const uint64_t & uint128_t::upper() const{
	return UPPER;
}
/*
const uint64_t & uint128_t::lower() const{
	return LOWER;
}
/*
uint8_t uint128_t::bits() const{
	uint8_t out = 0;
	if (UPPER){
		return 128 - __builtin_clzll(UPPER);
		out = 64;
		uint64_t up = UPPER;
		while (up){
			up >>= 1;
			out++;
		}
	}
	else if (LOWER){
		return 64 - __builtin_clzll(LOWER);
		uint64_t low = LOWER;
		while (low){
			low >>= 1;
			out++;
		}
	}
	return out;
}
/**/
