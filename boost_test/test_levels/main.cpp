#define BOOST_TEST_MODULE My Test
#include <boost/test/included/unit_test.hpp>

// warning example
BOOST_AUTO_TEST_CASE(first_test)
{
    BOOST_MESSAGE("test 1 begin:");
    int i = -1;

    // only warning - not error in results
    BOOST_WARN(i > 0);

    BOOST_CHECK(i == -1);
    BOOST_MESSAGE("test 1 end");
}

// check example
BOOST_AUTO_TEST_CASE(second_test)
{
    BOOST_MESSAGE("test 2 begin:");
    int i = -1;

    // provide error, but test case continue
    BOOST_CHECK(i > 0);
    BOOST_CHECK(i == -10);
    // got two errors in case
    BOOST_MESSAGE("test 2 end");
}

// require example
BOOST_AUTO_TEST_CASE(third_test)
{
    BOOST_MESSAGE("test 3 begin:");
    int i = -1;

    // provide error and stops this case
    BOOST_REQUIRE(i > 0);
    // never executed
    BOOST_CHECK(i == -10);

    BOOST_MESSAGE("test 3 end");
}

// test number 4 is executing although fatal error
BOOST_AUTO_TEST_CASE(fourth_test)
{
    BOOST_MESSAGE("test 4 begin:");
    BOOST_CHECK(true);
    BOOST_MESSAGE("test 4 end");
}
