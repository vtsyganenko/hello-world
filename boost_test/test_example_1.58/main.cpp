#define BOOST_TEST_MODULE My Test
#include <boost/test/included/unit_test.hpp>

BOOST_AUTO_TEST_CASE(first_test)
{
  int i = 1;
  //int k = 2;

  BOOST_MESSAGE("test 1");
  BOOST_CHECK(i == 1);
}
