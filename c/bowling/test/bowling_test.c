#include "munit/munit.h"
#include "src/bowling.h"

static MunitResult
test_gutter_game(const MunitParameter params[], void* data) {
  const int rolls[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

  munit_assert_int(0, ==, score(rolls));

  return MUNIT_OK;
}

static MunitTest test_suite_tests[] = {
  { (char*) "/gutter_game",
    test_gutter_game,
    NULL,
    NULL,
    MUNIT_TEST_OPTION_NONE,
    NULL
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
