#include "munit/munit.h"
#include "src/bowling.h"

static MunitResult
test_gutter_game(const MunitParameter params[], void* data) {
  const int rolls[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

  munit_assert_int(0, ==, score(rolls));

  return MUNIT_OK;
}

static MunitResult
test_all_ones(const MunitParameter params[], void* data) {
  const int rolls[] = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};

  munit_assert_int(20, ==, score(rolls));

  return MUNIT_OK;
}

static MunitResult
test_one_spare(const MunitParameter params[], void* data) {
  const int rolls[] = {5,5,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

  munit_assert_int(16, ==, score(rolls));

  return MUNIT_OK;
}

static MunitResult
test_one_strike(const MunitParameter params[], void* data) {
  const int rolls[] = {10,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

  munit_assert_int(16, ==, score(rolls));

  return MUNIT_OK;
}

static MunitResult
test_perfect_game(const MunitParameter params[], void* data) {
  const int rolls[] = {10,10,10,10,10,10,10,10,10,10,10,10};

  munit_assert_int(300, ==, score(rolls));

  return MUNIT_OK;
}

static MunitResult
test_all_spares(const MunitParameter params[], void* data) {
  const int rolls[] = {5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5};

  munit_assert_int(150, ==, score(rolls));

  return MUNIT_OK;
}

static MunitTest test_suite_tests[] = {
  { (char*) "/gutter_game",
    test_gutter_game,
    NULL, NULL, MUNIT_TEST_OPTION_NONE, NULL
  },
  { (char*) "/all_ones",
    test_all_ones,
    NULL, NULL, MUNIT_TEST_OPTION_NONE, NULL
  },
  { (char*) "/one_spare",
    test_one_spare,
    NULL, NULL, MUNIT_TEST_OPTION_NONE, NULL
  },
  { (char*) "/one_strike",
    test_one_strike,
    NULL, NULL, MUNIT_TEST_OPTION_NONE, NULL
  },
  { (char*) "/perfect_game",
    test_perfect_game,
    NULL, NULL, MUNIT_TEST_OPTION_NONE, NULL
  },
  { (char*) "/all_spares",
    test_all_spares,
    NULL, NULL, MUNIT_TEST_OPTION_NONE, NULL
  },
  { NULL, NULL, NULL, NULL, MUNIT_TEST_OPTION_NONE, NULL }
};

static const MunitSuite test_suite = {
  (char*) "/bowling",
  test_suite_tests,
  NULL,
  1,
  MUNIT_SUITE_OPTION_NONE
};

int main(int argc, char* argv[MUNIT_ARRAY_PARAM(argc + 1)]) {
  return munit_suite_main(&test_suite, (void*) "munit", argc, argv);
}
