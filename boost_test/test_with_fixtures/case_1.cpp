#define BOOST_TEST_DYN_LINK
#include <boost/test/unit_test.hpp>

#include "myfixture.h"

BOOST_FIXTURE_TEST_CASE( test_case1, MyFixture )
{
  BOOST_CHECK( getCurrentTime() > 0 );
}

BOOST_FIXTURE_TEST_CASE( test_case2, MyFixture )
{
  BOOST_CHECK( value_ > 2 );
}
