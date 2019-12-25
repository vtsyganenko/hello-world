#define BOOST_TEST_DYN_LINK
#include <boost/test/unit_test.hpp>

#include "myfixture.h"

BOOST_FIXTURE_TEST_SUITE(suite, MyFixture)

  BOOST_AUTO_TEST_CASE(test_case1)
  {
    BOOST_CHECK( getCurrentTime() > 0 );
  }

  BOOST_AUTO_TEST_CASE(test_case2)
  {
    BOOST_CHECK( value_ > 2 );
  }

BOOST_AUTO_TEST_SUITE_END()
